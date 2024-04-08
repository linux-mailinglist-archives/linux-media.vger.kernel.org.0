Return-Path: <linux-media+bounces-8857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C789C886
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 17:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39E6B282F8D
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 15:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAEE1411EA;
	Mon,  8 Apr 2024 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="QDti/lbw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E013E8A5
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 15:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590775; cv=none; b=Js6MMKeuw6gb0AV8hxpzHB4boUrTzYtrwJc0e3CaaOXixY/m162UlrEyl3hylfqKAcu0pfhiBmoyMeswr3wVdVCoZezX8ZStGz/WGd0+OJEmWFDDECwQ9ESOoY2MWLDHsza9n8UxYvLnMssG9+NPdQcT7f40zpNaho7zevXOSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590775; c=relaxed/simple;
	bh=0Ed8/KW0SAdZLokHwWwQHiGFN5/pTaCc0CVIQeL4gak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw+aEPmYqjTu5y3hilhhcmY6pEoNBfFsZwX+EaBpLcGOYFULFyOwV+Y9drODRk+lNeT9Rz/2GSfeW3k3vYbeFSmO/f+vMJDetBObkpVf1Z0U1ik4QpFtmzaIIQI6J9klAVGHhh8NLU51H80Sr1DaUOH8lKhcK+Oo973pfi3AQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=QDti/lbw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41639ec6fa4so14830125e9.3
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712590769; x=1713195569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEmMjjUUrVN5205BkJ//gZ0F1k2hKS9l/jxRWb6Xdew=;
        b=QDti/lbwgQBpTYkx+MTdcwSKVa+7TzibYmKvwSfiQ6PlZqO5LBqrY2mFhn92cudD2e
         N5mK8TafLdeXolPZ45FvJYS60T93ldGUTr8fyb0Z1+XqmPo+4M0z9zSzmD6c9Pthalf8
         CqKoOzix4KGAgOPmQ+nUZz4so3bzdhA5d2ze54KVacilTt/d0KMOxe4ck6J0VZwJUUoP
         3gjLgt5Cd+Z4J0I0h1demnoO9c6J2C3inb3UDiBLZQcteIYxLIgY7BEnhOh50Se/cJ2U
         rcCna5OZN/ic6sSKeBDBmC5iARlcAobVtZtOQ+EZlcF0WtkWTGKXLoa6F6njcAsaP03B
         wWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590769; x=1713195569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEmMjjUUrVN5205BkJ//gZ0F1k2hKS9l/jxRWb6Xdew=;
        b=dieM6ZoY7BRAGFOAoULdgjpjjCkdbtGaR8lWLPBBvJyfIweuQxb1dCdS2ZsPOEhtpI
         0QybZdcvzfmvbyy3v8/xrbfbeZxVk5s5vOx8OtVT1ov9fsBJZmQ/Ge7uuGukEe3i7gG7
         V/WWbw/IwfOAL0q72jY4H3mYa91igrUH8096x1E9RK241IR3zyWPNy/+xWs5advEAcyo
         mEuqJZ0398YcO3yf3TrUzxqH3VKDrFAixsfjCrifCwRwgzE0N18fCR+4JgBkBEidjpbX
         UBoL8sgrChlOmyazijY9XRMuQFAcotPV8dZgFmRM/Wdi+TELm0SileRMqMZdLQRAgm+3
         eUuw==
X-Gm-Message-State: AOJu0YxmcJUM+J3TCGIG0QAUm+yZVvGBVLESMWRyM2s4n/Hk8MAJPKwG
	S4becn4f5xQdxIysmUm7Y1J6/4pXqXTqHiTzQoD+AN7b7F3KZZkzHLQEp8yQ4EA=
X-Google-Smtp-Source: AGHT+IFeSbIjV9dExJAMFeMXzE6bBWlMEeZVolUylUYtV/UsVBf/yoc8jw3+WYD5jlnSVQxRu7vdPQ==
X-Received: by 2002:a05:600c:1f16:b0:416:539c:ace with SMTP id bd22-20020a05600c1f1600b00416539c0acemr4061472wmb.37.1712590769446;
        Mon, 08 Apr 2024 08:39:29 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b0041552dbc539sm13832305wmg.11.2024.04.08.08.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:39:29 -0700 (PDT)
