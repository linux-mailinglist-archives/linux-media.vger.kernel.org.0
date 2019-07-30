Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CB57A81A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 14:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbfG3MTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 08:19:52 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58841 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726167AbfG3MTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 08:19:52 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sR6ahmdvoAffAsR6bhjeBI; Tue, 30 Jul 2019 14:19:49 +0200
Subject: Re: [PATCH v4 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190716122718.125993-1-darekm@google.com>
 <20190716122718.125993-9-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <12f85ae9-db7a-9d51-1c3f-39ed0e110932@xs4all.nl>
Date:   Tue, 30 Jul 2019 14:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190716122718.125993-9-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK7eI/Rt2lv5hEQpfprk+pYM1G0VhrPmf4xaT1Kt36Vor1iIXzULX9HptYSkeNpI7JZDP8QOr8VFU/R2nLJHWWe5E6iEnCnkbC8Sb5XntKGD9u/RkjAO
 DM2b4SsDDZVkA/NBk7MGQ92UOqcp53B5ss8XaeZ/G8ieJqiOEN/vzh3D7m5eIvAU1cEZWKXjgLvma5tAzB8QVhg2mBHHuhQ4itIjOgBOCeb7TPoeVWlsWVHl
 Cqp+h2VOwNSfA5iTu7FrP87nDK1PfX9HoDcgp2UHxGXQ+BnsAS4FdQ5RBbTS7O65JJtr/RWdJWBAm5g+wKHAdw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dariusz,

One small typo below:

On 7/16/19 2:27 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v2:
> 	- removed unnecessary NULL check before a call to
> 	cec_notifier_conn_unregister,
> 	- use cec_notifier_phys_addr_invalidate to invalidate physical
> 	address.
> Changes since v1:
> 	Add memory barrier to make sure that the notifier
> 	becomes visible to the irq thread once it is fully
> 	constructed.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 36 ++++++++++++++---------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ab7968c8f6a29..1e183af0e1ab1 100644
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
> @@ -2295,9 +2309,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  				       phy_stat & HDMI_PHY_HPD,
>  				       phy_stat & HDMI_PHY_RX_SENSE);
>  
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0)
> -			cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -						   CEC_PHYS_ADDR_INVALID);
> +		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
> +			struct cec_notifier *notifer;

Typo: notifer -> notifier

Regards,

	Hans

> +
> +			notifer = READ_ONCE(hdmi->cec_notifier);
> +			if (notifer)
> +				cec_notifier_phys_addr_invalidate(notifer);
> +		}
>  	}
>  
>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> @@ -2600,12 +2618,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
> @@ -2693,9 +2705,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		hdmi->ddc = NULL;
>  	}
>  
> -	if (hdmi->cec_notifier)
> -		cec_notifier_put(hdmi->cec_notifier);
> -
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	if (hdmi->cec_clk)
>  		clk_disable_unprepare(hdmi->cec_clk);
> @@ -2717,8 +2726,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>  	/* Disable all interrupts */
>  	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
>  
> -	if (hdmi->cec_notifier)
> -		cec_notifier_put(hdmi->cec_notifier);
> +	cec_notifier_conn_unregister(hdmi->cec_notifier);
>  
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	clk_disable_unprepare(hdmi->isfr_clk);
> 

