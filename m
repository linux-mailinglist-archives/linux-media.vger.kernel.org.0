Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C63E285DEE
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 11:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731076AbfHHJMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 05:12:32 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:55941 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731054AbfHHJMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 05:12:32 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud9.xs4all.net with ESMTPA
        id veTFhrphJAffAveTGhBTDq; Thu, 08 Aug 2019 11:12:30 +0200
Subject: Re: [PATCH v5 5/9] drm: tda998x: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-6-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e2e53fc2-823d-cd16-a6c6-50ab8462f2f0@xs4all.nl>
Date:   Thu, 8 Aug 2019 11:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-6-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGXmUhZDBWKDVG9yzMda89gOZaNLX/UiTy67M9tDV79rNBxgDMcfXQxyuBoOeuqqoJMoYZiHECK6gw2UB9HrsI1F8JqZ+qW6MhfzhSoEguTaA98saww/
 Q3TvXtNhswqqCS400efOnL1tBQ6ELPoijUmX6gKH+X03ZqmancE4vWpOwY8ko7LP/fMoV4rjynuUFITcrGXCJ8vaGFFMxch961V1j9jU4QIov1dm0yUWRKq8
 vO/1NgzE1HV19KqBt0GTn4xRXf6//vnpJ+lC2TdSHJwY2J2XWhym/29ggxNPOGq8hjSZFCptshXuwZofI0tIOQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
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

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with a BeagleBone Black board.

Regards,

	Hans

> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 7f34601bb5155..31214663d6fdd 100644
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
> +					cec_notifier_phys_addr_invalidate(
> +							notify);
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
> @@ -1650,8 +1670,7 @@ static void tda998x_destroy(struct device *dev)
>  
>  	i2c_unregister_device(priv->cec);
>  
> -	if (priv->cec_notify)
> -		cec_notifier_put(priv->cec_notify);
> +	cec_notifier_conn_unregister(priv->cec_notify);
>  }
>  
>  static int tda998x_create(struct device *dev)
> @@ -1776,12 +1795,6 @@ static int tda998x_create(struct device *dev)
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

