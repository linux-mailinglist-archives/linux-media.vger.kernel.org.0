Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB0D454398
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbhKQJ2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:58788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233943AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E301A63231;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141141;
        bh=DbisRAojWgyaQVzIWP+y3RuFJUoffU8u7LWDE2yHf50=;
        h=From:To:Cc:Subject:Date:From;
        b=TE+c7I3MS8BEcucqfJg+xFR3dv9yltFK1qUINa1roGvg08P43Oiq+i08KeLPU6Etv
         DfePriZQDn5b9d1Ly5hx4Pbr8pOjVfJcZmN2lY3APDdJKe3d3MSYoX8+3XlbUDvZcw
         RZ36IPWrBjEAwXK92DDiXn4qEXyKm1Pp6L4BXNR7TrGFn8MWaO3uy+IIDE6mBhFnLH
         0om66HZZPJdrml4go+CbvOIOKKYpZHjBad2502r49CHS4QBN6wwTNEPl52fk9dNVk1
         S+7DTPppvmeodbSVhFHv+ZXR1h3Bm6xCYPTkcgMNegTETmYN+iZUJoGWue+ZxnOfLr
         IQgELyLpa0zNg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb5a-5N; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 00/13] media: atomisp: reduce the gap for ISP2401
Date:   Wed, 17 Nov 2021 09:25:25 +0000
Message-Id: <cover.1637140900.git.mchehab+huawei@kernel.org>
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

Mauro Carvalho Chehab (13):
  media: atomisp: drop empty files
  media: atomisp: simplif sh_css_defs.h
  media: atomisp: sh_css_metrics: drop some unused code
  media: atomisp: sh_css_mipi: cleanup the code
  media: atomisp: sh_css_params: remove tests for ISP2401
  media: atomisp: sh_css_params: cleanup the code
  media: atomisp: remove #ifdef HAS_NO_HMEM
  media: atomisp: get rid of USE_WINDOWS_BINNING_FACTOR tests
  media: atomisp: get rid of #ifdef HAS_BL
  media: atomisp: get rid of sctbl_legacy_*
  media: atomisp: sh_css_param_shading: fix comments coding style
  media: atomisp: fix a bug when applying the binning factor
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
 .../media/atomisp/pci/sh_css_param_shading.c  |  84 +++----
 .../staging/media/atomisp/pci/sh_css_params.c | 219 ++----------------
 .../staging/media/atomisp/pci/sh_css_params.h |   8 -
 .../media/atomisp/pci/sh_css_shading.c        |  17 --
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  17 +-
 .../staging/media/atomisp/pci/sh_css_stream.c |  17 --
 28 files changed, 151 insertions(+), 604 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_metadata.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_morph.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_shading.c
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_stream.c

-- 
2.33.1


