Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C1427712B
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 14:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgIXMij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 08:38:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727660AbgIXMij (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 08:38:39 -0400
Received: from coco.lan (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE1AB21D24;
        Thu, 24 Sep 2020 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600951119;
        bh=k3WZRZdZuF6s4FKyf4FEZOVMN8m6qD690wYuX9PC6+w=;
        h=Date:From:To:Cc:Subject:From;
        b=lbhWWp1KMyX6vYFySbwNlt11ppdhu1gnN1vcJDY7dn/wuoTjoR795MJmepqcn2jyN
         4hwhwcAaEA7NeobiF4U9WpUCKpIHMjZnlN61MxUYAk1aHKm/NcMmZrNdryLte35xKu
         bbO5ogfBUF3JMHCk3j7IkV76WpkbfTRsXeL6i97E=
Date:   Thu, 24 Sep 2020 14:38:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.9-rc7] media fixes
Message-ID: <20200924143834.79ef0744@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.9-3

It fixes a regression at the CEC adapter core:

      media: cec-adap.c: don't use flush_scheduled_work()

While not too late, it also contains two uAPI patches for the 
changes already merged for Kernel 5.9:

      media: dt-bindings: media: imx274: Convert to json-schema
      media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag

The first one has a change to lowercase on one of the DT new
additions for Kernel 5.9. The second one actually reverts one
uAPI change that was nacked by mm people, because the changeset
has problems.

Thanks!
Mauro

---

The following changes since commit ddecfc76979d5585847c76c4c489dcac389f86dd:

  media: mceusb: Avoid GFP_ATOMIC where it is not needed (2020-08-28 14:06:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.9-3

for you to fetch changes up to d0254f82d702a1d0d92e42f87676111de88846cf:

  media: dt-bindings: media: imx274: Convert to json-schema (2020-09-22 11:13:46 +0200)

----------------------------------------------------------------
media fixes for v5.9-rc7

----------------------------------------------------------------
Hans Verkuil (1):
      media: cec-adap.c: don't use flush_scheduled_work()

Jacopo Mondi (1):
      media: dt-bindings: media: imx274: Convert to json-schema

Sergey Senozhatsky (1):
      media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag

 .../devicetree/bindings/media/i2c/imx274.txt       | 38 -----------
 .../devicetree/bindings/media/i2c/sony,imx274.yaml | 76 ++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/buffer.rst   | 17 -----
 .../userspace-api/media/v4l/vidioc-create-bufs.rst |  6 +-
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     | 12 +---
 MAINTAINERS                                        |  2 +-
 drivers/media/cec/core/cec-adap.c                  |  2 +-
 drivers/media/common/videobuf2/videobuf2-core.c    | 46 ++-----------
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 19 ------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |  3 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    | 18 +----
 drivers/media/dvb-core/dvb_vb2.c                   |  2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      | 10 +--
 drivers/media/v4l2-core/v4l2-ioctl.c               |  5 +-
 include/media/videobuf2-core.h                     |  7 +-
 include/uapi/linux/videodev2.h                     | 13 +---
 16 files changed, 101 insertions(+), 175 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml

