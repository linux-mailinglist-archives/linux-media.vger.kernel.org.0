Return-Path: <linux-media+bounces-24796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC16A127DC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 16:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61159188B653
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AEF16DEDF;
	Wed, 15 Jan 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ciYqMMz4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6615665D
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956321; cv=none; b=bCj+YUFuuK6P9MKU/TmAC4BNhfpg0e2Uv3vtD23FHJ22dGgKjHzS3DjiYvzPoVqdj201kT/jotsOP6NoD4NSvct8hVO/WZ3bOpQ/DIcwJfyC4KvgKbNHWbLzJG4bCIoJjKgIxCsm02Vu+zZL2aTBS+stQT+MPQeIEg7wmjaLn90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956321; c=relaxed/simple;
	bh=b1O9BPFJ71XFLlUheuDka+LRzs2aZ3Th0tVtRVVvWWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpApTHNWPC+IVC1I23RbwosFekVijIzxqlzPlyOzxI+ec0z+wqcZt9lnVRD3q7+tr/U2b6y9Fv4JbjqY4N1aIajulvJMPvSbgKSdqBwcmwE7tIYmneKQNVfcqSiRkxjGKvGLiP/SBYWOz790ALSTYMsnq8kyeJDZkBSucJUwlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ciYqMMz4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so3761228f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 07:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736956317; x=1737561117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9T2aeq3iFePOXUR9+HZacaUOvR2SWTMTmgZmEVRLMQ=;
        b=ciYqMMz4V04vmbPJZmFwfMtbpGSNM9t7sFokD4ePTEiuDLK3YhY5jD0rTjIUmPcCjF
         FKYu4EU6Oqh0whe9Z6qbpw1vsslNlgtVOpIegAev9U0I9YL+I4uhwJMVZmjrmnB4dLIM
         /KabHWO4Ho9ApX6ANGOMxO7djVBII6fkvPU0vNKs+yRbD6zTDezKDOzIQCiZG2zK8ck/
         /LfNQxN8wHVS9ftrnJhLbV/J/9AEIhTW0yTiILnGN5Eoib2QxsAJnac1w06plGIL/UUR
         Tb7laseZpZF6w0zmiaUJ/CDEDtypvlBsUcDxjeqrA20/qfyQN0RVM6o//0HVRKUWkkIW
         1HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736956317; x=1737561117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9T2aeq3iFePOXUR9+HZacaUOvR2SWTMTmgZmEVRLMQ=;
        b=oqhiZR/F/WtoEMFBdhY9+4DYLq7N5vFu0+J/aQRS21zGOJNajpaOJZONwYKfP3OYY7
         fE9K/5wx9iNdQy4VTgYi8hbZSvr8roUf4PxZ2snJ1FYOlyVWls/uZ/iPSVW6xGgcKN2k
         8/ZFmvXzjgrqvUDX6ko8vHXPqq39v08PZM0LqJqt57gjA6ha0mSEP5Q5HkK8p05nmBti
         6j1XCG+WbuY09vV2wyNXIicaDfjxo/ylLRPj/1tF/GFIt3Mw1Mk9dz4WQS0yg/J0EeMY
         Gwf7kyAfDfDjfWf39wGDJYNo7fvbLbh0LgXf6H3qg3h5kon0gWYxSWb4YJFfkOjlwSOU
         RL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3hDHRyIP5hprOuwZNckOv76/s5gtwMH1yS/LLcm82R5oHbypW6nBep4yAyFe1MaBraW/G9ACwxEeQrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHIHgF13vzE2Ln2kxY5I8brVzYaGX5s0ncXTRoLjqbwwOzZ+4
	xqhe/Y1naxM4qE5JRkhXcQD8cllLKISwzb34BoEseoeBImIV1QHUuU+Ysvd7F3k=
X-Gm-Gg: ASbGnctNHIHaPRBXSKGDBStSFZAh7Np72fq/JAMuBewTYIGGmxXldrVxvIgjOoy/Pwo
	H8QPhXeJOjTqTAyRgEJs3CL1wHvi+Ug5txjjR/qqHWQg+SkyP64vYyBWFYcXyOaf5RgpNcCrUVU
	W9p+wvLOvj7ks7hhUxzRWSUy8m+biUK6dTLTjViPpZq16FvpAytSHRe1y4k60A98hV5fmKqxDek
	bfaoWptJfAix3zGEHQvkL2+bs4jadQPSOpfz9stiSfw0LWOat5C/AVxlN7S4JIZlQ5eZQ==
X-Google-Smtp-Source: AGHT+IGeRpOl/xcLw670njQbGIlse4M/Ta6BGmBUsUpeZiOkBp+9SFFfdRLO7qw8vg+sKUOnhUyOGg==
X-Received: by 2002:a5d:6da8:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38a872f7ef2mr26480703f8f.2.1736956317319;
        Wed, 15 Jan 2025 07:51:57 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0fasm18298220f8f.19.2025.01.15.07.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 07:51:56 -0800 (PST)
