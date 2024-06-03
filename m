Return-Path: <linux-media+bounces-12490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8CD8FA61F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 01:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B67E1B21D11
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 23:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655E313CF97;
	Mon,  3 Jun 2024 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2ztZNZC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1214529CEC
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455703; cv=none; b=VOjYL9P8IuEAF/30Pg/afvfx4+V7BeRVkiqNOT2WesJD0pp/bs25ZXDOLAs8vbDqDVtG35b5h63FcU0/C1heo9cjorb4ZddG+3tzR4IQm9KerzZf3CXDqkUMGPhjeS0PasShUaQStTG4d3b8z0A9efvVej48Y8H//eLvozPh3Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455703; c=relaxed/simple;
	bh=Qo4ylDWHCKBDpGUaTOGShTLPUnG4DbAeLHxJqlni0ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qm7We16TFgakMik+RmxPyvi7YOiqRRx00qS0Dn2pYdd9zMZNY5I5UKHvTo/FxvXbEipfCqtk5L9xaoCVIEPyuhUwRUEhKKDaLX60NoL3WDHzqzm+E51Rx1ytCG6t061qtVtrlywZEv5FsgbHNk2WKU/eurXFoTaej2YZaNTxEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2ztZNZC; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-421396e3918so24613465e9.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455700; x=1718060500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1iDRH/Hpo3TypBtE8AeJr13ufvedDoMcC4PukyspSI=;
        b=C2ztZNZCliIs/ZSrT0hzV+VF8GvWpLoGQ13vy/3jlPsSvoyv3EV+ltI/UobKPwcwjs
         OoV7fbEcFIuMyaq8rl0FFMVndVzGXF7dYkHyg9xECmgHcbjJp/AyP0a88Ofx8/wjxhzp
         vdQmQ7VFWqsxfwnRc0qEDb7NpvW7h3h/ECLOMgQEcDxigXHeO7CmUkaVvnS5jQhCuBym
         L/wN/kwOxF8s1/60cFZCxlqWttfLdpgqoCqDyLBjjaTJB9enP9JVhBOlrnkk78tpedKz
         t8kYMBnYQKAsE/2USsdCYW3vbYYjL8Vi4ydrr7SF2mOBl1TAsiWNoJCZRM4N934+NGUS
         91Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455700; x=1718060500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1iDRH/Hpo3TypBtE8AeJr13ufvedDoMcC4PukyspSI=;
        b=cUwuGkWnwuDNSZawuWssjZhZ5VTgTm3Cnjszb8JF2WXqL3WFqp33NQcNCLCXHT+/YU
         LEMWt9aIwvXzB3JAj6iyj416QdZ/pGFLCMqYp4LlvLMnkFSkYzqf16UbLVqo23WtG3rY
         thootF9Ov7x4cs4iuy3zbnNjPj9zZQ1vhqFEIU3e9CPPhUMJr5sBoHYoJRXWDGA+ESRM
         EpF+uUhEpC21AKPaHzB/olSnpEuJcGtLOSZS3bMyTsTgY5Dg5qyoewV1+Xty2EAIUGQV
         5p/9ht/TLxv4E8rWWYJ1RGDr9CLlWF3sp5+tBIT8TSMMXYbaN+vS+A8vYNRKFKgNaJdv
         PSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX7u1S/LZYclJHME5Lt++eHhqo+BPWuVImnu5EqJZcdPZFiFrszhWgDehXIcBrt2KJK7j6BnD5Cl5p4Ml2GeoiQ4NLrUjrJQ4hUQA=
X-Gm-Message-State: AOJu0YxSTcpmWJoV4CpmUbVz1tH1mZCWDxIveHEp6GsU55qRwFtvY7Rr
	4sAHEGs2kg6kvewTbyXApsNXBdQpHLp759ktt7AVGzrdAC6fB6ZJ+zOr6y329UE=
