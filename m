Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2CD4215AD4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 17:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgGFPhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 11:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729316AbgGFPhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 11:37:23 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0510C08C5DF
        for <linux-media@vger.kernel.org>; Mon,  6 Jul 2020 08:37:22 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n2so26350862edr.5
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2020 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xxYppoJ5Xdmb6201nrDERBnZiLW2OnZfagZUdHZeaSU=;
        b=JKesJlAECjFjI/iK6JTS09CCMrdlvePWqXsYUulUZTCdvj61Y+7JYLLNPNoxVlwH+g
         qGoXDJ+LehYoNuWE5lFgG75Etbqbx+k/qzpMeaTAaUnLED1iJBO9tGdlrfQ/pj8YGAxO
         YDADPKBKQFSdc1bpRUewE5VjRbY36NtUHXJVX771oR2/lNpqmJFrk5vqZ5hObUOps34V
         hnt/U+mmbdXUWkihpU5iHGi+9REVTwL83pBEMfeYw5EN3pNZVLJ1QjYCGNAvw7BLJj2e
         ZV+hvj3d7mBkfnMMCTAYB17z7u3I6s6JBY8MmcrrlvhOlVyrhiNlzsGooXAEhVBfMTO4
         5Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xxYppoJ5Xdmb6201nrDERBnZiLW2OnZfagZUdHZeaSU=;
        b=d4BRhdgKnDhXo2XNUiBDeOOmDMqNiU11vHzhykrL2VtHjX2WTN/x0g30DZxGSdTO8j
         1M2ZBBG86hAl2dFFET3rkwNn38OgclRsI0oAK3ZbVBb4GGyQzWvM4PRZLCzsaK2wbyH7
         XV4VvL8cf0dzUEFAZQKQNJSB89+yWx5ex/tG/va9DNXNJFt8J+0kwiwup5EacPnOk0SC
         PyGv00CQHMpvXfqF+2Y6AsrbjAQ/Vq9rTUyHz46OY/Ehncm0rSemvt4uNGhAxlKW912U
         BfDDS/3KYXOaQynJvQPRYYj3F/JAKiYPTtXIPsNAiPjSMb4AkNjVh1gimKn+qbCGKWRI
         Ljkw==
X-Gm-Message-State: AOAM532u4Sx/niwyst+DaVCnyhVI2xThNh00F+KXE8X0NDB2+AmN0o1I
        JgdL7GRve4GHUEK5wvOdVbIWej5ShB7JWQ==
X-Google-Smtp-Source: ABdhPJyQtFRzk0pHadCdn+zqYUptDzgYY8ATGnSZNYNb+K/sWerHN0jHCernDWVYwcFeSvYCxHm+Aw==
X-Received: by 2002:aa7:d341:: with SMTP id m1mr43636075edr.50.1594049841452;
        Mon, 06 Jul 2020 08:37:21 -0700 (PDT)
Received: from [192.168.1.2] (212-5-158-202.ip.btc-net.bg. [212.5.158.202])
        by smtp.googlemail.com with ESMTPSA id b4sm22888122edx.96.2020.07.06.08.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 08:37:20 -0700 (PDT)
