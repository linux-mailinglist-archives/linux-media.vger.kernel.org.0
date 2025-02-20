Return-Path: <linux-media+bounces-26487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24AA3DE4E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2127D189748F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00301FCFF9;
	Thu, 20 Feb 2025 15:20:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498D288D6;
	Thu, 20 Feb 2025 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064841; cv=none; b=fq3k7BV7FQXVTC6r+S7jUMHQeKBVReUH43mMR3u3AxumLzJrDh123LgdtOloUbUsv8uX4v5Fkqk8oNZv7EQmuQjFgnl6JTmG/x+BfU+TRNK6lhVGe/qb5Q23ZFVYiw89ZmSj+d9iC6X5Hnp1RoV4Bmx4Y1ZAb2DTo94GGpgSMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064841; c=relaxed/simple;
	bh=BCStGYgeyWna1HJHV1Elo72D/ZSbWDYW75IW4/PGPZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csB5wDnt9NXu6Ejk74ELUsHkejMgTrELW/USArPIu30023Z+qvvj/E3/KxkT0mleyxekXh+jRGDbi4wWG0edJKu52MIptjT+EnOFL3oT1axgaXrVu0iRNk/tzN5bsiZvom8PVW7I/I2UL/TyVGzyYZPIrQjk7J1wlbz2ZNAHLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B15C4CED1;
	Thu, 20 Feb 2025 15:20:38 +0000 (UTC)
