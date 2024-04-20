Return-Path: <linux-media+bounces-9817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A648ABD9E
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 00:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D630A28115B
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 22:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D439481DD;
	Sat, 20 Apr 2024 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zn0DsYbE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9A4F883
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653258; cv=none; b=tPJGWijvbkaI8F7kfyxChmIMkq0hX1aJL9DDCWgwPG/ULCGs+FZu/4YkXnW71HPc5M+lrpI41MwwBFx64uyKzEfPoIRPmbDXjvzAEYQUh2veJNdyfV5RCdRK/iQGKBoqE+EKaYkJRbB3iRkZs+TyRKM7QpoE8pVOu+wprDC+z74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653258; c=relaxed/simple;
	bh=7BKUeJX9aV7FK0wwM/ed4hU8pUFUg4zU4KPvLHQ6pXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozZlUMZMRM6MCYn8zUav254K5q4i2B/TjSaqzHeBdn5VYJf10r1854ZUbDIm3giMrLYQRW3qMJ6XoBT1WqLxbPpJjdOWZBf3F7FmwRYOmi6rtSp9JDsa9hRcIZCxNaxWADDY92weHdk9syMmnjGGnK2hr12bq5BWehQnPoFgB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zn0DsYbE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4199332c1dcso10464565e9.3
        for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713653255; x=1714258055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=Zn0DsYbEnTIwwESOgoO8bNl+kRk7ZIHTdFnQcbcfA9pC3SCAl9hSeCxZbKt7V1tpaS
         Fbw2Mq5+oPCuAkB4OYpcbQY0WFzQzenqO7M59554jHeY4cRFNojtogX94EvL1cOYAa3J
         Pc8ARaggrXzWsp6CK2fZLFQ5hdr+s72oCSL+Bo6R51Gmqrkh84BdS59hvxvS5uffj/XL
         DkOZyMNQj1pBCog+e3xt3D0ZvXPjFqp6lX+87sC6Bbe4HF5YVZWAKPiHBXE3kOzjaxxS
         vjhcNS5SszgYyNp87pSYWnI94Xt0JVWcFDmaegY7T6j8ekQ/WtPDEQ2/QtHzc8KCLhJt
         VaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653255; x=1714258055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=GLS1uwXNtFu4E6s4QNMELC/fWN+6YmXbzZPLd70vglSshwqO/L9jsvHNsxb7I/mto9
         eGP8zKkby3jpMFuFAZtp3f/5NtCl3MqtbMyfFqJrOF9V+LtygIWah151fLY2GiG4fgD5
         VOyfKyMK07+Z2vN+JY+YnXYOZ00zYzmSTI67LNoXYVz2tRLRwhIiz80NgFFaG4BWcKq/
         BKShKlCuIKNpbvvFFjF5w6wHHhj53jZfhl9U4h96vIdytRT0ZW9f0+HY4nzCh01g+EU0
         XXs8hE/CbyCrGCmRPllvN2Tx5o1AMF4dEstYI1i7BETxyf1S7jaju7ETcdwldPtBOD02
         9p3g==
X-Gm-Message-State: AOJu0YwBcoyj5Ajn2xmUdwxnqXMWHiXLRcOX56Ds9u2mLFzZYhLkKhCM
	rpHc0FFNTi8Xxqy0ifsrvDQweC85j09y277cv8lz2fK2x1m2gWnQVKlB3DIsiX4=
X-Google-Smtp-Source: AGHT+IFbaKQ0tPQEJ9I/RpZX+4qvxduHp5ktCxUofqd2WifblrkCYfYKIpU2lWpeintNmr/h6rZQlQ==
X-Received: by 2002:a05:600c:4e88:b0:419:87ab:f6da with SMTP id f8-20020a05600c4e8800b0041987abf6damr3268421wmq.3.1713653255313;
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b00417f65f148esm15283322wmo.31.2024.04.20.15.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Message-ID: <6b1627ff-5135-4685-be35-adf74a456469@linaro.org>
Date: Sat, 20 Apr 2024 23:47:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:48, Ricardo Ribalda wrote:
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
> 
> Found with cocci:
> drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..f87e33a34610 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_outputparm *out = &a->parm.output;
>   	struct v4l2_fract *timeperframe = &out->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
> -	inst->fps = fps;
>   
>   	return 0;
>   }
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

