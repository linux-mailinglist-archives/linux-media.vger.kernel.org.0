Return-Path: <linux-media+bounces-10467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15108B7BBD
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 17:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2DC287ED4
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 15:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BEC173344;
	Tue, 30 Apr 2024 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="gR5rHT60"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D5F143744
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491317; cv=none; b=OCu2B6DVwkJl9spHb/mmWA/sZWeJM0pMOQJFuB+nYNJmG8H4ZKRPpdMY+y4CSlBZYyp2k1zsVbq2DXl4GLoO7Epqnjbyjx5jKin6cqRX/S20N8W0j1WgVQIz6nlJ4/NpriuB5TpwbWlwZ/iygO/520MVHi4+fQhqGrKQnQS8pGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491317; c=relaxed/simple;
	bh=cnERhQN+psqBArfbsUuDM43qjdDKzTKRv36HTHjehz0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=AwxxKqBa3VZEAfQTaKkvtEYfAEs192h956ZLg6pSQIe6sJtMClEtGvbmzBarfNyQR2+kELgAkZZBuXuiCqvqNr90fuS6TsJiAQlJlj0//S37MbgNls33AQvhu4vQP3QPlEq2JZJqsn5tn3mv06OYLhVYq5tmnDgETC4vOZo3XI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=gR5rHT60; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2dd6c160eaaso71394561fa.1
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714491313; x=1715096113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c9rH3JeyvGKQdDSVVVx0PhRv40r9PE97KLjHmXfjCg=;
        b=gR5rHT60Jj2V51q2Cp+q58BmddwhPsV6gSjHWqiKSP+WnrOIsrdnAM2z8QnmMONb98
         W5hORwssgO2fVzaWBsEXUI7h4s69VHf0v1qCQV03PwAgQj/wYpWjbQmZVfk8lzhiZH0u
         MbvllkJy46868rtIBIiY70/VKUra0yjPmn7eNIND3aD8FaLTeMoxpY5vHMHt97z1yuK3
         pWoBuQo/cRQ1E9/fdJySMaZiG2GlI2TohEYgM4KUqn8EMHkDocVA0Ye9Q/vl4HBhKtn6
         juVC4uhv9q6WFpUYTXp9+VwTGcnf8swAsngwamM8zgb9nV3qFMfVKlS9Fe919EmMfj3+
         DP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491313; x=1715096113;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2c9rH3JeyvGKQdDSVVVx0PhRv40r9PE97KLjHmXfjCg=;
        b=P9HuYW64547hQC4QTFFUIsS5Tx9q/wBq7wXlx1AiSWvZBHZDCA6JdeNyCx6JzmaeY6
         8OcYuCT08u1i64Ti3rYSPeF7F4qk2qLsqic5RQQEat85j9m6HoIbnSz6uOi5wbJbRq1i
         eQu8G/0gOmSkoEglryzaBfSCaH4GbJMLB+qEDH9vJKTFp9MX6miEvyUW5TuRcnGb/gyy
         5m7MVTygmw0rn5ktt47tVfDn2HXF/0HbjC7kFBqBTpvd1/B6Gvf6xCSDkPXDfPmYYg8T
         2hyt2ombJ6M6vOndpbX8UNJJZeUX0d1EzUz8kTenTWxU94jSUFvOLdoVksPO42BTi51x
         3BUw==
X-Forwarded-Encrypted: i=1; AJvYcCXrC0YOYPkH/lE8+6JqVRB944shHL9DifLv54eYALFssBprHaZkzeewYNy3fgp+fJ3ACC8nW33QPAh5Yv9AgTUywz1eu96f0ZLLtqc=
X-Gm-Message-State: AOJu0Yx4WWnS5DVm2jAKOGzOIN7l7J2hoNYjJyGYo1Ao4zEYB5D+gATz
	OzqxZz3RjOXBw++JiO4Il+orFtRNU4dnQsGNTZoPXNbY0RmHNVfY/o2JLyzMFPk=
X-Google-Smtp-Source: AGHT+IH4FyszgLVd5E8UC44LgcvddxJsdBSvb733jfv+WHaa2WIHic3JGHRXMCNJwvDMKXzwCmXWRw==
X-Received: by 2002:a2e:8682:0:b0:2da:b1fc:7b8f with SMTP id l2-20020a2e8682000000b002dab1fc7b8fmr64095lji.9.1714491312626;
        Tue, 30 Apr 2024 08:35:12 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b0041ac4aafd3dsm27045674wmo.12.2024.04.30.08.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:35:12 -0700 (PDT)
Message-ID: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Date: Tue, 30 Apr 2024 17:28:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
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

Changes in v2
- Add Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> for patches 2 & 3
- Replace qcom,msm8998-venus.yaml (copy of qcom,msm8996-venus.yaml) with item in qcom,msm8996-venus.yaml

Marc Gonzalez (3):
  dt-bindings: media: add qcom,msm8998-venus
  arm64: dts: qcom: msm8998: add venus node
  media: venus: add MSM8998 support

 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c                        | 42 +++++++++++++++++++++++++
 3 files changed, 93 insertions(+), 1 deletion(-)

-- 
2.34.1

