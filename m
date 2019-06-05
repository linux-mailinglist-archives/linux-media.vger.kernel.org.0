Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C821935F86
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 16:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbfFEOpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 10:45:47 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35883 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727960AbfFEOpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 10:45:47 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YXAchnFPP3qlsYXAfhgueN; Wed, 05 Jun 2019 16:45:45 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] More fixes/improvements
Message-ID: <15e8bad5-5550-8b9c-fdc2-74eadad9814e@xs4all.nl>
Date:   Wed, 5 Jun 2019 16:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOTWQa/ruqfB7I9NsR9Ziu6oFj3fbeLlUF0IZ1kx/kOvexfpBJOMVomAD5gMHZf6gvOEIZR6NRDZM+nZ+DMHOU8xCGfZvhv85TCBQqEqea0yiZHDb+eQ
 pM0JW3eYR5xT3uHp8ZGsOrWmqJfkj0ZZeHSO/xY6yS6+S7eUWZumONpAZcPaRSdRhz32H92Uxk4dYzl1Z1WKXd7irMRKIgzGJzDsXqZU+4kycCR4TVBrQYXW
 teOzcfGEcZ63B0iD0S70KDPcnUsGZHQAFGsvYk6ZKkTm43bloK6eMW2TLddHEGZp9CsAKim6deHnSgIuS17WNuSHGjvy9m46TT/srVV+jSB7SOl0/FIWeIkW
 fmo9CNLw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

More fixes/improvements.

Jae Hyun Yoo, Eddie: I've merged the first 9 patches of the aspeed series,
but left out the last one since it wasn't reviewed by Eddie yet.

Once that is reviewed as well I'll pick it up in a later PR.

Regards,

	Hans

The following changes since commit 9b925365569eb4e845c006fdc254257e78fc12a4:

  media: vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs (2019-06-05 08:50:41 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3l

for you to fetch changes up to e256283467aec867aac967d23cb3016a92d43445:

  MAINTAINERS: update email address (2019-06-05 16:32:11 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Fabien Dessenne (1):
      media: stm32-dcmi: fix irq = 0 case

Fabio Estevam (3):
      media: imx7-media-csi: Use functions instead of macros
      media: imx7-media-csi: Use u32 for storing register reads
      media: imx7-media-csi: Remove unneeded error message

Hans Verkuil (2):
      Documentation: update email address
      MAINTAINERS: update email address

Jae Hyun Yoo (9):
      media: aspeed: fix a kernel warning on clk control
      media: aspeed: refine clock control logic
      media: aspeed: change irq to threaded irq
      media: aspeed: remove IRQF_SHARED flag
      media: aspeed: reduce noisy log printing outs
      media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
      media: aspeed: refine interrupt handling logic
      media: aspeed: remove source buffer allocation before mode detection
      media: aspeed: use different delays for triggering VE H/W reset

Kefeng Wang (1):
      media: pvrusb2: fix null-ptr-deref in class_unregister()

Neil Armstrong (1):
      media: platform: ao-cec-g12a: remove spin_lock_irqsave() locking in meson_ao_cec_g12a_read/write

 Documentation/ABI/testing/debugfs-cec-error-inj |   2 +-
 Documentation/media/uapi/cec/cec-api.rst        |   2 +-
 MAINTAINERS                                     |  20 +++++++-------
 drivers/media/platform/aspeed-video.c           | 128 ++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------
 drivers/media/platform/meson/ao-cec-g12a.c      |  20 +++-----------
 drivers/media/platform/stm32/stm32-dcmi.c       |   2 +-
 drivers/media/usb/pvrusb2/pvrusb2-sysfs.c       |   3 ++-
 drivers/staging/media/imx/imx7-media-csi.c      |  44 +++++++++++++++++--------------
 8 files changed, 107 insertions(+), 114 deletions(-)
