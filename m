Return-Path: <linux-media+bounces-56911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPArOQvqwmkOnQQAu9opvQ
	(envelope-from <linux-media+bounces-56911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:46:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D631BC4B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6D503056A91
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E8E372EC2;
	Tue, 24 Mar 2026 19:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p+A6agZx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAB313E36;
	Tue, 24 Mar 2026 19:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381357; cv=none; b=jqWUFPgJIsjy2EA8uUvSmmtfDhA7Zxud3qysJGf01WVZeMWQbh/+9ptEkty6YdhnMR23sGhYJ/ypq+MrkZ+pl6nDo9iBiWmDgcv+zX2PuyH9xek9cU8zxVX0/SxBUNW1H8YLQGBQwc1s/jLgEs4dbQbc7RS9aFV4MqguEMp23Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381357; c=relaxed/simple;
	bh=U3DeWTAmE2LnB3qU+Q5A0k9c+mYIEcBPU8ZO5YFui3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCzzD5f73JVN9Sq+Ccw5DfEfbyH+rr0SXM+KrCjQTsLoicTgPuks2M1MEJOh3f0gktwf0Q5IJOjMH/29KmABGlWmGOhLeH83kGPPm/3KIg7pSLMGFJ5txDqhYxk4zFI3QB+lxLNSn9qXApyTkJhu/iKFzh3QEfpL/GWsAUnoOZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p+A6agZx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774381353;
	bh=U3DeWTAmE2LnB3qU+Q5A0k9c+mYIEcBPU8ZO5YFui3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p+A6agZxyYL7Q1ouQnrsLc5ELvsiJ43qHKdhEqCIojExK2Y9XrTuyEfe6SiORu7oa
	 sGJg5Wm111CCiVFKWmR2axOia5V7Jv1aKzDxau4RBBlDK9oqoS43BZko5z9dkMr/4o
	 cGEH+p1Tt7wM3Q9gX76vR15VOcVqRmYjYdwv7op/Qp4HaBsHOvQbdyAN7NbXzJBcEE
	 A6IyughffAgz/oCNuSU2ymuFd+9XNXB7qb+HqOIGiOfAY31DsxbiVfaSvECDHpEZIP
	 eOAZGIArt278F/nfjm/1fiSmT6v/8TyMCcSeLNbVV2S9x2Mnn9WoqvNui8BtyhSCBB
	 GUON6tcMAOy/A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEE7C17E4DEB;
	Tue, 24 Mar 2026 20:42:32 +0100 (CET)
Message-ID: <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
Date: Tue, 24 Mar 2026 20:42:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com
Cc: tarang.raval@siliconsignals.io, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56911-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 117D631BC4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin,

Thanks for the patch but...

On 3/24/26 13:45, Elgin Perumbilly wrote:
> Replace runtime_suspend/resume wrappers by using power helpers
> directly with DEFINE_RUNTIME_DEV_PM_OPS().

...why? What advantage does this refactoring bring?

Best regards,
Michael

> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>  drivers/media/i2c/imx415.c | 44 +++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 0b424c17e880..b7d44f3e165b 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1129,8 +1129,12 @@ static void imx415_subdev_cleanup(struct imx415 *sensor)
>  	v4l2_ctrl_handler_free(&sensor->ctrls);
>  }
> 
> -static int imx415_power_on(struct imx415 *sensor)
> +static int imx415_power_on(struct device *dev)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct imx415 *sensor = to_imx415(subdev);
> +
>  	int ret;
> 
>  	ret = regulator_bulk_enable(ARRAY_SIZE(sensor->supplies),
> @@ -1161,11 +1165,17 @@ static int imx415_power_on(struct imx415 *sensor)
>  	return ret;
>  }
> 
> -static void imx415_power_off(struct imx415 *sensor)
> +static int imx415_power_off(struct device *dev)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct imx415 *sensor = to_imx415(subdev);
> +
>  	clk_disable_unprepare(sensor->clk);
>  	gpiod_set_value_cansleep(sensor->reset, 1);
>  	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
> +
> +	return 0;
>  }
> 
>  static int imx415_identify_model(struct imx415 *sensor)
> @@ -1371,7 +1381,7 @@ static int imx415_probe(struct i2c_client *client)
>  	 * work when runtime PM is disabled in the kernel. To that end, power
>  	 * the sensor on manually here, identify it, and fully initialize it.
>  	 */
> -	ret = imx415_power_on(sensor);
> +	ret = imx415_power_on(sensor->dev);
>  	if (ret)
>  		return ret;
> 
> @@ -1411,7 +1421,7 @@ static int imx415_probe(struct i2c_client *client)
>  	pm_runtime_put_noidle(sensor->dev);
>  	imx415_subdev_cleanup(sensor);
>  err_power:
> -	imx415_power_off(sensor);
> +	imx415_power_off(sensor->dev);
>  	return ret;
>  }
> 
> @@ -1430,32 +1440,12 @@ static void imx415_remove(struct i2c_client *client)
>  	 */
>  	pm_runtime_disable(sensor->dev);
>  	if (!pm_runtime_status_suspended(sensor->dev))
> -		imx415_power_off(sensor);
> +		imx415_power_off(sensor->dev);
>  	pm_runtime_set_suspended(sensor->dev);
>  }
> 
> -static int imx415_runtime_resume(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> -	struct imx415 *sensor = to_imx415(subdev);
> -
> -	return imx415_power_on(sensor);
> -}
> -
> -static int imx415_runtime_suspend(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> -	struct imx415 *sensor = to_imx415(subdev);
> -
> -	imx415_power_off(sensor);
> -
> -	return 0;
> -}
> -
> -static DEFINE_RUNTIME_DEV_PM_OPS(imx415_pm_ops, imx415_runtime_suspend,
> -				 imx415_runtime_resume, NULL);
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx415_pm_ops, imx415_power_off,
> +				 imx415_power_on, NULL);
> 
>  static const struct of_device_id imx415_of_match[] = {
>  	{ .compatible = "sony,imx415" },
> --
> 2.34.1
> 


