Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF34D1EC9FF
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgFCHBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgFCHBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A99420810;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=ZpRhtr1qwdn49YQdRddrvCTO/l7i3ButPbzAvxfFfTY=;
        h=From:To:Cc:Subject:Date:From;
        b=lD6BJwreq9+4F2+FyLeh5V+XSR4/BRkzoaCVg0SjsiTSvTHfjotmdM+JeIaK+b5is
         rU7Sq+yqmzkgJCGh7nJBs0uqlp/NPaRcOjutYLYqYqY/1KJNeokkyA69hqTdP46oYb
         gR80WzNUL0Yj8ZWGHOr38a4u5RPq1a4JrtO1e+z0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j81-1j; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 00/15] More atomisp fixes and cleanups
Date:   Wed,  3 Jun 2020 09:00:46 +0200
Message-Id: <cover.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of the code here is meant to make the IRQ handling code clearer,
and the ISP frequency setting (DFS).

There's a fix there at the DFS setting: right now, if the sensor doesn't
provide the number of frames per second, DFS is kept on its minimal
value, with will likely fail. The logic at patch 13 changes it to default
to the maximum value. While this will drain more power, the camera
should be able to work.

Mauro Carvalho Chehab (15):
  media: atomisp: improve IRQ handling debug messages
  media: atomisp: do some cleanup at irq_local.h
  media: atomisp: get rid of a duplicated file
  media: atomisp: get rid of ifdef nonsense
  media: atomisp: simplify IRQ ifdef logic
  media: atomisp: remove some unused defines from *mamoiada_params.h
  media: atomisp: use just one mamoiada_params.h
  media: atomisp: get rid of a detection hack for a BYT Andorid-based
    tablet
  media: atomisp: don't set hpll_freq twice with different values
  media: atomisp: use macros from intel-family.h
  media: atomisp: change the detection of ISP2401 at runtime
  media: atomisp: use different dfs failed messages
  media: atomisp: set DFS to MAX if sensor doesn't report fps
  media: atomisp: use strscpy() instead of less secure variants
  media: atomisp: get rid of a string_support.h abstraction layer

 .../media/atomisp/include/linux/atomisp.h     |   3 -
 .../atomisp/include/linux/atomisp_platform.h  |  21 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  71 +++---
 .../media/atomisp/pci/atomisp_common.h        |   4 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |  14 +-
 .../staging/media/atomisp/pci/atomisp_file.c  |   2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |   2 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  46 ++--
 .../media/atomisp/pci/atomisp_subdev.c        |   2 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   |   2 +-
 .../media/atomisp/pci/atomisp_trace_event.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 110 +++------
 .../pci/camera/pipe/src/pipe_binarydesc.c     |   4 +-
 .../hrt/isp2400_mamoiada_params.h             | 229 ------------------
 .../pci/hive_isp_css_2401_irq_types_hrt.h     |  69 ------
 .../pci/hive_isp_css_common/host/irq.c        |  29 +--
 .../pci/hive_isp_css_common/host/irq_local.h  |  17 +-
 .../pci/hive_isp_css_common/irq_global.h      |  10 +-
 .../pci/hive_isp_css_common/isp_global.h      |  12 +-
 .../pci/hive_isp_css_common/sp_global.h       |  10 -
 .../hive_isp_css_include/host/irq_public.h    |  16 +-
 .../pci/hive_isp_css_include/string_support.h | 165 -------------
 ...sp_css_irq_types_hrt.h => irq_types_hrt.h} |   0
 .../ctc/ctc_1.0/ia_css_ctc_table.host.c       |   3 +-
 .../kernels/gc/gc_1.0/ia_css_gc_table.host.c  |   3 +-
 .../kernels/gc/gc_2/ia_css_gc2_table.host.c   |   3 +-
 .../xnr/xnr_1.0/ia_css_xnr_table.host.c       |   3 +-
 .../atomisp/pci/isp2400_input_system_local.h  |  15 +-
 .../media/atomisp/pci/isp2400_system_global.h |  31 ---
 .../media/atomisp/pci/isp2400_system_local.h  |   8 -
 .../media/atomisp/pci/isp2401_system_global.h |  31 ---
 .../media/atomisp/pci/isp2401_system_local.h  |   8 -
 ...01_mamoiada_params.h => mamoiada_params.h} |  20 +-
 .../atomisp/pci/runtime/binary/src/binary.c   |   4 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  65 ++---
 .../pci/runtime/isys/src/virtual_isys.c       |  29 +--
 .../tagger/interface/ia_css_tagger_common.h   |   4 -
 drivers/staging/media/atomisp/pci/sh_css.c    |  50 ++--
 .../media/atomisp/pci/sh_css_firmware.c       |   6 +-
 .../media/atomisp/pci/sh_css_internal.h       |  10 -
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   8 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  22 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c |   5 +-
 .../media/atomisp/pci/sh_css_version.c        |   5 +-
 44 files changed, 247 insertions(+), 930 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_2401_irq_types_hrt.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
 rename drivers/staging/media/atomisp/pci/{css_2400_system/hrt/hive_isp_css_irq_types_hrt.h => irq_types_hrt.h} (100%)
 rename drivers/staging/media/atomisp/pci/{isp2401_mamoiada_params.h => mamoiada_params.h} (91%)

-- 
2.26.2


