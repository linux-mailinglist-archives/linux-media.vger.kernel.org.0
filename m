Return-Path: <linux-media+bounces-22234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E399DBB2A
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0006E16421D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAA71C07E3;
	Thu, 28 Nov 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhzRgMOK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959D1BD03B
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810915; cv=none; b=EwULFmxq7rGExwpGDKFTd5yZfieGOY1njAC/FM0+H8azdywQFMPdr8ft6AjTZKMKDbQEEYAW+APQcHeSaICgzvE+5YA0OgOAZ0hDf0JdeNBTlCganeP17Ssbs7ypUaFlK0zUnrBopiXJ7gDpKbcsYHqjWiUfGlV0qT/fMpgvANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810915; c=relaxed/simple;
	bh=W5d5TUpFqOmdQ0u+dAULQvpGp33jPqoJkFWD+JsjdlA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BEV9DjrNn++pg+FF1YJ7FIP3VM0MLIVVQWmJjL3ZTgDIRNhwJZhE36NCLoSYlNIAEElg+8IJJbAcyp47grmqwq/4Oq/VruZTR3OZdmr8jApq3WJAKhZKoXZAtrflcF6bbFb4DTev7lTqe3RycjfQudB8tLB3TcChiajAx7k4gc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhzRgMOK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a2033562so8888685e9.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732810911; x=1733415711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4JksmRiBHUzeK7eouUGwkYQse3gctmWdRPpveYR3Cg=;
        b=xhzRgMOKz4Xm/K8+gKmxVyYuLfR1dZYVqpdOKexxOMf1NAI/cFdERooy6D3EZsZMor
         wh06/zbOlf30lfIf9PHI36LRxopaeXE/Kq4vklTcW6bWWRHzFxbuvRnljdZUBaIfg7yk
         /ptN5VkpCSPMcsTsgBKdIoKJwbUGKru03Kx8ApeiO6mhfgRI1o5Q0ucwhGu2NHORiO4R
         1EcEb6l3UVZNAeDNKnuuV5q+B7Ep+9he6o4nFG2QvvoSBNs1t8sfzYIAOcpDGUoN2kap
         nSxkB8gKnv2cGEZ0WKCsfUDTXGpMM9WjGKYVBi04u2/gZq1zZFyn07dq/dth/NlIF92G
         DmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810911; x=1733415711;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4JksmRiBHUzeK7eouUGwkYQse3gctmWdRPpveYR3Cg=;
        b=jb0BcH+JCtKowgYAFCD50TwjCifAZd7K7TtbAoBbFgHsPHDA22tIgRc2wXrkOA+irm
         rkXL/wObv/jmGj7nQ2/WPKu+eqkheg9WBAYU3bK+lOdeAUzCrz2B+JVbKMxrhwESee1e
         uGnFL5ifvFq8hVe5qi23T5m1dx1gNUt5QPLy0PnocV57E8QerNoQT9Pp87/AhpjYkusC
         KPAbUUfA6ZxAfm3+k80vo9p+yBHG8dMvAtWDg3wgtLbhbWgJ3dRcpm+vxXtYTCNfmIp5
         qkhjDy9XdvSBWG3wt2JNJ1zjM/fU19rEwId4Et+ISEhiMOawPQz4EZwSohuusYD0oDJj
         cOLw==
X-Forwarded-Encrypted: i=1; AJvYcCXEr2NFsT0CJLn7gx4WQW5ZOP9s8jAopgpPwV3dqwj752fR4j4pImWoOkKVSSz7WjMx54s2aI3CLSplKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJaGDqpEsiFTZ+5Zw35TNOU7TtoLg8FDzTUYGw8mA6/MnhJrd
	gAww15Fp1hXCeRfZIDf+Hvr7xQ7fB/86jioiafJfNWDNj6iXpRZae5ba2RmHRnU=
X-Gm-Gg: ASbGncvo2LOGLcjEe0MmF9xGJm4Ir2uvgwUGMkDFTzcFpuBWfiJ8VdeoXxBpiZe5ELI
	q2TV/Bnwy5nsqpSz2+JlR7ncOCuCzIaZ+yqTNeFDM+ruAhEG59x+f5pVwTJxmRd3Vk/sl9994LZ
	llZ5gjp4eU8cVnUkIP7uZep8Z+GdIWnSBRalYm0lxmpk31x/ZRfu4TUfOsSCOORGBenl8X2qhBK
	SXV1HVDESWVMfi7J9PlE5AGwgz2Q1qBJBDqilsEBUBZWjKybDm+/W1qcsc=
X-Google-Smtp-Source: AGHT+IGQOC9+zFe5o1o38nSa1dxkrznIvZG/sokSsDpDtTF6eLIRINi1P3TnTkxGCRJF0Xa4y6T07Q==
X-Received: by 2002:a05:600c:458b:b0:434:a924:44e9 with SMTP id 5b1f17b1804b1-434a9dcfedfmr76860895e9.15.1732810910537;
        Thu, 28 Nov 2024 08:21:50 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d9csm27004545e9.38.2024.11.28.08.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:21:50 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
Date: Thu, 28 Nov 2024 16:21:48 +0000
Message-Id: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyYSGcC/6XNQW7DIBCF4atErDsRM2ASuuo9qiwwDDZSYyKw3
 FSR716cXZRdsnwz0vffROWSuIrP3U0UXlJNeWpDf+yEH900MKTQtiBJGpEOcOaQHNTZDWkagDQ
 gAnVQegXjL/h8vri5vcv2Zae8tVYdJaFo4qVwTNd77fvU9pjqnMvfPb7gdn2tsyBIsNajiWRMr
 83XT5pcyftcBrGFFnoDp4Z7iTIG3cVDjE+4egNXDedo+kAd22PoH/B1Xf8B3nAXcKEBAAA=
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

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
 drivers/media/platform/qcom/venus/core.c           | 100 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h           |   4 +
 8 files changed, 115 insertions(+), 50 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


