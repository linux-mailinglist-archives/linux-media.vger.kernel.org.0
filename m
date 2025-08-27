Return-Path: <linux-media+bounces-41134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C7B37E39
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 10:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC0D1898A28
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 08:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265CE341651;
	Wed, 27 Aug 2025 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebY9bhsd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BE242D88;
	Wed, 27 Aug 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285074; cv=none; b=rG9bK60Z6yiEAHMvRFvRp0N0rAyyXfsV9hWmJt6f4VUOqjOJsZYxgFyqKT7rvHlqJ7sO46LP/eaJCYR2DknKydKkZ1jxzHXMMrMEW7XtEVW8FMS2S+zxyEBuLdsh2aTjtj216XhMrxYF4CNXI58LaNEb2/skkFwI+WnhNOElVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285074; c=relaxed/simple;
	bh=mYjxTPeHhDhT1wm55WOQFjAfq4GLac+lULuomHlutMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YdwGt0OuQ8SBnKCfYPhZw/TEuWAixYfcLTPBQJlU1v5xNIUSlPoiAIBj7cSRdArkqdAqlpkGTtOKB2fwROdg9C7ueFmkKpSar2kt4Sd1+Sluyjiy/rlDEs00vTypABtZVCgBuko1Z2xz3+tENfKpPSYibpNv60QPcRvvz0KyItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebY9bhsd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA60C113D0;
	Wed, 27 Aug 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756285074;
	bh=mYjxTPeHhDhT1wm55WOQFjAfq4GLac+lULuomHlutMs=;
	h=Date:From:To:Cc:Subject:From;
	b=ebY9bhsdRq+pD/UVwGHl1zn9LC5UKp11mKazk597hex/O7RobaTUKVOJUCih0OF8r
	 yB68OSjqkx0lVo4WiInWYyxnb0gPYmLvGFvbmzKMphs+yvdIaVHnIqO3TumPSsfgEo
	 dSFoIeT/Jz5pyd2qXgG+QQJQYwmiqtSVBOMB6GuHeEXj5vN/VU3ukl22LwwFNvynu7
	 psQw3uj7/PUyEd6sdgaFgfz4FbA8FT55fGnyblEeEzDnkRq335AP6Kjtl+/UqW/qXJ
	 E/F1r+TbvrqICMxb2Gntn2pvt7vTf81HLA35jTYWhoehesW5ONqoHWUku4TIAUt2XH
	 SrDmO/30YmH8Q==
Date: Wed, 27 Aug 2025 10:57:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.17-rc4] media fixes
Message-ID: <20250827105749.32f7cc29@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.17-2

For:
  - drop the redundant pm_runtime_mark_last_busy() on rkvdec driver;
  - fix an error handling in probe at rkvdec driver;
  - fix an issue affecting lt6911uxe/lt6911uxc related to CSI-2
    GPIO pins at int3472.

Regards,
Mauro

---

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.17-2

for you to fetch changes up to 6f6fbd9a0c5a75eee0618c1499cf73cc770b3f52:

  media: Remove redundant pm_runtime_mark_last_busy() calls (2025-08-18 09:55:08 +0200)

----------------------------------------------------------------
[GIT PULL for v6.17-rc4] media fixes

----------------------------------------------------------------
Christophe JAILLET (1):
      media: rkvdec: Fix an error handling path in rkvdec_probe()

Dan Carpenter (1):
      media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()

Dongcheng Yan (1):
      platform/x86: int3472: add hpd pin support

Sakari Ailus (2):
      media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls
      media: Remove redundant pm_runtime_mark_last_busy() calls

 drivers/media/i2c/alvium-csi2.c                         |  1 -
 drivers/media/i2c/ccs/ccs-core.c                        |  7 +------
 drivers/media/i2c/dw9768.c                              |  1 -
 drivers/media/i2c/gc0308.c                              |  3 ---
 drivers/media/i2c/gc2145.c                              |  3 ---
 drivers/media/i2c/imx219.c                              |  2 --
 drivers/media/i2c/imx283.c                              |  3 ---
 drivers/media/i2c/imx290.c                              |  3 ---
 drivers/media/i2c/imx296.c                              |  1 -
 drivers/media/i2c/imx415.c                              |  1 -
 drivers/media/i2c/mt9m114.c                             |  6 ------
 drivers/media/i2c/ov4689.c                              |  3 ---
 drivers/media/i2c/ov5640.c                              |  4 ----
 drivers/media/i2c/ov5645.c                              |  3 ---
 drivers/media/i2c/ov64a40.c                             |  7 +------
 drivers/media/i2c/ov8858.c                              |  2 --
 drivers/media/i2c/st-mipid02.c                          |  2 --
 drivers/media/i2c/tc358746.c                            |  5 -----
 drivers/media/i2c/thp7312.c                             |  4 ----
 drivers/media/i2c/vd55g1.c                              |  4 ----
 drivers/media/i2c/vd56g3.c                              |  4 ----
 drivers/media/i2c/video-i2c.c                           |  4 ----
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c    |  4 ----
 .../media/platform/chips-media/wave5/wave5-vpu-enc.c    |  5 -----
 drivers/media/platform/nvidia/tegra-vde/h264.c          |  2 --
 drivers/media/platform/qcom/iris/iris_hfi_queue.c       |  1 -
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c    |  2 --
 drivers/media/platform/rockchip/rkvdec/rkvdec.c         | 17 +++++++++--------
 drivers/media/platform/verisilicon/hantro_drv.c         |  1 -
 drivers/media/rc/gpio-ir-recv.c                         |  4 +---
 drivers/platform/x86/intel/int3472/discrete.c           |  6 ++++++
 include/linux/platform_data/x86/int3472.h               |  1 +
 32 files changed, 19 insertions(+), 97 deletions(-)

