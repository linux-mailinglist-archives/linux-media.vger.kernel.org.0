Return-Path: <linux-media+bounces-12543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 937838FB96B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF802845C9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17091494DB;
	Tue,  4 Jun 2024 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="AQ4iGJ2L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C51168D0
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519572; cv=none; b=n5QrzdvrShoSdk2BGMuh8gH4SqlCYNt54744z2JoGEdUBsSEku1TnprA49vqPuMKZmF/StNoR8BDf1RHkD9QoutWuyewjxaCZpw1jNnKa5iIU9KCYLvSZEE3z/YhrP6qsKSeFLp6BXTzVKZNXuxZcHfbNassXR5fKU/2tEmy51U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519572; c=relaxed/simple;
	bh=sjUrVCVewPMi+6WKVBqLanHI9W98UentqJuOeu/CQAc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RLTCQAwn3dbVp/GpgEYtAjxCfzy06uQZIai5ArH9CzmvP18ztnpewNbIk/AweXp5eRpa37WTGRqXK16PjwuqpSz9fC7H6RuF5XgSsMVG0BjSxKGJ2LRaebDeIFG9IvslgU9UDa2IDqnrzN1mDQxpPBl9fmDb7jd4z6c6GyCOxwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=AQ4iGJ2L; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35dc9cef36dso4893784f8f.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519566; x=1718124366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iad7um1wy2LV2KGVzAikoqQybVQFvP+KXglo1zrKD3o=;
        b=AQ4iGJ2L20JyXOscur1EewIw3HeVfXe2GLJK7v/AejPkvTVbnyts6mNU/z11IU1vWA
         lj0ZCDNPRQ7UJHDexO6x3CL9zBIaoNxbqmKpBmFbLVO+3X6/77mMp65SCZeI2HpEPAH3
         ZL8pfPj2tgSckkkCGCEBJlU3yNH4IWTWCS6bP9w/OgnrUYpzS996CWk7zoR2vv0kF8Mn
         xaVQRAgxb/bTXW9TpE0F3BXc59i1Xu4ToPeQYgOR0aFizmPL7nY3yoA/EInI3VzqRT0P
         baPEYOEl8UWNtS+rauxTldH0IamdwTsLXT00KyM9ff7dqjX68CV5IBoWhyz9ZaCEOqz6
         xJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519566; x=1718124366;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iad7um1wy2LV2KGVzAikoqQybVQFvP+KXglo1zrKD3o=;
        b=LxAca/ltNQtoxl/datfm4FT+2SlQuNMj2nTmGWn17Wgu63LqaHRDx+IetmQHJmSZyo
         KlXin+Hn4RUHx1Me3XUteYct6LOGScefYyaXAfdoSFD0+2Zo+SWXUVY2pG0kd8y/JdrQ
         J/RG249aTaKMg2MsYr29nOL4LKTN1AA5Pm1N2nA2r18iDXkF0hEqdSC3rwS8n03XsXIv
         bRU1gZ2cmPgOKzgDiPzPM7fof2MAI34Eigwpt/s4Lxoq78y5Rd+Io14qoXB5AqmFp+HZ
         1irML1zS0paegZrcsNOU+m+6gEL/izfAEPf9hAu1eAh5c1XIMag6j483HNZrnoLUaDz8
         ETHg==
X-Forwarded-Encrypted: i=1; AJvYcCXKS9IQ9HjypJX9NjGS/NU3SDPjMHcFDFoAk5lNFMD7/vIgUsos+9owejH+a5VlX/bT7myweQjbJxxdwAwiqPDncvlY2lVeW6PeV84=
X-Gm-Message-State: AOJu0YzmHrzGs0eNOWN5RdLHqPSYvaPQGuIJzQIGFf3iEhO9DSSZOVyM
	LBoPHwCesRMPASZfstDXHGZeFqz6skI1r00WMjVOg7/8hMi8N68fnPg6pyjudk4=
X-Google-Smtp-Source: AGHT+IGwA4HOL7uVlsvp1kjCWTb91JKo/1LeORoddbW/2pJ14HHZ+nf7vr5NAI3DrM03hiKmtjCCKw==
X-Received: by 2002:a05:6000:1754:b0:357:7070:4fa with SMTP id ffacd0b85a97d-35e0f25c388mr7906943f8f.13.1717519566298;
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Message-ID: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Date: Tue, 4 Jun 2024 18:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Changes in v5
- Collect latest Acks (from Vikash)
- Resend to Mauro

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

