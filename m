Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC85785DEA
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 11:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731427AbfHHJLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 05:11:48 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:37807 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731076AbfHHJLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 05:11:48 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud9.xs4all.net with ESMTPA
        id veSXhrpNdAffAveSYhBT1u; Thu, 08 Aug 2019 11:11:46 +0200
Subject: Re: [PATCH v5 4/9] tda9950: use cec_notifier_cec_adap_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-5-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cb3500fe-89a2-34d6-2584-cb5749a98c2f@xs4all.nl>
Date:   Thu, 8 Aug 2019 11:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-5-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFrp7lYEmQ2aPT++6rEUZneV8fW3ZM6NB9+Y6SELn2+7Sz53QNkfUj/K5o2psjZqCUZW1zXu2WU/jNeQerOuG6ir66NkD0kheVwYaQUaU9F7Q0RJpnf/
 Tz7vY9zMnPcu3s9Qqeh5zgl3w8LOXP3h6iob7CAHznR/OfFoYQlQEAw6vIB2ae1W9v22ESqHuJk2uW/Aim+mmqm+RZhwQxuQZk/AY3f5fjCp8zG90A+I5Fci
 8HQ/Ifcmp7gZky5hVy2YsKUPU8qVh19V7L2Eo3nVCQwYYP3QA8aPQBH5ziTi9AwBKolcs7G8OxaOQaBU9Igmsg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_cec_adap_(un)register() functions to
> (un)register the notifier for the CEC adapter.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with a BeagleBone Black board.

Regards,

	Hans

> ---
>  drivers/gpu/drm/i2c/tda9950.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
> index 250b5e02a314a..e9f6171c47792 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -423,7 +423,8 @@ static int tda9950_probe(struct i2c_client *client,
>  		priv->hdmi = glue->parent;
>  
>  	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
> -					  CEC_CAP_DEFAULTS,
> +					  CEC_CAP_DEFAULTS |
> +					  CEC_CAP_CONNECTOR_INFO,
>  					  CEC_MAX_LOG_ADDRS);
>  	if (IS_ERR(priv->adap))
>  		return PTR_ERR(priv->adap);
> @@ -460,13 +461,14 @@ static int tda9950_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> -	priv->notify = cec_notifier_get(priv->hdmi);
> +	priv->notify = cec_notifier_cec_adap_register(priv->hdmi, NULL,
> +						      priv->adap);
>  	if (!priv->notify)
>  		return -ENOMEM;
>  
>  	ret = cec_register_adapter(priv->adap, priv->hdmi);
>  	if (ret < 0) {
> -		cec_notifier_put(priv->notify);
> +		cec_notifier_cec_adap_unregister(priv->notify);
>  		return ret;
>  	}
>  
> @@ -476,8 +478,6 @@ static int tda9950_probe(struct i2c_client *client,
>  	 */
>  	devm_remove_action(dev, tda9950_cec_del, priv);
>  
> -	cec_register_cec_notifier(priv->adap, priv->notify);
> -
>  	return 0;
>  }
>  
> @@ -485,8 +485,8 @@ static int tda9950_remove(struct i2c_client *client)
>  {
>  	struct tda9950_priv *priv = i2c_get_clientdata(client);
>  
> +	cec_notifier_cec_adap_unregister(priv->notify);
>  	cec_unregister_adapter(priv->adap);
> -	cec_notifier_put(priv->notify);
>  
>  	return 0;
>  }
> 

