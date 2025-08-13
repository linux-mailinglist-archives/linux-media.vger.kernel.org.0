Return-Path: <linux-media+bounces-39848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E00B25684
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD8A9A2895
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CF2302754;
	Wed, 13 Aug 2025 22:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYq6t83V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7EF302778
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755123490; cv=none; b=loGsSmnnHY6jUsScEtjwynQfbKFdEmEuB2fiMYNPE0blofDMhHGVDGTIJb6igSKCDAH6LYDubz8BUd80KaWOaf6GCzHGflWopIo8a/aT2NA7dL7jynpBDaUgBi7r+pqP/qQHk2ADJNHMCTf5cNF8ekakPjlijWezIcqOGiCLTWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755123490; c=relaxed/simple;
	bh=GMtXtAHnPJtVjxglewyZatQ82vSdhRgLOmSprQoYXQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0ELCAT/5WOM6TKA25hkKioTJv7v0u9P/dzSd/lOWnr5C0QfESkYx9IoWlnNIbxMrQuRR0fVyr7jujwkiIa4qdbyoHp235ZrM3/m3rh6kQDKAWvGdLMUxMvgL23iF6ZnAAokkXxoCkq2/c1e7nTYX1IBqwaXZzcPxcNKD0i1ik4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SYq6t83V; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9e4193083so212581f8f.3
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755123487; x=1755728287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSrgOVtURRRixDRwEfwBM5RMe5Wr8P2/Ou2G3Tp3nus=;
        b=SYq6t83VKDAkqHvpzfGJNGCOtF8O9jNmNqvkgCa2vo7fuY9rxM1it7Fa0xx6kCpMnB
         rPJsuGZwHXSYy+lzz0uUAWBNFmPkuYrOmMJMiqqKrh57qrMyWl833Lyobjey1rmNCwNB
         91JwqSa3oY7DGUnXQEgIsmPEN9wI1PD7/NNl6evQ4IG62n8bMuhmqEa6rxS1bWV3sAEi
         ZxMWN0JeYemqz3uxKt3WS/IS12LZxkHMY9SlIyUUhERJFc24A+P16B7RFNJz7svSUxbn
         9MkLpr3Dxxe+OXXYEFfsyPbsE/kKIvoHFLc7lDAj/6OLDDAGd93O6tvDsnpBCMq9aucT
         iuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755123487; x=1755728287;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSrgOVtURRRixDRwEfwBM5RMe5Wr8P2/Ou2G3Tp3nus=;
        b=czM5rgX0QgAGr4A5A1fIlFKqbH05Mis01wxJlpJMEW5iEJuIqZ/gvNfqMRVnXeTKk0
         LnWKer87dmj22/fjQhAfe9CCXZ73l7E+vpmMMfKlK98yMDBNaN9v3683Rg5Prbx5guhq
         GVpzvM7nylo8Vl7/WbduErhAmJQJfSZoZTcwLmFYUj3Fbi/Ns/0a7qRTo3ooBXP3BjJM
         CTdTfygcoAig3tpn8KRTPwRIwNgpYJ3zu2j5EXrI8DFASc2MmPGnc/nhYeZLogcxDsEy
         L9GyOq+qHXiw9mymbj8P5awh0mRmdHVxyH4yngoXle1EwufbL4bchsaicdpoI6fo5xcW
         2OfA==
X-Forwarded-Encrypted: i=1; AJvYcCXtcBMsM1Tgyf8Kh93k2AlCCjuFVYw30XRal9R0xa0Mc8u8ZbGICqbuTyirnzrThwMdWFTXOqzXIpcQRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpbcwc1cGpUkSrSD/Im7WtDhvqEw7UvduzLkSUv4XrnodkUHFk
	CQdQy1Es5F52z8cpXTCiU+xBOKsXdOKGM94fAE6G7dtwSGdF2R94zgGREolP/yVOLSA=
