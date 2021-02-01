Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D21230AC1E
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 16:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhBAP5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 10:57:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:49376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229763AbhBAP4z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 10:56:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A99861481;
        Mon,  1 Feb 2021 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612194975;
        bh=Yib7MU9o2CBsKHRtaky5fvx5TFvV2tUtm3Yrgg6xbxQ=;
        h=Date:From:To:Cc:Subject:From;
        b=XHY7hUS7vIgjRJbCXkNXlvs/ieEqho2NQUM2HedTNykGuchufYc98n95hOxjdaMPb
         2nERST7VT4DvNO/KMz963Ty6XDimvNySSxU+lQjmTe6p/D/WdCki6kwKgnvIyF7Yzc
         AD/R8NVRpGqtsbhlhyHSu2L7wKG0+1S7LEIeVZ3Py/6vZDFw+8Md3axXEBMinyu5vL
         AWBHC9ewAAg8bdJW3KdJ9uY2x3ezhcbDLEtjEFhZ3eAfo+Qe7CdzFA9PJOc0WeGeMW
         hsR8HuQvxvwMKA/1WKG0Wl8bt9U99KkQ5CNeTzMpU4x04ZA6sItSH93F3qrkGankAV
         6wmrheDPsprAQ==
Date:   Mon, 1 Feb 2021 16:56:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.11-rc7] media fixes
Message-ID: <20210201165609.21443571@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-3

The rockship rkisp1 driver will be promoted from stage on Kernel 5.11.
While not too late, do a few uAPI changes which are needed to better
support its functionalities.

Regards,
Mauro

-

The following changes since commit e081863ab48d9b2eee9e899cbd05752a2a30308d:

  media: hantro: Fix reset_raw_fmt initialization (2021-01-26 19:16:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-3

for you to fetch changes up to ef357e02b6c420dc2d668ebf3165838c77358acd:

  media: rockchip: rkisp1: extend uapi array sizes (2021-01-28 11:31:43 +0100)

----------------------------------------------------------------
media fixes for v5.11-rc7

----------------------------------------------------------------
Dafna Hirschfeld (3):
      media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
      media: rkisp1: stats: remove a wrong cast to u8
      media: rkisp1: stats: mask the hist_bins values

Heiko Stuebner (3):
      media: rockchip: rkisp1: reduce number of histogram grid elements in uapi
      media: rockchip: rkisp1: carry ip version information
      media: rockchip: rkisp1: extend uapi array sizes

 Documentation/admin-guide/media/rkisp1.rst         | 16 ++++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 21 +++---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  5 +-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  1 +
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  | 11 +--
 include/uapi/linux/rkisp1-config.h                 | 86 +++++++++++++++++++---
 6 files changed, 114 insertions(+), 26 deletions(-)

