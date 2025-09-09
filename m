Return-Path: <linux-media+bounces-42087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324DCB4A89C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E13BF160B8E
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC662D640A;
	Tue,  9 Sep 2025 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROmO3g+d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554772D63E5
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410981; cv=none; b=AaLHeTFaCK8qqFOgv33tHfsNz3J1MxAZL5NND+OpppTa9nmkjZWMWr11A++yCfoqEhT0HqfQ10Jp96wsX/yrnqvVsd7QtXtoYLqfpRdtKU3R/e7KFFUQD7pdzYDoU4TVruvEyXuasNdFbiyVG8VL3W+zbFBDujOw0/3HNN8c3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410981; c=relaxed/simple;
	bh=iLMjYHlCTqBemEBRDKrWRCBqIWmEb8j/pg+V3UWzBhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EcO5w2QQmOy0aQMdmGs3Tu4a+2x2wnVHnRx2gWIaoU98jz4oyDLjH+MvNf6HNuJSexgBFGbtqtVsuY7tE3WiNDy8/c5EPiKwqaX1B8Sqzdp1kQtkOiisZzTygkXMNoNMhrKHzKBxT8sjHNWe1aKQXCtfnU6xCwSJ2CDP2SVrx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROmO3g+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B4BC4CEFA;
	Tue,  9 Sep 2025 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757410980;
	bh=iLMjYHlCTqBemEBRDKrWRCBqIWmEb8j/pg+V3UWzBhA=;
	h=From:To:Cc:Subject:Date:From;
	b=ROmO3g+dCueJVe00mb8+lSEY+r29owWTm2SIlEpE88UYbpimP5VHL/wT6MafIn6ey
	 hBF9NfleAAs0icsIA/TAqgD753dzg/lvk/Ctzr8skdS+DOx+x+aECu1b2d6B7qT6Vh
	 ZerFcQGUEwQeCfovS6qpFSqLBuyMLGSVxUN/cS6nNjZKUn+rx21aJtA0/Xgfo8iTSY
	 To4iIBp4BklkYy66uMr0cG+7SFs/50AJc5+i7paeH6J8Go7fCmOW8AbJorO+KoB6Bb
	 5/vNcdKxPWvoi+pEW2H0tnl4SpjTPz8cx7Zfb2pEsahRvO/SNSa8G4gcA/FRkQNShV
	 DHvxhWeH4KWfQ==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-iris-encoder-plus-dependent-fixes-for-6.18-v2
Date: Tue,  9 Sep 2025 10:42:53 +0100
Message-ID: <20250909094256.40537-1-bod@kernel.org>
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

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-encoder-plus-dependent-fixes-for-6.18-v2

for you to fetch changes up to 105d6bc8583498dee6b8c665143a8d8eef135610:

  media: iris: add VPU33 specific encoding buffer calculation (2025-09-09 09:59:37 +0100)

----------------------------------------------------------------
This tag contains:

- A number of Fixes:
- An set of patches to enable the encoder which depend
  on the Fixes: in this PR to apply cleanly
- A power-sequencing update from Neil which also depends
  on code in this tag
- v2 missed inclusion of "Fix buffer count reporting.."
  from Dikshita - fixed in v2.

platform-qcom-iris-generic-fixes-updates-for-6.18-v2 should be
merged first.

----------------------------------------------------------------
Dikshita Agarwal (26):
      media: iris: Fix buffer count reporting in internal buffer check
      media: iris: Report unreleased PERSIST buffers on session close
      media: iris: Fix memory leak by freeing untracked persist buffer
      media: iris: Fix port streaming handling
      media: iris: Allow substate transition to load resources during output streaming
      media: iris: Always destroy internal buffers on firmware release response
      media: iris: Update vbuf flags before v4l2_m2m_buf_done
      media: iris: Simplify session stop logic by relying on vb2 checks
      media: iris: Allow stop on firmware only if start was issued.
      media: iris: Send dummy buffer address for all codecs during drain
      media: iris: Fix missing LAST flag handling during drain
      media: iris: Fix format check for CAPTURE plane in try_fmt
      media: iris: Add support for video encoder device
      media: iris: Initialize and deinitialize encoder instance structure
      media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
      media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
      media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
      media: iris: Add encoder support for V4L2 event subscription
      media: iris: Add support for G/S_SELECTION for encoder video device
      media: iris: Add support for G/S_PARM for encoder video device
      media: iris: Add platform-specific capabilities for encoder video device
      media: iris: Add V4L2 streaming support for encoder video device
      media: iris: Set platform capabilities to firmware for encoder video device
      media: iris: Allocate and queue internal buffers for encoder video device
      media: iris: Add support for buffer management ioctls for encoder device
      media: iris: Add support for drain sequence in encoder video device

Neil Armstrong (1):
      media: iris: add VPU33 specific encoding buffer calculation

 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     | 222 ++++-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
 drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
 drivers/media/platform/qcom/iris/iris_common.h     |  18 +
 drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 ++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 482 ++++++++---
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 +++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
 .../platform/qcom/iris/iris_platform_common.h      |  76 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 526 +++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 +++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      | 236 +++++-
 drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_state.h      |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
 drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
 drivers/media/platform/qcom/iris/iris_venc.c       | 579 +++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 299 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 922 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 +-
 33 files changed, 5051 insertions(+), 716 deletions(-)
 create mode 100644 drivers/media/platform/qcom/iris/iris_common.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_common.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_venc.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_venc.h

