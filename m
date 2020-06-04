Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1F61EE591
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgFDNpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:45:04 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44415 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726415AbgFDNpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 09:45:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id gqB1j2vDlnv5ngqB4juIbn; Thu, 04 Jun 2020 15:45:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591278302; bh=G53ENnm/UjOpaZusiLzzWOlK8nfMcbfwukP66+vVrI8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T1AJ7XcBmdqymmBP6z79g3Ln9kscDyEGbcYKFAsZaUWq8NtQiyHn4rk++cSPlm/tz
         /zUwHh8RkdO8yajvnG5f34PbdAsiC8ZVo+ZykMABBdx0ZoTcSa98c96SX4pGbpVK1r
         xvBBoBuQFSlNZS2vyZjqQQakB8t3OqfG+KqALIyhCLiC+02lt4HNB9G7GCHXWSowZZ
         j+d6hwEZmT1fxZ1XDFwVAYnUOZH1XSyGZDOAXFiN0G79NsJYzp7ivR3ntS2nviHdQe
         AsguziHlq/84X2zDkRnf02DwGeAkvwVgihcL+WIeD7RjEClqjRxi+ENsVkoiWQxE/x
         5s6SWeCK+50RQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.8] Various fixes for v5.8
Message-ID: <3fd4dd63-530b-0341-8579-a5759d8bb07a@xs4all.nl>
Date:   Thu, 4 Jun 2020 15:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG0S2RbEmj+G4PrD/docPnx9yyte0gy/B11THp66zz5bdCXt87I5yZeAaMxord68tTHALSOiu/f+qlK6wpOey5eewVdrE8aXx/m5Gd1o6tFnlZRlTxDP
 P78KJjxVDS7+P0/KY0q2RrLIPw6sR7nePDZd/xhM4d0oTu7MldkKojqs/9RDPkcLV0EvNSQRzYUsKQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 938b29db3aa9c293c7c1366b16e55e308f1a1ddd:

  media: Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 15:47:02 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8a

for you to fetch changes up to 36344121e87087b345167f260d08bf888528e499:

  media: rkvdec: Fix H264 scaling list order (2020-06-04 15:24:52 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Geert Uytterhoeven (1):
      medium: cec: Make MEDIA_CEC_SUPPORT default to n if !MEDIA_SUPPORT

Jernej Skrabec (1):
      media: cedrus: Implement runtime PM

Jonas Karlman (2):
      media: v4l2-ctrls: Unset correct HEVC loop filter flag
      media: rkvdec: Fix H264 scaling list order

Marek Szyprowski (1):
      media: s5p-mfc: Properly handle dma_parms for the allocated devices

Michael Rodin (1):
      v4l2-subdev.rst: correct information about v4l2 events

Samuel Holland (1):
      media: cedrus: Program output format during each run

Tomi Valkeinen (1):
      media: videobuf2-dma-contig: fix bad kfree in vb2_dma_contig_clear_max_seg_size

 Documentation/driver-api/media/v4l2-subdev.rst        |   3 +-
 drivers/media/cec/Kconfig                             |   2 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |  20 +--------
 drivers/media/platform/s5p-mfc/s5p_mfc.c              |   6 ++-
 drivers/media/v4l2-core/v4l2-ctrls.c                  |   2 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c            |  70 ++++++++++---------------------
 drivers/staging/media/sunxi/cedrus/cedrus.c           |   7 ++++
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c       |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c        | 106 ++++++++++++++++++++++++++++++-----------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h        |   3 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c     |  36 +++++++++++-----
 include/media/videobuf2-dma-contig.h                  |   2 +-
 12 files changed, 139 insertions(+), 120 deletions(-)
