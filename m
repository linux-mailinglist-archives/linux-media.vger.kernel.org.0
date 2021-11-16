Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB01545309F
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbhKPLcd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:34522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235077AbhKPLcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1966061360;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=sbQUWbkKMQcMFCkCOVifskmdo2GFngWUi5Cf2N0FhSc=;
        h=From:To:Cc:Subject:Date:From;
        b=TxTpSCPdqBgqJtC/2O0IOqli/CGu8kh1KfofpeeoB9ac6EpLS7ZXq9zDPyq0v1FJ/
         b6zmdEcTv0HIQrIXvqcdZPobXwRxbU5LaxDVm5hiU1uunJ4G05OHR8Hc22YyKjjaJJ
         e+o4VVLP//r4s4M/gGYnkgE/sR6x7tGYRlrUlL+bU4NHHvtEQrDYE2gmYq67ikn6S+
         iCeP8R/49zHcbxDzZ3ZSZLfVAk35ZM4XIauaqRR+zke1cCvtWBufkgpHKbxqvDamIR
         Bk1BVD40OGEVu2aufHPApK3kk+QrdH8w4ub8r732evf75ZeotlWaMa1q056BGm349X
         obmQN9iHK0E3w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qf6-A9; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 00/23] Make the code closer to candrpv_0415 firmware
Date:   Tue, 16 Nov 2021 11:28:41 +0000
Message-Id: <cover.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we adopt for ISP2401 the candrpv_0415_20150521_0458, which
comes together with the Intel Aero device driver, makes the code at sh_css
a lot closer to the Aero driver.

Tested on Asus T101HA.

Mauro Carvalho Chehab (23):
  media: atomisp: get rid of phys event abstractions
  media: atomisp: get rid of if CONFIG_ON_FRAME_ENQUEUE
  media: atomisp: shift some structs from input_system_local
  media: atomisp: ia_css_stream.h: remove ifdefs from the header
  media: atomisp: fix comments coding style at sh_css.c
  media: atomisp: Avoid some {} just to define new vars
  media: atomisp: drop two vars that are currently ignored
  media: atomisp: drop an useless #ifdef ISP2401
  media: atomisp: remove #ifdef HAS_OUTPUT_SYSTEM
  media: atomisp: drop #ifdef SH_CSS_ENABLE_PER_FRAME_PARAMS
  media: atomisp: drop #ifdef WITH_PC_MONITORING
  media: atomisp: remove #ifdef SH_CSS_ENABLE_METADATA
  media: atomisp: solve #ifdef HAS_NO_PACKED_RAW_PIXELS
  media: atomisp: drop crop code at stream create function
  media: atomisp: get rid of ia_css_stream_load()
  media: atomisp: unify ia_css_stream stop logic
  media: atomisp: drop ia_css_pipe_update_qos_ext_mapped_arg
  media: atomisp: drop a dead code
  media: atomisp: get rid of some weird warn-suppress logic
  media: atomisp: drop check_pipe_resolutions() logic
  media: atomisp: warn if mipi de-allocation failed
  media: atomisp: make sh_css similar to Intel Aero driver
  media: atomisp: get rid of #ifdef ISP_VEC_NELEMS

 .../staging/media/atomisp/pci/atomisp_cmd.c   |    2 +-
 .../media/atomisp/pci/atomisp_compat.h        |    2 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |   10 +-
 .../pci/camera/pipe/src/pipe_binarydesc.c     |    2 -
 .../media/atomisp/pci/ia_css_event_public.h   |   17 +-
 .../media/atomisp/pci/ia_css_pipe_public.h    |   23 -
 .../staging/media/atomisp/pci/ia_css_stream.h |    4 -
 .../media/atomisp/pci/ia_css_stream_public.h  |    9 -
 .../media/atomisp/pci/input_system_local.h    |  134 ++
 .../pci/isp/modes/interface/isp_const.h       |   10 -
 .../atomisp/pci/isp2400_input_system_local.h  |  126 --
 .../atomisp/pci/isp2401_input_system_local.h  |   26 -
 .../pci/runtime/pipeline/src/pipeline.c       |    3 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 1918 +++++------------
 .../staging/media/atomisp/pci/sh_css_defs.h   |   10 -
 .../media/atomisp/pci/sh_css_internal.h       |   26 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   15 +-
 .../staging/media/atomisp/pci/sh_css_mipi.h   |    2 +
 .../staging/media/atomisp/pci/sh_css_params.c |   20 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c |   22 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h |    7 +-
 .../staging/media/atomisp/pci/system_global.h |    3 -
 22 files changed, 723 insertions(+), 1668 deletions(-)

-- 
2.33.1


