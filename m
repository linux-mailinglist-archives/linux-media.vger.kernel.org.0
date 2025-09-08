Return-Path: <linux-media+bounces-41950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C11B483CF
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F54189BB66
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 05:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC552264D9;
	Mon,  8 Sep 2025 05:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG89zei1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526545945
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 05:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310867; cv=none; b=M8s0Bg3+tccq/wMu4F+wLGpqdzau7Xmzm4qiG6NvU8kl1xKuRSlPRZ60GdZnhfcgrVC8FlyvH4V8hsa3rvNAyJcNqK4Qq42n0P5UpOhlFqwv0SGglHt3iEA3IA3AXjO2qfHfbBgE4PM/GVNIQ6aMDOCQYG2px8unGWcxCx8te7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310867; c=relaxed/simple;
	bh=7/cwJ3SUkyV0ct7rXhCq6s3E3Vf4utM6sjm/ntEfuEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/Csubh1aRN9D+2H8Y9SyZHPdE6/+hHZwds1WL1tKpe9n59+dxs1XfFv+Fdl9GcrFZ9vLHRnCgZiVqNEI+JLPI+l0v048BfD0wv4r1TmO+3iQnTgmq1Zt8JE76Di01hiulzE8/baVBiw9TzxUUMcCiSYfox5RH0r7ugxIC6NsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG89zei1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF09C4CEF5;
	Mon,  8 Sep 2025 05:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310866;
	bh=7/cwJ3SUkyV0ct7rXhCq6s3E3Vf4utM6sjm/ntEfuEU=;
	h=From:To:Cc:Subject:Date:From;
	b=IG89zei1k+LXM0diZWLdkoVnkL8EX6HFssTlHA6GG8wGoAYbSr8oO1UEzf4WFnfyU
	 PJ3BxCVd8dXh7fTHc+HmvLSPNBYmjdWYiVfS3PUW9NVkDaz1l1LfwLOK19t3Q1CQ+R
	 xJeFpUjdSlAd9tX0SzA6puplgzsyuS9+eY0wPEtyHwcRYlU+Gu/VGq4gpshPxhvSDe
	 gRNMf4SWCgKaH8udp2c1szPLyGZFV+6VWXu6a+3Od9sDDJLpXS23VPWHat/WUpU3DD
	 Vsdqlbac13dPis/Aafv+ftChfK0HJVVcQk2jURZ9kUA3X/PVY85ulATg9qV2oVbBRk
	 jc4tnxuwi/TfQ==
From: bod@kernel.org
To: linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-camss-for-6.18
Date: Mon,  8 Sep 2025 06:54:18 +0100
Message-ID: <20250908055422.18446-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3:

  media: i2c: tc358743: add support for more infoframe types (2025-09-07 10:29:19 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-camss-for-6.18

for you to fetch changes up to 2d10474317358d41c7f746db4819ac4042a5ad11:

  media: qcom: camss: remove a check for unavailable CAMSS endpoint (2025-09-08 06:19:38 +0100)

----------------------------------------------------------------
Adds support for the following SoC flavours:

- sa8755p Lemans
- qcs8300 Monaco
- qcm2290 Agatti

Includes code optimisation from Vladimir

----------------------------------------------------------------
Loic Poulain (5):
      dt-bindings: media: Add qcom,qcm2290-camss
      media: qcom: camss: Add support for TFE (Spectra 340)
      media: qcom: camss: Add CSID 340 support
      media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
      media: qcom: camss: add support for QCM2290 camss

Vikram Sharma (14):
      media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
      media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
      media: dt-bindings: Add qcom,sa8775p-camss compatible
      media: qcom: camss: Add qcom,sa8775p-camss compatible
      media: qcom: camss: Add support for CSIPHY (v1.3.0)
      media: qcom: camss: Add support for CSID 690
      media: qcom: camss: Add support for VFE 690
      media: qcom: camss: Enumerate resources for lemans(sa8775p)
      media: dt-bindings: Add qcom,qcs8300-camss compatible
      media: qcom: camss: Add qcs8300 compatible
      media: qcom: camss: Add CSIPHY support for QCS8300
      media: qcom: camss: enable csid 690 for qcs8300
      media: qcom: camss: enable vfe 690 for qcs8300
      media: qcom: camss: Enumerate resources for QCS8300

Vladimir Zapolskiy (3):
      media: qcom: camss: remove .link_entities callback
      media: qcom: camss: unconditionally set async notifier of subdevices
      media: qcom: camss: remove a check for unavailable CAMSS endpoint

 .../bindings/media/qcom,qcm2290-camss.yaml         | 243 +++++++
 .../bindings/media/qcom,qcs8300-camss.yaml         | 336 ++++++++++
 .../bindings/media/qcom,sa8775p-camss.yaml         | 361 +++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   6 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c | 189 ++++++
 .../camss/{camss-csid-780.c => camss-csid-gen3.c}  |  34 +-
 .../camss/{camss-csid-780.h => camss-csid-gen3.h}  |   8 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   3 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 175 +++++
 drivers/media/platform/qcom/camss/camss-vfe-340.c  | 319 ++++++++++
 .../camss/{camss-vfe-780.c => camss-vfe-gen3.c}    |  76 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  29 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +-
 drivers/media/platform/qcom/camss/camss.c          | 705 +++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h          |   4 +-
 15 files changed, 2400 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (88%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (69%)