Subject: Re: [PATCH] venus: Add platform specific capabilities
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org
References: <1590736709-508-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ddc676e7-b593-c13c-47e0-e5861d7d57e5@linaro.org>
Date:   Mon, 6 Jul 2020 18:37:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590736709-508-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/29/20 10:18 AM, Dikshita Agarwal wrote:
> Add platform specific capabilities and use them
> in place of firmware capabilities.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c           |   3 +
>  drivers/media/platform/qcom/venus/hfi_helper.h     |   3 +-
>  drivers/media/platform/qcom/venus/hfi_parser.c     |  21 +--
>  .../media/platform/qcom/venus/hfi_platform_data.c  | 153 ++++++++++++++++++++-
>  .../media/platform/qcom/venus/hfi_platform_data.h  |  37 ++++-
>  5 files changed, 193 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4fde4aa..8221e5c 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -273,6 +273,9 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_venus_shutdown;
>  
> +	if (core->hfi_data && core->hfi_data->venus_parse_resources)
> +		venus_parse_resources(core);
> +
>  	ret = hfi_core_init(core);
>  	if (ret)
>  		goto err_venus_shutdown;
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index f6613df..1671012 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -520,7 +520,8 @@
>  enum hfi_version {
>  	HFI_VERSION_1XX,
>  	HFI_VERSION_3XX,
> -	HFI_VERSION_4XX
> +	HFI_VERSION_4XX,
> +	HFI_VERSION_6XX
>  };
>  
>  struct hfi_buffer_info {
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 7f515a4..b4b60e1 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -10,30 +10,11 @@
>  #include "core.h"
>  #include "hfi_helper.h"
>  #include "hfi_parser.h"
> +#include "hfi_platform_data.h"
>  
>  typedef void (*func)(struct venus_caps *cap, const void *data,
>  		     unsigned int size);
>  
> -static void init_codecs(struct venus_core *core)
> -{
> -	struct venus_caps *caps = core->caps, *cap;
> -	unsigned long bit;
> -
> -	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> -		cap = &caps[core->codecs_count++];
> -		cap->codec = BIT(bit);
> -		cap->domain = VIDC_SESSION_TYPE_DEC;
> -		cap->valid = false;
> -	}
> -
> -	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
> -		cap = &caps[core->codecs_count++];
> -		cap->codec = BIT(bit);
> -		cap->domain = VIDC_SESSION_TYPE_ENC;
> -		cap->valid = false;
> -	}
> -}
> -

Please keep this function in hfi_parse.c and make a copy here. I don't
want to make such cross dependency between hfi_parse and hfi_platform.
Once we are in good shape with hfi_platform we could drop the hfi_parser
completely and don't rely on firmware.

>  static void for_each_codec(struct venus_caps *caps, unsigned int caps_num,
>  			   u32 codecs, u32 domain, func cb, void *data,
>  			   unsigned int size)
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.c b/drivers/media/platform/qcom/venus/hfi_platform_data.c
> index 9d9035f..fc838f5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_data.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_data.c
> @@ -5,8 +5,132 @@
>  #include "hfi_platform_data.h"
>  #include "core.h"
>  
> +void init_codecs(struct venus_core *core)
> +{
> +	struct venus_caps *caps = core->caps, *cap;
> +	unsigned long bit;
> +
> +	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> +		cap = &caps[core->codecs_count++];
> +		cap->codec = BIT(bit);
> +		cap->domain = VIDC_SESSION_TYPE_DEC;
> +		cap->valid = false;
> +	}
> +
> +	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
> +		cap = &caps[core->codecs_count++];
> +		cap->codec = BIT(bit);
> +		cap->domain = VIDC_SESSION_TYPE_ENC;
> +		cap->valid = false;
> +	}
> +}
> +
> +static void parse_codecs(struct venus_core *core)

s/parse_codecs/fill_codecs/

