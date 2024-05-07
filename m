Return-Path: <linux-media+bounces-10971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2ED8BDE40
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 11:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F0F1F22E7A
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 09:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E0014E2FF;
	Tue,  7 May 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bdVa1d5o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8814E2E4
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074286; cv=none; b=U8zw2JyBURZHiu4jJUUQVh5/r++YVNTzC78+x6nTlw47a3OABMROp4Nm3XqlRkprd7ySBqtFtCR+75fqR+lP7XeL46DjiWcVhEgHp9UdtptlbcaezOL8DjRaR4fnEnHzQXIb8NFlvt+5vIfUb5iciD4GWXnba7HQ+aSMHcFsQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074286; c=relaxed/simple;
	bh=YXYTyieouPykDC310n7wSLN/QxsjHcOzMjfiWLiRj30=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=eqMA88zgER6T85yngOLrqYLrCNLs4MWJeNhwZWg5F1HGYM/P6TbNmgLSFwIrv0fcdzknLdp84PCIu2XJMCsbXbSnCAG5C61T4QZwQ0S06dbgznj8hcMf+mRvAFiz3yomhqJEEF+zoXzUMedaLjMiTdiSQdqAO9cMnSlUs7EqvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=bdVa1d5o; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41a72f3a20dso20262755e9.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 02:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715074278; x=1715679078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaiAi8gH4m4suHq6HQ5tlie7l56Jp0CtmxT54GAdTmE=;
        b=bdVa1d5oXOnykYEIiO0g7BkByoW1nSIrfLemM4sogddZHDVoP1Vapt3YU9cr/kugKq
         q2j1U01pGGP1LPYMHWf29LHMO6wbNai7NwDIUsBqIUWoQN8TJw/8yalmq4XjcyR109GY
         i50Has4DLt/06x0C32FCO/eIwHlMMBKOjny8cmKdw6vwbjyCl7b2/U+qIt2egdq9rcM7
         7K6O51aEX5YVIwmSYX80acGBMcgPxAesBVUAhmmVQfeaA2wV/jPVD7DsRd090woQ+loT
         rlmMhGuuPn+BwmbQrmx2ioS4Mh+bQtqxdifK6TLa25trTbT/bwlVO9k6CWYgTZwLPFpu
         Jh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715074278; x=1715679078;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QaiAi8gH4m4suHq6HQ5tlie7l56Jp0CtmxT54GAdTmE=;
        b=bHdj7VCiIOdSSnXt5VvF0/ku0jiY0Xg4T6670BFHPdDO3vYp1dIbJnbkKSkhMBlD+7
         4jEkuLU/rNMx6P/mR39jbTo4vqO/pKmx1GeN689RJUTLoETSo+H08np3WVwfQTYrY+k4
         bNh4RMv8WbSyM2aWggIDbKF6C3TjnTcD9PpfJS7vFxFSrhh5vCyuesTAmpuDXsprByXO
         /uKM3LcIjwQ+wlmO2u7gm8Sx3HCI0yyfQtTEqBF5Nk1/wOgfFTJzh0wB9+UDWwFXvfEs
         6PYAFILURyq0gIdXnboL/85yU2pDzZTdps4+zp5zFovnz1Vtl2k+C9PkIJHmfoo9x5Md
         Mn9w==
X-Forwarded-Encrypted: i=1; AJvYcCWjHq200LBWAFNq7mpLo2T8bNwzKUEfwf02muTrph68L/X10DqeOPXtxfztT+vv8p7g8IMX7sQjt9gvuRsBAsN+t+qkz1vZeqNx938=
X-Gm-Message-State: AOJu0Yxia+A2usySNmG+s8cFRm4nIA5ZaknHhcnL2nGGmdG9Oa6Yn3So
	e9nKc/2/1hZxxi+tANpK0knUaNCYPQh+6W7v4w21cYm1mrJqkUvRJ5Gq/K17G6I=
X-Google-Smtp-Source: AGHT+IFAdPPMyv36/6qTKc/1XBBR2RC/Y0bPwgCWlT1GlZKyMZ5AnsaSV8aN9REglgS5HWDQDusS1w==
X-Received: by 2002:a5d:670a:0:b0:34d:990a:e4cb with SMTP id o10-20020a5d670a000000b0034d990ae4cbmr7359729wru.36.1715074278069;
        Tue, 07 May 2024 02:31:18 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id f3-20020adfb603000000b0034dced2c5bdsm12517710wre.80.2024.05.07.02.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 02:31:17 -0700 (PDT)
Message-ID: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Date: Tue, 7 May 2024 11:27:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v4 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Changes in v4
- In patch 3, drop URLs in comments, keep one for reference in commit message

Marc Gonzalez (1):
  dt-bindings: media: add qcom,msm8998-venus

Pierre-Hugues Husson (2):
  arm64: dts: qcom: msm8998: add venus node
  media: venus: add msm8998 support

 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

-- 
2.34.1

