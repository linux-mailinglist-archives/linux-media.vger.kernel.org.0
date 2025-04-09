Return-Path: <linux-media+bounces-29749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B43A827E3
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4248C22DE
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7721F26562A;
	Wed,  9 Apr 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOhA0+2G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C9265CA0
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209010; cv=none; b=UGlxFjP1xS0hgMiOimeCzO7xz/IxhsU9gzniWlyC2qCYo9vb17/NbUghARnV0cI8yEk+CD+9K9LHUh/P6FJMKiEPo/ltwjaxqFkbDo72zB/qbA0rql0DbjzUaZuL8VlhWeT68dQo4oqa+D2fnPArmWysMOBJBnIoefxj5g/SPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209010; c=relaxed/simple;
	bh=npvT8j+Cs70iH2DxnARKFvJlnZdjWmfYrmcQAPjcgmc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lPoDZ6Qv6dT8TbsPANG6Jc6TYzS3YTEC/0wkoD9aT49mPgj/UKf9V7n/QUC6zePn9UYixzXu/RAxK3ljlyotRw+PoVvIKUGb3mPkMyjGVRxl0nfBH50qTHLHdHDEJt5jfF5RTstU96HZ4jVhp7kFbLELwPL2CEXJE8s+cTnlgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOhA0+2G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso63831765e9.1
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209004; x=1744813804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GkQuOeVn2ONhN5CNwRv9/7F9pJsr6h7ntpJG/RM6z/s=;
        b=dOhA0+2GJCN7x9F80L95SdYNvAe89zsta2S3pRTCAgVcBqkA8Ddnf5E9a3XY5aic5d
         PJRP7/Jgaw8WH6RscfuYvqjq/bkAQwYnCizofryRGe04XQaADQ81BIWmp8hWKPUfno8o
         o7UQBiF5NVRSxFR6iTVkswHXAQjzGmXHkIHtNocpNU1RL87xbENmV8kIt5HMFPHTo9Tk
         44QSsXKpxJG3rgoCgKnEhnz40BiRwHXFFavUPbnlF1OtRRG0ttnOxNEmGNtOZjOgXDef
         z0KmUDfovNQ08QZSTg6SSps5WVUWkuqSh8hMt6ynaOOMYwqZVwUafGEqOi6QHRDThfL4
         b0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209004; x=1744813804;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkQuOeVn2ONhN5CNwRv9/7F9pJsr6h7ntpJG/RM6z/s=;
        b=fTGLWp901MOIiSBinZH6tnZ0gg4tepeX5boZ1OavOHonySuoRybQCcMlmTLzfrkZnC
         t2X6zmcqn0TR7RDn8Ead3vQ/9yJWTgibU0NXuEF9pRKyI8So2bki5oPbb5lqGkU6/qsb
         ScZPYIhru1U4MLUIHXum9QeHeZEIxzGB11pbLeJB8eHQfB0wi/WfgDgTknvpsXDiLU+R
         WIKs47O1yrXWL3CJUyjhBdr7RoIvGJhtd/gpZXIDSilUSg6lZ/NQb3uGiYl1ZtX4Fo6k
         JabspatwnQ6Ug47h/N0WQgBPuiC7iLMfFAjbpvZ3aZGvfGWL/S81/urj8Atno+EoW5vE
         i6IA==
X-Forwarded-Encrypted: i=1; AJvYcCXElqWKnoyfgd/wTYKTx0vpsoCFJWur+yo6gMiR3I6VyzssieByHHgIJVSugD0XPJnrsi/pBENOcLWwSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+x1Mg9OilmlCsViEWDDNY4wv0qBeVqK0jhruPX0gHW1SedRFc
	K060QXxWkhwsggHbthWq9huciRwk9OvLosi7DfHYp46g4qTUQeqWm/7KcyLXtLU=
X-Gm-Gg: ASbGncu/4DuG5nVudRo6dqip44R8JJrOfipDkXLyVwwqWUg+PHpOVzbNiYR5ekcp4YD
	VsxEjCAKmxIG///AgnQW0TYWyRaIJp6vU8Oj54+2na2A9gPyyuPx/yMHydLDX2fWNrJWqE2j4JD
	6PEYFmRhAhesWLim1NJD/IP9DQomTgXtqjuPjKvZw2TlGwJwTVRwuPJenSIJdFqwR0IUOP0LI4e
	i/yMgHLMQHMBO2j7SHxNJSNYtmhAvMhl1PbraJPM5CqRkLu+ZDW+EdVf0xqzfKh65RpKE6mmZDC
	KcnX2hy++FLStJQhEngK/W+RlPf6eJkXu404kAXlWCPNezIPJqw8jGP+GfwaKfDAWFskWvtLiSf
	EDBPkQQ==
X-Google-Smtp-Source: AGHT+IEcqK0kNqp/Jqf2Mwb7lJryZqIEsydrSxZYZD4Leq8qbft0xXSYD2Z4wp+Wiot2TvYaL0oUQQ==
X-Received: by 2002:a05:600c:138b:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43f1fdc3ae7mr29526015e9.3.1744209004191;
        Wed, 09 Apr 2025 07:30:04 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d109sm22086535e9.20.2025.04.09.07.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:30:03 -0700 (PDT)
