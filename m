Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBDB387DC6
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 17:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407240AbfHIPM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 11:12:28 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60877 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726342AbfHIPM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 11:12:28 -0400
Received: from [IPv6:2001:983:e9a7:1:a042:9da:6cf5:9cb5] ([IPv6:2001:983:e9a7:1:a042:9da:6cf5:9cb5])
        by smtp-cloud7.xs4all.net with ESMTPA
        id w6Z7h4mJ5ur8Tw6Z8hcHIP; Fri, 09 Aug 2019 17:12:26 +0200
Subject: Re: [PATCH v5 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-9-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e1db21af-fb72-b5b1-3578-9684e297e7ce@xs4all.nl>
Date:   Fri, 9 Aug 2019 17:12:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-9-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGwiw3aYhALsX57+j8Og6RUpMbzi1xYycVWDEjhQA4wfZxpPUDcnyt28nlo/rxDUlZvlg287SvQcgf1m2Teyd2HvQtPwFhMKF4guIAG0dSg0gclcJNN0
 dm+uoQ4AurHuOrGM4LMmjn9M73gH+j1HW8AgoaYk8qfHNFEeziOnmdKyAU4x7aCZqC6R+GaFf85M6v92gaUglPZIgykDQ9m8aHZiADpDh9bDQhHWaiFkjlfG
 H8Aqe3S/JxPEhrM3z7P47OVDhMvHj2DeZjyawyhQGY2LvYdwfc+m8HXsleBd+28uRfweudAW4+NiTvw1+rekMQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v4:
> 	- typo fix
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

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested on a AML_S905X-CC board.

Note: there is a bug (unrelated to this series) that prevents the physical
address from being invalidated in drivers/gpu/drm/meson/meson_dw_hdmi.c.

I have a patch, but it needs a bit more testing before I'll post it.

Regards,

	Hans

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 36 ++++++++++++++---------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ab7968c8f6a29..b7d0d9ad5f2f7 100644
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
> +			struct cec_notifier *notifier;
> +
> +			notifier = READ_ONCE(hdmi->cec_notifier);
> +			if (notifier)
> +				cec_notifier_phys_addr_invalidate(notifier);
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

