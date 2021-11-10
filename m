Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5CB44C0EE
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 13:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhKJMML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 07:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhKJMMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 07:12:10 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDFAC061764;
        Wed, 10 Nov 2021 04:09:23 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D75561F4554C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636546161; bh=0U+TmSROJ4hS4Sex6dQGUnmVPmx/vc+pp23EUYRD1wI=;
        h=From:To:Cc:Subject:Date:From;
        b=fyyJFGhqUnp1/lnnXvE4zt1B+/pVD6r7JJOtvjvj8lEiBwkqy/eDEETfOO9YZCWqA
         v46FX6E5FOqNY9bn4Zbbllvx1MtbcfYrvAAm4plZWKfEV1/dERCZlIWQV45PQ2i8v/
         Urkm/v6GldTSlzl2okDTidpcomGRDNqDdt58z4UPL+TGvmy+kp2o3PtHrtawvPBhTo
         NjYgc+GFLX9qvIilBA5XNHwt37evwF9GdMKKU1g7efwQpwuF/4h+vqoLf3apeR3km1
         whlPeaJroo7qe2+CtGwJ3Nh0GqyP1253whzEYXmVyDZ9WB3bmubxZdXdOj7O7093xJ
         zVGVTcm/otmEg==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com, bob.beckett@collabora.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        rdunlap@infradead.org
Subject: [PATCH v3 0/6] staging: media: wave5: add wave5 codec driver
Date:   Wed, 10 Nov 2021 14:09:04 +0200
Message-Id: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wave5 codec is a stateful encoder/decoder.
It is found on the JH7100 SoC.

The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.

This driver has so far been tested on pre-silicon FPGA and on the beta BeagleV
board which uses the StarFive JH7100 beta SoC.

Testing on FPGA shows it working fine, though the FPGA uses polled interrupts
and copied buffers between the host and it's on board RAM.

Testing on BeagleV shows buffer corruption that is currently attributed to a
known silicon issue in the SoC that makes the cache coherent interconnect not
so coherent.
This can likely be solved when the riscv non-coherent dma support lands and
provide optional v4l2 non-contiguous allocator, though it remains to be seen
whether support non-coherent use cases will be useful in real world hw.

Until we can test and resolve any issues on final silicon (due 2H 2021)
this driver should remain in staging.

We currently tested only the decoder.
Testing the encoder is currently impossible because of the BeagleV buffer problems,
That will need to be tested once we have fixed beaglev buffer problems.

v4l2-compliance all pass for v2 as well.

changes since v1:

Main fixes includes:
* change the yaml and dirver code to support up to 4 clks (instead of one)
* fix Kconfig format
* remove unneeded cast,
* change var types
* change var names, func names
* checkpatch fixes


Dafna Hirschfeld (4):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the vdi layer
  staging: media: wave5: Add the v4l2 layer
  staging: media: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

 .../bindings/staging/media/cnm,wave.yaml      |   73 +
 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/wave5/Kconfig           |   12 +
 drivers/staging/media/wave5/Makefile          |   10 +
 drivers/staging/media/wave5/TODO              |   59 +
 drivers/staging/media/wave5/vdi.c             |  260 ++
 drivers/staging/media/wave5/vdi.h             |   76 +
 drivers/staging/media/wave5/vpu.c             |  367 ++
 drivers/staging/media/wave5/vpu.h             |   64 +
 drivers/staging/media/wave5/vpu_dec.c         | 1397 +++++++
 drivers/staging/media/wave5/vpu_enc.c         | 1585 ++++++++
 drivers/staging/media/wave5/vpuapi.c          | 1066 +++++
 drivers/staging/media/wave5/vpuapi.h          | 1140 ++++++
 drivers/staging/media/wave5/vpuconfig.h       |   85 +
 drivers/staging/media/wave5/vpuerror.h        |  455 +++
 drivers/staging/media/wave5/wave5-hw.c        | 3476 +++++++++++++++++
 drivers/staging/media/wave5/wave5.h           |   81 +
 drivers/staging/media/wave5/wave5_regdefine.h |  638 +++
 20 files changed, 10856 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
 create mode 100644 drivers/staging/media/wave5/Kconfig
 create mode 100644 drivers/staging/media/wave5/Makefile
 create mode 100644 drivers/staging/media/wave5/TODO
 create mode 100644 drivers/staging/media/wave5/vdi.c
 create mode 100644 drivers/staging/media/wave5/vdi.h
 create mode 100644 drivers/staging/media/wave5/vpu.c
 create mode 100644 drivers/staging/media/wave5/vpu.h
 create mode 100644 drivers/staging/media/wave5/vpu_dec.c
 create mode 100644 drivers/staging/media/wave5/vpu_enc.c
 create mode 100644 drivers/staging/media/wave5/vpuapi.c
 create mode 100644 drivers/staging/media/wave5/vpuapi.h
 create mode 100644 drivers/staging/media/wave5/vpuconfig.h
 create mode 100644 drivers/staging/media/wave5/vpuerror.h
 create mode 100644 drivers/staging/media/wave5/wave5-hw.c
 create mode 100644 drivers/staging/media/wave5/wave5.h
 create mode 100644 drivers/staging/media/wave5/wave5_regdefine.h

-- 
2.17.1

