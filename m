Return-Path: <linux-media+bounces-42086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDEEB4A85B
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E1E37A4D4E
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE1A2D3A72;
	Tue,  9 Sep 2025 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot34czWl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39002D2482
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410799; cv=none; b=cxJO0Re8hbDPPhdQJGZPRLnDw0gJvC5lsAYghpCiAMXPRzr0Ggt0pkGfQ/P9A9f9gx54zqK63tsngMoT1nMTadwDQNkVeOVZkHmy0CZcDkkIUPo4yMJZKmothQRujnOE2bFDmEw/Xp0c+vtv1u8HmwTfDYOPmYA3Zy+yj9Dhjy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410799; c=relaxed/simple;
	bh=yMaEciVGOiLOwLZUCCTsHXTLZwzAbNhuwmdQ3IVWgr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1bCwGaRIrCgeCMuqhf+mNSFYvVlWAWvcwSKiCy+xz0unlJUoqSpLDom/mkpF5yoJgMHRbYf2JQKHmFqWGOaO3MQJU2QMXRf8HecF09eOT/ReqogHlRH/B/aYf72zBw9cGTNzPgcxG5ubxmtm+NVMWoW0a3EfOmGXsO7SFMRTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot34czWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BC7C4CEF5;
	Tue,  9 Sep 2025 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757410799;
	bh=yMaEciVGOiLOwLZUCCTsHXTLZwzAbNhuwmdQ3IVWgr8=;
	h=From:To:Cc:Subject:Date:From;
	b=Ot34czWlPSyiLCByUx/niku46laS4VWlTtnnF3NHW9T/9dw4bhFR8vvtkfgt+mwjF
	 mcnvvWSbfGtT3uuAllHylGLyCvHTnyEOJXsXmFZGRw/jnFMeVs5hpRKMy9diV0QKgx
	 iQBfG4bJpGocRZnnBXYE10nS6vp9YFjpnqPOQdYNH1kBU9HmjxR9q0I3IXMwD+xjJB
	 sVkNHDHdwN0CxeDOG2/M9j5hKEESJbo7HpnrwecdfjohUem0Q9LiReTenIKOYy1J0V
	 m6tVZiwiEE9qUFnMM7gY+eD28aoD4o8fD+EO9PVzY2SfcX2V2qekp8sYBe4c+ABJCe
	 i+uO3v9+Oeq6g==
From: bod@kernel.org
To: linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-iris-generic-fixes-updates-for-6.18-v2
Date: Tue,  9 Sep 2025 10:39:41 +0100
Message-ID: <20250909093954.39984-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit dcd2ca10faaf59fedcafffc6bbf41ba628a23cc4:

  media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper (2025-09-08 20:32:43 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-generic-fixes-updates-for-6.18-v2

for you to fetch changes up to f1af376c32059cfe22b70e3832e5566107da9de0:

  media: iris: Fix firmware reference leak and unmap memory after load (2025-09-09 10:30:48 +0100)

----------------------------------------------------------------
This PR contains:

- MAINTAINERS updates for Dikshita, Vikash, Bryan
- dt-bindings additions for x1e80100 and sm8750
- dt-bindings fix from Krzysztof
- Fixes: from the community
  A number of memory leak and power-sequencing
  fixes.
- v2 mailmap update for Dikshita missed in my
  queue in v1.
- v2 adds a patch from Krzysztof which is RB since v1
  media: iris: Add support for SM8750 (VPU v3.5)

----------------------------------------------------------------
Bryan O'Donoghue (1):
      MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry

Dikshita Agarwal (4):
      MAINTAINERS: update Dikshita Agarwal's email addresses
      dt-bindings: media: qcom,sm8550-iris: Update Dikshita Agarwal's email address
      mailmap: update Dikshita Agarwal's email addresses
      media: iris: vpu3x: Add MNoC low power handshake during hardware power-off

Krzysztof Kozlowski (5):
      dt-bindings: media: qcom,sm8550-iris: Add SM8750 video codec
      dt-bindings: media: qcom,sm8550-iris: Do not reference legacy venus properties
      media: iris: Call correct power off callback in cleanup path
      media: iris: Split power on per variants
      media: iris: Add support for SM8750 (VPU v3.5)

Neil Armstrong (1):
      media: iris: fix module removal if firmware download failed

Stephan Gerhold (2):
      dt-bindings: media: qcom,sm8550-iris: Add X1E80100 compatible
      media: iris: Fix firmware reference leak and unmap memory after load

Vikash Garodia (1):
      MAINTAINERS: Update Vikash Garodia's email address

 .mailmap                                           |   6 +-
 .../bindings/media/qcom,sm8550-iris.yaml           |  16 +-
 .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++
 MAINTAINERS                                        |  21 ++-
 drivers/media/platform/qcom/iris/iris_core.c       |  10 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |  15 +-
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 202 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
 14 files changed, 547 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8750.h

