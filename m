Return-Path: <linux-media+bounces-22189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF619DA9A1
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 15:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818A1B22E9B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 14:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1961FCFF4;
	Wed, 27 Nov 2024 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9BpCB60"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276411FCF41
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732716318; cv=none; b=kA+iKMvBrMX0nR5TWicEf73YN0y3gSiHuDaDm1Iqmhmvb0A2La3fnql/YRKVjm7bXC73N6aUVVeh8qeSDjXBKdFKRDI8tPqXywX31mtDPZeWbwjuM7kBQCZwomLIKp/OsctEUatzIaitQCaITiNAl16UjG4JnT6qaXJpDRDlDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732716318; c=relaxed/simple;
	bh=8l1b9ahQ6r0Ez7EY2VrUezUFUgLek9a6Gxqe3YD3Djw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dg6JNnKT/PGe/CD5L/kwBtRsKikWQdIwjMEhTm3h9yLzvM35PREWOGG9PMsleUpKCZHIE8GkVFIG7QjHi5pI9qMD+RBujWeL5mdU+P0fxzyVaYHbKGPQXxkPIOrO9ecSfruWUfiKPN44mTfiRpxWT/gOiP4WoqctJHgVWVTBet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9BpCB60; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so5094955e9.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732716314; x=1733321114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3f9O9vZL3tbjRNBgBrukDHv6NIz58hUA90xmXqcfyB8=;
        b=q9BpCB603SyJlWVu2BQ7Tanvy3nCHMUJWREzqGDmwcwGvWxuQdjcAzGEEpf5E0iFJV
         heq63OQgIPVIayXkc9mGVvJKWeORVj1ffM009Am204hs4M8arIJKm5YEeedF4fS3P6vH
         Zs2XLIRS1JwaNCQdObnE0+rhgCTGanporXxV0CWwix0OQwIE8Z+p1UJ0a7dIudEg7qSQ
         LkCUFFBlsTTO0pXyKzFgc4AzfpJtgk2hCDQmCAad44/x25TIJICjl8DYAj4n89U0clMX
         Hk9gqBt+xHiPku3BHW8rLnWg0zpe/2lNiZ7KVDQRPSbtBEA6ZB7GdSQ5IuZexqVHPVVJ
         SkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732716314; x=1733321114;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3f9O9vZL3tbjRNBgBrukDHv6NIz58hUA90xmXqcfyB8=;
        b=l4borobaofvmRU5nhiVsqikceQ4EBBDrGar6zmQ2cD1uSJng+wMb27IgwNwcXXpyNV
         nyvj0V1SiYfszx7jz71JXqpD/ncb4AO9XluQ2OwG3/amy02oyghN4MXaQuAIUYBOqPMK
         cMYJfDUsLtPXfKFzZscQsiOuroOfg7Htq+o2d9kmEKpayDiWT/xPViegtWhjRq8KLVbO
         9brLVmFjWEiLVA1AjtJoCg0Sr3WsrYsx/JLXMlPw2fFRTs9oZOMjpquibxqrf1GRBJ76
         Ovf+EDdIDfcPrOqT2+sMUkCRSuLHUereobJDgYUUglk4wZjd7RfL4o9A+jC//psDx7hu
         E/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3U95OVo2+nsaLDZkHh01WWlVILzzoRDkLJl5ww8ABywqVwxu8fN67pb5AELOTuOuRckR3BcY0mFojg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwdsQ5d+PWiQIguCrHu9pwQ7kw900I1tEyIlhBELrSqedkHoA9
	HwJ4dwuR8ptA05p/ybKh891x3IqIc+59CGZ37U16IYR0SYlJNtZvTq3l5zVPNvg=
X-Gm-Gg: ASbGncuP1bIP4mpo1cA+BGLuCELrIyKxOyE40nSeQ3E3mMR+usUOF0ypqBxLvFAncbK
	CTbgwhHl+5/MnE4e1ossnLGfk6l8AvxJ/Jw9wYFQXJTCj0/iMedLyeL6XzscbbjSuOx6bOJyFvf
	ri/5Cr7rFmvmf0stCTe9vAA9Xy7tgqoVm8xLqIDkQSiHrDoowbmXOsr5sM3jAushtP5QQIaXqi9
	4o5/e4N0jwzSlinSYITwYFvFamYpen8B3MwIPZgmmmqqUHR8uFH8TQsbLQ=
X-Google-Smtp-Source: AGHT+IH9E1I6SJcGbvjq3llM4aBEjZ828MeieBzcCnebm3n1hBJ8N1EB+u0P1asbpWf8ObnMf3oIlA==
X-Received: by 2002:a05:6000:1ac8:b0:37d:3b31:7a9d with SMTP id ffacd0b85a97d-385bfb14bbemr7186256f8f.23.1732716314287;
        Wed, 27 Nov 2024 06:05:14 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad6436sm16442335f8f.13.2024.11.27.06.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:05:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
