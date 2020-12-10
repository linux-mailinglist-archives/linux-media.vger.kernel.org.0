Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332CB2D591F
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgLJLTY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 06:19:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:37966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387474AbgLJLTI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 06:19:08 -0500
Date:   Thu, 10 Dec 2020 12:18:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607599103;
        bh=BIAsCliAqIddZptYimb/AB3OuSMn8q2vbSsyrx5/zyE=;
        h=From:To:Cc:Subject:From;
        b=OX+b3TsJPuk7ntvycWom/n6ehtu1Kxh1R5bCcomRNtFadwdY/9GtLx9qCCDsCaP42
         RxXS2mlamDMZwHlUHJBw+dY06q1PiED19P6d6XFVwlsT0W48TE/lYw90hjh35nKLR5
         eZlRulg3YAG5PUK/IZF/yTBoPaONhwKgg2UJX1KuepOypC3MQYJjEM0vd9LN8Z7Cva
         NAIz2dxyXOiGs5b1iPCK4QePaP8MNA+ppzFigO2m3lvdEH1w0xtCuHzrjAquvvuXzp
         f//fqda26fdGBhsYkHVg/Mu5J8UHHFmMklNmfpgC5qqk32N+AzhGy4Gk3Zhzqs8iFX
         ewkMPoujfH/DA==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.10] media fixes
Message-ID: <20201210121818.2d5c0353@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-4

For a couple of fixes:

- videobuf2: fix a DMABUF bug, preventing it to properly handle
  cache sync/flush;
- vidtv: an usage after free and a few sparse/smatch warning fixes;
- pulse8-cec: a duplicate free and a bug related to new firmware usage;
- mtk-cir: fix a regression on a clock setting.

Thanks,
Mauro

The following changes since commit 44f28934af141149959c4e6495bb60c1903bda32:

  media: vidtv.rst: add kernel-doc markups (2020-11-26 08:05:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-4

for you to fetch changes up to 3d1387b3b8f6cc1ccdbb5f0d7af24df02f4baef9:

  media: vidtv: fix some warnings (2020-12-08 08:15:49 +0100)

----------------------------------------------------------------
media fixes for v5.10-rc8

----------------------------------------------------------------
Colin Ian King (1):
      media: [next] media: vidtv: fix a read from an object after it has been freed

Hans Verkuil (2):
      media: pulse8-cec: fix duplicate free at disconnect or probe error
      media: pulse8-cec: add support for FW v10 and up

Mauro Carvalho Chehab (2):
      media: vidtv: fix kernel-doc markups
      media: vidtv: fix some warnings

Sean Young (1):
      media: mtk-cir: fix calculation of chk period

Sergey Senozhatsky (1):
      media: vb2: set cache sync hints when init buffers

 drivers/media/cec/usb/pulse8/pulse8-cec.c        | 52 ++++++++++++++++--------
 drivers/media/common/videobuf2/videobuf2-core.c  | 11 +++++
 drivers/media/rc/mtk-cir.c                       |  9 ++--
 drivers/media/test-drivers/vidtv/vidtv_channel.c |  4 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.h     |  8 ++--
 drivers/media/test-drivers/vidtv/vidtv_s302m.c   |  4 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.h      |  2 +-
 7 files changed, 58 insertions(+), 32 deletions(-)

