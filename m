Return-Path: <linux-media+bounces-22880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5719E92D9
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0611636D2
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C973221D9F;
	Mon,  9 Dec 2024 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOwKesER"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A210221D98
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745179; cv=none; b=lvnpy8JBKtP83s3xJ8J4fRJj/dcDPSWqArNm4AXVD+pb6qR8yT7/dU9M7CKFWZr958cgqqJx9k62ZbXAx9x1ZxdBL+w7z8xn0WlB0mYj3vmPQfVpaTKnH3zOGcU+X66+HoeKb5HLG6tNRxJlyYrkY+5XAXiqSrm0uAlMMaYiHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745179; c=relaxed/simple;
	bh=cvAbGHmCA6HFonkR/rlrLWgZtYodAHJQHyMIJqJEv+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ROF3RRoMKMbWj3iyZbaHCo2zsiIyjxpWtyInxIQpjWdVzFA/SiF74gAduyED46hSXPHtccb381kLcwQi5JwEo/mDTl338JstD3A+GTqx/76YKODdChmr6RUTLIgSbGaRwui4AsCXPi3/d1UvqHD9dLd8hfU95RZWTcsRY3uy7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOwKesER; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso1566133a12.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 03:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745175; x=1734349975; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9ovQ7fdh6FLjUrJajFuZQHiSCvQ7SCuMMDnXva1GGg=;
        b=FOwKesERNRHXZljEaCDdtAGa/zg3FLJeca5b0Nz+SLGE/08ajBrWeMr/LtOFtiLRDs
         6ccEAIyN6nHr5CZJmGd6DuPm2pdfnyThWp9ihdg+ypwY028RHUm6ZysPvK8SZCP2+a7K
         Eco4yBNSFFmaS+xcwcqRGqr3Egxji3pctitrlSeB2EKAZYvxFhyGCEqj8abSeeeQBLCQ
         UTCqsKmq8+eGZQw9DGzOnZeMRXKLdxf3yZ2dtmWhuAp81KMU3Re9hdXciixiDpJDrfCN
         ujvwxKKaDg3zvTl9v9YpNY2jsyGVOTlJRjsYdAYq5e6lbJCfy/Yab34RmH6/TDnQ4Wyg
         fB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745175; x=1734349975;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9ovQ7fdh6FLjUrJajFuZQHiSCvQ7SCuMMDnXva1GGg=;
        b=oAyIexSJzqJIRmMbKYtNp3VjJRVdsJfMwXKvkKI/X2kEkjlUt+4UXzFexkD9D9G/77
         g8q2kDR3z7LJhuZ9U6rXkJr/ZfrN7byRbFrQqxJHO5UaCbNQA40KfCJF0B3Dmy7b3bxM
         NMIVzuNVzeTo5oYqHWrmXQzdt7E5kSZL2yC+JYdWtnBvcraWANgquF6P5gXeI5wbWvkZ
         XBlHPoVEnHcKoqVvEF1yqIqyF3AXguFuyDX0M621HCMIxcIiyEuGAucSYNkGRYwOyAfy
         00rC8RY87vxwqzKvthm+Cbizl5alnrciwr+iUK63cxgdNNQBSzEWyNrlc0p7jJ4bi3UJ
         hwkg==
X-Forwarded-Encrypted: i=1; AJvYcCXz0dRCvdgONBFCQYBbl4q5613WUYDjPWzWco3/92JMyOg1LSL7yCCjR3L7FzYlarJRUsbsEI6ZWBRWFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHivgMv5nfJ8gZ98HYhqx8I6sS/4vgsF90fnVCvWKwokqUPZA5
	UPxSu6sdfTxpbRgT4wJs9i+8yDFUJxnaIR7zHxs5MsJ58N172b5Ct7mKdQzivSw=
X-Gm-Gg: ASbGnctAswMgj29/CUNBR3+qq/aPxL2fG27sWQkVP8OcKMDksRoTqrr7EAZWifKwBbo
	ttNyj1FCIKe27AIMuJ1v9fy0TqNN1ITAm6Ck7gLWP70rlBfpCVsP/LjiY4sPaA3bxriPMgbOGxr
	YBZxmpKhL8so+aglz0XJ7CGEl6lt6bqtrBYWbTUmo1NDn86iLfYO14LqFADdBVF8kpWKdLzdddR
	JHCJ+41dH+xZW6sn00WaUVGf39T1O1XZ3rYdnL6hXQMg+wXBY8PXfoiskk=
X-Google-Smtp-Source: AGHT+IGBRhPT3vaZi3eebdghDDF9iBVSFo1g/+gVcmQjGLJ8zAkwqKigQ1Qiiq7VOGU4IyjiHrIOHg==
X-Received: by 2002:a17:906:4ca:b0:aa6:2d86:bd2c with SMTP id a640c23a62f3a-aa63a0ed36cmr983840666b.21.1733745175408;
        Mon, 09 Dec 2024 03:52:55 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa677968cdbsm247614266b.125.2024.12.09.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:52:54 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
Date: Mon, 09 Dec 2024 11:52:52 +0000
Message-Id: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTaVmcC/6XRO27DMBAE0KsYrLMBuaQo0VXuEaTgV1ogFg1Sk
 B0YunsoVwlcJS5nB3hT7I3VWChWdjzcWIkrVcpzC93LgfnJzmMECi0z5KiEwB5OMZCFutiR5hF
 QgRCAHRQnYbqAz6ezXVpd9jZa6Y0xcuAoWBPPJSa63tfeP1qeqC65fN3HV7Ff/7ezCuBgjBc6o
 dZO6bdPmm3Jr7mMbB9a8QkcG+654CmoLvUpPeDyCVw2PCbtAnbRDME94OonPvwNVw1PgWt0sn2
 hV7/wbdu+AR0/Gxf+AQAA
X-Change-ID: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

v5:
- Fixes venus_remove_dynamic_nodes() on probe err path - Dikshita
- Link to v4: https://lore.kernel.org/r/20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org

v4:

- Adds some unavoidable conditional CONFIG_OF_DYNAMIC to fix media-ci testcase # Test build:OF x86_64
- Added logic for of_changeset_revert() and of_changeset_destroy() on
  error/remove paths - Bryan
- Link to v3: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-0-ef6bd25e98db@linaro.org

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

 .../bindings/media/qcom,msm8916-venus.yaml         |  12 +--
 .../bindings/media/qcom,sc7180-venus.yaml          |  12 +--
 .../bindings/media/qcom,sc7280-venus.yaml          |  12 +--
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  12 +--
 .../bindings/media/qcom,sm8250-venus.yaml          |  12 +--
 drivers/media/platform/qcom/venus/Kconfig          |   1 +
 drivers/media/platform/qcom/venus/core.c           | 104 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.h           |   4 +
 8 files changed, 118 insertions(+), 51 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