> +{
> +	const struct venus_hfi_platform_data *hfi_data = core->hfi_data;
> +	const struct venus_codecs *codecs = hfi_data->venus_codecs;
> +	unsigned int i, codecs_size;
> +
> +	core->enc_codecs = 0;
> +	core->dec_codecs = 0;
> +	codecs_size = hfi_data->venus_codecs_size;
> +
> +	for (i = 0; i < codecs_size; i++) {
> +		if (codecs[i].domain == VIDC_SESSION_TYPE_ENC)
> +			core->enc_codecs |= codecs[i].codecs;
> +		else
> +			core->dec_codecs |= codecs[i].codecs;
> +	}
> +	init_codecs(core);
> +}
> +
> +static int fill_raw_fmt(struct venus_capability *hfi_data_caps,
> +			struct venus_caps *core_caps)
> +{
> +	if ((core_caps->num_pl + 1) == HFI_MAX_PROFILE_COUNT)

num_pl should be num_fmts, and MAX_FMT_ENTRIES

> +		return -EINVAL;
> +
> +	core_caps->fmts[core_caps->num_fmts].buftype =
> +		hfi_data_caps->capability_type;
> +	core_caps->fmts[core_caps->num_fmts].fmt =
> +		hfi_data_caps->defaul_value;
> +	core_caps->num_fmts += 1;
> +
> +	return 0;
> +}
> +
> +static int fill_profile(struct venus_capability *hfi_data_caps,
> +			struct venus_caps *core_caps)
> +{
> +	if ((core_caps->num_pl + 1) == HFI_MAX_PROFILE_COUNT)
> +		return -EINVAL;
> +
> +	core_caps->pl[core_caps->num_pl].profile =
> +		hfi_data_caps->capability_type;
> +	core_caps->pl[core_caps->num_pl].level = hfi_data_caps->defaul_value;
> +	core_caps->num_pl += 1;
> +
> +	return 0;
> +}
> +
> +static int fill_capabilities(struct venus_capability *hfi_data_caps,
> +			     struct venus_caps *core_caps)
> +{
> +	if ((core_caps->num_caps + 1) == MAX_CAP_ENTRIES)
> +		return -EINVAL;
> +
> +	core_caps->caps[core_caps->num_caps].capability_type =
> +		hfi_data_caps->capability_type;
> +	core_caps->caps[core_caps->num_caps].min = hfi_data_caps->min;
> +	core_caps->caps[core_caps->num_caps].max = hfi_data_caps->max;
> +	core_caps->caps[core_caps->num_caps].step_size =
> +		hfi_data_caps->step_size;
> +	core_caps->num_caps += 1;
> +	return 0;
> +}
> +
> +static int fill_caps(struct venus_capability *hfi_data_caps,
> +		     struct venus_caps *core_caps)
> +{
> +	if (hfi_data_caps->entry_type == CAPABILITY_ENTRY)
> +		return fill_capabilities(hfi_data_caps, core_caps);
> +	else if (hfi_data_caps->entry_type == PROFILE_ENTRY)
> +		return fill_profile(hfi_data_caps, core_caps);
> +	else
> +		return fill_raw_fmt(hfi_data_caps, core_caps);
> +}
> +
> +static void parse_capabilities(struct venus_core *core)

s/parse_capabilities/fill_capabilities/

> +{
> +	unsigned int i, j, ret;

ret should be 'int'

> +	const struct venus_hfi_platform_data *hfi_data = core->hfi_data;
> +	struct venus_capability *hfi_data_caps = hfi_data->capabilities;
> +	unsigned int hfi_data_caps_size = hfi_data->capabilities_size;
> +	const unsigned int codecs_size = hfi_data->venus_codecs_size;
> +
> +	for (i = 0; i < hfi_data_caps_size; i++) {
> +		for (j = 0; j < codecs_size; j++) {

could you loo[ over codecs first and then over hfi_data_caps

> +			if ((hfi_data_caps[i].domain &
> +				core->caps[j].domain) &&
> +				(hfi_data_caps[i].codecs &
> +				core->caps[j].codec)) {

could you invert the logic here:

if (!(hfi_data_caps[i].domain & core->caps[j].domain))
	continue;

if (!(hfi_data_caps[i].codecs & core->caps[j].codec))
	continue;

> +				ret = fill_caps(&hfi_data_caps[i],
> +						core->caps);

fill_caps could return error but we ignore it here, do we really want
fill_caps to return error?

> +				if (!ret)
> +					break;
> +			}
> +		}
> +	}
> +}
> +
> +void venus_parse_resources(struct venus_core *core)

Move the content of this function in venus_get_hfi_platform().

> +{
> +	parse_codecs(core);
> +	parse_capabilities(core);
> +}
> +
>  static struct codec_freq_data hfi4_codec_freq_data[] =  {
> -{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },

This shouldn't be part of this patch.

>  	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
>  	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
>  	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
> @@ -16,20 +140,45 @@
>  	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
>  };
>  
> +static struct venus_codecs default_codecs[] = { {DEC, H264}, {DEC, HEVC},
> +	{DEC, VP8}, {DEC, MPEG2}, {ENC, H264}, {ENC, HEVC}, {ENC, VP8},
> +};
> +
> +static struct venus_capability hfi6_capabilities[] = {

s/hfi6_capabilities/hfi_caps_v6/

> +	/* {cap_type, codecs, domains, min, max, step_size, default} */
> +	{ HFI_CAPABILITY_FRAME_WIDTH, CODECS_ALL, DOMAINS_ALL, 96, 5760, 1,
> +		96, CAPABILITY_ENTRY },
> +	{ HFI_CAPABILITY_FRAME_HEIGHT, CODECS_ALL, DOMAINS_ALL, 96, 5760, 1,
> +		96, CAPABILITY_ENTRY },
> +	{ HFI_CAPABILITY_FRAMERATE, CODECS_ALL, DOMAINS_ALL, 1, 480, 1,
> +		1, CAPABILITY_ENTRY },
> +	{ HFI_CAPABILITY_MAX_VIDEOCORES, CODECS_ALL, DOMAINS_ALL, 1, 2, 1,
> +		1, CAPABILITY_ENTRY },
> +};
> +
>  static const struct venus_hfi_platform_data hfi4_data = {
>  	.codec_freq_data = hfi4_codec_freq_data,
>  	.codec_freq_data_size = ARRAY_SIZE(hfi4_codec_freq_data),
>  };
>  
> +static const struct venus_hfi_platform_data hfi6_data = {
> +	.venus_codecs = default_codecs,
> +	.venus_codecs_size = ARRAY_SIZE(default_codecs),
> +	.capabilities = hfi6_capabilities,
> +	.capabilities_size = ARRAY_SIZE(hfi6_capabilities),
> +	.venus_parse_resources = venus_parse_resources,
> +};
> +
>  const struct venus_hfi_platform_data *venus_get_hfi_platform
>  	(enum hfi_version version)
>  {
>  	switch (version) {
>  	case HFI_VERSION_4XX:
>  		return &hfi4_data;
> +	case HFI_VERSION_6XX:
> +		return &hfi6_data;
>  	default:
>  		return NULL;
>  	}
>  	return NULL;
>  }
> -
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.h b/drivers/media/platform/qcom/venus/hfi_platform_data.h
> index 1b4bfb6..55de59b 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_data.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_data.h
> @@ -8,6 +8,19 @@
>  
>  #include "core.h"
>  
> +#define ENC    VIDC_SESSION_TYPE_ENC
> +#define DEC    VIDC_SESSION_TYPE_DEC
> +#define H264 HFI_VIDEO_CODEC_H264
> +#define MPEG2 HFI_VIDEO_CODEC_MPEG2
> +#define HEVC HFI_VIDEO_CODEC_HEVC
> +#define VP8 HFI_VIDEO_CODEC_VP8

please don't re-define defines.

> +#define DOMAINS_ALL    (HFI_DOMAIN_BASE_VENC | HFI_DOMAIN_BASE_VDEC)
> +#define CODECS_ALL (HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_H264    \
> +					| HFI_VIDEO_CODEC_VP8)