Message-ID: <18a005e1-e235-4c2b-8d1a-b593868843a5@xs4all.nl>
Date: Thu, 20 Feb 2025 16:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: venus: hfi_parser: refactor hfi packet
 parsing logic
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-2-522da0b68b22@quicinc.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250207-venus_oob_2-v4-2-522da0b68b22@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 09:24, Vikash Garodia wrote:
> words_count denotes the number of words in total payload, while data
> points to payload of various property within it. When words_count
> reaches last word, data can access memory beyond the total payload. This
> can lead to OOB access. With this patch, the utility api for handling
> individual properties now returns the size of data consumed. Accordingly
> remaining bytes are calculated before parsing the payload, thereby
> eliminates the OOB access possibilities.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 95 +++++++++++++++++++-------
>  1 file changed, 69 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 1cc17f3dc8948160ea6c3015d2c03e475b8aa29e..404c527329c5fa89ee885a6ad15620c9c90a99e4 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -63,7 +63,7 @@ fill_buf_mode(struct hfi_plat_caps *cap, const void *data, unsigned int num)
>  		cap->cap_bufs_mode_dynamic = true;
>  }
>  
> -static void
> +static int
>  parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  {
>  	struct hfi_buffer_alloc_mode_supported *mode = data;
> @@ -71,7 +71,7 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	u32 *type;
>  
>  	if (num_entries > MAX_ALLOC_MODE_ENTRIES)
> -		return;
> +		return -EINVAL;
>  
>  	type = mode->data;
>  
> @@ -83,6 +83,8 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  
>  		type++;
>  	}
> +
> +	return sizeof(*mode);
>  }
>  
>  static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
> @@ -97,7 +99,7 @@ static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
>  	cap->num_pl += num;
>  }
>  
> -static void
> +static int
>  parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  {
>  	struct hfi_profile_level_supported *pl = data;
> @@ -105,12 +107,14 @@ parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	struct hfi_profile_level pl_arr[HFI_MAX_PROFILE_COUNT] = {};
>  
>  	if (pl->profile_count > HFI_MAX_PROFILE_COUNT)
> -		return;
> +		return -EINVAL;
>  
>  	memcpy(pl_arr, proflevel, pl->profile_count * sizeof(*proflevel));
>  
>  	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>  		       fill_profile_level, pl_arr, pl->profile_count);
> +
> +	return pl->profile_count * sizeof(*proflevel) + sizeof(u32);
>  }
>  
>  static void
> @@ -125,7 +129,7 @@ fill_caps(struct hfi_plat_caps *cap, const void *data, unsigned int num)
>  	cap->num_caps += num;
>  }
>  
> -static void
> +static int
>  parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  {
>  	struct hfi_capabilities *caps = data;
> @@ -134,12 +138,14 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	struct hfi_capability caps_arr[MAX_CAP_ENTRIES] = {};
>  
>  	if (num_caps > MAX_CAP_ENTRIES)
> -		return;
> +		return -EINVAL;
>  
>  	memcpy(caps_arr, cap, num_caps * sizeof(*cap));
>  
>  	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>  		       fill_caps, caps_arr, num_caps);
> +
> +	return sizeof(*caps);
>  }
>  
>  static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
> @@ -154,7 +160,7 @@ static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
>  	cap->num_fmts += num_fmts;
>  }
>  
> -static void
> +static int
>  parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  {
>  	struct hfi_uncompressed_format_supported *fmt = data;
> @@ -163,7 +169,8 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
>  	u32 entries = fmt->format_entries;
>  	unsigned int i = 0;
> -	u32 num_planes;
> +	u32 num_planes = 0;
> +	u32 size;
>  
>  	while (entries) {
>  		num_planes = pinfo->num_planes;
> @@ -173,7 +180,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  		i++;
>  
>  		if (i >= MAX_FMT_ENTRIES)
> -			return;
> +			return -EINVAL;
>  
>  		if (pinfo->num_planes > MAX_PLANES)
>  			break;
> @@ -185,9 +192,13 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  
>  	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>  		       fill_raw_fmts, rawfmts, i);
> +	size = fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(u32))
> +		+ 2 * sizeof(u32);
> +
> +	return size;
>  }
>  
> -static void parse_codecs(struct venus_core *core, void *data)
> +static int parse_codecs(struct venus_core *core, void *data)
>  {
>  	struct hfi_codec_supported *codecs = data;
>  
> @@ -199,21 +210,27 @@ static void parse_codecs(struct venus_core *core, void *data)
>  		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
>  		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
>  	}
> +
> +	return sizeof(*codecs);
>  }
>  
> -static void parse_max_sessions(struct venus_core *core, const void *data)
> +static int parse_max_sessions(struct venus_core *core, const void *data)
>  {
>  	const struct hfi_max_sessions_supported *sessions = data;
>  
>  	core->max_sessions_supported = sessions->max_sessions;
> +
> +	return sizeof(*sessions);
>  }
>  
> -static void parse_codecs_mask(u32 *codecs, u32 *domain, void *data)
> +static int parse_codecs_mask(u32 *codecs, u32 *domain, void *data)
>  {
>  	struct hfi_codec_mask_supported *mask = data;
>  
>  	*codecs = mask->codecs;
>  	*domain = mask->video_domains;
> +
> +	return sizeof(*mask);
>  }
>  
>  static void parser_init(struct venus_inst *inst, u32 *codecs, u32 *domain)
> @@ -282,8 +299,9 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
>  u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>  	       u32 size)
>  {
> -	unsigned int words_count = size >> 2;
> -	u32 *word = buf, *data, codecs = 0, domain = 0;
> +	u32 *words = buf, *payload, codecs = 0, domain = 0;
> +	u32 *frame_size = buf + size;
> +	u32 rem_bytes = size;
>  	int ret;
>  
>  	ret = hfi_platform_parser(core, inst);
> @@ -300,38 +318,63 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>  		memset(core->caps, 0, sizeof(core->caps));
>  	}
>  
> -	while (words_count) {
> -		data = word + 1;
> +	while (words < frame_size) {
> +		payload = words + 1;
>  
> -		switch (*word) {
> +		switch (*words) {
>  		case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
> -			parse_codecs(core, data);
> +			if (rem_bytes <= sizeof(struct hfi_codec_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_codecs(core, payload);
>  			init_codecs(core);

Does it make sense to call init_codecs if parse_codecs returned an error?
It certainly looks weird, so even if it is OK, perhaps a comment might be
useful.

>  			break;
>  		case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
> -			parse_max_sessions(core, data);
> +			if (rem_bytes <= sizeof(struct hfi_max_sessions_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_max_sessions(core, payload);
>  			break;
>  		case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
> -			parse_codecs_mask(&codecs, &domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_codec_mask_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_codecs_mask(&codecs, &domain, payload);
>  			break;
>  		case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
> -			parse_raw_formats(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_uncompressed_format_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_raw_formats(core, codecs, domain, payload);
>  			break;
>  		case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
> -			parse_caps(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_capabilities))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_caps(core, codecs, domain, payload);
>  			break;
>  		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
> -			parse_profile_level(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_profile_level_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_profile_level(core, codecs, domain, payload);
>  			break;
>  		case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
> -			parse_alloc_mode(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_buffer_alloc_mode_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_alloc_mode(core, codecs, domain, payload);
>  			break;
>  		default:
> +			ret = sizeof(u32);
>  			break;
>  		}
>  
> -		word++;
> -		words_count--;
> +		if (ret < 0)
> +			return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +		words += ret / sizeof(u32);

Would it make sense to check and warn if ret is not a multiple of sizeof(u32)?
Up to you, just an idea.

> +		rem_bytes -= ret;
>  	}
>  
>  	if (!core->max_sessions_supported)
> 

Regards,

	Hans