Message-ID: <801511ac-78db-476b-8f1d-a478b0b64bcb@linaro.org>
Date: Wed, 9 Apr 2025 15:29:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds initial support for the HEVC(H.265) and VP9
> codecs in iris decoder. The objective of this work is to extend the
> decoder's capabilities to handle HEVC and VP9 codec streams,
> including necessary format handling and buffer management.
> In addition, the series also includes a set of fixes to address issues
> identified during testing of these additional codecs.
> 
> These patches also address the comments and feedback received from the
> RFC patches previously sent. I have made the necessary improvements
> based on the community's suggestions.
> 
> Changes sinces RFC:
> - Added additional fixes to address issues identified during further
> testing.
> - Moved typo fix to a seperate patch [Neil]
> - Reordered the patches for better logical flow and clarity [Neil,
> Dmitry]
> - Added fixes tag wherever applicable [Neil, Dmitry]
> - Removed the default case in the switch statement for codecs [Bryan]
> - Replaced if-else statements with switch-case [Bryan]
> - Added comments for mbpf [Bryan]
> - RFC: https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
> 
> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
> the existing H264 decoder functionality remains uneffected.
> 
> Note: 1 of the fluster compliance test is fixed with firmware [1]
> [1]: https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
> 
> The result of fluster test on SM8550:
>   131/147 testcases passed while testing JCT-VC-HEVC_V1 with
>   GStreamer-H.265-V4L2-Gst1.0.
>   The failing test case:
>   - 10 testcases failed due to unsupported 10 bit format.
>     - DBLK_A_MAIN10_VIXS_4
>     - INITQP_B_Main10_Sony_1
>     - TSUNEQBD_A_MAIN10_Technicolor_2
>     - WP_A_MAIN10_Toshiba_3
>     - WP_MAIN10_B_Toshiba_3
>     - WPP_A_ericsson_MAIN10_2
>     - WPP_B_ericsson_MAIN10_2
>     - WPP_C_ericsson_MAIN10_2
>     - WPP_E_ericsson_MAIN10_2
>     - WPP_F_ericsson_MAIN10_2
>   - 4 testcase failed due to unsupported resolution
>     - PICSIZE_A_Bossen_1
>     - PICSIZE_B_Bossen_1
>     - WPP_D_ericsson_MAIN10_2
>     - WPP_D_ericsson_MAIN_2
>   - 1 testcase failed as bitstream is invalid (this fails with reference
>     as well)
>     - RAP_B_Bossen_2
>   - 1 testcase failed due to CRC mismatch
>     - RAP_A_docomo_6
>       Analysis - First few frames in this discarded by firmware and are
>       sent to driver with 0 filled length. Driver send such buffers to
>       client with timestamp 0 and payload set to 0 and
>       make buf state to VB2_BUF_STATE_ERROR. Such buffers should be
>       dropped by GST. But instead, the first frame displayed as green
>       frame and when a valid buffer is sent to client later with same 0
>       timestamp, its dropped, leading to CRC mismatch for first frame.
> 
>   235/305 testcases passed while testing VP9-TEST-VECTORS with
>   GStreamer-VP9-V4L2-Gst1.0.
>   The failing test case:
>   - 64 testcases failed due to unsupported resolution
>     - vp90-2-02-size-08x08.webm
>     - vp90-2-02-size-08x10.webm
>     - vp90-2-02-size-08x16.webm
>     - vp90-2-02-size-08x18.webm
>     - vp90-2-02-size-08x32.webm
>     - vp90-2-02-size-08x34.webm
>     - vp90-2-02-size-08x64.webm
>     - vp90-2-02-size-08x66.webm
>     - vp90-2-02-size-10x08.webm
>     - vp90-2-02-size-10x10.webm
>     - vp90-2-02-size-10x16.webm
>     - vp90-2-02-size-10x18.webm
>     - vp90-2-02-size-10x32.webm
>     - vp90-2-02-size-10x34.webm
>     - vp90-2-02-size-10x64.webm
>     - vp90-2-02-size-10x66.webm
>     - vp90-2-02-size-16x08.webm
>     - vp90-2-02-size-16x10.webm
>     - vp90-2-02-size-16x16.webm
>     - vp90-2-02-size-16x18.webm
>     - vp90-2-02-size-16x32.webm
>     - vp90-2-02-size-16x34.webm
>     - vp90-2-02-size-16x64.webm
>     - vp90-2-02-size-16x66.webm
>     - vp90-2-02-size-18x08.webm
>     - vp90-2-02-size-18x10.webm
>     - vp90-2-02-size-18x16.webm
>     - vp90-2-02-size-18x18.webm
>     - vp90-2-02-size-18x32.webm
>     - vp90-2-02-size-18x34.webm
>     - vp90-2-02-size-18x64.webm
>     - vp90-2-02-size-18x66.webm
>     - vp90-2-02-size-32x08.webm
>     - vp90-2-02-size-32x10.webm
>     - vp90-2-02-size-32x16.webm
>     - vp90-2-02-size-32x18.webm
>     - vp90-2-02-size-32x32.webm
>     - vp90-2-02-size-32x34.webm
>     - vp90-2-02-size-32x64.webm
>     - vp90-2-02-size-32x66.webm
>     - vp90-2-02-size-34x08.webm
>     - vp90-2-02-size-34x10.webm
>     - vp90-2-02-size-34x16.webm
>     - vp90-2-02-size-34x18.webm
>     - vp90-2-02-size-34x32.webm
>     - vp90-2-02-size-34x34.webm
>     - vp90-2-02-size-34x64.webm
>     - vp90-2-02-size-34x66.webm
>     - vp90-2-02-size-64x08.webm
>     - vp90-2-02-size-64x10.webm
>     - vp90-2-02-size-64x16.webm
>     - vp90-2-02-size-64x18.webm
>     - vp90-2-02-size-64x32.webm
>     - vp90-2-02-size-64x34.webm
>     - vp90-2-02-size-64x64.webm
>     - vp90-2-02-size-64x66.webm
>     - vp90-2-02-size-66x08.webm
>     - vp90-2-02-size-66x10.webm
>     - vp90-2-02-size-66x16.webm
>     - vp90-2-02-size-66x18.webm
>     - vp90-2-02-size-66x32.webm
>     - vp90-2-02-size-66x34.webm
>     - vp90-2-02-size-66x64.webm
>     - vp90-2-02-size-66x66.webm
>   - 2 testcases failed due to unsupported format
>     - vp91-2-04-yuv422.webm
>     - vp91-2-04-yuv444.webm
>   - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
>     - vp90-2-22-svc_1280x720_3.ivf
>   - 2 testcase failed due to unsupported resolution after sequence change
>     - vp90-2-21-resize_inter_320x180_5_1-2.webm
>     - vp90-2-21-resize_inter_320x180_7_1-2.webm
>   - 1 testcase failed due to unsupported stream
>     - vp90-2-16-intra-only.webm
>   Note: There is a timing issue with the clips having multiple resolution
>   change. Where firmware returned all the buffers with previous sequence
>   and has no buffer left to attach the LAST flag to. At the same time,
>   client is not queueing any further buffers, so there is deadlock where
>   client is waiting for LAST flag, while firmware doesn't have any
>   capture buffer to attach LAST flag to.
>   Ideally client should keep queueing the buffers on capture queue untill
>   the LAST flag is received.
> 
> The result of fluster test on SM8250:
>   132/147 testcases passed while testing JCT-VC-HEVC_V1 with
>   GStreamer-H.265-V4L2-Gst1.0.
>   The failing test case:
>   - 10 testcases failed due to unsupported 10 bit format.
>     - DBLK_A_MAIN10_VIXS_4
>     - INITQP_B_Main10_Sony_1
>     - TSUNEQBD_A_MAIN10_Technicolor_2
>     - WP_A_MAIN10_Toshiba_3
>     - WP_MAIN10_B_Toshiba_3
>     - WPP_A_ericsson_MAIN10_2
>     - WPP_B_ericsson_MAIN10_2
>     - WPP_C_ericsson_MAIN10_2
>     - WPP_E_ericsson_MAIN10_2
>     - WPP_F_ericsson_MAIN10_2
>   - 4 testcase failed due to unsupported resolution
>     - PICSIZE_A_Bossen_1
>     - PICSIZE_B_Bossen_1
>     - WPP_D_ericsson_MAIN10_2
>     - WPP_D_ericsson_MAIN_2
>   - 1 testcase failed as bitstream is invalid (this fails with reference
>     as well)
>     - RAP_B_Bossen_2
> 
>   232/305 testcases passed while testing VP9-TEST-VECTORS with
>   GStreamer-VP9-V4L2-Gst1.0.
>   The failing test case:
>   - 64 testcases failed due to unsupported resolution
>     - vp90-2-02-size-08x08.webm
>     - vp90-2-02-size-08x10.webm
>     - vp90-2-02-size-08x16.webm
>     - vp90-2-02-size-08x18.webm
>     - vp90-2-02-size-08x32.webm
>     - vp90-2-02-size-08x34.webm
>     - vp90-2-02-size-08x64.webm
>     - vp90-2-02-size-08x66.webm
>     - vp90-2-02-size-10x08.webm
>     - vp90-2-02-size-10x10.webm
>     - vp90-2-02-size-10x16.webm
>     - vp90-2-02-size-10x18.webm
>     - vp90-2-02-size-10x32.webm
>     - vp90-2-02-size-10x34.webm
>     - vp90-2-02-size-10x64.webm
>     - vp90-2-02-size-10x66.webm
>     - vp90-2-02-size-16x08.webm
>     - vp90-2-02-size-16x10.webm
>     - vp90-2-02-size-16x16.webm
>     - vp90-2-02-size-16x18.webm
>     - vp90-2-02-size-16x32.webm
>     - vp90-2-02-size-16x34.webm
>     - vp90-2-02-size-16x64.webm
>     - vp90-2-02-size-16x66.webm
>     - vp90-2-02-size-18x08.webm
>     - vp90-2-02-size-18x10.webm
>     - vp90-2-02-size-18x16.webm
>     - vp90-2-02-size-18x18.webm
>     - vp90-2-02-size-18x32.webm
>     - vp90-2-02-size-18x34.webm
>     - vp90-2-02-size-18x64.webm
>     - vp90-2-02-size-18x66.webm
>     - vp90-2-02-size-32x08.webm
>     - vp90-2-02-size-32x10.webm
>     - vp90-2-02-size-32x16.webm
>     - vp90-2-02-size-32x18.webm
>     - vp90-2-02-size-32x32.webm
>     - vp90-2-02-size-32x34.webm
>     - vp90-2-02-size-32x64.webm
>     - vp90-2-02-size-32x66.webm
>     - vp90-2-02-size-34x08.webm
>     - vp90-2-02-size-34x10.webm
>     - vp90-2-02-size-34x16.webm
>     - vp90-2-02-size-34x18.webm
>     - vp90-2-02-size-34x32.webm
>     - vp90-2-02-size-34x34.webm
>     - vp90-2-02-size-34x64.webm
>     - vp90-2-02-size-34x66.webm
>     - vp90-2-02-size-64x08.webm
>     - vp90-2-02-size-64x10.webm
>     - vp90-2-02-size-64x16.webm
>     - vp90-2-02-size-64x18.webm
>     - vp90-2-02-size-64x32.webm
>     - vp90-2-02-size-64x34.webm
>     - vp90-2-02-size-64x64.webm
>     - vp90-2-02-size-64x66.webm
>     - vp90-2-02-size-66x08.webm
>     - vp90-2-02-size-66x10.webm
>     - vp90-2-02-size-66x16.webm
>     - vp90-2-02-size-66x18.webm
>     - vp90-2-02-size-66x32.webm
>     - vp90-2-02-size-66x34.webm
>     - vp90-2-02-size-66x64.webm
>     - vp90-2-02-size-66x66.webm
>   - 2 testcases failed due to unsupported format
>     - vp91-2-04-yuv422.webm
>     - vp91-2-04-yuv444.webm
>   - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
>     - vp90-2-22-svc_1280x720_3.ivf
>   - 5 testcase failed due to unsupported resolution after sequence change
>     - vp90-2-21-resize_inter_320x180_5_1-2.webm
>     - vp90-2-21-resize_inter_320x180_7_1-2.webm
>     - vp90-2-21-resize_inter_320x240_5_1-2.webm
>     - vp90-2-21-resize_inter_320x240_7_1-2.webm
>     - vp90-2-18-resize.ivf
>   - 1 testcase failed with CRC mismatch
>     - vp90-2-16-intra-only.webm
>     Analysis: First few frames are marked by firmware as NO_SHOW frame.
>     Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>     Such buffers should be dropped by GST. But instead, the first frame
>     is being displayed and when a valid buffer is sent to client later
>     with same timestamp, its dropped, leading to CRC mismatch for first
>     frame.
>   Note: Same timing issue as observed on SM8550 is seen on SM8250 as
>   well.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (20):
>        media: iris: Skip destroying internal buffer if not dequeued
>        media: iris: Update CAPTURE format info based on OUTPUT format
>        media: iris: Add handling for corrupt and drop frames
>        media: iris: Avoid updating frame size to firmware during reconfig
>        media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>        media: iris: Add handling for no show frames
>        media: iris: Improve last flag handling
>        media: iris: Skip flush on first sequence change
>        media: iris: Prevent HFI queue writes when core is in deinit state
>        media: iris: Remove redundant buffer count check in stream off
>        media: iris: Remove deprecated property setting to firmware
>        media: iris: Fix missing function pointer initialization
>        media: iris: Fix NULL pointer dereference
>        media: iris: Fix typo in depth variable
>        media: iris: Add a comment to explain usage of MBPS
>        media: iris: Add HEVC and VP9 formats for decoder
>        media: iris: Add platform capabilities for HEVC and VP9 decoders
>        media: iris: Set mandatory properties for HEVC and VP9 decoders.
>        media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>        media: iris: Add codec specific check for VP9 decoder drain handling
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c     |  22 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  44 ++-
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  22 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>   drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>   .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>   .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>   .../platform/qcom/iris/iris_platform_sm8550.c      | 143 +++++++-
>   drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 113 +++---
>   drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>   20 files changed, 948 insertions(+), 153 deletions(-)
> ---
> base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
> change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d
> 
> Best regards,

