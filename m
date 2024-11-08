Return-Path: <linux-media+bounces-21154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A18179C1D63
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 13:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2611B1C22DFA
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 12:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33ED1E8838;
	Fri,  8 Nov 2024 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEbBwRkC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB71D0F5C;
	Fri,  8 Nov 2024 12:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070479; cv=none; b=BKnFuL9CpI2Z+emTDfJ8NIySDHJCbPMDkLiDs/IbCK/PFt/a9wRPPxvpD6i5atpJDhn9y8ZAx/VxNxMMY0+3i3jkCVaURFc3ShQ830U45Hy8AeoXOvQqmvDrYjszvQcrcQmqzIDLaqZ4Zaa8nz7PTMPAHWl6CZLlrugfYcTIXyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070479; c=relaxed/simple;
	bh=vI/L7T2kf8SEZ0IGSHoKyhsVaqgwmft6WDe/gg4edVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A1ebgEINP6UeOrDQuNCs7jFIa+Y7CgplnN4wfSC4D92MWnduaK4giXuvInOfx5z0DEvPWosdxqy3PbkN5hfYCWTHgt52v/1t/e46mUJVgU+6C5Ig0waDTQDPbwt94EtfzfkZkr3IrainLqJlxAb9Y3/k5jU2Hb3VOyQmCSAKoqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEbBwRkC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776D4C4CECD;
	Fri,  8 Nov 2024 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731070478;
	bh=vI/L7T2kf8SEZ0IGSHoKyhsVaqgwmft6WDe/gg4edVg=;
	h=Date:From:To:Cc:Subject:From;
	b=qEbBwRkCy6woXRpnc55uN0JeSLd88T76zxySWhiVCo2cJ+kG/yG1bCjytKQWE42Xz
	 XctuRb08ZAYa2SZaJ/d0JoF9awykWGUYBhpbkzWDJTAy8PWSkgefSezuksueXLXmSi
	 ikDMGERPb9RZISztG6KjXOmz5vF8kcIe+E71sR2pL0MflnrCIIimsQX6Vlb3wu/oT2
	 ilSM+6+2HgiaNGI6mVNK5USnMDxunG64t/fTObWPtxmjbpNyUPP/Nx4H5XbHyx5Pg/
	 LR6+qrMMdhzxKtkQB5yGWF8maxmNWEWix3RD5LOdEVXSD+/EI3DwmNr5e5MmE/r7XV
	 xvzfEe2i7e2Xw==
Date: Fri, 8 Nov 2024 13:54:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.12-rc7] media fixes
Message-ID: <20241108135433.40c7a4fa@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.12-2

For:
  - dvb-core fixes at vb2 check and at device registration;
  - v4l2-core: fix an issue with error handling for VIDIOC_G_CTRL;
  - vb2 core: fix an issue at vb plane copy logic;
  - videobuf2-core: copy vb planes unconditionally;
  - vivid: fix buffer overwrite when using > 32 buffers;
  - vivid: fix a potential division by zero due to an issue at v4l2-tpg;
  - some spectre vulnerability fixes;
  - several OOM access fixes;
  - some buffer overflow fixes.

Regards,
Mauro

---

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.12-2

for you to fetch changes up to 702a47ce6dde72f6e247b3c3c00a0fc521f9b1c6:

  media: videobuf2-core: copy vb planes unconditionally (2024-11-07 12:55:46 +0100)

----------------------------------------------------------------
media fixes for v6.12-rc7

----------------------------------------------------------------
Hans Verkuil (2):
      media: dvb-core: add missing buffer index check
      media: vivid: fix buffer overwrite when using > 32 buffers

Mauro Carvalho Chehab (14):
      media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
      media: v4l2-tpg: prevent the risk of a division by zero
      media: dvbdev: prevent the risk of out of memory access
      media: dvb_frontend: don't play tricks with underflow values
      media: mgb4: protect driver against spectre
      media: av7110: fix a spectre vulnerability
      media: s5p-jpeg: prevent buffer overflows
      media: ar0521: don't overflow when checking PLL values
      media: cx24116: prevent overflows on SNR calculus
      media: adv7604: prevent underflow condition when reporting colorspace
      media: stb0899_algo: initialize cfr before using it
      media: cec: extron-da-hd-4k-plus: don't use -1 as an error code
      media: pulse8-cec: fix data timestamp at pulse8_setup()
      media: dvbdev: fix the logic when DVB_DYNAMIC_MINORS is not set

Tudor Ambarus (1):
      media: videobuf2-core: copy vb planes unconditionally

 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |  6 ++---
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |  2 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |  3 +++
 drivers/media/common/videobuf2/videobuf2-core.c    | 28 ++++++++++++----------
 drivers/media/dvb-core/dvb_frontend.c              |  4 ++--
 drivers/media/dvb-core/dvb_vb2.c                   |  8 ++++++-
 drivers/media/dvb-core/dvbdev.c                    | 16 +++++++++----
 drivers/media/dvb-frontends/cx24116.c              |  7 +++++-
 drivers/media/dvb-frontends/stb0899_algo.c         |  2 +-
 drivers/media/i2c/adv7604.c                        | 26 +++++++++++++-------
 drivers/media/i2c/ar0521.c                         |  4 ++--
 drivers/media/pci/mgb4/mgb4_cmt.c                  |  2 ++
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    | 17 ++++++++-----
 drivers/media/test-drivers/vivid/vivid-core.c      |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |  4 +++-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |  2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           | 17 ++++++++-----
 drivers/staging/media/av7110/av7110.h              |  4 +++-
 drivers/staging/media/av7110/av7110_ca.c           | 25 ++++++++++++-------
 20 files changed, 118 insertions(+), 63 deletions(-)


