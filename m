Return-Path: <linux-media+bounces-31092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62CA9DA73
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 13:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D27E47B1D29
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 11:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0589022CBD5;
	Sat, 26 Apr 2025 11:43:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9A22615
	for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745667782; cv=none; b=NMp+7NYJDpbEhZ6R+CyN8OHkI5189Ib4C0OMbJxgDPEi6K3OysB2h/KvqMAY4S2KUSOOZVIWD9xDUuZn/FLdG7wMWmiGOOmiOFl5O/+D+pR0qhBEWHQwzXuvxGk6OH6bLUXzYTBVSl8yxbZy2zTrAnpqGouBugM2NxXTle62qK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745667782; c=relaxed/simple;
	bh=DQHhdUD4xA3JZbqgAP6ZiCcGMoQqVPNoEKAWtu1LYXc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aWSNfs4XYFd7FKrFmyDfDJJczFxBeuIHxskir5BpKjoUEt4epV+4/bs9DmXrB2HPJhUU2IT0XZmpe08X0ZwdRgnYB5Pn58Fz4M50/5O5U5Fipt8VhdNlFgdUMZx1IYVb1BQDIBGw2g31J/skIkiKGDbKzWirVeWfi/AQjif+R/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BA6C4CEE2;
	Sat, 26 Apr 2025 11:43:01 +0000 (UTC)
Message-ID: <c44afffe-383d-4636-b7fa-6cc63257e0be@xs4all.nl>
Date: Sat, 26 Apr 2025 13:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.16] media: various fixes
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

Here are a bunch of patches:

- I finally managed to test my omap3isp patch dropping the wait_prepare/finish
  callbacks. After this is merged the only remaining user is drivers/media/dvb-core/dvb_vb2.c.
  I have a patch for that:

  https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=vb2_wait&id=65ec04d96f7c2845b6a1db32ad99684b05c13203

  but it needs more review.

- Changes all over to report rectangles in a consistent format. I have already updated
  v4l-utils to do the same thing there.

- A cec-funcs.h change to make it easier to understand.

- A tc358743 HPD fix.

Regards,

	Hans

The following changes since commit 6f1b74c1a686c93b404bd57d73577a6b5b19c5c3:

  media: i2c: imx334: switch to {enable,disable}_streams (2025-04-25 10:15:39 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.16h

for you to fetch changes up to 780f453708104460b92b5f7da986e5558bad6d8e:

  media: uapi: cec-funcs.h: use CEC_LOG_ADDR_BROADCAST (2025-04-25 14:28:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (9):
      media: omap3isp: drop wait_prepare/finish callbacks
      media: staging: atomisp/starfive: use (t,l)/wxh format for rectangle
      media: usb: em28xx: use (t,l)/wxh format for rectangle
      media: vivid: use (t,l)/wxh format for rectangle
      media: i2c: imx283: use (t,l)/wxh format for rectangle
      media: pci: zoran: use (t,l)/wxh format for rectangle
      media: platform: use (t,l)/wxh format for rectangle
      media: tc358743: ignore video while HPD is low
      media: uapi: cec-funcs.h: use CEC_LOG_ADDR_BROADCAST

 drivers/media/i2c/imx283.c                                     |  2 +-
 drivers/media/i2c/tc358743.c                                   |  4 ++++
 drivers/media/pci/zoran/zoran_card.c                           |  2 +-
 drivers/media/pci/zoran/zr36016.c                              |  2 +-
 drivers/media/pci/zoran/zr36050.c                              |  2 +-
 drivers/media/pci/zoran/zr36060.c                              |  2 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c              |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c           |  4 ++--
 drivers/media/platform/nxp/dw100/dw100.c                       |  8 ++++----
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c            |  8 ++++----
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c            |  2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c        |  2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-capture.c       |  6 +++---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c          |  8 ++++----
 drivers/media/platform/samsung/s3c-camif/camif-capture.c       | 12 ++++++------
 drivers/media/platform/st/sti/bdisp/bdisp-debug.c              |  8 ++++----
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c               | 14 +++++++-------
 drivers/media/platform/st/sti/delta/delta-debug.c              |  8 ++++----
 drivers/media/platform/st/stm32/stm32-dcmi.c                   | 10 +++++-----
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c | 10 +++++-----
 drivers/media/platform/ti/am437x/am437x-vpfe.c                 |  2 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c                  | 19 +------------------
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c           | 20 ++++++++++----------
 drivers/media/usb/em28xx/em28xx-video.c                        |  2 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c                |  4 ++--
 drivers/staging/media/starfive/camss/stf-isp.c                 |  2 +-
 include/uapi/linux/cec-funcs.h                                 | 40 ++++++++++++++++++++--------------------
 27 files changed, 96 insertions(+), 109 deletions(-)

