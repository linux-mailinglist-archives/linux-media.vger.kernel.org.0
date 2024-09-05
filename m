Return-Path: <linux-media+bounces-17700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE696DFFE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 18:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24C11F25C53
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 16:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471581A0714;
	Thu,  5 Sep 2024 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v66CVDSc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2CE1A0711
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554513; cv=none; b=syHzFisfoWJVgXTmvTr/BYeNsoyvpHlTfZkwM/9hDt3VcPEQISLTdPLywQ2qHOCAFTgmZmQKwNFXbmX0gsgdXgpzOY6mICbYH/VVUm8eba40k05rJALpMPFndXBTWhogt7CM0ocyEUHoWy1DuGiTZv2LinQaRYwTYOKnDCc3ovo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554513; c=relaxed/simple;
	bh=/n2w4WfL481QLP9giCdHjxL5pDOEV0EvTX+d0FaTApM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCBKkm/jtbq7hA3T4ecEoUBVEqn4hWbE/7NO09Cw4Ln8Da1d99YTh5m/Uuh/nu/KJvhs/ZFiB2BDN4yL/QlDv//WyB0ZhbgL3OSkfclUVFtjUlAQj2tBimLUmAGa6r0qrCwZ0X7AZie1agm1cozhsbFGxndB5EAr5uLiG+slOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v66CVDSc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-536536f6f8fso134893e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554510; x=1726159310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BITLSnNFqj9HqDQ/WsGrEC15ZzumQC3SBEJxW0vGrE4=;
        b=v66CVDScBxwcPFPnpPYwBbnLkdSJexjFPQG9GDXYCQFllRuNse/dhj6Uu9EqrYwo/v
         jYYSd9vBbL2ZTmaPhiFfjfxCWtk4j7ynb5SzRf1LQ4MsCy3zStWj3nzw7tF5skgcIN0Z
         ciQ2GqnyjIwwwocOTzZD9KSnO396ywb4NrEg3trygQvtDPHI/b8o4ChVBhxwXNeWbqE3
         IuXOt6MYZ/HPLqjV4UO7gyLSHQYhlHBe4QX9Et2JoWqg7PltK1DB3CA9wnSfeFiS0IA8
         6gOv/CeiR7WTRocgzB9O6nDWFRA3+8CE9jAaq0GZn3ys67Q6sMqMSKgsK+1VBd0AdOsz
         qecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554510; x=1726159310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BITLSnNFqj9HqDQ/WsGrEC15ZzumQC3SBEJxW0vGrE4=;
        b=er3Gcl4Hb8yzqP8+VjHtnc5VDj/S0nPQzO7tO+MJhJU9+bc0Y5E1d4rsnfaU9pJz4S
         VmtirSaSD8w2tdRsGJbueHcAe/T2q0cKKXfqsX+6rtcOfAAokqmYnKgs1m+2080m0TuS
         GcOETiQVkjPiqVSwyBU4jh8dH0gbZ/pRHrj89HhLDpGpSR2dD9h6JCYRDUmb9mN/k0CW
         U8qH25Vo6t1yHSYR8qP6Mc8VRbpYNRmvCTo519+m56a8yRkIn+WdE4JB+BuyrIppX/AG
         GLMePaB2tN+Pv5wT5B6LaYNGAonSMIECa5duLPd29xLEMe8TzQYxaHmRNu/Ii0opU9MV
         dRfw==
X-Forwarded-Encrypted: i=1; AJvYcCVajCAPcbD54tldw6RlOaB1QTp2PCAE7Tbq0hrCXoWkyh5UZpk9PtZMaY8IcfiViNnGVMEzBwbcdPAILA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGiEo/TspR75djziSAsFb+rKHqfkbssk+x5Fpu+m0GFvA8xRqO
	h8Z4K2lAQTDMyRtzoCQ9a8NbDobtEbe0TpuD5oa3AI/JEwHLVFql5lpiFSZhtiE=
X-Google-Smtp-Source: AGHT+IGWnGd0ssQFsIazN5TgFDkZGAmMFBgFDUI4pgKFBQoxwjNTwsPg/Vk9lHpOKiKJw42pMqaNKQ==
X-Received: by 2002:a05:6512:1390:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-53546b89e5cmr7114061e87.7.1725554509816;
        Thu, 05 Sep 2024 09:41:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] media: dt-bindings: media: camss: Fix interrupt types
Date: Thu,  5 Sep 2024 19:41:36 +0300
Message-ID: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that on a few Qualcomm platforms types of interrupts
do not match both downstream code and a type requested by the CAMSS driver.

The mismatched interrupt type between firmware and the correspondent
CAMSS driver leads to known problems, which were discussed previously:

  https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/

Here the situation is right the same, namely a repeated bind of camss
device is not possible due to a wrongly specified interrupt type, and
it may lead to an issue in runtime manifested like this:

  irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!

Vladimir Zapolskiy (6):
  media: dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
  media: dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
  media: dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
  arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
  arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
  arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++-----
 .../bindings/media/qcom,sm8250-camss.yaml     | 28 ++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 40 +++++++++----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 20 +++++-----
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 28 ++++++-------
 6 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.45.2