Date: Wed, 27 Nov 2024 14:05:11 +0000
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-0-ef6bd25e98db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABcnR2cC/6WNyw6CMBBFf4V07ZjO8LKu/A/jopQWJlFKWoIaw
 r9b2LnV5bk3OWcR0Qa2UZyzRQQ7c2Q/JMgPmTC9HjoL3CYWJKlApBoetmUNcdIdDx1QAYhAJYQ
 mh/4Jxj9GPaU7bK/VuVFK5SdJKJJxDNbxa69db4l7jpMP7z0+47b+1pkRJChlsHJUVU1RXe486
 OCPPnRiC830h5yS3EiUri1KVzv3JV/X9QN21sqnRAEAAA==
X-Change-ID: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

v3:
- Adds select OF_DYNAMIC to venus/Kconfig to ensure of_changeset_*() is
  available. Instead of ifdefing and have the fix not work without
  OF_DYNAMIC, select OF_DYANMIC with venus - linux-media-ci
- Link to v2: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org

v2:
- Removes useless dev_info() leftover from debugging - Bryan
  Link: https://lore.kernel.org/r/ce9ac473-2f73-4c7a-97b1-08be39f3adb4@linaro.org
- Trivial newline change @ np = of_changeset_create_node(ocs, dev->of_node, node_name); - Bryan
- Fixes a missing goto identified by smatch - Smatch/Bryan
- Adds Krzysztof's RB to deprecated - Krzysztof
- Link to v1: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org

v1:
Various venus patches have been held up due to the misuse of DT to provide
a configuration input to venus as to which mode a given transcoder should
be in.

Link: https://lore.kernel.org/linux-arm-msm/436145fd-d65f-44ec-b950-c434775187ca@kernel.org
Link: https://lore.kernel.org/linux-media/ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org/

This series provides support for static configuration of venus from the resource
structure via:

1. Adding two strings to the resource structure.
   One string for the decoder one for the encoder.
2. The string for each SoC has been matched to the existing in the
   DT which currently specifies the mode as decoder or encoder.
3. New logic in the driver parses the DTB looking for the node name
   specified for the decoder and encoder .
4. If the DTB contains the node name, then no new node is added as
   we assume to be working with an "old" DTB.
5. If the DTB does not contain the specified decoder/encoder string
   then a new in-memory node is added which contains a compat string
   consistent with upstream compat strings used to currently select
   between the decoder and encoder respectively.
6. In this way new venus driver entries may be added which respect
   the requirement to move mode selection out of DTB and into driver.
7. Simple instances of decoder/encoder nodes in the yaml schema have been
   marked as deprecated.
8. Since the proposed scheme here always defers to what the DTB says that
   means it would be possible to remove decoder/encoder entries for the
   deprecated schema should we choose to do so at a later date but,
   that step is not taken in this series.
9. Some of the upstream encoder/decoder nodes for example sdm630/sdm660
   also contain clock and power-domain information and have not been
   updated with the static configuration data or had the schema amended to
   deprecate values. Because these nodes impart hardware specific
   information and are already upstream this series proposes to leave
   those as-is.

However if this scheme is adopted it should allow for addition of venus for
both qcs615[1] and sc8280xp[2].

Other SoCs such as sm8550, sm8650 and beyond are expected to be supported
by Iris.

The sm8350 and sm8280xp in the second series would then be able to excise
the offending compat = "video-encoder" | "video-decoder" in the schema and
DT.

I considered making this series an all singing all dancing method to select
between encoder and decoder for all SoCs but, the objective here is not to
add functionality but to provide support for configuration in-driver
consistent with current usage and to do so with a minimal code
intervention.

So far I've tested on RB3 by removing:

video-core0 {
	compatible = "venus-decoder";
};

video-core1 {
	compatible = "venus-encoder";
};

This works - the code adds the nodes into memory and the video
encoder/decoder logic in the plaform code runs.

Similarly if the nodes are left in-place then no new nodes are added by the
code in this series and still both encoder and decoder probe.

Thus proving the code works and will provide support for new platforms
while also leaving open the option of dropping nodes from upstream.

I've left the dropping step out for now, it can be implemented later.

[1] https://lore.kernel.org/linux-arm-msm/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
[2] https://lore.kernel.org/linux-media/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      media: venus: Add support for static video encoder/decoder declarations
      media: venus: Populate video encoder/decoder nodename entries
      media: dt-bindings: qcom-venus: Deprecate video-decoder and video-encoder where applicable

 .../bindings/media/qcom,msm8916-venus.yaml         | 12 +---
 .../bindings/media/qcom,sc7180-venus.yaml          | 12 +---
 .../bindings/media/qcom,sc7280-venus.yaml          | 12 +---
 .../bindings/media/qcom,sdm845-venus-v2.yaml       | 12 +---
 .../bindings/media/qcom,sm8250-venus.yaml          | 12 +---
 drivers/media/platform/qcom/venus/Kconfig          |  1 +
 drivers/media/platform/qcom/venus/core.c           | 66 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h           |  2 +
 8 files changed, 79 insertions(+), 50 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