X-Gm-Gg: ASbGncs/DD3O4Yzwwd2oO7HJWD3AWTagd1XCvCz51m0YHTyZWmnurZJRxoGVWf5Dpo8
	0mVT9l5rBKgXbh43ubQF4OGePy3G4TEsdhhQAa4u22IJMb1DPkw0L5jqf44W2zdnzdyP167lYjN
	CUIZqYIOModoiUHOgyJn/qbBBvPCkyaBDyDN5j6X2Q6aqUWvkd/c+fJsFUFYQHiI7R476KrYfd+
	5C6LwkBvbuN+59Jpi2o5FNlgwKW+KPS/cSlwet9hfr1oIb5Nbv4zXOyia2uEZPu5JGX1Ho9WSC7
	GrtoOSW4AQ/E7XR/iJdINRWUqqx9LQhLKcEE15JApn51N/rdI7/5B/W9UajGAtTopVSU5WNaKrG
	SD2TvVRYu741myrPsGDo8YLvAYk8U3fjduyMXVxFHrOpPULrRUPFwxmSGiw+5hliz
X-Google-Smtp-Source: AGHT+IGBmS8+2J4LAL7Zgy86eICdqX5/gfgdrrrbAJB7uOLcq2oROBuoKzFdmRy+EnZjay73L8mGcQ==
X-Received: by 2002:a5d:5f4a:0:b0:3b8:d493:31ed with SMTP id ffacd0b85a97d-3b9edf4454emr749676f8f.47.1755123486628;
        Wed, 13 Aug 2025 15:18:06 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a5209e3sm15771815e9.13.2025.08.13.15.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:18:06 -0700 (PDT)