Assuming we merge Neils sm8650 stuff first, which I think we should 
merge first, you'll have a subsequent build error to fix [1]

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris?ref_type=heads

Testing your series in isolation. I can confirm vp9 decodes also getting 
some strange prinouts which we need to follow up to see if they exist 
with the baseline driver [2].

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com?ref_type=heads

[1]

  CC [M]  drivers/media/platform/qcom/iris/iris_vdec.o
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:432:10: 
error: ‘struct iris_platform_data’ has no member named 
‘input_config_params’; did you mean ‘output_config_params’?
   432 |         .input_config_params =
       |          ^~~~~~~~~~~~~~~~~~~
       |          output_config_params
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:433:17: 
error: ‘sm8550_vdec_input_config_params’ undeclared here (not in a 
function); did you mean ‘sm8550_vdec_output_config_params’?
   433 |                 sm8550_vdec_input_config_params,
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |                 sm8550_vdec_output_config_params
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:434:10: 
error: ‘struct iris_platform_data’ has no member named 
‘input_config_params_size’; did you mean ‘output_config_params_size’?
   434 |         .input_config_params_size =
       |          ^~~~~~~~~~~~~~~~~~~~~~~~
       |          output_config_params_size
In file included from 
/home/deckard/Development/linux/include/linux/dev_printk.h:14,
                  from 