Message-ID: <bbd19ffd-038c-435c-a63b-260a0b933660@linaro.org>
Date: Wed, 15 Jan 2025 15:51:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/16] media: qcom: camss: csid: Only add TPG v4l2 ctrl
 if TPG hardware is available
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250108143733.2761200-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2025 14:37, Depeng Shao wrote:
> There is no CSID TPG on some SoCs, so the v4l2 ctrl in CSID driver
> shouldn't be registered. Checking the supported TPG modes to indicate
> if the TPG hardware exists or not and only registering v4l2 ctrl for
> CSID only when the TPG hardware is present.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    | 60 +++++++++++--------
>   1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 6cf8e434dc05..e26a69a454a7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,11 +760,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>   	int ret;
>   
>   	if (enable) {
> -		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> -		if (ret < 0) {
> -			dev_err(csid->camss->dev,
> -				"could not sync v4l2 controls: %d\n", ret);
> -			return ret;
> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
> +			ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> +			if (ret < 0) {
> +				dev_err(csid->camss->dev,
> +					"could not sync v4l2 controls: %d\n", ret);
> +				return ret;
> +			}
>   		}
>   
>   		if (!csid->testgen.enabled &&
> @@ -838,7 +840,8 @@ static void csid_try_format(struct csid_device *csid,
>   		break;
>   
>   	case MSM_CSID_PAD_SRC:
> -		if (csid->testgen_mode->cur.val == 0) {
> +		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
> +		    csid->testgen_mode->cur.val == 0) {
>   			/* Test generator is disabled, */
>   			/* keep pad formats in sync */
>   			u32 code = fmt->code;
> @@ -888,7 +891,8 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
>   
>   		code->code = csid->res->formats->formats[code->index].code;
>   	} else {
> -		if (csid->testgen_mode->cur.val == 0) {
> +		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
> +		    csid->testgen_mode->cur.val == 0) {
>   			struct v4l2_mbus_framefmt *sink_fmt;
>   
>   			sink_fmt = __csid_get_format(csid, sd_state,
> @@ -1267,7 +1271,8 @@ static int csid_link_setup(struct media_entity *entity,
>   
>   		/* If test generator is enabled */
>   		/* do not allow a link from CSIPHY to CSID */
> -		if (csid->testgen_mode->cur.val != 0)
> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED &&
> +		    csid->testgen_mode->cur.val != 0)
>   			return -EBUSY;
>   
>   		sd = media_entity_to_v4l2_subdev(remote->entity);
> @@ -1360,24 +1365,27 @@ int msm_csid_register_entity(struct csid_device *csid,
>   		 MSM_CSID_NAME, csid->id);
>   	v4l2_set_subdevdata(sd, csid);
>   
> -	ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
> -		return ret;
> -	}
> +	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
> +		ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
> +			return ret;
> +		}
>   
> -	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
> -				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
> -				csid->testgen.nmodes, 0, 0,
> -				csid->testgen.modes);
> +		csid->testgen_mode =
> +			v4l2_ctrl_new_std_menu_items(&csid->ctrls,
> +						     &csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +						     csid->testgen.nmodes, 0, 0,
> +						     csid->testgen.modes);
>   
> -	if (csid->ctrls.error) {
> -		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
> -		ret = csid->ctrls.error;
> -		goto free_ctrl;
> -	}
> +		if (csid->ctrls.error) {
> +			dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
> +			ret = csid->ctrls.error;
> +			goto free_ctrl;
> +		}
>   
> -	csid->subdev.ctrl_handler = &csid->ctrls;
> +		csid->subdev.ctrl_handler = &csid->ctrls;
> +	}
>   
>   	ret = csid_init_formats(sd, NULL);
>   	if (ret < 0) {
> @@ -1408,7 +1416,8 @@ int msm_csid_register_entity(struct csid_device *csid,
>   media_cleanup:
>   	media_entity_cleanup(&sd->entity);
>   free_ctrl:
> -	v4l2_ctrl_handler_free(&csid->ctrls);
> +	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
> +		v4l2_ctrl_handler_free(&csid->ctrls);
>   
>   	return ret;
>   }
> @@ -1421,7 +1430,8 @@ void msm_csid_unregister_entity(struct csid_device *csid)
>   {
>   	v4l2_device_unregister_subdev(&csid->subdev);
>   	media_entity_cleanup(&csid->subdev.entity);
> -	v4l2_ctrl_handler_free(&csid->ctrls);
> +	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
> +		v4l2_ctrl_handler_free(&csid->ctrls);
>   }
>   
>   inline bool csid_is_lite(struct csid_device *csid)

The TPG on the RB5 has a known bug that not all test patterns work. I 
verified that the coloured box TPG still works after this change.

Like so:

# colour bars test pattern 9
media-ctl --reset
yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev6
yavta --list /dev/v4l-subdev6
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p
yavta -B capture-mplane --capture=5 -n 5 -I -f SGRBG10P -s 3280x2464 
--file=TPG-SGRBG10-3280x2464-000-#.bin /dev/video0

I think we had some confusion about the TPG regressing on v6/v7 of this 
patch but, I suspect the wrong test pattern was tested.

This works as expected for me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165 rb5

