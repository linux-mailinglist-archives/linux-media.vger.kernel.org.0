Return-Path: <linux-media+bounces-5502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459385BF08
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 15:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77FA51C23213
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A55D7318E;
	Tue, 20 Feb 2024 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="o4C03gON"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7E6F06D
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708440328; cv=none; b=JvnUP0bLmCjuf/P0e/MzCijz2+z12OV/GHxJdB50hEEENkjnNoNcHjbwequGwEnV44miYPwqUQWzM8G0EgL90ggMye29hPC6AbEg+sDANPHU1dOhFOKOejLplMoTeKlZKxujfLiFFc7wQ4HIdbNRHwA1B3yctSgKFKXgetEWa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708440328; c=relaxed/simple;
	bh=A63ilqUJMtWkVrkY3kMcW2Zj7+eMUqb5kFpoSNXVvMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+ddF46W/ZKomxEmoC1JOQZhszEsv/I8CgVNN8CYctnOSXXqWoHuRYB7qdX6Rd+6qrPV3L11J7EY2SDlWAXHTkzY/NZ+H4nKZHLxN16Z64G0lnRicnsMTryemxSjcK6SLs7DMAOpkIqX55WVygCb95Ep1UPz1xT1qy8SI1CtLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=o4C03gON; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4125e435b38so26239555e9.0
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708440324; x=1709045124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUXcnT00673NcGdHtou2jJv3e4wQxRzutyRaaRsM2Rg=;
        b=o4C03gONJbuzCMNowamR8ScA/T2wPnQHSeR+ikrnhmy0+pY6W2OJl659R+yAmk/owq
         vKuce773V8h4pg0q7EiOIiKW0dvtkIJz9ApDA1eXyavRjOGerZmo5C1YqYIw1Un134R/
         8Jb35JzB8ZKvhqpUDuz99+azb2NXzOOtBSmziY47tP11vlWbQaAU3PAmQvPQpeeNg1/u
         3S6NyKl7Jeowvfxb0UYTDtd6RizHT/WCJYo+r/GDTU1RxfAecHHHaVxm1JFCVEqoPyYc
         GJzeJUKcz4F0N1ZvfsWnxDL7LSpH4ncmETAeueLo616Ya9fOQemAWaCZCmoUAJrvNRGS
         qvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708440324; x=1709045124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NUXcnT00673NcGdHtou2jJv3e4wQxRzutyRaaRsM2Rg=;
        b=ma2VMaIa0B40ehCjCx/Sy540rOIDJdnEYktut/sth2Au6ajrtVFbz7+2KpjUaBdXAL
         PwYNVnQRB/rZO5eUmnVKGQJWPe6PG9P9wsMCggXR6u3UfMDX2xNv142GdrJ8uZx6JVM2
         P55RoLqqE1JUe4p6XeCFT3VYVVWEhj1VGR18wGMANJXBQPgWdO7PZshlJmxVHT0eOrDB
         Fbpq1vT8ZcRUDB695xUjdf/JdHAU+oc6HdXDNGMQoa3EEteO3sZxbxhuJCGgmJU4Zccz
         gnplTkjuayDLn/it5PzQMlZD4Nr49vJpKkmDgrf8ue4epx1KEP8U27JPiS31jVyXS2+J
         Hv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRKueELB3bNszUEeGm8Yt0GNxV7igsDvGCp4rYJBF593foOtcIUThsTZqynKUZojtKA4D9cMgipj4NLIVhpKz50Pyigq1twTtuYGc=
X-Gm-Message-State: AOJu0YxsdXHL93wN0mFCJlRnhxzrJRSeRoPN9brclDIZLrT/TxafzR5D
	rjlVUhMe5ssUwsjpyKwqzNcGxsd7QLqrOZuO2RBI5YrrdJcB7qoYhCG/Br7/CeQ=
X-Google-Smtp-Source: AGHT+IHo6SnecQrz2iYJgIxfZnnvcjFOdJtQ98Rc5/M5iDKmtEgPHjn7WaSRQnmKLNnKS94kJkr8ng==
X-Received: by 2002:a05:6000:1f89:b0:33d:4bc3:e786 with SMTP id bw9-20020a0560001f8900b0033d4bc3e786mr5610884wrb.23.1708440323936;
        Tue, 20 Feb 2024 06:45:23 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0033d07edbaa6sm13770908wrs.110.2024.02.20.06.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 06:45:23 -0800 (PST)
Message-ID: <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
Date: Tue, 20 Feb 2024 15:45:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
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
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 14:53, Vikash Garodia wrote:

> On 2/20/2024 6:57 PM, Krzysztof Kozlowski wrote:
>
>> On 20/02/2024 13:34, Marc Gonzalez wrote:
>>
>>> Here's the proposal for v2:
>>>
>>> qcom,venus-broken-low-power-mode
>>>
>>> Description:
>>> This property is defined for devices where playback does not work
>>> when the video decoder is in low power mode.
>>
>> Would be nice to know what's broken but if that's tricky to get, then
>> sounds fine.
> 
> msm8998 supports configuring the VCodec (venus core0) GDSC in HW power control
> mode. Could you please check and confirm if the driver is configuring only the
> VCodec GDSC and not the venus GDSC. Look for the attribute
> "qcom,support-hw-trigger" in vendor dt file.

[ Vendor DTS for easy reference: ]
[ https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998.dtsi ]

In the queue, we have a patch enabling the Venus Decoder (VDEC) in mainline.
(It is using the previously proposed "qcom,no-low-power" mechanism, but that
might not be necessary, if I understand correctly?)


diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2793cc22d381a..5084191be1446 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
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
+			qcom,no-low-power; /*** WORK AROUND LOW-POWER ISSUE ***/
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
index a712dd4f02a5b..ad1705e510312 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
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
+static const struct reg_val msm8998_reg_preset[] = {
+    { 0x80124, 0x00000003 },
+    { 0x80550, 0x01111111 },
+    { 0x80560, 0x01111111 },
+    { 0x80568, 0x01111111 },
+    { 0x80570, 0x01111111 },
+    { 0x80580, 0x01111111 },
+    { 0xe2010, 0x00000000 },
+};
+
+static const struct venus_resources msm8998_res = {
+	.freq_tbl = msm8998_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
+	.reg_tbl = msm8998_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
+	.clks = {"core", "iface", "bus", "mbus"},
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
@@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },



@Vikash, are you saying that perhaps the DTS for video-codec@cc00000
needs to be written slightly differently?

Regards


