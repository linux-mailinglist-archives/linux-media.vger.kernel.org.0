Return-Path: <linux-media+bounces-28021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00249A5BDA6
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 972B93AA288
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D9B2356A3;
	Tue, 11 Mar 2025 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="chO8Uc09"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BFA22F3A8
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688427; cv=none; b=WtvFZ+LY8daGaDS71KwDT25pxNfbPKwFWDNUEEXTlwvdQ6NET/qhXwiHXmHn+9gzcYvyJLjCAjgClPxApVzQ/1ncc4EQMdC6YF0OysuR9S0QTBtJjmwkrb04mPULKguTvXgDcMT5vHSJIcXkH81RbySTacNZKwFs2E2CQZthA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688427; c=relaxed/simple;
	bh=rBgpmzX2+wP1tLDlhfTPueI+y4IfICRivF/YyUb+B1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNEMBO6ST60yGr+S5bunz8VxFQhdElagDgLDsSITuAZVkK/6kmrZRFtwvkdm9Zat/yYCANXXHszJrzUOPL6TYiEYVu9BxFx9Pn8RfUqhloX7JTxkeeSHYR4ptX2o3Mvqh1OAaqq17cpmBCG7ebXi5aCy3qci8PnRblyzYKgkzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=chO8Uc09; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741688424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QebtFEreh1yUlR0ep68UqUWw/xuUev/FYvtC83ocwFI=;
	b=chO8Uc09c+rdFRPu73Tx93y+sdoOkFqRHD0H+x+rOpTrazLZwF7D40+V/eZgNrYOOUNyKo
	NGX+5QQ8VJHL9Prn0Q1YO7H/L9J66A09qqLjUfDGRwqgcqqy0htRmwAL2HJuRjo3yq5/16
	FrW8xXTAne8qPFawEAZP6SSL1slj4d0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-itR8kPcuOMOcKT-5i1HpDg-1; Tue, 11 Mar 2025 06:20:23 -0400
X-MC-Unique: itR8kPcuOMOcKT-5i1HpDg-1
X-Mimecast-MFC-AGG-ID: itR8kPcuOMOcKT-5i1HpDg_1741688422
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f6eso5286655a12.3
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 03:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688422; x=1742293222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QebtFEreh1yUlR0ep68UqUWw/xuUev/FYvtC83ocwFI=;
        b=Ae7S3TKLlu6xEi993FOsSmLjeHa4xPSPKsTqDCSj1k+HOiqUbfXUIzavoXb5c7QmX5
         9Z87Wds09iiJRHIshuMi9GROhwFN8mLI6Py6wSBKxlJnXCRxddhLH/fHDzBLto2GP+pm
         OWAKaXqEyNT2UxO4aRLvpASicMKhXv6PAhASfJw8rxVORACjwbKccuPT9l9iIXjWsDH6
         jah25hR/LoM3uX8U41gaezRSL2FZxODvR7gcfBbRYDo3GS1OHLVy83BhspNc8qndSYll
         PzezQXbVS6eF59aSdN3grFl2LpQ11yER2Pf9rGqvt0Uj+1Tn7qSpuzk3A7Oehn5Sf+F+
         GxdQ==
X-Gm-Message-State: AOJu0YyTr/RB736aGAnMq4ssMHlXkif5NJ4ZMDbFcrP8c6gJ8DIu/7KT
	7QeglqfFI6fq1GRNn/Xz0NyA2H9rXvlVAOLLrRTfid/3URdkNEwo2Lyb7xrX9IcCEQCXnLDuqBZ
	ZzseMcLu/HFJhA+gJMjoJE30TnubwIaBXP9UsWW5Vvl60lrPjjScEULHHfQk+
