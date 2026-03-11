Return-Path: <linux-media+bounces-55277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBxvCpSxsGnGmAIAu9opvQ
	(envelope-from <linux-media+bounces-55277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:04:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D54132597CC
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DAA630707A6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 00:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B4F2A1BF;
	Wed, 11 Mar 2026 00:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ViAirm3o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE7AD24
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187472; cv=none; b=a2fjSe+fkADy3+XeRMoFd7LkyieRSjr0EM4HVcuMmucXX3tEsOfoXQa9q2FhV1h5b+nPX/gfNSiH07iHa0Q2FdmyEXe8gKdovdF0pq/uVLM33OjF/ddVG0ysfofZFtmrlEDsgneD4E8tXl79VTw0sJKlD1dXfPdFI4QwwOno3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187472; c=relaxed/simple;
	bh=+43BOdwo7VXiTUsgxdy44JLwgVIf885ihZJy1GIB76E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeTTOUtWc1SXyISM1lCRT1rZ6LPT963O5Wku4xBkn/OIKRhyTmCRr5n6P9Ie7ucAnWWP9Mlr/j9BxnD+2cCFWFqMInktP2/hluRwOdxjIlug8adso9/9i3rOz/BskvJtEYhudNa8dgr+uahIoKu04fd89fo/PTVL5atw2aQgM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ViAirm3o; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-463f00cda04so8112245b6e.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773187468; x=1773792268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=ViAirm3osrVbeKYxqIwJquIRPqf7j7Ct/h10HSGJCuzHbQ+xNoWOqRm5x2iGD3bKIN
         gSo7/nsHTZkTcOZIbxCGO/QWQ6PSbHh3QUk7CyVD65VB60Mi5Qk+lSC6q/8nSobaySXp
         STUqXGpov3Vo4AxXqM1AzTqN8CnZlbBXArj2O8DjAMfbWBGaXf0EZC9e3/UZ5bMeIRCZ
         HtbX0ws/VCcgyTO5MF3NtmfII0EMEZSW3mzCVmHn8+Pj0op+4VKpDLURRDzfdJVY/1lF
         14ZKnNeLykDQgguwn+u0eizWHoEkwHv42ObQCXiG0qbzIgil3Dd1Uo/m1PxHjCumj72C
         h54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187468; x=1773792268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=CJCTO1RlZ9vRw9LKkX0lA7E/hT9eZuAeodMSQwAtfg0/jraeg2ZaY5/yj6NzdNokF4
         pb3X14ZOhJyLFS7VWvMMfIqDJ+RXMHya1Gy1T4PeExSmsM3T+T64Zf12S7gLil6xeO5q
         ZFl257sD7YhrgI8HjA8yV+cwXoXsgTDL4SOG8c57p2ria2xgwVR4fTSZ644/f+OlmKXi
         14Xr6ejxrrzg4BgIOQ0RRXVUoJYMYoabOWFLcPKF0y0xVVWstB6nVQ0ymW2hhCHKzG2r
         Gmt9a06+I5+EMziaOYGJO9wOGGVaWeBg8lfDWacTa1xoyx0NIIf66IJTRB6J/MUtJTW7
         INMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgRQwUoYxEyS1bGgLmHmaRbq8Kk5V+pq3G7TbybraSlHKyg25j1tAzgLO9uuQlK18r02V6wWhWQCYMiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GDHWIVKZ0MzNY0J/YOuAc3MhMYBLgLwaC6MRSPmkgzJD3GgK
	nxtfxF4CLobWCr9UQ3VaITdj9ohEZhcAXa96TcgAfKCF8CFApfAr9MLKk4ea2oGv2SI=
X-Gm-Gg: ATEYQzxvWqtX3pB9dOzPcrix4fPqAyZ5c7f/43WoQqM2LllJM6cTL4NYmowrLbkkNUW
	9ee832WRyfQNFiAjR+rRzGh4dEG3ZpeFFS3WTCSZxlRxq8ezQZgMcip0fr7UUVCXic7mOxsg/kZ
	WZDA3IATpsu+0FS+Tvh3V9Srh1S1rasCr/R4rtrjoXQT8sqY8s+liF0Zc4p6mxfGsljdb3/7ADt
	hEfUewjIeJEtMXnKXeTTZYMT6k5iL5Uc3O8KwyXBkelIG9BX/DVqSlnfPrrrBmyib0EIyheWF/3
	qVPyjXkw3QNJ/mQw4NObuPCrLUZTX7gVo5O2fkerfcETh2k+uPX6ABoohXxK5U10OSE+6oVdfJc
	Ear8G2V18pxbvSbuiOhssNDsJPIvtj7mgCc9jqc5mMWTdDWfivdyvft523HswU2TxeSEEh3AY5Z
	74grOBFbt+SnNGBmbOZ0IzZBEBKtDebF9Fqhzgd/bZHrtqSDrhFLlwFVynCwIYE3ksOCV6P3I+m
	Q==
X-Received: by 2002:a05:6808:14c8:b0:450:b249:718c with SMTP id 5614622812f47-46733547c85mr330873b6e.31.1773187468063;
        Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03? ([2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm233690b6e.7.2026.03.10.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:04:26 -0700 (PDT)
Message-ID: <04ffc988-f4ce-47f8-a998-66d2553d88af@baylibre.com>
Date: Tue, 10 Mar 2026 19:04:24 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D54132597CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55277-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
> index dac593be5695..f641b62e692b 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  
>  	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
>  					ch->scan_type.shift, 8);
> -	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
> +	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);

Even better would be to not alloc new memory at all.

We could probably reuse buffer_data from struct st_sensor_data for this.

>  	if (!outdata)
>  		return -ENOMEM;
>  
>  	err = regmap_bulk_read(sdata->regmap, ch->address,
>  			       outdata, byte_for_channel);
>  	if (err < 0)
> -		goto st_sensors_free_memory;
> +		return err;
>  
>  	if (byte_for_channel == 1)
>  		*data = (s8)*outdata;
> @@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  	else if (byte_for_channel == 3)
>  		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
>  
> -st_sensors_free_memory:
> -	kfree(outdata);
> -
>  	return err;

Should be able to change this to `return 0;` now.

>  }
>  


