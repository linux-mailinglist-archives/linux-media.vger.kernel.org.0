Return-Path: <linux-media+bounces-60403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAvfOifd+WkwEwMAu9opvQ
	(envelope-from <linux-media+bounces-60403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:05:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B54CD316
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D891A301747B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 12:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5086941325F;
	Tue,  5 May 2026 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geC38nXa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A239A7FD;
	Tue,  5 May 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982755; cv=none; b=cSQe+IIO7ged2peeU04gJGAyl/xTOTknnjshE1Nb9dQg4HTTkfCXgHuSneUPfSI7HDQa9cb4fihY3vrje56MOaIAZ1qAE0UXhgpCvkCsEGJSqKuSYbORuIILJX6WNgr3q9V3dgy8HPocuFvoiDcQpP88FhO/fbnrAd2WAi8I4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982755; c=relaxed/simple;
	bh=tFcPGTWeki9Taijwy4G4ifPpnSu4/IV8i4QfyCO1ngc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXHvgd1fPssFkwJm0ON76rzWbea8Co0bEHYeXyhlJRAWLmBG1HLemjo/+Vh2DSKIT7dzniNqd8PUHlJE53OEA7iwDlyoMuew0c7FjmpAr6Yj2sTLKqI9VYFDD2R3E6XZ8szsJkWjMzK8I/EAZ5Cg5TMTQkViQIw6Vpgi6wNr7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geC38nXa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA4FC2BCB4;
	Tue,  5 May 2026 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982755;
	bh=tFcPGTWeki9Taijwy4G4ifPpnSu4/IV8i4QfyCO1ngc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=geC38nXa6csEkTLKYAawWN8RrwJl41tXmaj1xWMjq0ujUUBcAwhKtyHeyPlvxZXDl
	 1TDps2n6W762c0Tu+mn7bo9T2i2nMufXDVVT5dWnWpku9PpKG4zGZEHA43Numyv9dd
	 +XUd/iZlXAAtw0ZAe1Tn2SKrlQ+CCXTgLvZ9FlGI3iQrVjoqV6NtiN5f4bZvZ7R5Qd
	 NfWaHGGjRe3k5hX4I1s3nELijKuUL2QCuZE6pc0DCiJ7jo/AMLODHyLt7v/d8fHWON
	 XiVLiUc0dBQabY1qQOUMoPcuQ9AI19AwBbJqlqTRQC/Xh+2oZso2y4HJM9AqP8G6HJ
	 ZU+ZnBBXRTVMg==
Message-ID: <79449571-d8c6-4fa7-8d53-5b358b73d34f@kernel.org>
Date: Tue, 5 May 2026 14:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: tuner: check return value of I2C transfers in
 set_type()
To: Wenyuan Li <2063309626@qq.com>, Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn,
 23120469@bjtu.edu.cn, stable@vger.kernel.org
References: <tencent_46889E152DE22B7E8A0CBB3311C556F92E09@qq.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <tencent_46889E152DE22B7E8A0CBB3311C556F92E09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B51B54CD316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60403-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,md.metrocast.net,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:email]

On 3/29/26 12:51, Wenyuan Li wrote:
> In set_type(), several I2C transfers are performed to initialize
> specific tuners (e.g. FMD1216ME, FMD1216MEX, TD1316), but the return
> value of i2c_master_send() is not checked.
> 
> If an I2C transfer fails, the initialization sequence may be
> incomplete, potentially leaving the tuner in an inconsistent state
> without any error being reported.
> 
> Check the return value of i2c_master_send() and propagate failures
> to the attach_failed path. A small helper is introduced to reduce
> duplication and provide consistent error reporting.
> 
> This ensures that I2C communication errors during tuner
> initialization are properly detected and handled.
> 
> Fixes: 93df3413f1b4 ("[PATCH] v4l: 655: added support for the philips td1316 tuner")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenyuan Li <2063309626@qq.com>
> 
> ---
> v5:
> - Reword commit message to better explain rationale
> - Clarify error handling approach
> - No functional changes
> 
> v4:
> - Added Cc: stable@vger.kernel.org
> - Updated Fixes tag
> ---
>  drivers/media/v4l2-core/tuner-core.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-core/tuner-core.c
> index 004ec4d7beea..01f28436a1f8 100644
> --- a/drivers/media/v4l2-core/tuner-core.c
> +++ b/drivers/media/v4l2-core/tuner-core.c
> @@ -280,6 +280,19 @@ static const struct analog_demod_ops tuner_analog_ops = {
>   * Functions to select between radio and TV and tuner probe/remove functions
>   */
>  
> +static int tuner_i2c_send(struct i2c_client *c, u8 *buf, int len)
> +{
> +	int ret = i2c_master_send(c, buf, len);
> +
> +	if (ret != len) {
> +		int err = ret < 0 ? ret : -EIO;
> +
> +		dev_err(&c->dev, "I2C send failed: %pe\n", ERR_PTR(err));
> +		return err;
> +	}
> +	return 0;
> +}
> +

I think this is overkill, and I also like to keep changes to this old code
to a minimum.

>  /**
>   * set_type - Sets the tuner type for a given device
>   *
> @@ -351,11 +364,13 @@ static void set_type(struct i2c_client *c, unsigned int type,
>  		buffer[1] = 0xdc;
>  		buffer[2] = 0x9c;
>  		buffer[3] = 0x60;
> -		i2c_master_send(c, buffer, 4);
> +		if (tuner_i2c_send(c, buffer, 4))
> +			goto attach_failed;

Just keep it simple:

		if (i2c_master_send(c, buffer, 4) != 4)
			goto attach_failed;

Ditto below.

>  		mdelay(1);
>  		buffer[2] = 0x86;
>  		buffer[3] = 0x54;
> -		i2c_master_send(c, buffer, 4);
> +		if (tuner_i2c_send(c, buffer, 4))
> +			goto attach_failed;
>  		if (!dvb_attach(simple_tuner_attach, &t->fe,
>  				t->i2c->adapter, t->i2c->addr, t->type))
>  			goto attach_failed;
> @@ -365,7 +380,8 @@ static void set_type(struct i2c_client *c, unsigned int type,
>  		buffer[1] = 0xdc;
>  		buffer[2] = 0x86;
>  		buffer[3] = 0xa4;
> -		i2c_master_send(c, buffer, 4);
> +		if (tuner_i2c_send(c, buffer, 4))
> +			goto attach_failed;
>  		if (!dvb_attach(simple_tuner_attach, &t->fe,
>  				t->i2c->adapter, t->i2c->addr, t->type))
>  			goto attach_failed;

Regards,

	Hans

