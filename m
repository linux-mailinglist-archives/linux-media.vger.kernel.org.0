Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00EE68766
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbfGOKwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:52:25 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59185 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729530AbfGOKwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:52:24 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myajhcGWO0SBqmyakhRVqp; Mon, 15 Jul 2019 12:52:22 +0200
Subject: Re: [PATCH v2 4/5] drm: dw-hdmi: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190701145944.214098-1-darekm@google.com>
 <20190701145944.214098-5-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <83b975d1-7654-1ebb-772a-e5df368bb90f@xs4all.nl>
Date:   Mon, 15 Jul 2019 12:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701145944.214098-5-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH812tuLdlq78ijf0Khql3HIGYNleLo87fdriENI7o2BWkdxdIG7xKv9WiAbccPN4zMS1XgvOrvXvu1HIaEMpkhApDXitbYA3tdJIhUsx+Kn0cLY7+ZS
 i7y040mFvn9VB1oLj44ntEd7zFkHAUielHBLJFedDm2UyvmNPwa4th8Q2pq3Rw5RHyXZ/RDx+SxWWtPlwELvvbjZZrO0BU0Vr9bjtQ+T/opAhV7u7DWrjR+r
 0IVeARHH0XzRuOFFpZ8eZWlJp1yFl6N2kdrpfHYFHJ1GC6H7aMeqw2IOwa8VGWco8wOoyKqE+RpXgjzmqIkqwbZrZ/M33yuiXJnkMzsFi6U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 4:59 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v1:
> 	Add memory barrier to make sure that the notifier
> 	becomes visible to the irq thread once it is fully
> 	constructed.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 37 +++++++++++++++--------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ab7968c8f6a29..c0f4eb3c12b18 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2118,6 +2118,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  	struct drm_encoder *encoder = bridge->encoder;
>  	struct drm_connector *connector = &hdmi->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
>  
>  	connector->interlace_allowed = 1;
>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
> @@ -2129,6 +2131,18 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  
>  	drm_connector_attach_encoder(connector, encoder);
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> +	if (!notifier)
> +		return -ENOMEM;
> +	/*
> +	 * Make sure that dw_hdmi_irq thread does see the notifier
> +	 * when it fully constructed.
> +	 */
> +	smp_wmb();
> +	hdmi->cec_notifier = notifier;
> +
>  	return 0;
>  }
>  
> @@ -2295,9 +2309,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  				       phy_stat & HDMI_PHY_HPD,
>  				       phy_stat & HDMI_PHY_RX_SENSE);
>  
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0)
> -			cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -						   CEC_PHYS_ADDR_INVALID);
> +		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
> +			struct cec_notifier *notifer;
> +
> +			notifer = READ_ONCE(hdmi->cec_notifier);
> +			if (notifer)
> +				cec_notifier_set_phys_addr(
> +						notifer,
> +						CEC_PHYS_ADDR_INVALID);

Please replace with cec_notifier_phys_addr_invalidate().

> +		}
>  	}
>  
>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> @@ -2600,12 +2620,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	if (ret)
>  		goto err_iahb;
>  
> -	hdmi->cec_notifier = cec_notifier_get(dev);
> -	if (!hdmi->cec_notifier) {
> -		ret = -ENOMEM;
> -		goto err_iahb;
> -	}
> -
>  	/*
>  	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
>  	 * N and cts values before enabling phy
> @@ -2693,9 +2707,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		hdmi->ddc = NULL;
>  	}
>  
> -	if (hdmi->cec_notifier)
> -		cec_notifier_put(hdmi->cec_notifier);
> -
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	if (hdmi->cec_clk)
>  		clk_disable_unprepare(hdmi->cec_clk);
> @@ -2718,7 +2729,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>  	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
>  
>  	if (hdmi->cec_notifier)
> -		cec_notifier_put(hdmi->cec_notifier);
> +		cec_notifier_conn_unregister(hdmi->cec_notifier);

No need for the 'if', cec_notifier_conn_unregister() already checks for a NULL
notifier.

Regards,

	Hans

>  
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	clk_disable_unprepare(hdmi->isfr_clk);
> 

