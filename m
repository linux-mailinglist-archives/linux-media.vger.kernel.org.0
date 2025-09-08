Return-Path: <linux-media+bounces-41949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C29B483BC
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9433A3F1E
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 05:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1321DFE26;
	Mon,  8 Sep 2025 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozCnNwyU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0B36B
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 05:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310393; cv=none; b=BZ7lnlpsSa/3h5AvP0Mr0hREaULAgD+vNxZiKWhCP+IvB1l+rBZtHdk/kdg1ChOSPgrt8tOS7Y2sa/RhP/pvRLjC6OvPMOmw8b6NhJol8lEyq38MCUFdMijpd4k+HLLHgfNXxMP7v3Jfb5YaIfMgI0gLLp02HVE3o3F4aTvn/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310393; c=relaxed/simple;
	bh=HS/JXwSTb7Ft4ufjqLDUEx9XPZDSMfqRvd0375d7tN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2x4m3iAoQQqJPlay2iXpdgJpJjWWjBP5Us+nE/RX1o5J3C+YJfTDkvrRUlTNzQ7p3OI7yB2m0YA6NYHuFO7UCwaeSHjU/Iz5cocZqxzVXzk24iLGXFFYO02ealyaTiENzS/4f3VrrOX2sgUm5vryvt1LbgQJwTtXVPiqe+3Bm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozCnNwyU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D819C4CEF5;
	Mon,  8 Sep 2025 05:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310392;
	bh=HS/JXwSTb7Ft4ufjqLDUEx9XPZDSMfqRvd0375d7tN0=;
	h=From:To:Cc:Subject:Date:From;
	b=ozCnNwyUcxbR0R6A6KuwjRMl1bsZZ3yjbZz8CNNO0M4tnaa8neER6IQwcxKLxMTdu
	 jDCrAEYICjHcNE5QX7/LHgOQbuFdzx1FInP/aFtjeiY+UaCuL4mXw6iCwZfWEc5qMX
	 iTMeHj/M/vwX5a0QVFMy6q62StMLjsZy+wv79g8DULH64tD+3jy8ueVhrx8WDuQAHz
	 BYRN5cWHpQx7IgGkFtomPImj9a+G38pR82x7w0fxKHoQwM8DapyoiTp93Ed+KHIF/F
	 8d1PQbOVe/yJ6F6rquY0cZIdpH9i16vXWxzD8tnBtloyq73EFBxWH97k1BXv2WJQ66
	 oDcoPLbUgfnrg==
From: bod@kernel.org
To: linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-iris-encoder-plus-dependent-fixes-for-6.18
Date: Mon,  8 Sep 2025 06:46:24 +0100
Message-ID: <20250908054627.17976-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 34837c444cd42236b2b43ce871f30d83776a3431:

  media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-04 10:37:05 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-encoder-plus-dependent-fixes-for-6.18

for you to fetch changes up to f656d5fe3ca0f018e08082a8a756cf4972859c57:

  media: iris: add VPU33 specific encoding buffer calculation (2025-09-05 22:02:18 +0100)

----------------------------------------------------------------
This tag contains:

- A number of Fixes:
- An set of patches to enable the encoder which depend
  on the Fixes: in this PR to apply cleanly
- A power-sequencing update from Neil which also depends
  on code in this tag

platform-qcom-iris-generic-fixes-updates-for-6.18 should be
merged first.

----------------------------------------------------------------
Dikshita Agarwal (25):
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
 drivers/media/platform/qcom/iris/iris_vidc.c       | 298 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 922 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 +-
 33 files changed, 5050 insertions(+), 716 deletions(-)
 create mode 100644 drivers/media/platform/qcom/iris/iris_common.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_common.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_venc.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_venc.h