/home/deckard/Development/linux/include/linux/device.h:15,
                  from 
/home/deckard/Development/linux/include/linux/pm_domain.h:11,
                  from 
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_core.h:10,
                  from 
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:6:
/home/deckard/Development/linux/include/linux/compiler.h:197:77: error: 
expression in static assertion is not an integer
   197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
{_Static_assert(!(e), msg);}))
       |             ^
/home/deckard/Development/linux/include/linux/compiler.h:202:33: note: 
in expansion of macro ‘__BUILD_BUG_ON_ZERO_MSG’
   202 | #define __must_be_array(a) 
__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/deckard/Development/linux/include/linux/array_size.h:11:59: note: 
in expansion of macro ‘__must_be_array’
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | ^~~~~~~~~~~~~~~
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:435:17: 
note: in expansion of macro ‘ARRAY_SIZE’
   435 |                 ARRAY_SIZE(sm8550_vdec_input_config_params),
       |                 ^~~~~~~~~~
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:442:10: 
error: ‘struct iris_platform_data’ has no member named 
‘dec_output_prop’; did you mean ‘dec_input_prop’?
   442 |         .dec_output_prop = sm8550_vdec_subscribe_output_properties,
       |          ^~~~~~~~~~~~~~~
       |          dec_input_prop
   CC [M]  drivers/media/platform/qcom/iris/iris_vpu3x.o
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:442:28: 
error: ‘sm8550_vdec_subscribe_output_properties’ undeclared here (not in 
a function); did you mean ‘sm8550_vdec_subscribe_input_properties’?
   442 |         .dec_output_prop = sm8550_vdec_subscribe_output_properties,
       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |                            sm8550_vdec_subscribe_input_properties
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:443:10: 
error: ‘struct iris_platform_data’ has no member named 
‘dec_output_prop_size’; did you mean ‘dec_input_prop_size’?
   443 |         .dec_output_prop_size = 
ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
       |          ^~~~~~~~~~~~~~~~~~~~
       |          dec_input_prop_size
/home/deckard/Development/linux/include/linux/compiler.h:197:77: error: 
expression in static assertion is not an integer
   197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
{_Static_assert(!(e), msg);}))
       |             ^
/home/deckard/Development/linux/include/linux/compiler.h:202:33: note: 
in expansion of macro ‘__BUILD_BUG_ON_ZERO_MSG’
   202 | #define __must_be_array(a) 
__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/deckard/Development/linux/include/linux/array_size.h:11:59: note: 
in expansion of macro ‘__must_be_array’
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | ^~~~~~~~~~~~~~~
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:443:33: 
note: in expansion of macro ‘ARRAY_SIZE’
   443 |         .dec_output_prop_size = 
ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
       |                                 ^~~~~~~~~~
make[8]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:203: 
drivers/media/platform/qcom/iris/iris_platform_sm8550.o] Error 1
make[8]: *** Waiting for unfinished jobs....
make[7]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media/platform/qcom/iris] Error 2
make[6]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media/platform/qcom] Error 2
make[5]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media/platform] Error 2
make[4]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media] Error 2
make[3]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: drivers] 
Error 2
make[2]: *** [/home/deckard/Development/linux/Makefile:2006: .] Error 2
make[1]: *** [/home/deckard/Development/linux/Makefile:248: __sub-make] 
Error 2
make[1]: Leaving directory 
'/home/deckard/Development/linux-tools/qlt-kernel/build/x1e80100-crd_qlt_integration'
make: *** [Makefile:248: __sub-make] Error 2
make[1]: Entering directory 
'/home/deckard/Development/linux-tools/qlt-kernel/build/x1e80100-crd_qlt_integration'
   GEN     Makefile
   CALL    /home/deckard/Development/linux/scripts/checksyscalls.sh
   CC [M]  drivers/media/platform/qcom/iris/iris_platform_sm8550.o
   CC [M]  drivers/media/platform/qcom/iris/iris_vpu_buffer.o
   CC [M]  drivers/media/platform/qcom/iris/iris_vpu_common.o
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:432:10: 
error: ‘struct iris_platform_data’ has no member named 
‘input_config_params’; did you mean ‘output_config_params’?
   432 |         .input_config_params =
       |          ^~~~~~~~~~~~~~~~~~~
       |          output_config_params
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:433:17: 
error: ‘sm8550_vdec_input_config_params’ undeclared here (not in a 
function); did you mean ‘sm8550_vdec_output_config_params’?
   433 |                 sm8550_vdec_input_config_params,
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |                 sm8550_vdec_output_config_params
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:434:10: 
error: ‘struct iris_platform_data’ has no member named 
‘input_config_params_size’; did you mean ‘output_config_params_size’?
   434 |         .input_config_params_size =
       |          ^~~~~~~~~~~~~~~~~~~~~~~~
       |          output_config_params_size
In file included from 
/home/deckard/Development/linux/include/linux/dev_printk.h:14,
                  from 
/home/deckard/Development/linux/include/linux/device.h:15,
                  from 
