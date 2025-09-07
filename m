Return-Path: <linux-media+bounces-41935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F1B480A0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 00:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B719417F76F
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 22:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8162E29A33E;
	Sun,  7 Sep 2025 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJAy5heZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CBC12B73;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757282675; cv=none; b=B/ObQi80/gyt3R4K4M7qeKwjGlWuHZLpt2I0Q5Y62W34Hdll0nSM4C3qHrXx8eLSHTr/BaPQmBQaugEUVXuWhf337B2VIXUn5o+fmWE01poWsW9Bf0VsyaVK5d0FX2pKubEJVo/bs32lWku0pMkJs8/P6cSAD3VAvhOIUumLzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757282675; c=relaxed/simple;
	bh=9+FmzHBVrcCtqXllvP6hTlSCZ5CvZZym/HB8c4kj5mE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nl+s1yWuJc6AeWgY3I8mRJxsvXFyBrQCXxbbccX+ly2d701WLx3pWXq/A8bS/52hEC7EclpML7qPoLerEbTfEFiaEOwizM/7VxDHDC2RRBp0h/wnFlxpbkimBhvZNH73HVjmZAxqMKIrxitExfLgVWBIX8UQAmX8KOPbolzJr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJAy5heZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613E4C4CEF1;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757282675;
	bh=9+FmzHBVrcCtqXllvP6hTlSCZ5CvZZym/HB8c4kj5mE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qJAy5heZ+J2njbyzPp9qajGXEkOjrzO+tomqM6qu1/9IoCGa9j+fba7HJLiyn0iG+
	 n03OXTnvLOftPuiLUXUhDO8BbL+hgNLEdsE/P4aLBX8kqRI5aZfh0R2vY5hFQxLxdm
	 v4Yd5LwPNI5zwyODc1KX2AfMszTFmyd0Z43hO/wGZewk74i+iQ8fbcfQB7BzHEotiE
	 UKhYfRmtim3NmPNtbNdXChu1HblICDvLrEyKvfOUKRQU83LMJuAJspRxaa554MNG8G
	 XppQhnoSwiQWuk+KlSNmMgzeTCYP9oQyJr2/k6yjCeSNq6V6L7Y8kEOClghqtqZJ8N
	 wKBj5Qcdaqq+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B03ECA1013;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/4] Add CAMSS support for MSM8939
Date: Mon, 08 Sep 2025 00:04:14 +0200
Message-Id: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF4BvmgC/23OSw7CIBCA4asY1mIYcLC48h7GBeVRSVQMGFLT9
 O7SxkVNXf6TzDczkOxScJkcNwNJroQc4qMGbDfEXPWjczTY2oQzjgzhQI2+50ybXiha2uCpOqD
 32IAC1ZC69UzOh34Wz5fa15BfMb3nAwWm6dfibGUVoIxq4MZKxqT26nTX4RbjLqaOTFjhSwDXA
 K+AtMKiQe33KFeAWADizweiAt4osIBti/YXGMfxA/StPzgxAQAA
X-Change-ID: 20250517-camss-8x39-vbif-975ff5819198
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757282673; l=2310;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=9+FmzHBVrcCtqXllvP6hTlSCZ5CvZZym/HB8c4kj5mE=;
 b=sdrcJ3hmiqBjErZCuxj8R0+8gYYznFsn/UaMWjBactkUePKhr9bgMpGrsog5PwVLNWYRdbi7M
 D2RLjHQ5hEmBgr4AfURmHK3x+otqq8amfVKoreTakUBvC4GTqTLlrgI
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

(This series resumes [1].)

This series adds CAMSS support for MSM8939.  It's mostly identical to
MSM8916, except for some clocks and an additional CSI.

To fix black stripes across sensor output, and garbage in CSID TPG
output, 2 VFE VBIF register settings are needed.  So the 2nd patch adds
helper functions to do just that.

Patch 1: documents qcom,msm8939-camss DT bindings
Patch 2: adds helper for VFE VBIF settings
Patch 3: adds CAMSS_8x39 version in CAMSS driver
Patch 4: adds camss and cci in msm8939.dtsi

Changes compared to [1]:
- Move bindings patch to the beginning
- Make the order of {reg, clock, interrupt} items the same as in 8916 +
  append additional items
- Drop R-b tags from bindings and dts patches as order of items was
  changed

[1] https://lore.kernel.org/all/20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org/

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
[André: Apply reviewer comments]
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Vincent Knecht (4):
      media: dt-bindings: Add qcom,msm8939-camss
      media: qcom: camss: vfe: Add VBIF setting support
      media: qcom: camss: Add support for MSM8939
      arm64: dts: qcom: msm8939: Add camss and cci

 .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 146 ++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  12 +
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |  31 +++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h |  19 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +
 drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 645 insertions(+), 2 deletions(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



