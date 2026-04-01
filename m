Return-Path: <linux-media+bounces-57899-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHwnIsRszWnvdQYAu9opvQ
	(envelope-from <linux-media+bounces-57899-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:06:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62937FA29
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2EDE302F182
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 19:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F2335AC25;
	Wed,  1 Apr 2026 19:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sP7f503K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF972E091B;
	Wed,  1 Apr 2026 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070397; cv=none; b=oFLvh3qyuB3fS8AM8HkfuKzKFw3pgoNmyIeYmnWgrfoedyS6OiWzNa+khUibhUnkIUeF2PwUzZ/EduV/VFTeqDm0MpaTrxSpIcyKOyJaVqt2Pv2OuUU4Ox4KH3NevhZNJTTTKVsd1G/rqnqboBAubC1/AJPhpYT6VjMf3af0JhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070397; c=relaxed/simple;
	bh=KND1P/afpGvmKNto0NJQpA32JLegb6YzSaE+4pN+iPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEZiKiCDkmdhLo7dEgslEHkgpPBRTtn3kIgA0fgkCMP26JxrHLpB6n0BifFbiwGL8RNOJldZj/SnCtXKGcezLPwCl6p/irfIcwfHtyKXJr9dDyO5AYgTNs/pOv+qCA2O/yrfUn0y2BaBGhaoz04Ilbj6AiA78gjBdDTKt2yXgiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sP7f503K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EC8C4CEF7;
	Wed,  1 Apr 2026 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775070396;
	bh=KND1P/afpGvmKNto0NJQpA32JLegb6YzSaE+4pN+iPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sP7f503K4AHnsxc2JsLzsFtkFBi4ZSuWiWDfrZEZdw5lPuLns4yHuTcB4n3Izao20
	 7SdEGtDVjElC3c6ngTYunccsUtZoH9xB/SZCTEcHPTaKgH9X5Ga+u2PSExVSEUrXD6
	 FUyDotLQwzLJbswH+r6X4rXNV+eHfa/B5RXmHxtU3YHPoUux2nmkLwJYtzyLJn71sq
	 vi4A8PCsKiO9/1OdNNguLHV5KR+9TsHCzYDa/Xgqrv8cyhr3VtPCFf0YGTjronbrqg
	 KAGDQJfNqLlGwYF/MbRFmNwZ5Q9KMd2eAW8jnTTMCzxjcNk9nDkZspgGo/9JdFxmuO
	 Ap4VYkiQXtvgA==
Message-ID: <38dc77ed-2427-44df-847d-4d41183e0df2@kernel.org>
Date: Wed, 1 Apr 2026 21:06:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: i2c: gc0310: fix probe error handling and
 unwind resources properly
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
 <20260401181657.654055-2-sanjayembedded@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260401181657.654055-2-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57899-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C62937FA29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 1-Apr-26 20:16, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> The GC0310 probe path currently performs error cleanup by jumping to a
> common label that mirrors the driver's remove() callback. This is unsafe,
> as remove() assumes that the subdevice has been fully registered with
> the V4L2 framework, media and control resources have been initialized.

That is simply not true, all functions called in remove() internally
check if their init counter-part has succeeded and if not are a no-op.

If you're aware of any specific calls in remove() where this is not
the case, please explicitly describe these cases and describe an
example exit-error path from probe() where things actually go wrong.

> Calling remove() from probe can result in unregistering or cleaning up
> subdevice, leading to resource leaks and subtle lifecycle bugs.
> 
> Rewrite the probe() error handling to unwind resources explicitly, using
> fine‑grained goto labels along with appropriate error logs. Each failure
> path now frees only successfully acquired resource, without remove().
> 
> This aligns the driver with standard V4L2 sensor lifecycle expectations
> and avoids incorrect teardown during probe failures.

The rest of this reads very much like this was AI generated.

Did you use AI to generate these patches ? If so please:

Make sure you actually understand what the patch is doing and
very yourself that it actually is correct, which in this case
I believe it is not.

Regards,

Hans


> 
> Fixes: 1e72afb5146a ("media: Move gc0310 sensor drivers to drivers/media/i2c/")
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/media/i2c/gc0310.c | 39 ++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
> index 7af4d66f42a0..72a82ad4118a 100644
> --- a/drivers/media/i2c/gc0310.c
> +++ b/drivers/media/i2c/gc0310.c
> @@ -721,7 +721,7 @@ static int gc0310_probe(struct i2c_client *client)
>  
>  	ret = gc0310_detect(sensor);
>  	if (ret)
> -		goto err_power_down;
> +		goto error_power_off;
>  
>  	sensor->sd.internal_ops = &gc0310_internal_ops;
>  	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> @@ -730,20 +730,27 @@ static int gc0310_probe(struct i2c_client *client)
>  
>  	ret = gc0310_init_controls(sensor);
>  	if (ret)
> -		goto err_power_down;
> +		goto error_power_off;
>  
>  	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> -	if (ret)
> -		goto err_power_down;
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
>  
>  	sensor->sd.state_lock = sensor->ctrls.handler.lock;
>  	ret = v4l2_subdev_init_finalize(&sensor->sd);
> -	if (ret)
> -		goto err_power_down;
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
>  
>  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> -	if (ret)
> -		goto err_power_down;
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret,
> +			      "failed to register gc0310 sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
>  
>  	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>  	pm_runtime_use_autosuspend(&client->dev);
> @@ -751,9 +758,21 @@ static int gc0310_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> -err_power_down:
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&sensor->sd);
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +error_media_entity:
> +	media_entity_cleanup(&sensor->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +
> +error_power_off:
>  	pm_runtime_put_noidle(&client->dev);
> -	gc0310_remove(client);
> +	gc0310_power_off(&client->dev);
> +
>  	return ret;
>  }
>  