/home/deckard/Development/linux/include/linux/pm_domain.h:11,
                  from 
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_core.h:10,
                  from 
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:6:
/home/deckard/Development/linux/include/linux/compiler.h:197:77: error: 
expression in static assertion is not an integer
   197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
{_Static_assert(!(e), msg);}))
       |             ^
/home/deckard/Development/linux/include/linux/compiler.h:202:33: note: 
in expansion of macro ‘__BUILD_BUG_ON_ZERO_MSG’
   202 | #define __must_be_array(a) 
__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/deckard/Development/linux/include/linux/array_size.h:11:59: note: 
in expansion of macro ‘__must_be_array’
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | ^~~~~~~~~~~~~~~
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:435:17: 
note: in expansion of macro ‘ARRAY_SIZE’
   435 |                 ARRAY_SIZE(sm8550_vdec_input_config_params),
       |                 ^~~~~~~~~~
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:442:10: 
error: ‘struct iris_platform_data’ has no member named 
‘dec_output_prop’; did you mean ‘dec_input_prop’?
   442 |         .dec_output_prop = sm8550_vdec_subscribe_output_properties,
       |          ^~~~~~~~~~~~~~~
       |          dec_input_prop
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:442:28: 
error: ‘sm8550_vdec_subscribe_output_properties’ undeclared here (not in 
a function); did you mean ‘sm8550_vdec_subscribe_input_properties’?
   442 |         .dec_output_prop = sm8550_vdec_subscribe_output_properties,
       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |                            sm8550_vdec_subscribe_input_properties
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:443:10: 
error: ‘struct iris_platform_data’ has no member named 
‘dec_output_prop_size’; did you mean ‘dec_input_prop_size’?
   443 |         .dec_output_prop_size = 
ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
       |          ^~~~~~~~~~~~~~~~~~~~
       |          dec_input_prop_size
/home/deckard/Development/linux/include/linux/compiler.h:197:77: error: 
expression in static assertion is not an integer
   197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
{_Static_assert(!(e), msg);}))
       |             ^
/home/deckard/Development/linux/include/linux/compiler.h:202:33: note: 
in expansion of macro ‘__BUILD_BUG_ON_ZERO_MSG’
   202 | #define __must_be_array(a) 
__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/deckard/Development/linux/include/linux/array_size.h:11:59: note: 
in expansion of macro ‘__must_be_array’
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | ^~~~~~~~~~~~~~~
/home/deckard/Development/linux/drivers/media/platform/qcom/iris/iris_platform_sm8550.c:443:33: 
note: in expansion of macro ‘ARRAY_SIZE’
   443 |         .dec_output_prop_size = 
ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
       |                                 ^~~~~~~~~~
make[8]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:203: 
drivers/media/platform/qcom/iris/iris_platform_sm8550.o] Error 1
make[8]: *** Waiting for unfinished jobs....
make[7]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media/platform/qcom/iris] Error 2
make[6]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media/platform/qcom] Error 2
make[5]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media/platform] Error 2
make[4]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: 
drivers/media] Error 2
make[3]: *** 
[/home/deckard/Development/linux/scripts/Makefile.build:461: drivers] 
Error 2


[2]

[   58.165118] qcom-iris aa00000.video-codec: invalid plane
[   58.165721] ------------[ cut here ]------------
[   58.165727] WARNING: CPU: 1 PID: 1209 at 
drivers/media/common/videobuf2/videobuf2-core.c:2222 
__vb2_queue_cancel+0x238/0x2d0 [videobuf2_common]
[   58.165749] Modules linked in: rfcomm michael_mic reset_gpio 
snd_soc_wsa884x q6prm_clocks q6apm_lpass_dais snd_q6dsp_common q6apm_dai 
q6prm algif_hash algif_skcipher af_alg qrtr_mhi ntfs3 ath12k mac80211 
ov02e10 v4l2_cci snd_q6apm snd_soc_x1e80100 hci_uart snd_soc_qcom_common 
btqca bluetooth snd_soc_qcom_sdw ps883x ecdh_generic pwrseq_qcom_wcn ecc 
regmap_i2c phy_nxp_ptn3222 rtc_pm8xxx snd_soc_wcd938x snd_soc_wcd_classh 
snd_soc_wcd938x_sdw regmap_sdw qcom_iris videobuf2_dma_contig qcom_camss 
snd_soc_wcd_mbhc v4l2_mem2mem videobuf2_dma_sg snd_soc_lpass_rx_macro 
snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_wsa_macro 
soundwire_qcom snd_soc_hdmi_codec mux_core v4l2_fwnode 
snd_soc_lpass_macro_common videobuf2_memops videobuf2_v4l2 
videobuf2_common v4l2_async snd_soc_core videocc_sm8550 i2c_qcom_cci 
videodev snd_compress mc phy_qcom_qmp_usb rpmsg_ctrl apr fastrpc snd_pcm 
qcom_pd_mapper rpmsg_char pci_pwrctrl_pwrseq pci_pwrctrl_core qrtr_smd 
pwrseq_core snd_timer cfg80211 snd soundwire_bus rfkill i2c_dev
[   58.165914]  ip_tables x_tables autofs4 ipv6 fuse socinfo 
qcom_cpucp_mbox icc_bwmon leds_gpio phy_qcom_qmp_pcie arm_smccc_trng 
rng_core gpucc_x1e80100 pcie_qcom crc8 soundcore tcsrcc_x1e80100 
pinctrl_sm8550_lpass_lpi pinctrl_lpass_lpi lpasscc_sc8280xp 
hid_multitouch i2c_qcom_geni dispcc_x1e80100 phy_qcom_edp qcom_stats 
phy_qcom_snps_eusb2 sha512_ce sha512_arm64 nvmem_qcom_spmi_sdam 
qcom_spmi_temp_alarm industrialio sha3_ce phy_qcom_qmp_combo aux_bridge 
phy_qcom_eusb2_repeater qcom_pon reboot_mode sm3_ce sm3 ucsi_glink 
pmic_glink_altmode typec_ucsi qcom_battmgr aux_hpd_bridge pmic_glink 
pdr_interface qcom_pdr_msg typec msm drm_client_lib drm_exec llcc_qcom 
gpu_sched i2c_hid_of i2c_hid qrtr qcom_q6v5_pas qcom_pil_info 
qcom_common qcom_glink_smem qcom_glink qcom_q6v5 qcom_sysmon mdt_loader 
rpmsg_core qmi_helpers input_leds panel_edp drm_display_helper 
drm_dp_aux_bus drm_kms_helper drm i2c_core mhi libarc4 nvme nvme_core 
usb_storage r8152 mii libphy led_class dm_crypt dm_mod
[   58.166115] CPU: 1 UID: 1001 PID: 1209 Comm: GstPlay Tainted: G 
  W           6.15.0-rc1 #69 PREEMPT