Message-ID: <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
Date: Mon, 8 Apr 2024 17:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Marijn Suijten <marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/02/2024 16:32, Vikash Garodia wrote:

> Not completely sure on these configurations, but certainly both the
> video_subcore0_gdsc and video_subcore1_gdsc should be configured in hardware
> control mode in the gdsc configuration.

Hello,

Still trying to land support for venus decoder on msm8998 in mainline.

This is the patch I have at the moment:

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 4dfe2d09ac285..67b8374ddf02f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3010,6 +3010,55 @@ mdss_dsi1_phy: phy@c996400 {
 			};
 		};
 
+		venus: video-codec@cc00000 {
+			compatible = "qcom,msm8998-venus";
+			reg = <0x0cc00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VIDEO_TOP_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&mmss_smmu 0x400>,
+				 <&mmss_smmu 0x401>,
+				 <&mmss_smmu 0x40a>,
+				 <&mmss_smmu 0x407>,
+				 <&mmss_smmu 0x40e>,
+				 <&mmss_smmu 0x40f>,
+				 <&mmss_smmu 0x408>,
+				 <&mmss_smmu 0x409>,
+				 <&mmss_smmu 0x40b>,
+				 <&mmss_smmu 0x40c>,
+				 <&mmss_smmu 0x40d>,
+				 <&mmss_smmu 0x410>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x421>,
+				 <&mmss_smmu 0x428>,
+				 <&mmss_smmu 0x429>,
+				 <&mmss_smmu 0x42b>,
+				 <&mmss_smmu 0x42c>,
+				 <&mmss_smmu 0x42d>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x431>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
+			};
+		};
+
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..42e0c580e093d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 520000000 },	/* 4k UHD @ 30 */
+	{  489600, 346666667 },	/* 1080p @ 60 */
+	{  244800, 150000000 },	/* 1080p @ 30 */
+	{  108000,  75000000 },	/* 720p @ 30 */
+};
+
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
+ */
+static const struct reg_val msm8998_reg_preset[] = {
+	{ 0x80124, 0x00000003 },
+	{ 0x80550, 0x01111111 },
+	{ 0x80560, 0x01111111 },
+	{ 0x80568, 0x01111111 },
+	{ 0x80570, 0x01111111 },
+	{ 0x80580, 0x01111111 },
+	{ 0x80588, 0x01111111 },
+	{ 0xe2010, 0x00000000 },
+};
+
+static const struct venus_resources msm8998_res = {
+	.freq_tbl = msm8998_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
+	.reg_tbl = msm8998_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
+	.clks = { "core", "iface", "bus", "mbus" },
+	.clks_num = 4,
+	.vcodec0_clks = { "core" },
+	.vcodec1_clks = { "core" },
+	.vcodec_clks_num = 1,
+	.max_load = 2563200,
+	.hfi_version = HFI_VERSION_3XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-4.4/venus.mbn",
+};
+
 static const struct freq_tbl sdm660_freq_table[] = {
 	{ 979200, 518400000 },
 	{ 489600, 441600000 },
@@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b91..abdc578ce988e 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -945,6 +945,7 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
 			dev_warn(dev, "setting idle response ON failed (%d)\n", ret);
 	}
 
+	venus_fw_low_power_mode = false;
 	ret = venus_sys_set_power_control(hdev, venus_fw_low_power_mode);
 	if (ret)
 		dev_warn(dev, "setting hw power collapse ON failed (%d)\n",



With the quick and dirty hack in hfi_venus.c
I am able to correctly decode using venus with:

# mpv --hwdec=v4l2m2m-copy --vo=tct --quiet demo-480.webm
 (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
 (+) Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl



Without the hack, HW decoding fails (and falls back to SW decode)

# cd /home && mpv --hwdec=v4l2m2m-copy --vo=tct --quiet demo-480.webm
 (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
 (+) Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
[ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
[ffmpeg/video] vp9_v4l2m2m: can't configure decoder
Could not open codec.


Not sure where to go from here.
Vikash, do you have any guidance?
(I think you were not a fan of the DT-based work-around?)


Regards


