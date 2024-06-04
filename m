Return-Path: <linux-media+bounces-12544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E868FB97B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD11B2AC46
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C712149C4B;
	Tue,  4 Jun 2024 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="DQEezx71"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3D1487D4
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519572; cv=none; b=N568Tpu5fLKIG7d7bD0ngzLWCfH/Wj04oJl5HAxhK5nEhY3M/M/o7kBax4o0pBmr8GSRSrmvMDrPgTMy+zZcoSjxM/MAH/njir/DyQ1q6bvRWZwICRA2Oi/nqsEF7odyKIf8ssubm/DUTNJcsQdjARi5R/5zFkSeQl3oRiqlHrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519572; c=relaxed/simple;
	bh=qZsLucO4wltDzOvpnEVOiiPXz0qeTCCoPH/9/Nt9vP8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YsCSUee5I3wdH+A0Z05YC/4Trye/GaaTr1S7/b13zG/iXNDnkJuqJmsdNDsjllrLjJnh0BMMCpvDgkl8ytc+T+nUw1gFQ0JGUBRvjTe1K27GSixjvzh+d0PcMUoP7UNrxP1h2ta9sfy/bKSZ8oLkUSxnxi9KKZN0SbwT0PgNVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=DQEezx71; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so1184044f8f.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519568; x=1718124368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4aOTDhd6SYPECUR44Sp9t/2nUToF1TX06udRYmdYOk=;
        b=DQEezx71fjuPAjLBupTmCaVLPNZts3iGCwAsFuOZfpkD/Mc/XGWwvDPrqO+unZcAMd
         xqPQZdE/8G55g3NraeEsfX0t9g4u1mjc4pnudpV+EWHaMIAmSbzvvwXN0dIaMw0vjXaf
         ovr/svLSorZv7dID5O+EF3foEh7cRFYSAjWtFq0Yv0ZqwDxCDmXoYugZrll/wozarXO7
         0KdyZ33Moo92gtzwWp6U4FT8q2Gj4yKmy5dIKjaqvyE+CQLoxNesC1yWR97q2ww+4r2b
         kE3yPC0hnMvjBcmubRdPjGR52Dc8XsJRAVgYbTAEEkPop/mT/tJqW91xPB0PrKKwK8q2
         4lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519568; x=1718124368;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4aOTDhd6SYPECUR44Sp9t/2nUToF1TX06udRYmdYOk=;
        b=BD734chN4wYR8Ftbm9T2XTA00icZGM3kGnSKylTQDCyWFBQoTbEONMK+uAA8/udPyr
         e7oVegVje9o3cRvBgvFFlJzd1xnD5K2URpfzKUSN65HCxqrtxHiJGUmljj7IpxcaKAWP
         qAPaEaYdMi6Yy26+ChBEOVXnF9AMDd4mP5TwHESnfBmVWgkezTqIYXm1+qE8pqP+61lV
         1N/cf0cKmO9eh72Yuzbk+s7HrDqKKxh43dWzuVsmbGdaAtaTB3LvMbIJfuKolMxqH7/q
         I+LIZ38E/TpxXksQOUqEi8jDh4t4yppEcaJEfxO4L6zrWpwwbaXkgyguunITq+0d5Eo7
         k2JA==
X-Forwarded-Encrypted: i=1; AJvYcCVx7fwgy78H0gJE1/YRbmCV2E5mIgYEB1O0H9G8p3zX8J1/IlgCQLkx+lKLlhBmK+sm5LmU5BJiZTqUowvMQWIzMs/urC78sztfWzg=
X-Gm-Message-State: AOJu0YwoUirwsjlRLm1KcXhl2As2rYof9Zi7SQ3N5XXQk3sgrJqNXkk9
	0K69geagot7uAycgO8F5uyUml5nt2FI1RhqpL7SpwG7KMc2+YVPbt74esMSS6zg=
X-Google-Smtp-Source: AGHT+IHfGuqUXGBWWo8WiHE0hJOslHvsN+h+FU1a0TC4FSJOpeGMJjMByciPhc79OYAM01Hk52ip1w==
X-Received: by 2002:adf:f58e:0:b0:35b:5a14:984a with SMTP id ffacd0b85a97d-35e0f30c7d4mr9621006f8f.56.1717519567901;
        Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
Message-ID: <6d86a6a3-4d99-4fda-9a38-7688587237e6@freebox.fr>
Date: Tue, 4 Jun 2024 18:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/3] arm64: dts: qcom: msm8998: add venus node
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Now that the venus clocks are fixed, we can add the DT node.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 6e286f91241be..f65a76da61ea8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3145,6 +3145,54 @@ hdmi_phy: hdmi-phy@c9a0600 {
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
-- 
2.34.1


