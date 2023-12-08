Return-Path: <linux-media+bounces-1949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504B80A47E
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 202DAB20C94
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662F51D536;
	Fri,  8 Dec 2023 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MUYrKADp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED143115
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 05:35:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0509552;
	Fri,  8 Dec 2023 14:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702042475;
	bh=ayd39DT2t7pd0x1T+WGKsh7ricLDPtD/ZHi5s234Fno=;
	h=Date:From:To:Cc:Subject:From;
	b=MUYrKADp8/KSUDALHwzpBoCP3mgRp5rSFkNDI8lmUbzB8wsv6yxkTWvQ1gIEdxrPi
	 kLhVCkZPw9OSXzpyy7pF+Z3/Wnd/doqyvPl4+GNY1+fJRuCMJdC5FRiJa0UllpjfNM
	 MZ4M9m1kdK0Dz6akyfRN03TUkGTqW+dZxB9TLCro=
Date: Fri, 8 Dec 2023 15:35:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>
Subject: [GIT PULL FOR v6.8] rkisp1 fixes and enhancements
Message-ID: <20231208133524.GC12450@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

The following changes since commit e55a9482888da73eeadde5f13ef8bafce68a38ed:

  media: ov9640: Don't set format in sub-device state (2023-12-08 10:04:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-rkisp1-next-20231208

for you to fetch changes up to ab3da430aa7d890735f24e8be32747762f709313:

  media: rkisp1: resizer: Stop manual allocation of v4l2_subdev_state (2023-12-08 15:25:53 +0200)

----------------------------------------------------------------
Miscellaneous fixes and improvements to the rkisp1 driver

----------------------------------------------------------------
Laurent Pinchart (1):
      media: rkisp1: resizer: Stop manual allocation of v4l2_subdev_state

Mehdi Djait (1):
      media: dt-bindings: media: rkisp1: Fix the port description for the parallel interface

Paul Elder (3):
      media: rkisp1: regs: Consolidate MI interrupt wrap fields
      media: rkisp1: debug: Add register dump for IS
      media: rkisp1: debug: Count completed frame interrupts

Tomi Valkeinen (6):
      media: rkisp1: Fix media device memory leak
      media: rkisp1: Fix memory leaks in rkisp1_isp_unregister()
      media: rkisp1: Drop IRQF_SHARED
      media: rkisp1: Fix IRQ handler return values
      media: rkisp1: Store IRQ lines
      media: rkisp1: Fix IRQ disable race issue

 .../devicetree/bindings/media/rockchip-isp1.yaml   | 11 +++---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h | 12 ++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    | 14 +++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-debug.c  |  6 ++++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 41 ++++++++++++++++------
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 23 ++++++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  9 ++---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 38 ++++++++++++--------
 8 files changed, 114 insertions(+), 40 deletions(-)

-- 
Regards,

Laurent Pinchart