[   58.166125] Tainted: [W]=WARN
[   58.166129] Hardware name: Dell Inc. Inspiron 14 Plus 7441/0YWPR3, 
BIOS 2.5.0 12/16/2024
[   58.166133] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS 
BTYPE=--)
[   58.166140] pc : __vb2_queue_cancel+0x238/0x2d0 [videobuf2_common]
[   58.166146] lr : __vb2_queue_cancel+0x2c/0x2d0 [videobuf2_common]
[   58.166152] sp : ffff800083f9bb00
[   58.166155] x29: ffff800083f9bb00 x28: ffff6ad64770c020 x27: 
0000000000000000
[   58.166165] x26: 0000000040045613 x25: 0000000000000000 x24: 
ffffac02677a6bc8
[   58.166174] x23: ffff6ad64770c060 x22: ffff6ad68e60c780 x21: 
ffff6ad679c36428
[   58.166183] x20: 0000000000000009 x19: ffff6ad679c36428 x18: 
0000000000000000
[   58.166192] x17: 0000000000000000 x16: ffffac027ba13408 x15: 
0000ffff000304b0
[   58.166200] x14: 0000000000000000 x13: 0000000000000000 x12: 
0000000000000000
[   58.166208] x11: 0000000000000000 x10: 0000000000000000 x9 : 
0000000000000000
[   58.166216] x8 : ffff800083f9bd48 x7 : ffffac02677a6e28 x6 : 
ffffac02677a6e28
[   58.166226] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 
0000000000000000
[   58.166233] x2 : ffffac0267986fb0 x1 : 0000000000000000 x0 : 
0000000000000008
[   58.166242] Call trace:
[   58.166246]  __vb2_queue_cancel+0x238/0x2d0 [videobuf2_common] (P)
[   58.166254]  vb2_core_streamoff+0x24/0xc8 [videobuf2_common]
[   58.166260]  vb2_streamoff+0x18/0x64 [videobuf2_v4l2]
[   58.166267]  v4l2_m2m_streamoff+0x78/0x144 [v4l2_mem2mem]
[   58.166273]  v4l2_m2m_ioctl_streamoff+0x18/0x24 [v4l2_mem2mem]
[   58.166279]  v4l_streamoff+0x24/0x30 [videodev]
[   58.166289]  __video_do_ioctl+0x40c/0x4a0 [videodev]
[   58.166298]  video_usercopy+0x2bc/0x688 [videodev]
[   58.166307]  video_ioctl2+0x18/0x38 [videodev]
[   58.166315]  v4l2_ioctl+0x40/0x60 [videodev]
[   58.166323]  __arm64_sys_ioctl+0xb4/0xf4
[   58.166335]  invoke_syscall+0x48/0x104
[   58.166346]  el0_svc_common.constprop.0+0x40/0xe0
[   58.166355]  do_el0_svc+0x1c/0x28
[   58.166363]  el0_svc+0x30/0xcc
[   58.166373]  el0t_64_sync_handler+0x10c/0x138
[   58.166381]  el0t_64_sync+0x198/0x19c
[   58.166386] ---[ end trace 0000000000000000 ]---
[   58.166390] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 0 in active state
[   58.166395] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 1 in active state
[   58.166398] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 2 in active state
[   58.166401] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 3 in active state
[   58.166404] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 5 in active state
[   58.166407] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 6 in active state
[   58.166410] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 7 in active state
[   58.166413] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 8 in active state
[   58.169738] qcom-iris aa00000.video-codec: invalid plane
[   61.517138] ------------[ cut here ]------------
[   61.517147] WARNING: CPU: 1 PID: 1209 at 
drivers/media/common/videobuf2/videobuf2-core.c:2222 
__vb2_queue_cancel+0x238/0x2d0 [videobuf2_common]
[   61.517157] Modules linked in: rfcomm michael_mic reset_gpio 
snd_soc_wsa884x q6prm_clocks q6apm_lpass_dais snd_q6dsp_common q6apm_dai 
q6prm algif_hash algif_skcipher af_alg qrtr_mhi ntfs3 ath12k mac80211 
ov02e10 v4l2_cci snd_q6apm snd_soc_x1e80100 hci_uart snd_soc_qcom_common 
btqca bluetooth snd_soc_qcom_sdw ps883x ecdh_generic pwrseq_qcom_wcn ecc 
regmap_i2c phy_nxp_ptn3222 rtc_pm8xxx snd_soc_wcd938x snd_soc_wcd_classh 
snd_soc_wcd938x_sdw regmap_sdw qcom_iris videobuf2_dma_contig qcom_camss 
snd_soc_wcd_mbhc v4l2_mem2mem videobuf2_dma_sg snd_soc_lpass_rx_macro 
snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_wsa_macro 
soundwire_qcom snd_soc_hdmi_codec mux_core v4l2_fwnode 
snd_soc_lpass_macro_common videobuf2_memops videobuf2_v4l2 
videobuf2_common v4l2_async snd_soc_core videocc_sm8550 i2c_qcom_cci 
videodev snd_compress mc phy_qcom_qmp_usb rpmsg_ctrl apr fastrpc snd_pcm 
qcom_pd_mapper rpmsg_char pci_pwrctrl_pwrseq pci_pwrctrl_core qrtr_smd 
pwrseq_core snd_timer cfg80211 snd soundwire_bus rfkill i2c_dev
[   61.517210]  ip_tables x_tables autofs4 ipv6 fuse socinfo 
qcom_cpucp_mbox icc_bwmon leds_gpio phy_qcom_qmp_pcie arm_smccc_trng 
rng_core gpucc_x1e80100 pcie_qcom crc8 soundcore tcsrcc_x1e80100 
pinctrl_sm8550_lpass_lpi pinctrl_lpass_lpi lpasscc_sc8280xp 
hid_multitouch i2c_qcom_geni dispcc_x1e80100 phy_qcom_edp qcom_stats 
phy_qcom_snps_eusb2 sha512_ce sha512_arm64 nvmem_qcom_spmi_sdam 
qcom_spmi_temp_alarm industrialio sha3_ce phy_qcom_qmp_combo aux_bridge 
phy_qcom_eusb2_repeater qcom_pon reboot_mode sm3_ce sm3 ucsi_glink 
pmic_glink_altmode typec_ucsi qcom_battmgr aux_hpd_bridge pmic_glink 
pdr_interface qcom_pdr_msg typec msm drm_client_lib drm_exec llcc_qcom 
gpu_sched i2c_hid_of i2c_hid qrtr qcom_q6v5_pas qcom_pil_info 
qcom_common qcom_glink_smem qcom_glink qcom_q6v5 qcom_sysmon mdt_loader 
rpmsg_core qmi_helpers input_leds panel_edp drm_display_helper 
drm_dp_aux_bus drm_kms_helper drm i2c_core mhi libarc4 nvme nvme_core 
usb_storage r8152 mii libphy led_class dm_crypt dm_mod
[   61.517282] CPU: 1 UID: 1001 PID: 1209 Comm: GstPlay Tainted: G 
  W           6.15.0-rc1 #69 PREEMPT
