Return-Path: <linux-media+bounces-28022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D1A5BDA8
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E324B3AA3E1
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E78235374;
	Tue, 11 Mar 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NFTEzB9z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE802356DE
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688432; cv=none; b=IiXftwbmpuYNxYS99NTCzpyvu2a2Ac0/7NkCXKHGWVnBvSeBRFlgtohzZ92KrhVpNkB6rTEhrjcnY5Vrhvp2NpqKnbJ5aj6Q22Qeq1TCKX++qWMMjnKejSshMbuVcTN3b5QwSMHVrSRFR8PGyWBvkcGA/UztSHhvGdSQAovph+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688432; c=relaxed/simple;
	bh=rBgpmzX2+wP1tLDlhfTPueI+y4IfICRivF/YyUb+B1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKEG2H//qBg3yc+90enMA4fWbaORFMkgQUnbe3NkN6+BjyQhgiDHmMW0g+XqtIXzOq47nm1eNlwl3CR11SLMaoE3YjbyqtgPs58ge4Fyo74qZsSuhUEDSTKsaCMBm+0o5kgV0p1ktvkvyQ9p7MdP1sa5SLI3G/k/aXKtlgLqALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NFTEzB9z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741688429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QebtFEreh1yUlR0ep68UqUWw/xuUev/FYvtC83ocwFI=;
	b=NFTEzB9zk52wuBZ2w9YVAWoWPwqYr5o1aYuy+XWqyRKacbTOL37UseMZZVENDXUhwx+w8V
	z+fLrl09j631PGSDIHJiy3uo7hkkjzsfPLbhyAAdeQUHsbE4RW0xcl6BouKvn0a5tEvXHQ
	tHUPveHHNI/rmBghiXJ0dm90ESjt3EI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-lHYZYL6gObOWXGOq2naTnA-1; Tue, 11 Mar 2025 06:20:27 -0400
X-MC-Unique: lHYZYL6gObOWXGOq2naTnA-1
X-Mimecast-MFC-AGG-ID: lHYZYL6gObOWXGOq2naTnA_1741688427
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e72c1bf151so1885819a12.3
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 03:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688426; x=1742293226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QebtFEreh1yUlR0ep68UqUWw/xuUev/FYvtC83ocwFI=;
        b=AdNcg2pmW+b7PSLfUqvQCW/Y5A7IoukcnQxeJnI6sPExMpm4Z3zdmg5F/tmKU84HPv
         mmGqHPGIaJE9fR8OVlTgwtVZCL5QGFgljxww60sj0haayp9A6zrTDbdpWOVPBSVevZWk
         5vYmijdaO43deXdpKwglIQim8NC0TVTGxluZsKlQB1JQslvXqaRCRXman5bSvlntMON3
         QWlvgEzNZmy2jLBdRU0AJiU3hoI8hDM+Xh/Bc2ZdNGJOAhHH8EpXjLfDaVl/DBfSABbv
         SdUpVch5XloWRt1Rnv8OiGf/IeI05646EIv+bPFdvkDG7QPdbNCxFiCt7Z48BAriyjLw
         HWvA==
X-Gm-Message-State: AOJu0Yww4iDlihylNWy/l0oUlLPC+VO/OxMgIaTih3t+nRyklUDFIP7j
	Ez4A8AXs2n48Z7anUZZU8qBBRCkzYMYq7AcE0HB6ZLxx96lJK6aKcFaIlcK492MkyGNAnbDmnRk
	cEUwzgesetQ1PpWDHwPWF2W2zvfHHQ5XEMLVzgnUyEMzPB9UuTNwZttnVWSrV
X-Gm-Gg: ASbGncu6v6cmR2ODRslWEdDU0httPWNalACv6k6hBk5WxuDZkEbFeROWiiVVmm8GS49
	EFjX/IvCnadTurvlhk1xeuBJRA53TAG8ZyZF5259ItlAalH1f5WwKAqFC5cT60ApdAR1MfXRQ+w
	VuH3tDZrFob7LP7yKbfYzith1Syj41hFiypY+kbr7jb1lb3xqKn6IUKu9X5SBOQ8Id2dQ1PSPWE
	nDvq2JdDizjGAdR0Y1+jtgahJ/BXDt9fbZaycJD5rkidFY3yN2CcuZxBMjmhlWRN+lwliFw9aG7
	0ai/ola7sSy06uh3HPjNYMktKhTdK3vDJAogLbPLPdyYpC/8+vke0u13+csScyPuNz0zVxAyxFq
	wiPNB9Vi0UyrPNtjrXUuxttZKby0ynEvKrPo+oXQOvP8JB7ARLMiaWXRuiyMgi1LgFw==
X-Received: by 2002:a05:6402:270f:b0:5e4:b66f:880b with SMTP id 4fb4d7f45d1cf-5e5e22988f8mr20111098a12.6.1741688426564;
        Tue, 11 Mar 2025 03:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYYfYXHMx8dlAxPfH8HooO9PRQAOL8niw3gMxz3sh7OLQZ7RGicVerFf7sWkf4owiW/sOXIA==
X-Received: by 2002:a05:6402:270f:b0:5e4:b66f:880b with SMTP id 4fb4d7f45d1cf-5e5e22988f8mr20111059a12.6.1741688426045;
        Tue, 11 Mar 2025 03:20:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a6fbsm7993123a12.61.2025.03.11.03.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:20:24 -0700 (PDT)
Message-ID: <21e5be29-1934-430a-a332-3cf574f4302a@redhat.com>
Date: Tue, 11 Mar 2025 11:20:23 +0100
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


