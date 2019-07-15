Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1017E68750
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbfGOKrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:47:20 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53771 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729530AbfGOKrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:47:20 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myVohcE9a0SBqmyVphRUIy; Mon, 15 Jul 2019 12:47:18 +0200
Subject: Re: [PATCH v2 1/5] drm: tda998x: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190701145944.214098-1-darekm@google.com>
 <20190701145944.214098-2-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ee8a2464-0b23-9cfe-1a56-19da8cf36fdc@xs4all.nl>
Date:   Mon, 15 Jul 2019 12:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701145944.214098-2-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCw4j1xueRILyZMgSz1c1UaxYmkeuJgmuDzRmJZnu4KkH70OLrgUs4u195/Rt8llcpUcP/hfYvhBc7sbWzJG20lWYLnO8Qf74dOg0YFIW/m0TUJgUsir
 iZ8Kcb8yeNb3lXijZc9y3qGWPOAofoFJFRHA+5HGNShcZ3GFSSW+7t/K+9pHbM4Z+pg/ZnDQzpD+zdaSKTlhbu2c31r5A2r/g4v0Fk6GmSEh4jK002ormLQU
 fxoL1rXKwWJmpzvnijUk9kxSmbyTSceXxK1lSoL4wFAphkgxHcvJqi5QP+h+0BuPnCMQ52V/+Lq3Vp+p3Wqs0Bs/biKhxgA7gCPSoI7/mhg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 4:59 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill
> in the cec_connector_info.
> 
> Changes since v1:
> 	Add memory barrier to make sure that the notifier
> 	becomes visible to the irq thread once it is
> 	fully constructed.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 32 ++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 7f34601bb5155..7844f4113a839 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -794,9 +794,14 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
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
> +					cec_notifier_set_phys_addr(notify,
> +							CEC_PHYS_ADDR_INVALID);

Can you replace this with cec_notifier_phys_addr_invalidate()?

>  			}
>  
>  			handled = true;
> @@ -1253,6 +1258,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  				  struct drm_device *drm)
>  {
>  	struct drm_connector *connector = &priv->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
>  	int ret;
>  
>  	connector->interlace_allowed = 1;
> @@ -1269,6 +1276,19 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
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
> +
>  	drm_connector_attach_encoder(&priv->connector,
>  				     priv->bridge.encoder);
>  
> @@ -1651,7 +1671,7 @@ static void tda998x_destroy(struct device *dev)
>  	i2c_unregister_device(priv->cec);
>  
>  	if (priv->cec_notify)
> -		cec_notifier_put(priv->cec_notify);
> +		cec_notifier_conn_unregister(priv->cec_notify);

You can drop the 'if': cec_notifier_conn_unregister() does nothing if
the notifier is NULL.

>  }
>  
>  static int tda998x_create(struct device *dev)
> @@ -1776,12 +1796,6 @@ static int tda998x_create(struct device *dev)
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

Regards,

	Hans