X-Google-Smtp-Source: AGHT+IGhXTioXRyealCIteCy2/hNRfcH/xTXI+2nFxC4USmBjCi67rMfEgRNKtv2TokNUdou6KOusQ==
X-Received: by 2002:a05:600c:5248:b0:421:4ecb:bd68 with SMTP id 5b1f17b1804b1-4214ecbbf7amr132595e9.31.1717455700327;
        Mon, 03 Jun 2024 16:01:40 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42129de0cf9sm148954215e9.13.2024.06.03.16.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 16:01:39 -0700 (PDT)
Message-ID: <aa3170c8-5bc3-44a8-a623-8558dc60e803@linaro.org>
Date: Tue, 4 Jun 2024 00:01:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Constify struct dec_bufsize_ops and enc_bufsize_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2024 08:26, Christophe JAILLET wrote:
> "struct dec_bufsize_ops and "struct enc_bufsize_ops" are not modified in
> this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>     text	   data	    bss	    dec	    hex	filename
>    12494	    822	      0	  13316	   3404	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    12766	    566	      0	  13332	   3414	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   .../platform/qcom/venus/hfi_plat_bufs_v6.c    | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index f5a655973c08..6289166786ec 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -1063,51 +1063,51 @@ struct enc_bufsize_ops {
>   	u32 (*persist)(void);
>   };
>   
> -static struct dec_bufsize_ops dec_h264_ops = {
> +static const struct dec_bufsize_ops dec_h264_ops = {
>   	.scratch = h264d_scratch_size,
>   	.scratch1 = h264d_scratch1_size,
>   	.persist1 = h264d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_h265_ops = {
> +static const struct dec_bufsize_ops dec_h265_ops = {
>   	.scratch = h265d_scratch_size,
>   	.scratch1 = h265d_scratch1_size,
>   	.persist1 = h265d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_vp8_ops = {
> +static const struct dec_bufsize_ops dec_vp8_ops = {
>   	.scratch = vpxd_scratch_size,
>   	.scratch1 = vp8d_scratch1_size,
>   	.persist1 = vp8d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_vp9_ops = {
> +static const struct dec_bufsize_ops dec_vp9_ops = {
>   	.scratch = vpxd_scratch_size,
>   	.scratch1 = vp9d_scratch1_size,
>   	.persist1 = vp9d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_mpeg2_ops = {
> +static const struct dec_bufsize_ops dec_mpeg2_ops = {
>   	.scratch = mpeg2d_scratch_size,
>   	.scratch1 = mpeg2d_scratch1_size,
>   	.persist1 = mpeg2d_persist1_size,
>   };
>   
> -static struct enc_bufsize_ops enc_h264_ops = {
> +static const struct enc_bufsize_ops enc_h264_ops = {
>   	.scratch = h264e_scratch_size,
>   	.scratch1 = h264e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
>   	.persist = enc_persist_size,
>   };
>   
> -static struct enc_bufsize_ops enc_h265_ops = {
> +static const struct enc_bufsize_ops enc_h265_ops = {
>   	.scratch = h265e_scratch_size,
>   	.scratch1 = h265e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
>   	.persist = enc_persist_size,
>   };
>   
> -static struct enc_bufsize_ops enc_vp8_ops = {
> +static const struct enc_bufsize_ops enc_vp8_ops = {
>   	.scratch = vp8e_scratch_size,
>   	.scratch1 = vp8e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
> @@ -1186,7 +1186,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>   	u32 codec = params->codec;
>   	u32 width = params->width, height = params->height, out_min_count;
>   	u32 out_width = params->out_width, out_height = params->out_height;
> -	struct dec_bufsize_ops *dec_ops;
> +	const struct dec_bufsize_ops *dec_ops;
>   	bool is_secondary_output = params->dec.is_secondary_output;
>   	bool is_interlaced = params->dec.is_interlaced;
>   	u32 max_mbs_per_frame = params->dec.max_mbs_per_frame;
> @@ -1260,7 +1260,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
>   		      struct hfi_buffer_requirements *bufreq)
>   {
>   	enum hfi_version version = params->version;
> -	struct enc_bufsize_ops *enc_ops;
> +	const struct enc_bufsize_ops *enc_ops;
>   	u32 width = params->width;
>   	u32 height = params->height;
>   	bool is_tenbit = params->enc.is_tenbit;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