X-Gm-Gg: ASbGnctG1tiRiWzv44f5pPpNdygnlyV5yOIa2pECE8QXjBqrSMX9tWSBS8d3y7gNwcR
	ZK5JELQ9fR8Yh47znTLA4YdP9RCRaqGy77hraKkB5i4gUh5BKhHfP2o0lKsXo8uCRC23AswK7G+
	sXXB9EUa9hltKDfIDHHTPaGYL14/KEOLx7eJJpAAL8E7oqz9BXI1S4orDzeeiNWGKDH/Cblp9+W
	Ksr8hKl0s9sYHD8ukg6aa49jASJUYGGV3bRLm25QANWrkXBqE8x8Py1kkxbCUJfAMFBsYp4MppO
	awW0M1jhPF8QK/UI34X2lLwBEkRHtTvo7ZDK0snobVjj8ZU6opvDudjwPm9PUCW3+JrtQgK1Laz
	AZLvcUhwr4dDkP9kXcfG+LUKCFp0LTMi6QnjjQ6bRLNgKUi9mkVHSMEUFRSnENlDALw==
X-Received: by 2002:a05:6402:34d4:b0:5e0:9056:33f7 with SMTP id 4fb4d7f45d1cf-5e75f5a3465mr3950815a12.24.1741688422021;
        Tue, 11 Mar 2025 03:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC2hlcanlhxtu9mj0ooeGGNMRNZBG9wXMTGmiYI1tyH+NLMwbb/k/xYjjogF9PbdSSWoqULg==
X-Received: by 2002:a05:6402:34d4:b0:5e0:9056:33f7 with SMTP id 4fb4d7f45d1cf-5e75f5a3465mr3950772a12.24.1741688421494;
        Tue, 11 Mar 2025 03:20:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f98asm8042202a12.68.2025.03.11.03.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:20:20 -0700 (PDT)
Message-ID: <70b8c4d4-09c4-4818-ab59-0ea8867157db@redhat.com>
Date: Tue, 11 Mar 2025 11:20:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: ov13b10: Fix h_blank calculation
To: Hao Yao <hao.yao@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
References: <20250311084656.516627-1-hao.yao@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250311084656.516627-1-hao.yao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hao,

