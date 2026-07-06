Return-Path: <linux-media+bounces-66710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f5UHN1FjS2pWQgEAu9opvQ
	(envelope-from <linux-media+bounces-66710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:12:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4E70DF58
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=tLt4uHFY;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66710-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66710-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7810F30C8774
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047D73ED113;
	Mon,  6 Jul 2026 07:47:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931983E8C44
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:46:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324024; cv=none; b=rD8bcbJFHdD+KJaCl4nWiOGtQuDSS1Hb58OXOI02MMlEcA1MKPnsFMRIv0fxn6X/tqfdTFw5UbUEgcaLTHWgvIQzq4xM7uoM3kwIb9qYtL+740orWHrkBJYDRHJmPa8EVNkiPT2yfH555yZ04jVP3+Y7J4JFVXqtwHgz9/b+m7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324024; c=relaxed/simple;
	bh=jmRLWotoYEhjIX0eg1UI4ndyBKCd3zgokiRBmq8uD1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=td6KG3C6t/fXl4ftCy394Iu201hDRCTqDmAV12+bKdZkhb7zMXc7/N5tOAiAWsDI/8wCcGb3srBFp66UXIxm1FPtI212ueYwyV48GZJGZ2CYfXiOMto4aHyPKp7XTic8DpUvN23KMh5knT5uDtPW6WrogmhIQl7/HBXTy3r5hV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLt4uHFY; arc=none smtp.client-ip=209.85.167.41
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so315013e87.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783324005; x=1783928805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ttbAS/8urIf+XGHC0s8dkc6oboku9enqLpUvWitBlDs=;
        b=tLt4uHFYctHsuyh6ToTy5Zri85Idx4aKWAEGSL5vjtSAEJ/FIO4Vmrnm7Lf6HS39wd
         BYznRTrGC+4AydE9ixKRMIAQk2SRyc7cqt+rscyZAKsqEjrnIgOZF3jW+kZ0Izwszcbg
         b2/a3dLM0op7XHNuY8V8z+glTCs2jhtfJBzR/QcEXjrhvktKOnhQGBUEkPfgRT5U1Fts
         hb7sTzxPFsu5JKAWYC7bN7S2Gl2oPrPk5zGICRbFP5TZDiVEParwGSuPGXg6aEvecitd
         /osDDyGlURTNFOetFlYqx5US5nNuBtbVoWuvlmWA/LRtk43k3tF67WNlNp4qkq/pEEXz
         ipXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324005; x=1783928805;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttbAS/8urIf+XGHC0s8dkc6oboku9enqLpUvWitBlDs=;
        b=imoVdl1vrk6difEWtgcEaRKz15ajQVZ5pIA5VPDsDwVzKMywfJXpN5vxaVmytBVAG4
         H9IevQEq3TDO8yBkeoW1wDPvn/bfU/GoBJ2THOwSJkgbCdyea5mFluLGRTHljZQa8gx0
         WPKc4bUcGE5MhKg/qfOi8LpdmiYjlEu0DwWDj8ea6tup8mk8NvbnWjp/5ZlQNKW0tywX
         v/gMzB4vOhkb5iwsqFgpbPtVseWAqpUtEH6rueIfPQLp3rH7s03+5qREGRbevq/OMXIo
         iKXmHkc2AwTjFEdT1W2b67ubl+EyCpkcEXn90IMah2+kg9wPK1fE3oA/Pwf7IwNTOOG9
         sk2w==
X-Forwarded-Encrypted: i=1; AHgh+RoDItvxN9C5iczOU8AfHuvyH4iu6aCGkw3PNLEO46bOUMJAJKycZ7sNUg8J5crwE2CW5igPKelp14tCiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSWnBfhS/Egu4ezMRRM3HHH4vjXVOQZCCM8TGXOZ9AO6dK6pJd
	fPi49s1wsuRPqpajKr2rv20NmYd3+t82JqRP6L9BaglBjTkX2wKu5SJj5+5cpJCMqF4=
X-Gm-Gg: AfdE7cll95zhKbViflOwLwEcGNcVO6U9KeN8EGamY59V0ZoO4IOhXz3RGAjAlz9AQMv
	KHNdAfdqUvIZmhfa1uRsounPn0NjUXsccQBIN1ewpxxwx/Y/nsy+/kM77Ytn19P6/ugyaiX8wwv
	3sCoMkzRhkOQ6B4OGxXY+VClZL8M3VHKp7FzHRECUn2ZEjk+BX8fGeLxDrMUYuLRP+/muOPGkxv
	pu7J+rLZkcfNJbYuvp9Qy0azEKWwA923AN0scLx1JnqdL+Z7CrJfGpfCYTlrilkgQndEjF2IMcy
	o92n6VgOZnJfyyOhjf+NJYshGA3iQbwZpKrgKF5dk3XQnAfCknN3jnO/T0Z4nEIVZONMW5fq0Ol
	ERBv71QdTWOYfHLQQwKU3cLdsaXRcA3I1Pyjcp3ri1sw2NSeV+M5CA8xZDYmPMJsPCa2IrNGGCU
	Zvq+QYJ86VFuhvEGAhbh5Y0DQSpSClaIS+hL/OC6HnXO0ekp+7DEONnKoOTLD444EEH+YCOgMuq
	B5RvA==
X-Received: by 2002:a05:6512:3d04:b0:5ae:b2df:c11a with SMTP id 2adb3069b0e04-5aed44f625emr1064910e87.0.1783324005196;
        Mon, 06 Jul 2026 00:46:45 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed132f89dsm2588450e87.0.2026.07.06.00.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:46:44 -0700 (PDT)
Message-ID: <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
Date: Mon, 6 Jul 2026 10:46:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66710-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50D4E70DF58

Hi Atanas.

lt me provide a few initial simple review comments.

On 7/6/26 10:11, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Usage examples:
> 
> - Check of related video node: v4l2-ctl --list-devices
>    The expected result:
>     qcom-jpeg-enc (platform:qcom-jpeg-enc):
>          /dev/videoX
> 
> V4L2 Examples:
> 
> v4l2-ctl -d /dev/video14 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
> --stream-mmap --stream-out-mmap
> 
> v4l2-ctl -d /dev/video14 \
> -c compression_quality=100 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
> --stream-mmap --stream-out-mmap \
> --stream-count=100
> 
> v4l2-ctl -d /dev/video14 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
> --stream-mmap --stream-out-mmap \
> --set-ctrl=perf_level_auto=1 \
> --set-ctrl=fps_target=30 \
> --stream-count=100
> 
> v4l2-ctl -d /dev/video14 \
> --set-fmt-video-out=width=8192,height=8192,pixelformat=NM12 \
> --stream-mmap --stream-out-mmap \
> --stream-count=1 \
> --stream-to=8192x8192_NM12.jpg
> 
> v4l2-ctl -d /dev/video14 \
> --set-fmt-video-out=width=8192,height=8192,pixelformat=GREY \
> --stream-mmap --stream-out-mmap \
> --stream-count=1 \
> --stream-to=OUT_8192x8192.jpg
> 
> v4l2-ctl -d /dev/video14 \
> -c compression_quality=100 \
> --set-fmt-video-out=width=1920,height=1088,pixelformat=NM12 \
> --stream-mmap=4 --stream-out-mmap=4 \
> --stream-count=100 \
> --stream-out-pattern=21 \
> --stream-to=OUT_1920x1088_100F.mjpg
> 
> GStreamer examples:
> 
> gst-launch-1.0 videotestsrc \
> is-live=false pattern=ball num-buffers=50 ! \
> video/x-raw,format=NV12,width=1920,height=1080 ! \
> videoscale ! videoconvert ! \
> video/x-raw,format=NV12,width=1920,height=1088 ! \
> v4l2jpegenc ! \
> fakesink sync=false
> 
> gst-launch-1.0 videotestsrc is-live=true pattern=smpte ! \
> video/x-raw,format=NV12,width=1920,height=1088 ! \
> v4l2jpegenc extra-controls="controls,compression_quality=85" ! \
> fpsdisplaysink -v sync=false
> 
> Performance measurements on SM8250
> (NV12, quality=100, GStreamer v4l2jpegenc vs jpegenc):
> 
> +------------+-----------------------------+-------------------+
> | Resolution |    HW v4l2jpegenc (q100)    | SW jpegenc (q100) |
> |            | Execution | avrFPS | maxFPS | Execution |  FPS  |
> +------------+-----------+--------+--------+-----------+-------+
> |   512x512  | 2.2332    | 1139.1 | 1195.4 | 7.1055    | 358.0 |
> |  1280x720  | 1.7300    |  418.5 |  457.2 | 5.0585    | 143.1 |
> | 1024x1024  | 1.6991    |  374.3 |  397.4 | 4.7304    | 134.4 |
> | 1920x1088  | 1.6596    |  192.8 |  193.8 | 3.7913    |  84.4 |
> | 2048x2048  | 1.7277    |   92.0 |   91.6 | 3.6343    |  43.7 |
> | 4096x4096  | 1.5887    |   25.2 |   25.3 | 4.2163    |   9.5 |
> | 8192x8192  | 1.3104    |    7.6 |    8.0 | 2.9987    |   3.3 |
> +------------+-----------+--------+--------+-----------+-------+
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,jpeg-encoder.yaml     |  143 +-
>   drivers/media/platform/qcom/Kconfig           |    1 +
>   drivers/media/platform/qcom/Makefile          |    1 +
>   drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |   37 +
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  314 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  109 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  331 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1625 +++++++++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   15 +
>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   19 +
>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  410 +++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1154 ++++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   23 +
>   include/media/jpeg.h                          |   33 +
>   include/uapi/linux/v4l2-controls.h            |   21 +
>   19 files changed, 4357 insertions(+), 74 deletions(-)
>   create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>   create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> index e4c16388ef07..53e83ebe4699 100644
> --- a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -72,80 +72,75 @@ examples:
>       #include <dt-bindings/interconnect/qcom,sm8250.h>
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
> -    jpeg-encoder@ac53000 {
> -        compatible = "qcom,sm8250-jenc";
> -        reg = <0xac53000 0x1000>;
> -
> -        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> -
> -        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> -                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> -                 <&camcc CAM_CC_CORE_AHB_CLK>,
> -                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> -                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> -                 <&camcc CAM_CC_JPEG_CLK>;
> -        clock-names = "hf_axi",
> -                      "sf_axi",
> -                      "core_ahb",
> -                      "cpas_ahb",
> -                      "cnoc_axi",
> -                      "jpeg";
> -
> -        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> -                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> -                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> -                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> -                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> -                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> -        interconnect-names = "cpu-cfg",
> -                             "hf-mnoc",
> -                             "sf-mnoc";
> -
> -        iommus = <&apps_smmu 0x2040 0x400>;
> -
> -        operating-points-v2 = <&jpeg_opp_table>;
> -
> -        jpeg_opp_table: opp-table {
> -            compatible = "operating-points-v2";
> -
> -            opp-100000000 {
> -                opp-hz = /bits/ 64 <400000000>,
> -                         /bits/ 64 <100000000>;
> -                opp-peak-kBps = <76800 104166 104166>;
> -                opp-avg-kBps = <38400 33569 33569>;
> -                required-opps = <&rpmhpd_opp_min_svs>;
> -            };
> -
> -            opp-200000000 {
> -                opp-hz = /bits/ 64 <400000000>,
> -                         /bits/ 64 <200000000>;
> -                opp-peak-kBps = <76800 208333 208333>;
> -                opp-avg-kBps = <38400 67138 67138>;
> -                required-opps = <&rpmhpd_opp_low_svs>;
> -            };
> -
> -            opp-400000000 {
> -                opp-hz = /bits/ 64 <400000000>,
> -                         /bits/ 64 <400000000>;
> -                opp-peak-kBps = <76800 416666 416666>;
> -                opp-avg-kBps = <38400 134277 134277>;
> -                required-opps = <&rpmhpd_opp_svs>;
> -            };
> -
> -            opp-480000000 {
> -                opp-hz = /bits/ 64 <400000000>,
> -                         /bits/ 64 <480000000>;
> -                opp-peak-kBps = <76800 500000 500000>;
> -                opp-avg-kBps = <38400 161132 161132>;
> -                required-opps = <&rpmhpd_opp_svs_l1>;
> -            };
> -
> -            opp-600000000 {
> -                opp-hz = /bits/ 64 <400000000>,
> -                         /bits/ 64 <600000000>;
> -                opp-peak-kBps = <76800 625000 625000>;
> -                opp-avg-kBps = <38400 201416 201416>;
> -                required-opps = <&rpmhpd_opp_nom>;
> +    soc {

The 'jpeg-encoder' devicetree node is not placed directly under 'soc', which
invalidates this one change in the dt-bindings documentation.

In any case, this change shall be squashed with 3/5, and the doc file should
be named by compatible value, i.e. 'qcom,sm8250-jenc.yaml'.

> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        jpeg-encoder@ac53000 {
> +            compatible = "qcom,sm8250-jenc";
> +            reg = <0 0x0ac53000 0 0x1000>;
> +
> +            interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +            clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_JPEG_CLK>;
> +            clock-names = "hf_axi",
> +                          "sf_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cnoc_axi",
> +                          "jpeg";
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "cpu-cfg",
> +                                 "hf-mnoc",
> +                                 "sf-mnoc";

This is the topic, which may raise a disagreement, but I'll repeat my
position about the need to remove all "CAMSS bus" specific resources from
the device node, they are found and should be allocated on parent's side.

 From what I see it is applicable to all but one clock and all interconnects.

> +
> +            iommus = <&apps_smmu 0x2040 0x400>;
> +
> +            operating-points-v2 = <&jpeg_opp_table>;
> +
> +            jpeg_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-100000000 {
> +                    opp-hz = /bits/ 64 <400000000>,
> +                             /bits/ 64 <100000000>;
> +                    required-opps = <&rpmhpd_opp_min_svs>;
> +                };
> +
> +                opp-200000000 {
> +                    opp-hz = /bits/ 64 <400000000>,
> +                             /bits/ 64 <200000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-400000000 {
> +                    opp-hz = /bits/ 64 <400000000>,
> +                             /bits/ 64 <400000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-480000000 {
> +                    opp-hz = /bits/ 64 <400000000>,
> +                             /bits/ 64 <480000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-600000000 {
> +                    opp-hz = /bits/ 64 <400000000>,
> +                             /bits/ 64 <600000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
>               };
>           };
>       };

<snip>

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
> new file mode 100644
> index 000000000000..f9ab7c86792f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_res.h"
> +
> +#include "qcom_jenc_v420_hw_info.h"
> +
> +const struct qcom_dev_resources qcom_t165_t480_jpeg_drvdata = {
> +	.hw_ops			= &qcom_jpeg_default_ops,
> +	.ref_clk_hz		= 600000000UL,
> +	.ref_throughput_mpps	= 110UL,
> +};
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
> new file mode 100644
> index 000000000000..91c6e789cffa
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_RES_H
> +#define QCOM_JENC_RES_H
> +
> +#include "qcom_jenc_defs.h"
> +
> +struct qcom_dev_resources {
> +	const struct qcom_jpeg_hw_ops	*hw_ops;
> +	unsigned long			ref_clk_hz;
> +	unsigned long			ref_throughput_mpps;
> +};
> +
> +extern const struct qcom_dev_resources qcom_t165_t480_jpeg_drvdata;
> +
> +#endif	/* QCOM_JENC_RES_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> new file mode 100644
> index 000000000000..ebf69128cc2b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> @@ -0,0 +1,410 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_V420_HW_INFO_H
> +#define QCOM_JENC_V420_HW_INFO_H
> +
> +#include "qcom_jenc_defs.h"
> +
> +#define JPEG_V420_HW_VER_STEP_POS 0
> +#define JPEG_V420_HW_VER_STEP_MSK \
> +	(0xffffu << JPEG_V420_HW_VER_STEP_POS)
> +
> +#define JPEG_V420_HW_VER_MINOR_POS 16
> +#define JPEG_V420_HW_VER_MINOR_MSK \
> +	(0x0fffu << JPEG_V420_HW_VER_MINOR_POS)
> +
> +#define JPEG_V420_HW_VER_MAJOR_POS 28
> +#define JPEG_V420_HW_VER_MAJOR_MSK \
> +	(0xfu << JPEG_V420_HW_VER_MAJOR_POS)
> +
> +#define JPEG_V420_HW_CAP_ENCODE_MSK BIT_U32(0)
> +#define JPEG_V420_HW_CAP_DECODE_MSK BIT_U32(1)
> +
> +#define JPEG_V420_HW_CAP_UPSCALE_POS 4
> +#define JPEG_V420_HW_CAP_UPSCALE_MSK \
> +	(0x7u << JPEG_V420_HW_CAP_UPSCALE_POS)
> +
> +#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
> +#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
> +	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
> +
> +#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)
> +#define JPEG_V420_RST_CMD_WE_RESET_MSK			BIT_U32(1)
> +#define JPEG_V420_RST_CMD_ENCODER_RESET_MSK		BIT_U32(4)
> +#define JPEG_V420_RST_CMD_DECODER_RESET_MSK		BIT_U32(5)
> +#define JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT_U32(6)
> +#define JPEG_V420_RST_CMD_SCALE_RESET_MSK		BIT_U32(7)
> +#define JPEG_V420_RST_CMD_REGISTER_RESET_MSK		BIT_U32(13)
> +#define JPEG_V420_RST_CMD_MISR_RESET_MSK		BIT_U32(16)
> +#define JPEG_V420_RST_CMD_CORE_RESET_MSK		BIT_U32(17)
> +#define JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK	BIT_U32(29)
> +#define JPEG_V420_RST_CMD_RESET_BYPASS_MSK		BIT_U32(31)
> +
> +#define JPEG_V420_CORE_CFG_FE_ENABLE_MSK	BIT_U32(0)
> +#define JPEG_V420_CORE_CFG_WE_ENABLE_MSK	BIT_U32(1)
> +#define JPEG_V420_CORE_CFG_ENC_ENABLE_MSK	BIT_U32(4)
> +#define JPEG_V420_CORE_CFG_SCALE_ENABLE_MSK	BIT_U32(7)
> +#define JPEG_V420_CORE_CFG_TESTBUS_ENABLE_MSK	BIT_U32(19)
> +#define JPEG_V420_CORE_CFG_MODE_MSK		BIT_U32(24)
> +#define JPEG_V420_CORE_CFG_CGC_DISABLE_MSK	BIT_U32(31)
> +
> +#define JPEG_V420_CMD_HW_START_MSK		BIT_U32(0)
> +#define JPEG_V420_CMD_HW_STOP_MSK		BIT_U32(1)
> +#define JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT_U32(4)
> +#define JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT_U32(5)
> +#define JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT_U32(6)
> +#define JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT_U32(8)
> +#define JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT_U32(9)
> +#define JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT_U32(10)
> +#define JPEG_V420_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT_U32(11)
> +
> +#define JPEG_V420_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT_U32(0)
> +#define JPEG_V420_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT_U32(2)
> +#define JPEG_V420_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT_U32(4)
> +#define JPEG_V420_CORE_STATE_STATUS_BUS_STATE_MSK	BIT_U32(8)
> +#define JPEG_V420_CORE_STATE_STATUS_CGC_STATE_MSK	BIT_U32(9)
> +
> +#define JPEG_V420_FE_CFG_BYTE_ORDERING_POS 0
> +#define JPEG_V420_FE_CFG_BYTE_ORDERING_MSK \
> +	(0xfu << JPEG_V420_FE_CFG_BYTE_ORDERING_POS)
> +
> +#define JPEG_V420_FE_CFG_BURST_LENGTH_MAX_POS 4
> +#define JPEG_V420_FE_CFG_BURST_LENGTH_MAX_MSK \
> +	(0xfu << JPEG_V420_FE_CFG_BURST_LENGTH_MAX_POS)
> +
> +#define JPEG_V420_FE_CFG_MEMORY_FORMAT_POS 8
> +#define JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK \
> +	(0x3u << JPEG_V420_FE_CFG_MEMORY_FORMAT_POS)
> +
> +#define JPEG_V420_FE_CFG_CBCR_ORDER_MSK		BIT_U32(12)
> +#define JPEG_V420_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT_U32(13)
> +#define JPEG_V420_FE_CFG_PLN0_EN_MSK		BIT_U32(16)
> +#define JPEG_V420_FE_CFG_PLN1_EN_MSK		BIT_U32(17)
> +#define JPEG_V420_FE_CFG_PLN2_EN_MSK		BIT_U32(18)
> +#define JPEG_V420_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT_U32(21)
> +#define JPEG_V420_FE_CFG_MCUS_PER_BLOCK_MSK	BIT_U32(22)
> +#define JPEG_V420_FE_CFG_MAL_BOUNDARY_MSK	BIT_U32(24)
> +#define JPEG_V420_FE_CFG_MAL_EN_MSK		BIT_U32(27)
> +
> +#define JPEG_V420_PLN_RD_OFFS_OFFSET_POS 0
> +#define JPEG_V420_PLN_RD_OFFS_OFFSET_MSK \
> +	(0x1fffffffu << JPEG_V420_PLN_RD_OFFS_OFFSET_POS)
> +
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_POS 0
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK \
> +	(0xffffu << JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_POS)
> +
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
> +	(0xffffu << JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_POS)
> +
> +#define JPEG_V420_PLN_RD_STRIDE_STRIDE_POS 0
> +#define JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK \
> +	(0xffffu << JPEG_V420_PLN_RD_STRIDE_STRIDE_POS)
> +
> +#define JPEG_V420_PLN_RD_HINIT_FRACTIONAL_POS 0
> +#define JPEG_V420_PLN_RD_HINIT_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_PLN_RD_HINIT_FRACTIONAL_POS)
> +
> +#define JPEG_V420_PLN_RD_VINIT_FRACTIONAL_POS 0
> +#define JPEG_V420_PLN_RD_VINIT_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_PLN_RD_VINIT_FRACTIONAL_POS)
> +
> +#define JPEG_V420_WE_CFG_BYTE_ORDERING_POS 0
> +#define JPEG_V420_WE_CFG_BYTE_ORDERING_MSK \
> +	(0xfu << JPEG_V420_WE_CFG_BYTE_ORDERING_POS)
> +
> +#define JPEG_V420_WE_CFG_BURST_LENGTH_MAX_POS 4
> +#define JPEG_V420_WE_CFG_BURST_LENGTH_MAX_MSK \
> +	(0xfu << JPEG_V420_WE_CFG_BURST_LENGTH_MAX_POS)
> +
> +#define JPEG_V420_WE_CFG_MEMORY_FORMAT_POS 8
> +#define JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK \
> +	(0x3u << JPEG_V420_WE_CFG_MEMORY_FORMAT_POS)
> +
> +#define JPEG_V420_WE_CFG_CBCR_ORDER_MSK		BIT_U32(12)
> +#define JPEG_V420_WE_CFG_PLN0_EN_MSK		BIT_U32(16)
> +#define JPEG_V420_WE_CFG_PLN1_EN_MSK		BIT_U32(17)
> +#define JPEG_V420_WE_CFG_PLN2_EN_MSK		BIT_U32(18)
> +#define JPEG_V420_WE_CFG_MAL_BOUNDARY_MSK	BIT_U32(24)
> +#define JPEG_V420_WE_CFG_MAL_EN_MSK		BIT_U32(27)
> +#define JPEG_V420_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT_U32(28)
> +
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_POS 0
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_POS)
> +
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_POS)
> +
> +#define JPEG_V420_PLN_WR_STRIDE_STRIDE_POS 0
> +#define JPEG_V420_PLN_WR_STRIDE_STRIDE_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_STRIDE_STRIDE_POS)
> +
> +#define JPEG_V420_PLN_WR_HINIT_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_HINIT_INTEGER_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_HINIT_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_VINIT_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_VINIT_INTEGER_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_VINIT_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_HSTEP_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_WR_HSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_VSTEP_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_WR_VSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
> +
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
> +
> +#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_POS 0
> +#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK \
> +	(0x7u << JPEG_V420_ENC_CFG_IMAGE_FORMAT_POS)
> +
> +#define JPEG_V420_ENC_CFG_APPLY_EOI_MSK		BIT_U32(7)
> +#define JPEG_V420_ENC_CFG_HUFFMAN_SEL_MSK	BIT_U32(8)
> +#define JPEG_V420_ENC_CFG_FSC_ENABLE_MSK	BIT_U32(11)
> +#define JPEG_V420_ENC_CFG_OUTPUT_DISABLE_MSK	BIT_U32(15)
> +#define JPEG_V420_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT_U32(16)
> +
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
> +	(0x1fffu << JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
> +
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
> +	(0x1fffu << JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
> +
> +#define JPEG_V420_STATUS_OUT_SIZE_BYTES_POS 0
> +#define JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK \
> +	(0x1fffffffu << JPEG_V420_STATUS_OUT_SIZE_BYTES_POS)
> +
> +#define JPEG_V420_SCALE_CFG_HSCALE_ENABLE_MSK		BIT_U32(4)
> +#define JPEG_V420_SCALE_CFG_VSCALE_ENABLE_MSK		BIT_U32(5)
> +#define JPEG_V420_SCALE_CFG_UPSAMPLE_EN_MSK		BIT_U32(6)
> +#define JPEG_V420_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT_U32(7)
> +#define JPEG_V420_SCALE_CFG_HSCALE_ALGO_MSK		BIT_U32(8)
> +#define JPEG_V420_SCALE_CFG_VSCALE_ALGO_MSK		BIT_U32(9)
> +
> +#define JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
> +#define JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
> +	(0x3u << JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
> +
> +#define JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
> +#define JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
> +	(0x3u << JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
> +
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
> +	(0xffu << JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
> +
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
> +	(0xfu << JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
> +
> +#define JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
> +#define JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_POS)
> +
> +#define JPEG_V420_SCALE_PLN_HSTEP_INTEGER_POS 21
> +#define JPEG_V420_SCALE_PLN_HSTEP_INTEGER_MSK \
> +	(0x3fu << JPEG_V420_SCALE_PLN_HSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
> +#define JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_POS)
> +
> +#define JPEG_V420_SCALE_PLN_VSTEP_INTEGER_POS 21
> +#define JPEG_V420_SCALE_PLN_VSTEP_INTEGER_MSK \
> +	(0x3fu << JPEG_V420_SCALE_PLN_VSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_DMI_CFG_MEM_SEL_POS 0
> +#define JPEG_V420_DMI_CFG_MEM_SEL_MSK \
> +	(0x7u << JPEG_V420_DMI_CFG_MEM_SEL_POS)
> +
> +#define JPEG_V420_DMI_CFG_AUTO_INC_EN_MSK	BIT_U32(4)
> +
> +/* DMI_CFG value to select quantization table memory and enable auto-increment */
> +#define JPEG_DMI_ENABLE_UPLOAD			(JPEG_V420_DMI_CFG_AUTO_INC_EN_MSK | 0x1u)
> +
> +#define JPEG_V420_DMI_ADDR_ADDR_POS 0
> +#define JPEG_V420_DMI_ADDR_ADDR_MSK \
> +	(0x3ffu << JPEG_V420_DMI_ADDR_ADDR_POS)
> +
> +#define JPEG_V420_TESTBUS_CFG_BUS_SEL_POS 0
> +#define JPEG_V420_TESTBUS_CFG_BUS_SEL_MSK \
> +	(0x3fu << JPEG_V420_TESTBUS_CFG_BUS_SEL_POS)
> +
> +#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_POS 0
> +#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK \
> +	(0x1fffu << JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_POS)
> +
> +#define JPEG_V420_PLN_RD_HINIT_INT_INTEGER_POS 0
> +#define JPEG_V420_PLN_RD_HINIT_INT_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_RD_HINIT_INT_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_RD_VINIT_INT_INTEGER_POS 0
> +#define JPEG_V420_PLN_RD_VINIT_INT_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_RD_VINIT_INT_INTEGER_POS)
> +
> +#define JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK		BIT_U32(0)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT_U32(4)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT_U32(5)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT_U32(6)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT_U32(7)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT_U32(8)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT_U32(9)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT_U32(10)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT_U32(11)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT_U32(12)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT_U32(13)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT_U32(14)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT_U32(15)
> +#define JPEG_V420_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT_U32(19)
> +#define JPEG_V420_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT_U32(20)
> +#define JPEG_V420_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT_U32(21)
> +#define JPEG_V420_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT_U32(22)
> +#define JPEG_V420_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT_U32(23)
> +#define JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT_U32(24)
> +#define JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT_U32(25)
> +#define JPEG_V420_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT_U32(26)
> +#define JPEG_V420_IRQ_STATUS_STOP_ACK_MSK		BIT_U32(27)
> +#define JPEG_V420_IRQ_STATUS_RESET_ACK_MSK		BIT_U32(28)
> +
> +#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK \
> +	(JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_DONE_MSK \
> +	(JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK \
> +	(JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK \
> +	(JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK \
> +	(JPEG_V420_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_COEFF_ERROR_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_MISSING_RSM_MSK)
> +
> +#define JPEG_V420_IRQ_STATUS_ALL_BITS \
> +	(JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK		| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK		| \
> +	 JPEG_V420_IRQ_STATUS_STOP_ACK_MSK		| \
> +	 JPEG_V420_IRQ_STATUS_RESET_ACK_MSK)
> +
> +/* Register offsets for JPEG v4.2.0 hardware */
> +#define JPEG_V420_REG_HW_VERSION	0x000
> +#define JPEG_V420_REG_HW_CAPABILITY	0x004
> +#define JPEG_V420_REG_RESET_CMD		0x008
> +#define JPEG_V420_REG_CORE_CFG		0x00c
> +#define JPEG_V420_REG_HW_CMD		0x010
> +#define JPEG_V420_REG_ENC_CORE_STATE	0x014
> +#define JPEG_V420_REG_INT_MASK		0x018
> +#define JPEG_V420_REG_INT_CLR		0x01c
> +#define JPEG_V420_REG_INT_STATUS	0x020
> +#define JPEG_V420_REG_FE_CFG		0x024
> +
> +/* FE (fetch engine) plane registers */
> +#define JPEG_V420_REG_FE_PNTR_0		0x038
> +#define JPEG_V420_REG_FE_PNTR_1		0x044
> +#define JPEG_V420_REG_FE_PNTR_2		0x050
> +#define JPEG_V420_REG_FE_OFFS_0		0x03c
> +#define JPEG_V420_REG_FE_OFFS_1		0x048
> +#define JPEG_V420_REG_FE_OFFS_2		0x054
> +#define JPEG_V420_REG_FE_PNTR_CNT	0x05c
> +#define JPEG_V420_REG_FE_BSIZE_0	0x060
> +#define JPEG_V420_REG_FE_BSIZE_1	0x068
> +#define JPEG_V420_REG_FE_BSIZE_2	0x070
> +#define JPEG_V420_REG_FE_STRIDE_0	0x064
> +#define JPEG_V420_REG_FE_STRIDE_1	0x06c
> +#define JPEG_V420_REG_FE_STRIDE_2	0x08c
> +#define JPEG_V420_REG_FE_HINIT_0	0x074
> +#define JPEG_V420_REG_FE_HINIT_1	0x078
> +#define JPEG_V420_REG_FE_HINIT_2	0x07c
> +#define JPEG_V420_REG_FE_VINIT_0	0x080
> +#define JPEG_V420_REG_FE_VINIT_1	0x084
> +#define JPEG_V420_REG_FE_VINIT_2	0x088
> +#define JPEG_V420_REG_FE_VBPAD_CFG	0x2e8
> +
> +/* WE (write engine) plane registers */
> +#define JPEG_V420_REG_WE_CFG		0x0c0
> +#define JPEG_V420_REG_WE_PNTR_CNT	0x0e4
> +#define JPEG_V420_REG_WE_PNTR_0		0x0cc
> +#define JPEG_V420_REG_WE_PNTR_1		0x0d0
> +#define JPEG_V420_REG_WE_PNTR_2		0x0d4
> +#define JPEG_V420_REG_WE_BSIZE_0	0x0e8
> +#define JPEG_V420_REG_WE_BSIZE_1	0x0ec
> +#define JPEG_V420_REG_WE_BSIZE_2	0x0f0
> +#define JPEG_V420_REG_WE_STRIDE_0	0x0f4
> +#define JPEG_V420_REG_WE_STRIDE_1	0x0f8
> +#define JPEG_V420_REG_WE_STRIDE_2	0x0fc
> +#define JPEG_V420_REG_WE_HINIT_0	0x100
> +#define JPEG_V420_REG_WE_HINIT_1	0x104
> +#define JPEG_V420_REG_WE_HINIT_2	0x108
> +#define JPEG_V420_REG_WE_VINIT_0	0x10c
> +#define JPEG_V420_REG_WE_VINIT_1	0x110
> +#define JPEG_V420_REG_WE_VINIT_2	0x114
> +#define JPEG_V420_REG_WE_HSTEP_0	0x118
> +#define JPEG_V420_REG_WE_HSTEP_1	0x11c
> +#define JPEG_V420_REG_WE_HSTEP_2	0x120
> +#define JPEG_V420_REG_WE_VSTEP_0	0x124
> +#define JPEG_V420_REG_WE_VSTEP_1	0x128
> +#define JPEG_V420_REG_WE_VSTEP_2	0x12c
> +#define JPEG_V420_REG_WE_BLOCKS_0	0x130
> +#define JPEG_V420_REG_WE_BLOCKS_1	0x134
> +#define JPEG_V420_REG_WE_BLOCKS_2	0x138
> +
> +/* Encoder registers */
> +#define JPEG_V420_REG_ENC_CFG		0x13c
> +#define JPEG_V420_REG_ENC_IMG_SIZE	0x140
> +#define JPEG_V420_REG_ENC_OUT_SIZE	0x180
> +
> +/* Scaler registers */
> +#define JPEG_V420_REG_SCALE_CFG		0x26c
> +#define JPEG_V420_REG_SCALE_OUT_CFG_0	0x270
> +#define JPEG_V420_REG_SCALE_OUT_CFG_1	0x274
> +#define JPEG_V420_REG_SCALE_OUT_CFG_2	0x278
> +#define JPEG_V420_REG_SCALE_HSTEP_0	0x27c
> +#define JPEG_V420_REG_SCALE_HSTEP_1	0x280
> +#define JPEG_V420_REG_SCALE_HSTEP_2	0x284
> +#define JPEG_V420_REG_SCALE_VSTEP_0	0x28c
> +#define JPEG_V420_REG_SCALE_VSTEP_1	0x290
> +#define JPEG_V420_REG_SCALE_VSTEP_2	0x294
> +
> +/* DMI registers */
> +#define JPEG_V420_REG_DMI_CFG		0x298
> +#define JPEG_V420_REG_DMI_ADDR		0x29c
> +#define JPEG_V420_REG_DMI_DATA		0x2a0
> +
> +#endif /* QCOM_JENC_V420_HW_INFO_H */

qcom_jenc_v420_hw_info.h shall be removed, and its content goes to
qcom_jenc_res.c file, no info is shared from the header, and static
declarations in header files are not favoured.

In general the driver loos good.

-- 
Best wishes,
Vladimir

