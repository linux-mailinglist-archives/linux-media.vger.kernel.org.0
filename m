Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48F39C364
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2019 15:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfHYNM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Aug 2019 09:12:57 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50971 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726772AbfHYNM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Aug 2019 09:12:57 -0400
Received: from [IPv6:2001:983:e9a7:1:7020:eb81:fead:d93b] ([IPv6:2001:983:e9a7:1:7020:eb81:fead:d93b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 1sK9ipzoFzaKO1sKBiCe2A; Sun, 25 Aug 2019 15:12:54 +0200
Subject: Re: [PATCH v7 5/9] drm: tda998x: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Russell King <linux@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-6-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1e7fdf30-3723-857a-68fd-139f396856b7@xs4all.nl>
Date:   Sun, 25 Aug 2019 15:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-6-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD0fOt9mfrzmV3IgV/uuKEoGzKJP/P6EzDr0kMFNQssoX8s5YNV5+YgUiIvVh6d3LVB8y6IDWaT0wbrf3ehxU1TCvmh0aFbp8L2IqcHC85Us3obOfjj8
 TPWTUsShSvSpqV5RdMUC7o9fMEDFE516SgNflSAMdldChyJ8k5CKL9RbA0mX55Sc7p0cACKjsT7KzH46533qjuwPjm1pCoTIR9k68fI2joJinaFHxIsB3E9m
 NAnij23C3GM+vFOkTEvorGWuykO9t8Ux9iP9tVkpThHhUNI7uBbNtVOZXRZaT/hz+SqrKNoQTYeECMl7IWRuDvM9yWxEUNOF3qEVSwaap4rfD9q2zhNvWV3i
 3xTHJhf11QsG//0484cEbv9TRhgWOzfYxGH54TSclwlb4HaGWHrzm7m2MG/uax4xKzK3F3RuWrO6jZSc7qrjYD+ab6sTFdXpFNyidhg1nUgbb97QcU+dMOAm
 hpKwQkNQlMNXrT68
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill
> in the cec_connector_info.
> 
> Changes since v6:
>         - move cec_notifier_conn_unregister to tda998x_bridge_detach,
> 	- add a mutex protecting accesses to a CEC notifier.
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
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 36 +++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 61e042918a7fc..643480415473f 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -82,6 +82,8 @@ struct tda998x_priv {
>  	u8 audio_port_enable[AUDIO_ROUTE_NUM];
>  	struct tda9950_glue cec_glue;
>  	struct gpio_desc *calib;
> +
> +	struct mutex cec_notifiy_mutex;
>  	struct cec_notifier *cec_notify;
>  };
>  
> @@ -805,8 +807,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
>  				tda998x_edid_delay_start(priv);
>  			} else {
>  				schedule_work(&priv->detect_work);
> -				cec_notifier_set_phys_addr(priv->cec_notify,
> -						   CEC_PHYS_ADDR_INVALID);
> +
> +				mutex_lock(&priv->cec_notifiy_mutex);
> +				cec_notifier_phys_addr_invalidate(
> +						priv->cec_notify);
> +				mutex_unlock(&priv->cec_notifiy_mutex);
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
> @@ -1347,6 +1354,16 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  	if (ret)
>  		return ret;
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
> +					      NULL, &conn_info);
> +		return -ENOMEM;

You dropped a 'if (!notifier)' before the return!

After adding back this 'if' it worked fine on my BeagleBone Black board,
so after fixing this you can add my:

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

tag.

Regards,

	Hans

> +
> +	mutex_lock(&priv->cec_notifiy_mutex);
> +	priv->cec_notify = notifier;
> +	mutex_unlock(&priv->cec_notifiy_mutex);
> +
>  	drm_connector_attach_encoder(&priv->connector,
>  				     priv->bridge.encoder);
>  
> @@ -1366,6 +1383,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
>  {
>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
>  
> +	mutex_lock(&priv->cec_notifiy_mutex);
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +	priv->cec_notify = NULL;
> +	mutex_unlock(&priv->cec_notifiy_mutex);
> +
>  	drm_connector_cleanup(&priv->connector);
>  }
>  
> @@ -1789,9 +1811,6 @@ static void tda998x_destroy(struct device *dev)
>  	cancel_work_sync(&priv->detect_work);
>  
>  	i2c_unregister_device(priv->cec);
> -
> -	if (priv->cec_notify)
> -		cec_notifier_put(priv->cec_notify);
>  }
>  
>  static int tda998x_create(struct device *dev)
> @@ -1812,6 +1831,7 @@ static int tda998x_create(struct device *dev)
>  	mutex_init(&priv->mutex);	/* protect the page access */
>  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
>  	mutex_init(&priv->edid_mutex);
> +	mutex_init(&priv->cec_notifiy_mutex);
>  	INIT_LIST_HEAD(&priv->bridge.list);
>  	init_waitqueue_head(&priv->edid_delay_waitq);
>  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
> @@ -1916,12 +1936,6 @@ static int tda998x_create(struct device *dev)
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
> 

