Return-Path: <linux-media+bounces-30086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A9A873A9
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 21:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 880C33B6BB4
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 19:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1D01F4620;
	Sun, 13 Apr 2025 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnKV+QXA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B31F3BAB;
	Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572936; cv=none; b=VNpgcH7/v+oj2uPLrrsDCs+Neh4iPMorQez6WeKmXOgc+EvAJ57qYw1rSqZ4Sa01g68BLQWesMXQj4DVXg6zgdrIIyeoLNC0eKGruGI7DP3zMhcO5GQcqwaVKMSLBGofq8VR8rsl9i0XE/u+EsjgWhNh7r0FUO+xYKO2jGu2JAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572936; c=relaxed/simple;
	bh=mwG4Cj2Ztv79BD/XS/55Zl5lC0H2/N8fCCGZjwWMhH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i9YVjFYZP8VBnesRZsKNjElWej+z3RPGIbddcIMTVMQtr+5glTWeI4X9u+luzXl/0Ix02QMA0h/84518G5lZryUb7CLRqlEbh4oLrTpXbFYqg2DABxTgN419siIcvM0MTFx4MMikb8mYT8zhj1Kpds7vwO1UdAE7btZ0L3q+6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnKV+QXA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C4D4C4CEDD;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572936;
	bh=mwG4Cj2Ztv79BD/XS/55Zl5lC0H2/N8fCCGZjwWMhH0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rnKV+QXACP1Z2fmC4UtfdpLwuOzMtYiZO2p96En1eT5UfLVmU0AYvJ6lCaW0rGlaU
	 k8a4M10UTZeACW5dvg9gyvf2wW2gUghsilUJRaGg3ZZlmaz5bIxpEfnjf5KidJ+xAe
	 0B3kFJnzw3NXhl816VUEaWN42BPl3sRdwZBcnSiq5Urpm29eErKkMw+OF9gdoO+5RQ
	 hM6dykESS8u3vnwpwdUQg9uICUj58EKJtQWYmOCx7z8Jq1lrVRfb5P5NSKodnsUGhm
	 xGinnyDHWeAXnx4P+JFaiCqnX+DU9Rkw+H0eeS5TAmh2UKIB4U9l1759HRCbSBXrQI
	 FCQvSmtYqFUjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4781AC3601E;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v4 0/4] Tegra CEC Updates
Date: Sun, 13 Apr 2025 14:35:31 -0500
Message-Id: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMS/GcC/23MQQ6DIBCF4as0rEsDCKJd9R5NFwgzSlK1AUPaG
 O9edEWaLt9kvn8lEYKHSK6nlQRIPvp5ykOeT8QOZuqBepc3EUwoJpmmC/TBUAuWaqiM7gClqpH
 k/1cA9O+jdX/kPfi4zOFzpBPfr/8qiVNGQSjnWqV1p/DWj8Y/L3YeyV5JopRNKUWWAhmT6LCR0
 PzKqpRtKassW15Lxivu0IhSbtv2BYMczdIWAQAA
X-Change-ID: 20250407-tegra-cec-7e3a7bef456f
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744572933; l=1886;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=mwG4Cj2Ztv79BD/XS/55Zl5lC0H2/N8fCCGZjwWMhH0=;
 b=wQQLFHjhNIRlAbrNd3iQPtZZrdGAJgPmBlPEX6gwfQAxHvR+FZr+OOkrHNgbZPJ4D8fa/jNc9
 N79fbjQESF+DRnMfJUMIlo+P7Z7b64m905VcjEox5xn2XHfruQsaKug
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This series updates Tegra hdmi cec support to be usable out of the box
on Tegra210 through Tegra194.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v4:
- Fix review comment on patch 1
- Link to v3: https://lore.kernel.org/r/20250409-tegra-cec-v3-0-91640131dfa2@gmail.com

Changes in v3:
- Update patch 1 to fix lint warnings
- Link to v2: https://lore.kernel.org/r/20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com

Changes in v2:
- Dropped patch 2, per request
- Added change to declare fallback compatibles instead, as per request
- Update patch 1 to allow fallback compatibles
- Link to v1: https://lore.kernel.org/r/20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com

---
Aaron Kling (4):
      media: dt-bindings: Document Tegra186 and Tegra194 cec
      arm64: tegra: Add fallback cec compatibles
      arm64: tegra: Add CEC controller on Tegra210
      arm64: tegra: Wire up cec to devkits

 .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml | 14 ++++++++++----
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts         |  6 ++++++
 .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts     |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi                   |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts         |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi        |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi                   |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts         |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts         |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi                   |  9 +++++++++
 10 files changed, 57 insertions(+), 6 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-tegra-cec-7e3a7bef456f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