Message-ID: <bd8a88f1-403d-4089-b174-f62ba69e188f@linaro.org>
Date: Wed, 13 Aug 2025 23:18:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] media: venus: Add QCM2290 support with AR50_LITE
 core
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> Changes since v8:
>    v8: https://lore.kernel.org/all/20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com/
> -  patch 1/8: Add qcm2290 dt schema
>    - no change
> - patch 2/8: media: venus: Define minimum valid firmware version
>    - dev_err on failure
> - patch 3/8: Add framework to support for AR50 LITE video core
>    - pass core rather than the lite property to the hfi platform
>    - remove warnings
> - patch 4/8: HFI platform V4 capabilities
>    -no change
> - patch 5/8: Sort dt_match alphabetically
>    - new
> - patch 6/8: Add DT compatible and capabilities
>    - sort dt_match alphabetically
> - patch 7/8: Add Venus video node for 2290
>    - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> - patch 8/8: Enable Venus on 2210 RB1 board
>    - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Changes since v7:
>    v7: https://lore.kernel.org/all/20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com/
> -  patch 1/7: Add qcm2290 dt schema
>    - extend commit message to cover IOMMU order, remove iommus minItems, alphabetic order for includes
>    - added myself as the file maintainer
> -  patch 2/7: media: venus: Define minimum valid firmware version
>    - Replaces previous patch that was able to distinguish encoder vs decoder firmware version support
>    - Now it is an all or nothing implementation (the firmware either support enc and dec or it doesn't)
> - patch 3/7: Add Support for AR50 LITE video core
>    - remove EOS support for older firmwares since we will drop support for fw < 6.0.55
> - patch 4/7: HFI platform V4 capabilities
>    - remove some hardcoded values and some ternary operations
>    - added reviewed by Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> - patch 5/7: Add DT compatible and capabilities
>    - only min_fw now required since we dont support encode/decode indepedently after 2/7
>    - added reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
> - patch 6/7: Add Venus video node for 2290
>    - no change
> - patch 7/7: Enable Venus on 2210 RB1 board
>    - fix alphabetical order
> 
> Changes since v6:
>    v6: https://lore.kernel.org/all/20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com/
> - patch 1/7: Add qcm2290 dt schema
>    - no change
> - patch 2/7: Conditionally register video nodes
>    - fixed potential NULL dereference on handling firmware errors when the encoder is not present.
> - patch 3/7: Add Support for AR50 LITE video core
>    - applied Dikshita Agarwal review comments: do not handle no-tz case, fix WD mask
>    - replaced EOS buffers for a work around (firmware should not access the eos buffers)
>       renamed venus_helper_alloc_eos_buf to venus_helper_prepare_eos_data
> - patch 4/7: HFI platform V4 capabilities
>    - removed 10 bit encoder support as per Dikshita Agarwal review
> - patch 5/7: Add DT compatible and capabilities
>    - removed frequency table as per Konrad Dybcio review (driver now uses opp)
>    - fixed bw_tables for the supported loads (remove 10 bit support)
> - patch 6/7: Add Venus video node for 2290
>    - no change
> - patch 7/7: Enable Venus on 2210 RB1 board
>    - no change
> 
> Changes since v5:
>    Two additional new patches added to the set to support video encoding.
> 
> - patch 1/7: Add qcm2290 dt schema
>    - added reviewed by: Bryan O'Donoghue
>    - added reviewed by: Krzysztof Kozlowski
> - patch 2/7: Conditionally register video nodes
>    - new functionality required to support AR50_LITE
> - patch 3/7: Add Support for AR50 LITE video core
>    - completely rewritten - lite platforms are extensions of previous HFI_XXX
> - patch 4/7: HFI platform V4 capabilities
>    - use HFI 4XX instead of HFI 6XX as per review
> - patch 5/7: Add DT compatible and capabilities
>    - added reviewed by: Bryan O'Donoghue
>    - enabled new option min_fw_version
> - patch 6/7: Add Venus video node for 2290
>    - added reviewed by: Konrad Dybcio
>    - removed status property
> - patch 7/7: Enable Venus on 2210 RB1 board
>    - new
> 
> Changes since v4:
> - patch 1/5:
>    - added reviewed by: Krzysztof Kozlowski
>    - updated example section
> - patch 2/5:
>    - added reviewed by: Bryan O'Donoghue
>    - Fixed Co-developed-by order
> - patch 3/5:
> - patch 4/5:
>   - removed encode-node (userspace exposure)
>   - fixed Co-developed-by order
> - patch 5/5:
>   - fixed venus register region
>   - power-domain-names: one per line
>   - clock-names: one per line
>   - fixed interconnect tags
>   - empty line before subnode
>   - enable the venus node
> 
> Changes since v3:
> - Fixed schema commit subject.
> 
> Changes since v2:
> - Removed IS_HFI/IS_VPU macros
> - checkpatch.pl --strict fixes:
>    - convert macro to static inline to avoid argument reuse side effect
> 
> Changes since v1:
> - Added IS_HFI macro usage
> - Moved schema patch to top
> - Fixed commit messages
> 
> This patch series adds support for the Venus video decoder/encoder block
> present on the Qualcomm QCM2290.
> 
> This series functionally depends on the following patch:
> 
>    clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
>    https://lore.kernel.org/all/20250613102245.782511-1-loic.poulain@oss.qualcomm.com/
> 
> Please ensure the above patch is applied before this series.
> 
> The QCM2290 integrates an AR50_LITE core, a low-power implementation of
> Venus supporting H.264, HEVC (H.265), and VP9 decoding as well as H.264
> and H.265 encoding.
> 
> The series includes:
>    - DT binding schema for qcom,qcm2290-venus
>    - SoC integration via qcm2290.dtsi
>    - Resource table definitions and frequency scaling
>    - Platform capability registration for the AR50_LITE core decoding block.
> 
> Limitations:
>    - The hardware does not support concurrent operation at FullHD.
>    - Encoding is not supported in firmware version before 6.0.54
> 
> Firmware:
>    - This code has been tested with 6.0.52, 6.0.53, 6.0.54-PRERELEASE
> 
> Some basic Tests:
> 
> Decoding and Encoding were verified on the QCOM RB1 platform using
> GStreamer with V4L2-based decode plugins.
> 
> The following pipelines were used for playback 1280x720 and 1920x1080
> H.264, HEVC and VP9 videos from https://www.elecard.com/videos.
> 
> Decoding:
> [H.264]
> gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
>    ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
>    ! videoconvert ! autovideosink
> 
> [H.265]
> gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
>    ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
>    ! videoconvert ! autovideosink
> 
> [VP9]
> gst-launch-1.0 filesrc location=videos/xxxxx.webm \
>    ! matroskademux ! queue ! v4l2vp9dec \
>    ! videoconvert ! autovideosink
> 
> Encoding:
> [H.264]
> gst-launch-1.0 videotestsrc num-buffers=30 \
>    ! video/x-raw,width=1280,height=720,framerate=30/1 \
>    ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=/tmp/output.mp4
> 
> [H.265]
> gst-launch-1.0 videotestsrc num-buffers=30 \
>    ! video/x-raw,width=1920,height=1080,framerate=30/1 \
>    ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=/tmp/output.mp4
> 
> Concurrency:
> gst-launch-1.0 -v videotestsrc num-buffers=1000 \
>    ! video/x-raw,format=NV12,width=1280,height=720,framerate=30/1 \
>    ! v4l2h264enc capture-io-mode=4 output-io-mode=2 ! h264parse \
>    ! v4l2h264dec capture-io-mode=4 output-io-mode=2 ! videoconvert \
>    ! autovideosink
> 
> [Fluster]
> The H.264 decoder was also tested using the Fluster test suite
> (version: v0.4.0-12-g33566abd0964).
>   Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
>   Result: 126/135 tests passed
>   Failures:
>   FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
>   SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B
> 
> ---
> 
> Jorge Ramirez-Ortiz (8):
>    media: dt-bindings: venus: Add qcm2290 dt schema
>    media: venus: Define minimum valid firmware version
>    media: venus: Add framework support for AR50_LITE video core
>    media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
>    media: venus: core: Sort dt_match alphabetically.
>    media: venus: core: Add qcm2290 DT compatible and resource data
>    arm64: dts: qcom: qcm2290: Add Venus video node
>    arm64: dts: qcom: qrb2210-rb1: Enable Venus
> 
>   .../bindings/media/qcom,qcm2290-venus.yaml    | 130 ++++++++++++
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  55 +++++
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      |   4 +
>   drivers/media/platform/qcom/venus/core.c      | 109 +++++++---
>   drivers/media/platform/qcom/venus/core.h      |  18 +-
>   drivers/media/platform/qcom/venus/firmware.c  |  30 +++
>   drivers/media/platform/qcom/venus/firmware.h  |   2 +
>   drivers/media/platform/qcom/venus/helpers.c   |  12 +-
>   .../media/platform/qcom/venus/hfi_parser.c    |   2 +-
>   .../media/platform/qcom/venus/hfi_platform.c  |  23 ++-
>   .../media/platform/qcom/venus/hfi_platform.h  |  34 ++--
>   .../platform/qcom/venus/hfi_platform_v4.c     | 188 ++++++++++++++++--
>   .../platform/qcom/venus/hfi_platform_v6.c     |  33 ++-
>   drivers/media/platform/qcom/venus/hfi_venus.c |  25 ++-
>   .../media/platform/qcom/venus/hfi_venus_io.h  |   4 +
>   .../media/platform/qcom/venus/pm_helpers.c    |   2 +-
>   16 files changed, 582 insertions(+), 89 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 

Trying to apply your series and getting a few or more than one splat 
anyway, on media-comitters/next

Could you fix this series and test up as a V10 ?

https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commits/b4/bod-media-committers-next-platform-qcom-6.17-rc1

---
bod



