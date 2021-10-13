Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEBA42BE12
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 12:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbhJMK6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 06:58:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35244 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhJMK6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:22 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2d05:985b:ed8c:969a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E64761F4415E;
        Wed, 13 Oct 2021 11:56:17 +0100 (BST)
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
        olivier.crete@collabora.com
Subject: [PATCH v2 0/6] staging: media: wave5: add wave5 codec driver
Date:   Wed, 13 Oct 2021 12:56:03 +0200
Message-Id: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
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

Fix chanes due to comments from Ezequiel and Dan Carpenter. Main fixes inclueds:
* move all files to one dir 'wave5'
* replace private error codes with standart error codes
* fix extra spaces
* various checkpatch fixes
* replace private 'DPRINTK' macro with standart 'dev_err/dbg ..'
* fix error handling
* add more possible fixes to the TODO file

Dafna Hirschfeld (4):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the vdi layer
  staging: media: wave5: Add the v4l2 layer
  staging: media: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

 .../bindings/staging/media/cnm,wave.yaml      |   71 +
 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/wave5/Kconfig           |   12 +
 drivers/staging/media/wave5/Makefile          |   10 +
 drivers/staging/media/wave5/TODO              |   58 +
 drivers/staging/media/wave5/vdi.c             |  260 ++
 drivers/staging/media/wave5/vdi.h             |   79 +
 drivers/staging/media/wave5/vpu.c             |  353 ++
 drivers/staging/media/wave5/vpu.h             |   63 +
 drivers/staging/media/wave5/vpu_dec.c         | 1400 +++++++
 drivers/staging/media/wave5/vpu_enc.c         | 1587 ++++++++
 drivers/staging/media/wave5/vpuapi.c          | 1096 +++++
 drivers/staging/media/wave5/vpuapi.h          | 1148 ++++++
 drivers/staging/media/wave5/vpuconfig.h       |   85 +
 drivers/staging/media/wave5/vpuerror.h        |  455 +++
 drivers/staging/media/wave5/wave5-hw.c        | 3513 +++++++++++++++++
 drivers/staging/media/wave5/wave5.h           |   80 +
 drivers/staging/media/wave5/wave5_regdefine.h |  638 +++
 20 files changed, 10920 insertions(+)
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

