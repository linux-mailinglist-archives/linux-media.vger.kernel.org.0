Return-Path: <linux-media+bounces-39712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DBB23EAC
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 04:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D65D174277
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 02:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E92E26CE23;
	Wed, 13 Aug 2025 02:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lFMVxN5B"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCE42836F
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053969; cv=none; b=liKNsVHIg/uJ+gIeJdBJdEz+9/LSLDmEizlBt481fcKPuPThQw/6UXEkHGi0bVte985SK0fh99VE3vpSmYyPPJzutMlcfvYU/cmVsrJGs/E2x4Ok9Lj3iZIe3BLCRkv1S8GUzUVbamlQNQE+s3iUyMMgrkyv0UtmtHkkA16L5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053969; c=relaxed/simple;
	bh=SnVS3r4yewgzNEQ1Wp9XVnA0LnglOdNV2fun4JVSjVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWFcvpqA4rVnOluEnsTgNfYWHaaj8kUsrEI2Fa4eRhUn9jEbc+LwyO1iCQz9snDOW0szroW+BEag5hwfCJ7y1m58f1nMdECjky9Vi1MNa3oaBuhhy0Ikr1TYlAi1p4g4/0il5q31NdwvTtSVNaEfxjPx13DCckBEz8xwdGdp1ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lFMVxN5B; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=+TyFJwxxkDUQYHA01POmCsDg5hiDiEEXB3xETjzezjQ=;
	b=lFMVxN5BNyd9ZDlaWqfCauTqJlOvRSbJ38a1p7ctsr8yHALzCzcuzcPf7q+85Y
	Vk8J60aKaHYLE9M1mnU+TmH67FL01hLJW/l2azzXZ8+n7zMj2qAfEQnt+JjqB3fq
	QjZFEqrZP9Dy54G+d+QsCfyoBT2baTePhrEXNrTcQP9BY=
Received: from [10.42.20.201] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXH8B0_5toogGaAw--.1228S2;
	Wed, 13 Aug 2025 10:59:02 +0800 (CST)
Message-ID: <d333a8ef-32fc-4a53-acbf-b5b30d621c3a@163.com>
Date: Wed, 13 Aug 2025 10:59:00 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: xc2028: hold the device if firmware loading
 is in progress
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
References: <20250811072326.44569-1-dmantipov@yandex.ru>
 <20250811072326.44569-2-dmantipov@yandex.ru>
Content-Language: en-US
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20250811072326.44569-2-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgCXH8B0_5toogGaAw--.1228S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr4DCryDGr17XF4UGr13twb_yoW5Aw4fp3
	yDJrW3GFWDtr4ftasrJrWUu3sYvwsYgFW5Gr1xJ3Z3uFnFvr4kAr1UtrykWr4jkrWkKw4a
	ka1agFn5GF4Dt37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2JPiUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/1tbiFBOonWib-g4i1QAAsG

On 2025/8/11 15:23, Dmitry Antipov wrote:
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
>   drivers/media/tuners/xc2028.c | 37 ++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
> index 807585d2dfde..602e66e4ba03 100644
> --- a/drivers/media/tuners/xc2028.c
> +++ b/drivers/media/tuners/xc2028.c
> @@ -117,6 +117,8 @@ struct xc2028_data {
>   
>   	struct firmware_properties cur_fw;
>   
> +	struct completion fwload;
> +
>   	struct mutex lock;
>   };
>   
> @@ -1329,12 +1331,17 @@ static void xc2028_dvb_release(struct dvb_frontend *fe)
>   
>   	mutex_lock(&xc2028_list_mutex);
>   
> -	/* only perform final cleanup if this is the last instance */
> -	if (hybrid_tuner_report_instance_count(priv) == 1)
> -		free_firmware(priv);

I'm not very familiar with this driver.
FWIW, how about call cancel_work_sync() before free the firmware?

Thanks,
Chi Zhiling

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
>   		hybrid_tuner_release_state(priv);
> +	}
>   
>   	mutex_unlock(&xc2028_list_mutex);
>   
> @@ -1362,22 +1369,22 @@ static void load_firmware_cb(const struct firmware *fw,
>   {
>   	struct dvb_frontend *fe = context;
>   	struct xc2028_data *priv = fe->tuner_priv;
> -	int rc;
> +
> +	WARN_ON(priv->state != XC2028_WAITING_FIRMWARE);
>   
>   	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
>   	if (!fw) {
>   		tuner_err("Could not load firmware %s.\n", priv->fname);
>   		priv->state = XC2028_NODEV;
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
>   }
>   
>   static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
> @@ -1426,8 +1433,10 @@ static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
>   			tuner_err("Failed to request firmware %s\n",
>   				  priv->fname);
>   			priv->state = XC2028_NODEV;
> -		} else
> +		} else {
> +			init_completion(&priv->fwload);
>   			priv->state = XC2028_WAITING_FIRMWARE;
> +		}
>   	}
>   unlock:
>   	mutex_unlock(&priv->lock);


