Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3A492052
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 11:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfHSJaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 05:30:35 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39177 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfHSJaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 05:30:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zdzfhLqiCDqPezdzihneDV; Mon, 19 Aug 2019 11:30:32 +0200
Subject: Re: [PATCH v7 5/9] drm: tda998x: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-6-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7a00ef8f-5b63-bc43-4f76-b0c4773b9117@xs4all.nl>
Date:   Mon, 19 Aug 2019 11:30:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-6-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLwAolzWBKe+ynQkD6R5+9eAsDVAI2FLOm6G0PIrkOFflmwuLF0Rd1UO2PlrtgHJMfbr8Dbq2W5XdW58ULQIkZQKgpj8NQCrP9Ioow8OThUWFrKr5O4N
 abzOSvXEh1J2cWE/izyk2ixYiw0MIztjY7TVtss8p9SnhYu1y5J/c/3MxfLu4DNpIKdyxM/KmSwDl9KcRUgRy8FDaVVeE+NTXpCWlQm20OiJ1oZgD06aTyjg
 Csq6M6wODmKDNN78uckbnpAcy8MyDDvRmdjR4SYwJS3BZfOPGww2Yw0Kj56k0D2ff84Qxu40mQn54GTFR++Fw7VSDZh2pLsJ3m1UUNE2kEM8Guem8az3CLsz
 2FGX2cLy
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

Typo: notifiy -> notify

Regards,

	Hans

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