[   61.517286] Tainted: [W]=WARN
[   61.517288] Hardware name: Dell Inc. Inspiron 14 Plus 7441/0YWPR3, 
BIOS 2.5.0 12/16/2024
[   61.517289] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS 
BTYPE=--)
[   61.517291] pc : __vb2_queue_cancel+0x238/0x2d0 [videobuf2_common]
[   61.517293] lr : __vb2_queue_cancel+0x2c/0x2d0 [videobuf2_common]
[   61.517295] sp : ffff800083f9bb00
[   61.517296] x29: ffff800083f9bb00 x28: ffff6ad64770c020 x27: 
0000000000000000
[   61.517299] x26: 0000000040045613 x25: 0000000000000000 x24: 
ffffac02677a6bc8
[   61.517301] x23: ffff6ad64770c060 x22: ffff6ad68e60c780 x21: 
ffff6ad679c36428
[   61.517304] x20: 0000000000000009 x19: ffff6ad679c36428 x18: 
0000000000000000
[   61.517306] x17: 0000000000000000 x16: ffffac027ba13408 x15: 
0000ffff000304b0
[   61.517309] x14: 0000000000000000 x13: 0000000000000000 x12: 
0000000000000000
[   61.517311] x11: 0000000000000000 x10: 0000000000000000 x9 : 
0000000000000000
[   61.517314] x8 : ffff800083f9bd48 x7 : ffffac02677a6e28 x6 : 
ffffac02677a6e28
[   61.517316] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 
0000000000000000
[   61.517319] x2 : ffffac0267986fb0 x1 : 0000000000000000 x0 : 
0000000000000008
[   61.517321] Call trace:
[   61.517323]  __vb2_queue_cancel+0x238/0x2d0 [videobuf2_common] (P)
[   61.517325]  vb2_core_streamoff+0x24/0xc8 [videobuf2_common]
[   61.517327]  vb2_streamoff+0x18/0x64 [videobuf2_v4l2]
[   61.517330]  v4l2_m2m_streamoff+0x78/0x144 [v4l2_mem2mem]
[   61.517332]  v4l2_m2m_ioctl_streamoff+0x18/0x24 [v4l2_mem2mem]
[   61.517334]  v4l_streamoff+0x24/0x30 [videodev]
[   61.517338]  __video_do_ioctl+0x40c/0x4a0 [videodev]
[   61.517341]  video_usercopy+0x2bc/0x688 [videodev]
[   61.517343]  video_ioctl2+0x18/0x38 [videodev]
[   61.517346]  v4l2_ioctl+0x40/0x60 [videodev]
[   61.517348]  __arm64_sys_ioctl+0xb4/0xf4
[   61.517355]  invoke_syscall+0x48/0x104
[   61.517359]  el0_svc_common.constprop.0+0x40/0xe0
[   61.517362]  do_el0_svc+0x1c/0x28
[   61.517364]  el0_svc+0x30/0xcc
[   61.517368]  el0t_64_sync_handler+0x10c/0x138
[   61.517371]  el0t_64_sync+0x198/0x19c
[   61.517372] ---[ end trace 0000000000000000 ]---
[   61.517375] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 0 in active state
[   61.517377] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 1 in active state
[   61.517378] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 2 in active state
[   61.517379] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 3 in active state
[   61.517381] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 5 in active state
[   61.517382] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 6 in active state
[   61.517383] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 7 in active state
[   61.517384] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 8 in active state
[   84.239087] ------------[ cut here ]------------
[   84.239099] WARNING: CPU: 0 PID: 1283 at 
drivers/media/common/videobuf2/videobuf2-core.c:2222 
__vb2_queue_cancel+0x238/0x2d0 [videobuf2_common]
[   84.239110] Modules linked in: rfcomm michael_mic reset_gpio 
snd_soc_wsa884x q6prm_clocks q6apm_lpass_dais snd_q6dsp_common q6apm_dai 
q6prm algif_hash algif_skcipher af_alg qrtr_mhi ntfs3 ath12k mac80211 
ov02e10 v4l2_cci snd_q6apm snd_soc_x1e80100 hci_uart snd_soc_qcom_common 
btqca bluetooth snd_soc_qcom_sdw ps883x ecdh_generic pwrseq_qcom_wcn ecc 
regmap_i2c phy_nxp_ptn3222 rtc_pm8xxx snd_soc_wcd938x snd_soc_wcd_classh 
snd_soc_wcd938x_sdw regmap_sdw qcom_iris videobuf2_dma_contig qcom_camss 
snd_soc_wcd_mbhc v4l2_mem2mem videobuf2_dma_sg snd_soc_lpass_rx_macro 
snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_wsa_macro 
soundwire_qcom snd_soc_hdmi_codec mux_core v4l2_fwnode 
snd_soc_lpass_macro_common videobuf2_memops videobuf2_v4l2 
videobuf2_common v4l2_async snd_soc_core videocc_sm8550 i2c_qcom_cci 
videodev snd_compress mc phy_qcom_qmp_usb rpmsg_ctrl apr fastrpc snd_pcm 
qcom_pd_mapper rpmsg_char pci_pwrctrl_pwrseq pci_pwrctrl_core qrtr_smd 
pwrseq_core snd_timer cfg80211 snd soundwire_bus rfkill i2c_dev
[   84.239190]  ip_tables x_tables autofs4 ipv6 fuse socinfo 
qcom_cpucp_mbox icc_bwmon leds_gpio phy_qcom_qmp_pcie arm_smccc_trng 
rng_core gpucc_x1e80100 pcie_qcom crc8 soundcore tcsrcc_x1e80100 
pinctrl_sm8550_lpass_lpi pinctrl_lpass_lpi lpasscc_sc8280xp 
hid_multitouch i2c_qcom_geni dispcc_x1e80100 phy_qcom_edp qcom_stats 
phy_qcom_snps_eusb2 sha512_ce sha512_arm64 nvmem_qcom_spmi_sdam 
qcom_spmi_temp_alarm industrialio sha3_ce phy_qcom_qmp_combo aux_bridge 
phy_qcom_eusb2_repeater qcom_pon reboot_mode sm3_ce sm3 ucsi_glink 
pmic_glink_altmode typec_ucsi qcom_battmgr aux_hpd_bridge pmic_glink 
pdr_interface qcom_pdr_msg typec msm drm_client_lib drm_exec llcc_qcom 
gpu_sched i2c_hid_of i2c_hid qrtr qcom_q6v5_pas qcom_pil_info 
qcom_common qcom_glink_smem qcom_glink qcom_q6v5 qcom_sysmon mdt_loader 
rpmsg_core qmi_helpers input_leds panel_edp drm_display_helper 
drm_dp_aux_bus drm_kms_helper drm i2c_core mhi libarc4 nvme nvme_core 
usb_storage r8152 mii libphy led_class dm_crypt dm_mod
[   84.239292] CPU: 0 UID: 1001 PID: 1283 Comm: GstPlay Tainted: G 
  W           6.15.0-rc1 #69 PREEMPT