The CODECS_ALL should have the hfi version in the name, because
different versions supports different codecs.

> +#define CAPABILITY_ENTRY	0
> +#define PROFILE_ENTRY	1
> +#define FMT_ENTRY	2
> +
>  struct codec_freq_data {
>  	u32 pixfmt;
>  	u32 session_type;
> @@ -15,13 +28,35 @@ struct codec_freq_data {
>  	unsigned long vsp_freq;
>  };
>  
> +struct venus_codecs {

can we call this hfi_platform_codecs ?

> +	u32 codecs;
> +	u32 domain;
> +};
> +
> +struct venus_capability {

hfi_platform_caps ?

> +	u32 capability_type;
> +	u32 codecs;
> +	u32 domain;

maybe 'domains' ?

> +	u32 min;
> +	u32 max;
> +	u32 step_size;
> +	u32 defaul_value;
> +	u32 entry_type;

can we avoid this entry_type by grouping the const arrays for caps,
profile/level and raw formats?

> +};
> +
>  struct venus_hfi_platform_data {
>  	const struct codec_freq_data *codec_freq_data;
>  	unsigned int codec_freq_data_size;
> +	struct venus_codecs *venus_codecs;
> +	unsigned int venus_codecs_size;
> +	struct venus_capability *capabilities;
> +	unsigned int capabilities_size;
> +	void (*venus_parse_resources)(struct venus_core *core);

I'd like to see the function pointers (aka ops) in separate structure.
I think struct hfi_platform_ops is a good name.

Also I think it would be better to get the capabilities when
venus_get_hfi_platform (hfi_platform_get) is called.

>  };
>  
>  const struct venus_hfi_platform_data *venus_get_hfi_platform
>  	(enum hfi_version version);
> +void venus_parse_resources(struct venus_core *core);
> +void init_codecs(struct venus_core *core);
>  
>  #endif
> -
> 

-- 
regards,
Stan
