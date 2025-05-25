Return-Path: <linux-media+bounces-33331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5C0AC366C
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 21:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 546DA3B5030
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 19:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32BD264FA6;
	Sun, 25 May 2025 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTrLLJI5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7272637;
	Sun, 25 May 2025 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201105; cv=none; b=iasVIqDqRFGCXf01CKG6ad4Cp3xJ0KV+MggsFsDco06cm/XpVgwEVE3gqNBJPew0zCpWV2HhZgVQeNtk7F1b+oLEfFsEe1vSYdc//+8CTwNv/JA3yK8beBiLqrNC+qW9xaUYbeDxFZIBxpVLU0+blc3J45v527cbMsYBMMg7Cak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201105; c=relaxed/simple;
	bh=Rfp4t3oNNdUnf4CSzby65fbywfI+1IZsu6oziz1pucM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MVAPPHWNLqlrDEhAQcZWNUuI5XWXRMR8cfXg4JKxkBVeWxYz1oYBIfbXFtLKLPmDYULnTsqeCBqdhkXDghOGRvmc5lWnVdB5wJmilova6EYD8+LIvs3A6LYh1+P3qPoCJKt5x8uxXPmBBY0BJ953VZABXG1/JQZNTvwz6JvVn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTrLLJI5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81EE0C4CEEA;
	Sun, 25 May 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748201104;
	bh=Rfp4t3oNNdUnf4CSzby65fbywfI+1IZsu6oziz1pucM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nTrLLJI5TxFJJSJtg7QqTXJZY7W+rRq4Ndi7OLyAwtjCUqyNYNcBVbcqVgSVxye/c
	 YCYAHTz1QTfBOb1riBBI+iNZdMKJiB3992LOMl86KfJ3MYZyiDLrF4R2KcpgtTgSkX
	 +W6XHPKFMqlvMfEjS2TAvceRvdbKApFQaKnUp/1mvFN6MUw9jCLBWkpbZQ90ij3F/x
	 TKvkMeQIG2MYp8R5EqJmGV03cKIXIOxodGUL7Jns1RzRflHkwDX3mOCJfMHyETkLHp
	 DkPJd1B5VEme85Zz23RHbznjufg9spZ6ptjc87DSf3BeLbzDtk2WjgS6mGjYtKgram
	 OxcBbukxNvYDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730A0C5AE59;
	Sun, 25 May 2025 19:25:04 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Subject: [PATCH v2 0/4] CAMSS support for MSM8939
Date: Sun, 25 May 2025 21:25:00 +0200
Message-Id: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxuM2gC/2WNwQ7CIBAFf6XZs2sAQwue/A/TA1JoN7GlAUNqG
 v5dbLx5nEnevB2Si+QSXJsdosuUKCwVxKkBO5lldEhDZRBMSCZ5h9bMKaHaLhrzgzzqTnovFdd
 cK6irNTpP21G895UnSq8Q38dB5l/7awn218ocGRou7NAy1hqvb7OhZwjnEEfoSykfDlOAh68AA
 AA=
X-Change-ID: 20250517-camss-8x39-vbif-975ff5819198
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vincent Knecht <vincent.knecht@mailoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748201103; l=2711;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=Rfp4t3oNNdUnf4CSzby65fbywfI+1IZsu6oziz1pucM=;
 b=cLggF4BQt2BLpzNbBwUmm3+tg/OQMV89+wZPGaUmai4j0vcMpvStMPHX2s3775Ku65XtuxSWc
 FldLQSyTYygChOTnfZpgEXXvtklI9dzyIXgbslaompIW/2JT5MNqfbg
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

This series adds CAMSS support for MSM8939.
It's mostly identical to MSM8916, except for some clocks
and an additional CSI.

To fix black stripes across sensor output, and garbage in
CSID TPG output, 2 VFE VBIF register settings are needed.
So the 1st patch adds helper functions to do just that.

Patch 1: adds helper for VFE VBIF settings
Patch 2: adds CAMSS_8x39 version in CAMSS driver
Patch 3: documents qcom,msm8939-camss DT bindings
Patch 4: adds camss and cci in msm8939.dtsi

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changes in v2:
- Patch 1:
  - Fix devm_platform_ioremap_resource_byname line to not end with
    opening parenthesis (media-ci/1-checkpatch)
  - Move camss-vfe-4-1.c handling of VBIF previously in patch 2 here
    (Dmitry)
- Patch 2:
  - Declare regulators in PHY entries, not CSID ones (Bryan)
- Patch 3: (bindings)
  - Fix bindings checks for new errors (Rob)
  - Fix properties ordering, code-style and example (Krzysztof)
  - Sort reg-names, clock-names and interrupt-names alphanumerically (Bryan)
- Patch 4: (dtsi)
  - Move #address/#size cells before status (Konrad)
  - Aligned CCI with msm8916, thus removing ispif_ahb mention (Konrad)
    If "camss_ahb should be unnecessary", it's still required by qcom,i2c-cci.yaml
- Link to v1: https://lore.kernel.org/r/20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org

---
Vincent Knecht (4):
      media: qcom: camss: vfe: Add VBIF setting support
      media: qcom: camss: Add support for MSM8939
      media: dt-bindings: Add qcom,msm8939-camss
      arm64: dts: qcom: msm8939: Add camss and cci

 .../bindings/media/qcom,msm8939-camss.yaml         | 253 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 146 ++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  11 +
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |  37 +++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h |  19 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +
 drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 649 insertions(+), 2 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
Vincent Knecht <vincent.knecht@mailoo.org>



