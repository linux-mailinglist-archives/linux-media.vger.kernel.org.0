Return-Path: <linux-media+bounces-44368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC3BD81CB
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D88AA4E6ACD
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C06430F812;
	Tue, 14 Oct 2025 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q45y/VIM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFCB1A9FB3
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429487; cv=none; b=RtOU0XJsFzWo5sGkNxEktyRuX0vk4YODFiRCibfD4sC0ERlyT1mviURe0UEJWkrYxbjPilxlR8Xq+xNUCNzGqH/0e966uNHvJONdgSACi1ISsZ7JpEmCsNI9NHKZlnmi4gM0pfJFsBpJq1qJPfCstiQNEvQ/NbaDcO2bpXxP2Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429487; c=relaxed/simple;
	bh=cl0H1T9IB3vDr8YpVfyb1fSVU/D1wYAA+bawYos3jVw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DCAsMgsbHnaH38byk0wkZMPdFuo9/dxadF2noavDSSPz5t2AnZvFRfmpkfMfxIDmYGAPGGeQw4Tk8xEea3vqT3h7orSJf5misCSJDdrq5tIz6wm+P+mxTClwYn50CjV7UIf1dg6Ew7zgvbp1UyKQrPX8rcTBXX2+mJYopOve9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q45y/VIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F90AC4CEE7;
	Tue, 14 Oct 2025 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760429487;
	bh=cl0H1T9IB3vDr8YpVfyb1fSVU/D1wYAA+bawYos3jVw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=q45y/VIM7ctZhWXKB/Rn/yh6yJon84UT0LDbThvveTSOQTfd0m7h0d0lLS1o2Ed7s
	 DXAkaeRBTFRHyqszPUDElUEZV9rs7z4nl8T7yC3aRfGQgy+MtAzoj2201TIjcGmWiV
	 b+x5jyjkBV2vKHZEeKfkjoX9IQr0RUDTBB67fyFPr8bnZhKA5f/XEw+qLhnsyf5c2O
	 pqf0++SE5IQ9wUytXtCGYnqZmUubZ62nccM746AYkbmTarRx+3M87zP6YXI/KgewV3
	 yCLZMVx/Z7GzuuSOPm8Ev0rTvochzAByz/JZKH4uVe4AXqVPW0zukeFGprqwHxw32s
	 dUmL+RL10Dqkw==
Message-ID: <43b7cdef-d1c1-44ef-84ab-8b7ca2360d3a@kernel.org>
Date: Tue, 14 Oct 2025 10:11:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 2/2] media: xc2028: hold the device if firmware loading
 is in progress
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
References: <20250811072326.44569-1-dmantipov@yandex.ru>
 <20250811072326.44569-2-dmantipov@yandex.ru>
Content-Language: en-US, nl
In-Reply-To: <20250811072326.44569-2-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2025 09:23, Dmitry Antipov wrote:
> If firmware loading is scheduled with 'request_firmware_nowait()',
> wait for completion in 'xc2028_dvb_release()' to ensure that
> 'load_firmware_cb()' doesn't use the device which is actually freed.
> 
> Reported-by: syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: fix smatch warning in xc2028_dvb_release()
> ---
>  drivers/media/tuners/xc2028.c | 37 ++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
> index 807585d2dfde..602e66e4ba03 100644
> --- a/drivers/media/tuners/xc2028.c
> +++ b/drivers/media/tuners/xc2028.c
> @@ -117,6 +117,8 @@ struct xc2028_data {
>  
>  	struct firmware_properties cur_fw;
>  
> +	struct completion fwload;
> +
>  	struct mutex lock;
>  };
>  
> @@ -1329,12 +1331,17 @@ static void xc2028_dvb_release(struct dvb_frontend *fe)
>  
>  	mutex_lock(&xc2028_list_mutex);
>  
> -	/* only perform final cleanup if this is the last instance */
> -	if (hybrid_tuner_report_instance_count(priv) == 1)
> -		free_firmware(priv);
> +	if (priv) {
> +		/* wait for request_firmware_nowait() if scheduled */
> +		if (priv->state == XC2028_WAITING_FIRMWARE)
> +			wait_for_completion(&priv->fwload);
> +
> +		/* only perform final cleanup if this is the last instance */
> +		if (hybrid_tuner_report_instance_count(priv) == 1)
> +			free_firmware(priv);
>  
> -	if (priv)
>  		hybrid_tuner_release_state(priv);
> +	}
>  
>  	mutex_unlock(&xc2028_list_mutex);
>  
> @@ -1362,22 +1369,22 @@ static void load_firmware_cb(const struct firmware *fw,
>  {
>  	struct dvb_frontend *fe = context;
>  	struct xc2028_data *priv = fe->tuner_priv;
> -	int rc;
> +
> +	WARN_ON(priv->state != XC2028_WAITING_FIRMWARE);
>  
>  	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
>  	if (!fw) {
>  		tuner_err("Could not load firmware %s.\n", priv->fname);
>  		priv->state = XC2028_NODEV;

You have to call complete(&priv->fwload); here as well.

> -		return;
> -	}
> -
> -	rc = load_all_firmwares(fe, fw);
> +	} else {
> +		int rc = load_all_firmwares(fe, fw);
>  
> -	release_firmware(fw);
> +		release_firmware(fw);
> +		if (rc == 0)
> +			priv->state = XC2028_ACTIVE;
> +	}
>  
> -	if (rc < 0)
> -		return;
> -	priv->state = XC2028_ACTIVE;
> +	complete(&priv->fwload);
>  }
>  
>  static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
> @@ -1426,8 +1433,10 @@ static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
>  			tuner_err("Failed to request firmware %s\n",
>  				  priv->fname);
>  			priv->state = XC2028_NODEV;
> -		} else
> +		} else {
> +			init_completion(&priv->fwload);

This must be called before the request_firmware_nowait call. Otherwise load_firmware_cb
might be called when priv->fwload is still uninitialized.

>  			priv->state = XC2028_WAITING_FIRMWARE;
> +		}
>  	}
>  unlock:
>  	mutex_unlock(&priv->lock);

Regards,

	Hans

