Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60ECE22999D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732432AbgGVN5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:57:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727825AbgGVN5c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:57:32 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E0EE2071A;
        Wed, 22 Jul 2020 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595426251;
        bh=kcAHjZM1rs+yjiyHvvMG1g8izKqFZPmNJbqLCZ7HdJ8=;
        h=Date:From:To:Cc:Subject:From;
        b=yLT+R3vGn0tLy5aw/l98zCCqoE35efOhSndolU3XblPpyu2+gYcaKSrAwiuWNV5r2
         6RQjLO41ctrwunx1WMShk6c3Tnxc9tgU6Toi0E+6W1VmQITKmGA6Q1TA4apRyh0Wvd
         k9ZdCCrlftENlBwU/iJYR/0ZRMKGalxomtKp/GXQ=
Date:   Wed, 22 Jul 2020 15:57:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.8-rc7] media fixes
Message-ID: <20200722155727.06ab1692@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.8-3


For a series of fixes for the upcoming stating atomisp driver. They solve
issues when probing atomisp on devices with multiple cameras and get rid of
warnings when built with W=3D1.

The diffstat is a bit long, as this driver has several abstractions. The=20
patches that solved the issues with W=3D1 had to get rid of some duplicated
code (there used to have 2 versions of the same code, one for ISP2401 and
another one for ISP2400).=20

Anyway, as this driver is not at Kernel 5.7, such changes won't cause
regressions.

Regards,
Mauro


.

The following changes since commit 2630e1bb0948c3134c6f22ad275ae27cc6023532:

  media: rkvdec: Fix H264 scaling list order (2020-06-11 19:21:38 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.8-3

for you to fetch changes up to 0d6db85131e014c128e57649793aff5aa96e065f:

  Revert "media: atomisp: keep the ISP powered on when setting it" (2020-07=
-19 13:31:53 +0200)

----------------------------------------------------------------
media fixes for v5.8-rc7

----------------------------------------------------------------
Andy Shevchenko (17):
      media: atomisp: Replace last use of Intel MID APIs
      media: atomisp: move CCK endpoint address to generic header
      media: atomisp: Use proper APIs to find I=C2=B2C client device by ACP=
I HID
      media: atomisp: don't pass struct device_driver as parameter
      media: atomisp: Get rid of struct pci_dev in struct atomisp_device
      media: atomisp: Unify pdev to be pointer to struct pci_device
      media: atomisp: Replace direct access to MMIO with proper helpers
      media: atomisp: Drop global atomisp_dev variable (easy cases)
      media: atomisp: make platform data more readable
      media: atomisp: Don't try to parse unexpected ACPI object type
      media: atomisp: Make pointer to PMIC client global
      media: atomisp: Deduplicate return ret in gmin_i2c_write()
      media: atomisp: Refactor PMIC detection to a separate function
      media: atomisp: Use temporary variable for device in gmin_subdev_add()
      media: atomisp: Provide Gmin subdev as parameter to gmin_subdev_add()
      media: atomisp: Get rid of ACPI specifics in gmin_subdev_add()
      media: atomisp: Clean up non-existing folders from Makefile

B K Karthik (1):
      media: atomisp: i2c: atomisp-ov2680.c: fixed a brace coding style iss=
ue.

Baidyanath Kundu (1):
      media: atomisp: Fix __func__ style warnings

Colin Ian King (2):
      media: atomisp: make const arrays static, makes object smaller
      media: atomisp: fix mask and shift operation on ISPSSPM0

Dan Carpenter (1):
      media: atomisp: Fix error code in ov5693_probe()

Mauro Carvalho Chehab (15):
      media: atomisp: fix the handling of clock number
      media: atomisp: reorganize the code under gmin_subdev_add()
      media: atomisp: Prepare sensor support for ACPI PM
      media: atomisp: properly parse CLK PMIC on newer devices
      media: atomisp: fix call to g_frame_interval
      media: atomisp: print info if gpio0 and gpio2 were detected
      media: atomisp: split add from find subdev
      media: atomisp: place all gpio parsing together
      media: atomisp: fix help message for ISP2401 selection
      media: atomisp: get rid of some unused static vars
      media: atomisp: remove non-used 32-bits consts at system_local
      media: atomisp: move global stuff into a common header
      media: atomisp: get rid of version-specific system_local.h
      media: atomisp: move system_local consts into a C file
      Revert "media: atomisp: keep the ISP powered on when setting it"

Nicolas Boichat (1):
      media: atomisp: Replace trace_printk by pr_info

 arch/x86/include/asm/iosf_mbi.h                    |   1 +
 drivers/staging/media/atomisp/Kconfig              |   2 +-
 drivers/staging/media/atomisp/Makefile             |   6 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |   6 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |   6 +-
 .../media/atomisp/include/linux/atomisp_platform.h |   1 +
 drivers/staging/media/atomisp/pci/atomisp-regs.h   |   3 -
 drivers/staging/media/atomisp/pci/atomisp_acc.c    |   4 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  59 +--
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |   4 +-
 drivers/staging/media/atomisp/pci/atomisp_compat.h |   2 -
 .../media/atomisp/pci/atomisp_compat_css20.c       |  70 ++-
 .../media/atomisp/pci/atomisp_compat_css20.h       |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |  14 +-
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |   2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      | 537 ++++++++++++++---=
----
 .../staging/media/atomisp/pci/atomisp_internal.h   |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  19 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 287 +++++------
 .../media/atomisp/pci/base/refcount/src/refcount.c |  28 +-
 drivers/staging/media/atomisp/pci/hive_types.h     |  24 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  10 +-
 .../media/atomisp/pci/isp2400_system_global.h      | 302 ------------
 .../media/atomisp/pci/isp2400_system_local.h       | 321 ------------
 .../media/atomisp/pci/isp2401_system_global.h      | 410 +---------------
 .../media/atomisp/pci/isp2401_system_local.h       | 402 ---------------
 drivers/staging/media/atomisp/pci/sh_css.c         |   9 +-
 drivers/staging/media/atomisp/pci/system_global.h  | 395 +++++++++++++++
 drivers/staging/media/atomisp/pci/system_local.c   | 179 +++++++
 drivers/staging/media/atomisp/pci/system_local.h   | 104 +++-
 30 files changed, 1280 insertions(+), 1931 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2400_system_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2401_system_local.h
 create mode 100644 drivers/staging/media/atomisp/pci/system_local.c