On 11-Mar-25 9:46 AM, Hao Yao wrote:
> Pixel per line (PPL) is calculated as pixel_rate / (VTS * FPS), which
> is not decided by MIPI CSI-2 link frequency. PPL can vary while link
> frequency keeps the same. If PPL is wrong, the h_blank = PPL - width
> is also wrong then FPS control is inaccurate.
> 
> This patch fix h_blank by:
> 1. Move PPL from link_freq_config to ov13b10_mode
> 2. Add PPL value for different modes
> 3. Use PPL from mode to calculate h_blank
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 73c844aa5697..2e83fc23f321 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -34,9 +34,6 @@
>  #define OV13B10_VTS_120FPS		0x0320
>  #define OV13B10_VTS_MAX			0x7fff
>  
> -/* HBLANK control - read only */
> -#define OV13B10_PPL_560MHZ		4704
> -
>  /* Exposure control */
>  #define OV13B10_REG_EXPOSURE		0x3500
>  #define OV13B10_EXPOSURE_MIN		4
> @@ -95,7 +92,7 @@ struct ov13b10_reg_list {
>  
>  /* Link frequency config */
>  struct ov13b10_link_freq_config {
> -	u32 pixels_per_line;
> +	u64 link_freq;
>  
>  	/* registers for this link frequency */
>  	struct ov13b10_reg_list reg_list;
> @@ -114,6 +111,10 @@ struct ov13b10_mode {
>  
>  	/* Index of Link frequency config to be used */
>  	u32 link_freq_index;
> +
> +	/* Pixels per line in current mode */
> +	u32 ppl;
> +
>  	/* Default register values */
>  	struct ov13b10_reg_list reg_list;
>  };
> @@ -549,7 +550,7 @@ static const s64 link_freq_menu_items[] = {
>  static const struct ov13b10_link_freq_config
>  			link_freq_configs[] = {
>  	{
> -		.pixels_per_line = OV13B10_PPL_560MHZ,
> +		.link_freq = OV13B10_LINK_FREQ_560MHZ,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1120mbps),
>  			.regs = mipi_data_rate_1120mbps,
> @@ -564,6 +565,7 @@ static const struct ov13b10_mode supported_modes[] = {
>  		.height = 3120,
>  		.vts_def = OV13B10_VTS_30FPS,
>  		.vts_min = OV13B10_VTS_30FPS,
> +		.ppl = 4704,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_4208x3120_regs),
>  			.regs = mode_4208x3120_regs,
> @@ -575,6 +577,7 @@ static const struct ov13b10_mode supported_modes[] = {
>  		.height = 3120,
>  		.vts_def = OV13B10_VTS_30FPS,
>  		.vts_min = OV13B10_VTS_30FPS,
> +		.ppl = 4704,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_4160x3120_regs),
>  			.regs = mode_4160x3120_regs,
> @@ -586,6 +589,7 @@ static const struct ov13b10_mode supported_modes[] = {
>  		.height = 2340,
>  		.vts_def = OV13B10_VTS_30FPS,
>  		.vts_min = OV13B10_VTS_30FPS,
> +		.ppl = 4704,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_4160x2340_regs),
>  			.regs = mode_4160x2340_regs,
> @@ -597,6 +601,7 @@ static const struct ov13b10_mode supported_modes[] = {
>  		.height = 1560,
>  		.vts_def = OV13B10_VTS_60FPS,
>  		.vts_min = OV13B10_VTS_60FPS,
> +		.ppl = 4704,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_2104x1560_regs),
>  			.regs = mode_2104x1560_regs,
> @@ -608,6 +613,7 @@ static const struct ov13b10_mode supported_modes[] = {
>  		.height = 1170,
>  		.vts_def = OV13B10_VTS_60FPS,
>  		.vts_min = OV13B10_VTS_60FPS,
> +		.ppl = 4704,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_2080x1170_regs),
>  			.regs = mode_2080x1170_regs,
> @@ -620,6 +626,7 @@ static const struct ov13b10_mode supported_modes[] = {
>  		.vts_def = OV13B10_VTS_120FPS,
>  		.vts_min = OV13B10_VTS_120FPS,
>  		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
> +		.ppl = 4664,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1364x768_120fps_regs),
>  			.regs = mode_1364x768_120fps_regs,
> @@ -1062,19 +1069,13 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
>  		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
>  
>  		/* Update limits and set FPS to default */
> -		vblank_def = ov13b->cur_mode->vts_def -
> -			     ov13b->cur_mode->height;
> -		vblank_min = ov13b->cur_mode->vts_min -
> -			     ov13b->cur_mode->height;
> +		vblank_def = mode->vts_def - mode->height;
> +		vblank_min = mode->vts_min - mode->height;
>  		__v4l2_ctrl_modify_range(ov13b->vblank, vblank_min,
> -					 OV13B10_VTS_MAX
> -					 - ov13b->cur_mode->height,
> -					 1,
> -					 vblank_def);
> +					 OV13B10_VTS_MAX - mode->height,
> +					 1, vblank_def);
>  		__v4l2_ctrl_s_ctrl(ov13b->vblank, vblank_def);
> -		h_blank =
> -			link_freq_configs[mode->link_freq_index].pixels_per_line
> -			 - ov13b->cur_mode->width;
> +		h_blank = mode->ppl - mode->width;
>  		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,
>  					 h_blank, 1, h_blank);
>  	}

You are doing a bunch of unrelated search 'ov13b->cur_mode->' replace
with 'mode->' here e.g. for vblank_def and vblank_min. While this is
a good change to have which increases readability, this is unrelated
to the hblank changes, so please split this out into a new patch 1/3
as preparation for the further changes in the series.

Mixing those changes into this patch makes it hard for reviewers to
see which changes you are actually making wrt h_blank handling.

Regards,

Hans


> @@ -1328,8 +1329,7 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
>  					  OV13B10_VTS_MAX - mode->height, 1,
>  					  vblank_def);
>  
> -	hblank = link_freq_configs[mode->link_freq_index].pixels_per_line -
> -		 mode->width;
> +	hblank = mode->ppl - mode->width;
>  	ov13b->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
>  					  V4L2_CID_HBLANK,
>  					  hblank, hblank, 1, hblank);


