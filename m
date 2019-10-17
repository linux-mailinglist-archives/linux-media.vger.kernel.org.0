Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DC3DA701
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438529AbfJQILz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:11:55 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:42680 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392882AbfJQILz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dzLnOrt1nuGs46l9b8BTW2NtHNU4uEBVTZK5sdtYbAQ=; b=dHhKeSLS7U7Bc4TgpbRYyjnjW
        eqt84EvWYVA7hKBP3arphPl01u0DngJHcSRQfLmxigKM7pzZ3/ovLWqpIPEg2exfW2QMdgzfj6SNd
        ifPqqzxWa5TFjD++mV3etIiWOI9i+hP03WFdQnlm55LWHPXXl6Ln7o7yisaC3EG7GnJp7yUUwaOks
        4mX7oKvtjsmaOAIXoGzC/9jLWGVKcBmgUu4LhS7MP3xNKItWvvcOdlfs92u1lxabiPzn/bLToBz8r
        hDrPuzihVgFmoFwQ68fQ+54kSnhrSaz/ycbDazN3DqslkHskhz55RZKyIh8goiPgyTJ2vUndvjHnd
        lErUVdW3A==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:51356)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iL0su-0007cp-BL; Thu, 17 Oct 2019 09:11:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iL0sq-00082l-3a; Thu, 17 Oct 2019 09:11:44 +0100
Date:   Thu, 17 Oct 2019 09:11:44 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv9 2/2] drm: tda998x: set the connector info
Message-ID: <20191017081143.GA25745@shell.armlinux.org.uk>
References: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
 <20191017072842.16793-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017072842.16793-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 17, 2019 at 09:28:42AM +0200, Hans Verkuil wrote:
> From: Dariusz Marcinkiewicz <darekm@google.com>
> 
> Fill in the cec_connector_info when calling cec_notifier_conn_register().
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index dde8decb52a6..b0620842fa3a 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -82,6 +82,9 @@ struct tda998x_priv {
>  	u8 audio_port_enable[AUDIO_ROUTE_NUM];
>  	struct tda9950_glue cec_glue;
>  	struct gpio_desc *calib;
> +
> +	/* protect cec_notify */
> +	struct mutex cec_notify_mutex;
>  	struct cec_notifier *cec_notify;
>  };
>  
> @@ -805,8 +808,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
>  				tda998x_edid_delay_start(priv);
>  			} else {
>  				schedule_work(&priv->detect_work);
> +
> +				mutex_lock(&priv->cec_notify_mutex);
>  				cec_notifier_phys_addr_invalidate(
>  						priv->cec_notify);
> +				mutex_unlock(&priv->cec_notify_mutex);
>  			}
>  
>  			handled = true;
> @@ -1331,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  				  struct drm_device *drm)
>  {
>  	struct drm_connector *connector = &priv->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
>  	int ret;
>  
>  	connector->interlace_allowed = 1;
> @@ -1347,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  	if (ret)
>  		return ret;
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
> +					      NULL, &conn_info);
> +	if (!notifier)
> +		return -ENOMEM;
> +
> +	mutex_lock(&priv->cec_notify_mutex);
> +	priv->cec_notify = notifier;
> +	mutex_unlock(&priv->cec_notify_mutex);

You haven't taken on board what I said about the mutex in this
instance.

> +
>  	drm_connector_attach_encoder(&priv->connector,
>  				     priv->bridge.encoder);
>  
> @@ -1366,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
>  {
>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
>  
> +	mutex_lock(&priv->cec_notify_mutex);
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +	priv->cec_notify = NULL;
> +	mutex_unlock(&priv->cec_notify_mutex);
> +
>  	drm_connector_cleanup(&priv->connector);
>  }
>  
> @@ -1789,8 +1813,6 @@ static void tda998x_destroy(struct device *dev)
>  	cancel_work_sync(&priv->detect_work);
>  
>  	i2c_unregister_device(priv->cec);
> -
> -	cec_notifier_conn_unregister(priv->cec_notify);
>  }
>  
>  static int tda998x_create(struct device *dev)
> @@ -1811,6 +1833,7 @@ static int tda998x_create(struct device *dev)
>  	mutex_init(&priv->mutex);	/* protect the page access */
>  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
>  	mutex_init(&priv->edid_mutex);
> +	mutex_init(&priv->cec_notify_mutex);
>  	INIT_LIST_HEAD(&priv->bridge.list);
>  	init_waitqueue_head(&priv->edid_delay_waitq);
>  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
> @@ -1915,12 +1938,6 @@ static int tda998x_create(struct device *dev)
>  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
>  	}
>  
> -	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
> -	if (!priv->cec_notify) {
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> -
>  	priv->cec_glue.parent = dev;
>  	priv->cec_glue.data = priv;
>  	priv->cec_glue.init = tda998x_cec_hook_init;
> -- 
> 2.23.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
