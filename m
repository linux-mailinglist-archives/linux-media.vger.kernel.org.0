Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8DD86696
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 18:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403889AbfHHQDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 12:03:23 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:33378
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732698AbfHHQDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 12:03:22 -0400
X-IronPort-AV: E=Sophos;i="5.64,362,1559512800"; 
   d="scan'208";a="315951951"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 18:03:20 +0200
Date:   Thu, 8 Aug 2019 18:03:19 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
cc:     linux-kernel@vger.kernel.org, kbuild-all@01.org
Subject: drivers/media/pci/cx23885/cx23885-video.c:636:24-44: duplicated
 argument to & or | (fwd)
Message-ID: <alpine.DEB.2.21.1908081802240.2995@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_CAP_VBI_CAPTURE appears twice on lines 635-638.

julia

---------- Forwarded message ----------
Date: Thu, 8 Aug 2019 22:11:43 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: drivers/media/pci/cx23885/cx23885-video.c:636:24-44: duplicated
    argument to & or |

CC: kbuild-all@01.org
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecb095bff5d4b8711a81968625b3b4a235d3e477
commit: 2161536516edcc0be31109eb1284939119e7ba6d media: media/pci: set device_caps in struct video_device
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> drivers/media/pci/cx23885/cx23885-video.c:636:24-44: duplicated argument to & or |

git remote add linus https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git
git remote update linus
git checkout 2161536516edcc0be31109eb1284939119e7ba6d
vim +636 drivers/media/pci/cx23885/cx23885-video.c

e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  625
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  626  static int vidioc_querycap(struct file *file, void  *priv,
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  627  	struct v4l2_capability *cap)
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  628  {
568f44a18e9b63 drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2014-04-23  629  	struct cx23885_dev *dev = video_drvdata(file);
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  630
cc1e6315e83db0 drivers/media/pci/cx23885/cx23885-video.c   Mauro Carvalho Chehab 2018-09-10  631  	strscpy(cap->driver, "cx23885", sizeof(cap->driver));
c0decac19da390 drivers/media/pci/cx23885/cx23885-video.c   Mauro Carvalho Chehab 2018-09-10  632  	strscpy(cap->card, cx23885_boards[dev->board].name,
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  633  		sizeof(cap->card));
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  634  	sprintf(cap->bus_info, "PCIe:%s", pci_name(dev->pci));
2161536516edcc drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2019-06-17  635  	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
2161536516edcc drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2019-06-17 @636  			    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE |
2161536516edcc drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2019-06-17  637  			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
2161536516edcc drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2019-06-17  638  			    V4L2_CAP_DEVICE_CAPS;
0f3bf3dc1ca394 drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2014-06-27  639  	if (dev->tuner_type != TUNER_ABSENT)
2161536516edcc drivers/media/pci/cx23885/cx23885-video.c   Hans Verkuil          2019-06-17  640  		cap->capabilities |= V4L2_CAP_TUNER;
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  641  	return 0;
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  642  }
e47f30b1403335 drivers/media/video/cx23885/cx23885-video.c Steven Toth           2008-01-10  643

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
