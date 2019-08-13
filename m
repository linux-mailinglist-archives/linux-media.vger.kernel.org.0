Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE4D8B67C
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfHMLUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:20:22 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35238 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfHMLUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=As27JiQCtjDix/tvRgjOc1g0lMqX8YplheJrOl6+LCA=; b=gXQL49mvvW4g2lW3tFhEt/2Ti
        xJ5H0r3hmXslUTn6VvLnszvQyYt1zap4JFtfZUXawdKFi9QVEF/Kg4vNRg7gr8NCz2OJn5+Qz5t1x
        yL8tw79mr2khVW3KGP8Fqs7RfNiH8rQ8wHATRxCpGl17cSf6WBEJS13CafGQWO7wk2OKZ4moTwCMk
        +8G6KXHbKNQbDRjXwx0Lk0WUDnl8YBa1xvGCXhPGFMB/OChqK3WO/O0iUI7zOEj4iECsTuzG4m6ec
        ccVbbms5xFGIZjSIQ2Tiqoly9SwVgoGAsVeoiYZJN1xi0YkzEhq9fLFggpYCb1YOI3LNREYxy4ZcF
        HUzLEqaiQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:44420)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hxUqf-0008NO-Rz; Tue, 13 Aug 2019 12:20:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hxUqc-0007Sa-JG; Tue, 13 Aug 2019 12:20:14 +0100
Date:   Tue, 13 Aug 2019 12:20:14 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 4/8] drm: tda998x: use cec_notifier_conn_(un)register
Message-ID: <20190813112014.GE13294@shell.armlinux.org.uk>
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-5-darekm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813110300.83025-5-darekm@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 01:02:36PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill
> in the cec_connector_info.
> 
> Changes since v2:
> 	- cec_notifier_phys_addr_invalidate where appropriate,
> 	- don't check for NULL notifier before calling
> 	cec_notifier_conn_unregister.
> Changes since v1:
> 	Add memory barrier to make sure that the notifier
> 	becomes visible to the irq thread once it is
> 	fully constructed.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 61e042918a7fc..19a63ee1b3f53 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -804,9 +804,14 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
>  			if (lvl & CEC_RXSHPDLEV_HPD) {
>  				tda998x_edid_delay_start(priv);
>  			} else {
> +				struct cec_notifier *notify;
> +
>  				schedule_work(&priv->detect_work);
> -				cec_notifier_set_phys_addr(priv->cec_notify,
> -						   CEC_PHYS_ADDR_INVALID);
> +
> +				notify = READ_ONCE(priv->cec_notify);
> +				if (notify)
> +					cec_notifier_phys_addr_invalidate(
> +							notify);
>  			}
>  
>  			handled = true;
> @@ -1331,6 +1336,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  				  struct drm_device *drm)
>  {
>  	struct drm_connector *connector = &priv->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
>  	int ret;
>  
>  	connector->interlace_allowed = 1;
> @@ -1347,6 +1354,19 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  	if (ret)
>  		return ret;
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
> +					      NULL, &conn_info);
> +	if (!notifier)
> +		return -ENOMEM;
> +	/*
> +	 * Make sure that tda998x_irq_thread does see the notifier
> +	 * when it fully constructed.
> +	 */
> +	smp_wmb();
> +	priv->cec_notify = notifier;

To nitpick, this comment and the following code do not go together.

I think what you actually mean is:

	 * Make sure that tda998x_irq_thread sees the notifier
	 * only after it is fully constructed.

> +
>  	drm_connector_attach_encoder(&priv->connector,
>  				     priv->bridge.encoder);
>  
> @@ -1790,8 +1810,7 @@ static void tda998x_destroy(struct device *dev)
>  
>  	i2c_unregister_device(priv->cec);
>  
> -	if (priv->cec_notify)
> -		cec_notifier_put(priv->cec_notify);
> +	cec_notifier_conn_unregister(priv->cec_notify);

This also doesn't make sense: tda998x_destroy() is the opposite of
tda998x_create().  However, tda998x_connector_destroy() is the
opposite of tda998x_connector_create().

By moving the CEC creation code into tda998x_connector_create(), you
are creating the possibility for the following sequence to mess up
CEC and leak:

	tda998x_create()
	tda998x_connector_create()
	tda998x_connector_destroy()
	tda998x_connector_create()
	tda998x_connector_destroy()
	tda998x_destroy()

Anything you create in tda998x_connector_create() must be cleaned up
by tda998x_connector_destroy().

>  }
>  
>  static int tda998x_create(struct device *dev)
> @@ -1916,12 +1935,6 @@ static int tda998x_create(struct device *dev)
>  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
>  	}
>  
> -	priv->cec_notify = cec_notifier_get(dev);
> -	if (!priv->cec_notify) {
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> -
>  	priv->cec_glue.parent = dev;
>  	priv->cec_glue.data = priv;
>  	priv->cec_glue.init = tda998x_cec_hook_init;
> -- 
> 2.23.0.rc1.153.gdeed80330f-goog
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