[   84.239297] Tainted: [W]=WARN
[   84.239299] Hardware name: Dell Inc. Inspiron 14 Plus 7441/0YWPR3, 
BIOS 2.5.0 12/16/2024
[   84.239301] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS 
BTYPE=--)
[   84.239304] pc : __vb2_queue_cancel+0x238/0x2d0 [videobuf2_common]
[   84.239307] lr : __vb2_queue_cancel+0x2c/0x2d0 [videobuf2_common]
[   84.239309] sp : ffff800082333b00
[   84.239311] x29: ffff800082333b00 x28: ffff6ad65e9d5020 x27: 
0000000000000000
[   84.239315] x26: 0000000040045613 x25: 0000000000000000 x24: 
ffffac02677a6bc8
[   84.239319] x23: ffff6ad65e9d5060 x22: ffff6ad646d64d80 x21: 
ffff6ad65f005028
[   84.239324] x20: 0000000000000009 x19: ffff6ad65f005028 x18: 
0000000000000000
[   84.239328] x17: 0000000000000000 x16: ffffac027ba13408 x15: 
0000ffff20030410
[   84.239332] x14: 0000000000000000 x13: 0000000000000000 x12: 
0000000000000000
[   84.239335] x11: 0000000000000000 x10: 0000000000000000 x9 : 
0000000000000000
[   84.239339] x8 : ffff800082333d48 x7 : ffffac02677a6e28 x6 : 
ffffac02677a6e28
[   84.239343] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 
0000000000000000
[   84.239347] x2 : ffffac0267986fb0 x1 : 0000000000000000 x0 : 
0000000000000016
[   84.239351] Call trace:
[   84.239353]  __vb2_queue_cancel+0x238/0x2d0 [videobuf2_common] (P)
[   84.239357]  vb2_core_streamoff+0x24/0xc8 [videobuf2_common]
[   84.239360]  vb2_streamoff+0x18/0x64 [videobuf2_v4l2]
[   84.239364]  v4l2_m2m_streamoff+0x78/0x144 [v4l2_mem2mem]
[   84.239368]  v4l2_m2m_ioctl_streamoff+0x18/0x24 [v4l2_mem2mem]
[   84.239370]  v4l_streamoff+0x24/0x30 [videodev]
[   84.239376]  __video_do_ioctl+0x40c/0x4a0 [videodev]
[   84.239380]  video_usercopy+0x2bc/0x688 [videodev]
[   84.239384]  video_ioctl2+0x18/0x38 [videodev]
[   84.239388]  v4l2_ioctl+0x40/0x60 [videodev]
[   84.239392]  __arm64_sys_ioctl+0xb4/0xf4
[   84.239400]  invoke_syscall+0x48/0x104
[   84.239407]  el0_svc_common.constprop.0+0x40/0xe0
[   84.239411]  do_el0_svc+0x1c/0x28
[   84.239415]  el0_svc+0x30/0xcc
[   84.239421]  el0t_64_sync_handler+0x10c/0x138
[   84.239425]  el0t_64_sync+0x198/0x19c
[   84.239428] ---[ end trace 0000000000000000 ]---
[   84.239430] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 0 in active state
[   84.239432] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 1 in active state
[   84.239433] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 2 in active state
[   84.239435] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 3 in active state
[   84.239436] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 4 in active state
[   84.239438] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 5 in active state
[   84.239439] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 7 in active state
[   84.239440] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 8 in active state
[   84.239442] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 9 in active state
[   84.239443] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 10 in active state
[   84.239445] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 11 in active state
[   84.239446] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 14 in active state
[   84.239447] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 15 in active state
[   84.239449] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 16 in active state
[   84.239450] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 17 in active state
[   84.239452] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 18 in active state
[   84.239453] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 19 in active state
[   84.239454] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 20 in active state
[   84.239456] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 21 in active state
[   84.239457] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 22 in active state
[   84.239459] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 23 in active state
[   84.239460] videobuf2_common: driver bug: stop_streaming operation is 
leaving buffer 24 in active state
[   84.245873] qcom-iris aa00000.video-codec: invalid plane
[  126.573593] qcom-iris aa00000.video-codec: session error received 
0x1000009: unknown
[  126.573638] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.573644] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.573649] qcom-iris aa00000.video-codec: session error received 
0x1000009: unknown
[  126.573654] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.573659] qcom-iris aa00000.video-codec: session error received 
0x1000009: unknown
[  126.573664] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.573668] qcom-iris aa00000.video-codec: session error received 
0x1000009: unknown
[  126.573670] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.582134] qcom-iris aa00000.video-codec: session error received 
0x1000006: unknown
[  126.582142] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.582147] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.582152] qcom-iris aa00000.video-codec: session error received 
0x1000006: unknown
[  126.582156] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.582161] qcom-iris aa00000.video-codec: session error received 
0x1000006: unknown
[  126.582166] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state
[  126.582170] qcom-iris aa00000.video-codec: session error received 
0x1000006: unknown
[  126.582177] qcom-iris aa00000.video-codec: session error received 
0x4000004: invalid operation for current state

