Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32FAE8B74A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfHMLiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:38:06 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37339 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726600AbfHMLiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:38:05 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xV7hhKyl4qTdhxV7lh9QWs; Tue, 13 Aug 2019 13:38:03 +0200
Subject: Re: [PATCH v6 7/8] drm: dw-hdmi: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-8-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <41c95313-fe39-b201-5238-24df7e72879a@xs4all.nl>
Date:   Tue, 13 Aug 2019 13:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813110300.83025-8-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIBagj28XgFXymMISKdyrWMjFt9IjTRiBXHeYQ8i3w0U4Wmg+lnZ4GDTQICxwIRE85AT9cLb1gSIzU3XCyCFb06QnkcTTCxjaQdd9IIIDbMS7bs5/Seq
 6wtzY0AoNHNv4XZ9VmC4qEaDiqB6IEjBr73ptDVWgMelCSl9YXJXPJMO0ivIG5B+CrTxcI74sSrvID5kdg2f3tMIENv57PbTFy18gzjJWLz8G69CYhaLdIJz
 gMo7szk+Ysud2+ULZN5BuGjhvxHqCqnMiZ16x26Rz8wqkJ0p/cfuKBvLRUYrcGOn9drZjQbC4+oqfiWwh8v0Lvjs3JaFCiCsoygSJQh5oMbS2ewOC0gZGHVt
 0YESTERspXC9yG9j6vUXZ1TUnXIRm6tfqYNysThfBOgkTmKKaLe147ZJvmvPuR6PJH8sXGBX0mcmwtqs+IUyDjRYLoiAFuQ9JYadKltmz5Yhwca6jxnFEH3U
 U67fCyYxZK+6Pnl6kTZhZc4B+Q8g1stYW7QHS6V+mT0Z5YCwKrDhxjfoZrL/GmNGU7Q6W504ilzQ5oDoP103BJ4w5pT4uu3R/AIvZSJ35782yKdbmWgkCJuE
 X8lcNgQisp/ICI9RN+zYMhIHhskKnJQY5rqthEzspk/T/Y6zGuWxT0oHh4mWuC/g0Mkq6mKFAvRcwbQY8IY6faGxg/Xj8TlZtw63BtR/VMCeRA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 1:02 PM, Dariusz Marcinkiewicz wrote:
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
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 36 ++++++++++++++---------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 83b94b66e464e..c00184700bb9d 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2194,6 +2194,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  	struct drm_encoder *encoder = bridge->encoder;
>  	struct drm_connector *connector = &hdmi->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
>  
>  	connector->interlace_allowed = 1;
>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
> @@ -2207,6 +2209,18 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
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
> @@ -2373,9 +2387,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
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
> @@ -2693,12 +2711,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
> @@ -2796,9 +2808,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		hdmi->ddc = NULL;
>  	}
>  
> -	if (hdmi->cec_notifier)
> -		cec_notifier_put(hdmi->cec_notifier);
> -
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	if (hdmi->cec_clk)
>  		clk_disable_unprepare(hdmi->cec_clk);
> @@ -2820,8 +2829,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>  	/* Disable all interrupts */
>  	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
>  
> -	if (hdmi->cec_notifier)
> -		cec_notifier_put(hdmi->cec_notifier);
> +	cec_notifier_conn_unregister(hdmi->cec_notifier);

Russell's review caused me to take another look at this series, and it made
wonder if cec_notifier_conn_unregister() shouldn't be called from bridge_detach?

Regards,

	Hans

>  
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	clk_disable_unprepare(hdmi->isfr_clk);
> 

