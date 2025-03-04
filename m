Return-Path: <linux-media+bounces-27460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B7A4DC16
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 352D37A2EAA
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834BC20127A;
	Tue,  4 Mar 2025 11:11:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D96F201256
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086685; cv=none; b=ken2xJa9PbKBpSp0lAi0EYwtwYrJ3sGhFVTqrUMvh00KgUpUnpv44AdyTno2wnUMfE5CYlp2C7Nv6+jJe5L0Ya9WFFJ2YrlUFpHhmI7cx/LCuysVqZN3cPGTeA9gODMSQ7Ly8RSeXynCF8mEWGSOt5Ygyf266HTeSKAKC/MnZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086685; c=relaxed/simple;
	bh=mSyZ19VUAzxjZWOqvwvbz2ObjRm8m6/x8B+ehQs7LoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=k967/jaSnDhFvV9dYh1DAj6C6DD8Uc52l+AF5dsOGkCYA9dmDPUcgPKK984dG1iveHhFAcZvNb5unA5kA9xuUONrKXkG4Az+jzZQLIPbaywc4SXuv3MfkElcYlOmiiYdwyDAUMMcPeTRaXZIJVUb9Ixe6xAXqKLLX08DTK72axo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943DFC4CEE9
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:24 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/8] media: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:06 +0100
Message-ID: <cover.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up of:

https://lore.kernel.org/linux-media/20250301222207.GA15528@pendragon.ideasonboard.com/T/#t

Standardize logging of rectangles to the "(t,l)/wxh" format.

Mostly this logs v4l2_rect structs, but the zoran patch has
some internal rectangle fields, where either all four fields
are signed or all are unsigned. So the format specifiers are
a bit different there.

Regards,

	Hans

Hans Verkuil (8):
  media: v4l2-tpg: use (t,l)/wxh format for rectangle
  media: v4l2-core: use (t,l)/wxh format for rectangle
  staging: media: atomisp/starfive: use (t,l)/wxh format for rectangle
  media: usb: em28xx: use (t,l)/wxh format for rectangle
  media: vivid: use (t,l)/wxh format for rectangle
  media: i2c: imx283: use (t,l)/wxh format for rectangle
  media: pci: zoran: use (t,l)/wxh format for rectangle
  media: platform: use (t,l)/wxh format for rectangle

 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  8 ++++----
 drivers/media/i2c/imx283.c                    |  2 +-
 drivers/media/pci/zoran/zoran_card.c          |  2 +-
 drivers/media/pci/zoran/zr36016.c             |  2 +-
 drivers/media/pci/zoran/zr36050.c             |  2 +-
 drivers/media/pci/zoran/zr36060.c             |  2 +-
 .../media/platform/mediatek/mdp/mtk_mdp_m2m.c |  2 +-
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  4 ++--
 drivers/media/platform/nxp/dw100/dw100.c      |  8 ++++----
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  8 ++++----
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  2 +-
 .../samsung/exynos4-is/fimc-capture.c         |  6 +++---
 .../platform/samsung/exynos4-is/fimc-lite.c   |  8 ++++----
 .../samsung/s3c-camif/camif-capture.c         | 12 +++++------
 .../media/platform/st/sti/bdisp/bdisp-debug.c |  8 ++++----
 .../media/platform/st/sti/bdisp/bdisp-v4l2.c  | 14 ++++++-------
 .../media/platform/st/sti/delta/delta-debug.c |  8 ++++----
 drivers/media/platform/st/stm32/stm32-dcmi.c  | 10 +++++-----
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 10 +++++-----
 .../media/platform/ti/am437x/am437x-vpfe.c    |  2 +-
 .../test-drivers/vivid/vivid-kthread-cap.c    | 20 +++++++++----------
 drivers/media/usb/em28xx/em28xx-video.c       |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  6 +++---
 drivers/media/v4l2-core/v4l2-ioctl.c          | 20 +++++++++----------
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 ++--
 .../staging/media/starfive/camss/stf-isp.c    |  2 +-
 27 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.47.2


