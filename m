Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BBA454459
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbhKQJ75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:59:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:35282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235768AbhKQJ7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42CDF61BD2;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=NK9F7iRTBM1/CzDwAYQhJi9TgsotU7EOz58bIbq9ChM=;
        h=From:To:Cc:Subject:Date:From;
        b=F0gbIzwPFmh4iCrat9iJ7oqOZs6FK3HWgWlC019RdOglT/n9E7QW0iG4IMUCO3nIw
         7D/GJozEiVJLbGav5iVxiUR/rQaWkpilKvbrioCfbmhEiykttozLM3Sxns9c0Kt5v3
         OoBYJcu25kJbmaOd0CzpjPgpPMGjIBUmAkMXw1Kg180YpslTNjTMjwstSH18/1LAOJ
         PDWK1xOAAIxccuSBGU+NajeG4/u5y8DQuiBJ3D63eam8HL9fyZ9kOrYqsPcf561/GY
         hFqsBBSxXhPMXQrYk8P/difVnf3HLLpf1Tll52uC1rdNnfkR8MOMUGIjjegjpIooL8
         R0DTmTyibwTJg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUN-3j; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 00/12] media: atomisp: reduce the gap for ISP2401
Date:   Wed, 17 Nov 2021 09:56:42 +0000
Message-Id: <cover.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the driver and the firmware are closely bound each other and we're
using the Intel Aero firmware, with is widely available, make the sh_css
code closer to the OOT device driver for such board.

As a plus, it reduces the number of #ifdefs inside the code.

Patch 1: drop several boilerplate files;
Patch 2 and above: reduce sh_css gap.

- v2: patch 12/13 from the past review was merged with 08/13.

Mauro Carvalho Chehab (12):
  media: atomisp: drop empty files
  media: atomisp: simplify sh_css_defs.h
  media: atomisp: sh_css_metrics: drop some unused code
  media: atomisp: sh_css_mipi: cleanup the code
  media: atomisp: sh_css_params: remove tests for ISP2401
  media: atomisp: sh_css_params: cleanup the code
  media: atomisp: remove #ifdef HAS_NO_HMEM
  media: atomisp: get rid of USE_WINDOWS_BINNING_FACTOR tests
  media: atomisp: get rid of #ifdef HAS_BL
  media: atomisp: get rid of sctbl_legacy_*
  media: atomisp: sh_css_param_shading: fix comments coding style
  media: atomisp: sh_css_sp: better support the current firmware

 drivers/staging/media/atomisp/Makefile        |   4 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  28 +--
 .../staging/media/atomisp/pci/ia_css_pipe.h   |   4 +-
 .../media/atomisp/pci/ia_css_stream_public.h  |  10 +-
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c  |   2 -
 .../raw_aa_binning_1.0/ia_css_raa.host.c      |   2 -
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c |   5 -
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |   6 +-
 .../kernels/tnr/tnr_1.0/ia_css_tnr_param.h    |   4 +-
 .../pci/isp/modes/interface/isp_const.h       |   4 +-
 .../runtime/binary/interface/ia_css_binary.h  |   2 -
 .../atomisp/pci/runtime/binary/src/binary.c   |  18 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |   2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  16 +-
 .../staging/media/atomisp/pci/sh_css_defs.h   |  48 +---
 .../media/atomisp/pci/sh_css_firmware.h       |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../media/atomisp/pci/sh_css_metadata.c       |  17 --
 .../media/atomisp/pci/sh_css_metrics.c        |  25 --
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 159 +++----------
 .../staging/media/atomisp/pci/sh_css_mipi.h   |  15 --
 .../staging/media/atomisp/pci/sh_css_morph.c  |  17 --
 .../media/atomisp/pci/sh_css_param_shading.c  |  80 +++----
 .../staging/media/atomisp/pci/sh_css_params.c | 219 ++----------------
 .../staging/media/atomisp/pci/sh_css_params.h |   8 -
 .../media/atomisp/pci/sh_css_shading.c        |  17 --
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  17 +-
 .../staging/media/atomisp/pci/sh_css_stream.c |  17 --
 28 files changed, 149 insertions(+), 602 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_metadata.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_morph.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_shading.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_stream.c

-- 
2.33.1


