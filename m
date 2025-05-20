Return-Path: <linux-media+bounces-32943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF15ABE2D5
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 20:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9A297AFBC9
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 18:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1FB281538;
	Tue, 20 May 2025 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tydRZ7sm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1710248896;
	Tue, 20 May 2025 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747766353; cv=none; b=JoEqIsgdyX7EjE9nHIoOVHZsuyJ+k6qN917DZNtQMxCu1wDMIHJ2nHPNGtY6EHRGVRwHjuXbALT7mzk3m6xGwkR3iDca3b4QpfXf0iOuD/sJsKkh2olhAIpemKGAtQdaFiIS1SvxgyfCPQvfbgMgGjkthG+3dZoCBDpralF9nXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747766353; c=relaxed/simple;
	bh=xMPftx8ZL1Fdnrn6+/pTmp8ZHvl/LtV3wjYxJ7nWMjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qwK3dpAbAR48dV5HnlYG2V+pykPkgl4Ffwtt07RLlcXPpZT+t2t/ZPTTucfTMC0Vy4pnuxicFTEOWWyZ8c5bgsnWwWKCsZLK1OcGOmZkLFBslC9GOblyL1eaYkmoHZc3frnJDzEkeJ2C1GHRd8UIUuJUde4PLW4HSosnmUDqTMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tydRZ7sm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D8C8C4CEEF;
	Tue, 20 May 2025 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747766353;
	bh=xMPftx8ZL1Fdnrn6+/pTmp8ZHvl/LtV3wjYxJ7nWMjM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tydRZ7sm3nBXy0taiRugMj87kfEB47X0T0LBh+HZBGG4ooB2LobHmxnBSTOmUDvfz
	 4JqhPH0EF+ExORQGfSNa3DE0zQYCrDNyZfq0vA8x3eqQPpdBMuOQikBhawHUUeJ4vQ
	 QZVkCsSJ+N9wTfT214wGcSmHAsh6s1Ta7Qlmm/VaC3qSQO0HaRy/zsvhdY/4LfVlWv
	 Pai+YWZy3G6WpsIjGks9E0xLEVy0xk79lll+ZEKcTe1yebPxSNz7VmlAq8RPvlmLOG
	 QrIHn5GwVW7ZNDxZ8Xe7KwrGiKgz897/Huw15+v4x6s5NbgxwOAY4ZG0q5I7i3TPi2
	 O5tr26oYk/gRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B5DC54E71;
	Tue, 20 May 2025 18:39:13 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Subject: [PATCH 0/4] CAMSS support for MSM8939
Date: Tue, 20 May 2025 20:39:05 +0200
Message-Id: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnMLGgC/x3MTQqAIBBA4avIrBvIQtKuEi3MxppFPzggQnT3p
 OW3eO8BocQkMKoHEmUWvs4K3SgIuz83Ql6roWs70xo9YPCHCNrSO8wLR3SDidFY7bSzUKs7UeT
 yH6f5fT90dfVBYQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747766350; l=1864;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=xMPftx8ZL1Fdnrn6+/pTmp8ZHvl/LtV3wjYxJ7nWMjM=;
 b=5H7zBjpE6EwMk9Sh/1Pi/8cs5I+ouMQ1J7iMQUdhHso+sTYEs++vKgH9X8U3SGo33FuYp91mQ
 GCar79nboIjBR4ZHi08sXW1mU4+lxCynxQF5Hmqv6ZK187DgriOJ8Wp
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
Vincent Knecht (4):
      media: qcom: camss: vfe: Add VBIF setting support
      media: qcom: camss: Add support for MSM8939
      media: dt-bindings: Add qcom,msm8939-camss
      arm64: dts: qcom: msm8939: Add camss and cci

 .../bindings/media/qcom,msm8939-camss.yaml         | 269 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 152 ++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  11 +
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |  37 +++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h |  19 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +
 drivers/media/platform/qcom/camss/camss.c          | 157 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 671 insertions(+), 2 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
Vincent Knecht <vincent.knecht@mailoo.org>



