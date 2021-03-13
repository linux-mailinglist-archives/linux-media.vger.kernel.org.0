Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F45339E9A
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhCMOnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:36105 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234010AbhCMOn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UElV5cA; Sat, 13 Mar 2021 15:43:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646607; bh=O3MwNQhRNzqd8QxgPawHIeJJoZMJ70XulGV08rBp2qM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=S0Enxly0b/Lw+ck17ZpatbYyGT+hXfS8LhjKmkGRSGg6ZRh90j5g3zeFXpaVfJJzJ
         TprMPnYg6Urd92lAjLTDy30GAclZbjKknHGZMP3+trnAy8pDsZ53jEiMtp98sdrQgp
         1KXGcqs4iEe+WllERL2SAoLwMnLtN9qRJ45MJ3d1n3/EkBlH9W9m4mC5IUr7dUTT9p
         MxBsQBu6SHKaGts7EYET3yQmJipANSfUpRwdjrOJCrzWytZyE43XsSiR+hZRgdv0aC
         S0YZGgmLu/5BqyniBL+izwxWcefwBENOl3nR5S1tN/rF1OixUPQNNbLt/bAwN1MycY
         v8AgigiPt4BQw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 00/15] v4l2-controls.h: rename _MPEG_ to _CODEC_
Date:   Sat, 13 Mar 2021 15:43:08 +0100
Message-Id: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfC6oyS35tArlVT3Tnt89cA2C4XNyiVAN7tzIh2jmRj56uarUG0Tiv/X88SAJj0ej6pZYerU9UVVbFdMNCl+eVw8QIESNcP7LB7Y4odaF7qNzoRGvPBO2
 3fujnFXXO2XzoBlbnG6nLr+LveNYlpyD+p9//uy/mmLgh3IUGzadS5EZJCvxZyCEZlgQzTxTj5b7p3B2tIdB+ksQWQoNIgrgc6GzngBUNIIBPwyMKZL6+rhG
 zU26G4QZpzFXmLwQThCL3xlLg6Ofd6/MkoldDgg2v2zeiGJe0j2qLpiysYGRx1YOq4Hr1tJfqAGczYkMf5bqRvwLE85RiFBwUtKvxzxJzVU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first codec that was supported in V4L2 was the MPEG codec.
As a result of that all codec controls and related data structures
where all prefixed with MPEG. This is confusing and in fact makes
it hard to find the MPEG-specific controls since all controls have
'MPEG' in their name.

This patch series renames all controls and data structures to use
CODEC instead of MPEG, and adds defines for compatibility at the end.

The first patch fixes a typo in the documentation. I posted that
as a seperate patch, but it makes sense to combine this in this series
since it depends on this fix.

Then v4l2-controls.h is modified, renaming MPEG to CODEC and creating
aliases for the old names.

Next the documentation is updated, followed by the drivers/media/*
directories, drivers/staging/media, include/media, videodev2.h and
staging/vc04_services.

Finally the aliases in v4l2-controls.h are placed under #ifndef __KERNEL__
to ensure that the kernel code can't use those anymore.

This patch has no functional changes, only renames and the addition
of compatibility defines at the end.

Regards,

	Hans

Hans Verkuil (15):
  ext-ctrls-codec.rst: fix typos
  v4l2-controls.h: rename _MPEG_ to _CODEC_
  Documentation/*/media: rename MPEG to CODEC
  media/common: rename MPEG to CODEC
  media/i2c: rename MPEG to CODEC
  media/v4l2-core: rename MPEG to CODEC
  media/pci: rename MPEG to CODEC
  media/usb: rename MPEG to CODEC
  media/platform: rename MPEG to CODEC
  media/test-drivers: rename MPEG to CODEC
  staging/media: rename MPEG to CODEC
  include/media: rename MPEG to CODEC
  videodev2.h: rename MPEG to CODEC
  staging/vc04_services: rename MPEG to CODEC
  v4l2-controls.h: place all MPEG aliases under #ifndef __KERNEL__

 .../driver-api/media/v4l2-controls.rst        |    2 +-
 .../media/drivers/cx2341x-uapi.rst            |    8 +-
 .../dvb/audio-bilingual-channel-select.rst    |    2 +-
 .../media/dvb/audio-channel-select.rst        |    2 +-
 .../media/dvb/video-get-frame-count.rst       |    2 +-
 .../userspace-api/media/dvb/video-get-pts.rst |    2 +-
 .../media/v4l/dev-sliced-vbi.rst              |   14 +-
 .../media/v4l/ext-ctrls-codec.rst             | 1250 +++++------
 .../userspace-api/media/v4l/hist-v4l2.rst     |    6 +-
 .../media/v4l/pixfmt-compressed.rst           |   18 +-
 .../userspace-api/media/v4l/v4l2.rst          |    4 +-
 drivers/media/common/cx2341x.c                |  836 ++++----
 drivers/media/i2c/saa6752hs.c                 |  144 +-
 drivers/media/pci/cx18/cx18-controls.c        |   14 +-
 drivers/media/pci/ivtv/ivtv-controls.c        |   10 +-
 drivers/media/pci/ivtv/ivtv-driver.c          |   22 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |    4 +-
 drivers/media/pci/saa7164/saa7164-api.c       |   12 +-
 drivers/media/pci/saa7164/saa7164-core.c      |    4 +-
 drivers/media/pci/saa7164/saa7164-encoder.c   |   52 +-
 drivers/media/pci/saa7164/saa7164.h           |    4 +-
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |    8 +-
 drivers/media/pci/tw5864/tw5864-video.c       |    8 +-
 .../media/platform/allegro-dvt/allegro-core.c |  348 ++--
 drivers/media/platform/allegro-dvt/nal-h264.c |   52 +-
 drivers/media/platform/allegro-dvt/nal-h264.h |    4 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c |   42 +-
 drivers/media/platform/allegro-dvt/nal-hevc.h |    6 +-
 drivers/media/platform/coda/coda-bit.c        |    8 +-
 drivers/media/platform/coda/coda-common.c     |  218 +-
 drivers/media/platform/coda/coda-h264.c       |   40 +-
 drivers/media/platform/coda/coda-mpeg2.c      |   18 +-
 drivers/media/platform/coda/coda-mpeg4.c      |   22 +-
 drivers/media/platform/coda/coda.h            |    2 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    6 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |   80 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   38 +-
 drivers/media/platform/qcom/venus/helpers.c   |  154 +-
 .../media/platform/qcom/venus/vdec_ctrls.c    |   92 +-
 drivers/media/platform/qcom/venus/venc.c      |   26 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |  294 +--
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |   28 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   16 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  764 +++----
 .../media/platform/s5p-mfc/s5p_mfc_opr_v5.c   |   12 +-
 .../media/platform/s5p-mfc/s5p_mfc_opr_v6.c   |   38 +-
 drivers/media/platform/sti/hva/hva-debugfs.c  |   10 +-
 drivers/media/platform/sti/hva/hva-h264.c     |   48 +-
 drivers/media/platform/sti/hva/hva-v4l2.c     |  100 +-
 drivers/media/platform/sti/hva/hva.h          |   14 +-
 .../media/test-drivers/vicodec/vicodec-core.c |    4 +-
 drivers/media/usb/cx231xx/cx231xx-417.c       |    2 +-
 drivers/media/usb/go7007/go7007-v4l2.c        |   22 +-
 drivers/media/usb/hdpvr/hdpvr-control.c       |    6 +-
 drivers/media/usb/hdpvr/hdpvr-core.c          |    4 +-
 drivers/media/usb/hdpvr/hdpvr-video.c         |   46 +-
 drivers/media/usb/hdpvr/hdpvr.h               |    4 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |   72 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  640 +++---
 drivers/staging/media/hantro/hantro_drv.c     |   16 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |    4 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |    2 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |    4 +-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |    2 +-
 drivers/staging/media/rkvdec/rkvdec.c         |   16 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   34 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   12 +-
 .../bcm2835-camera/bcm2835-camera.c           |    4 +-
 .../bcm2835-camera/bcm2835-camera.h           |    4 +-
 .../vc04_services/bcm2835-camera/controls.c   |  126 +-
 include/media/drv-intf/cx2341x.h              |   36 +-
 include/media/hevc-ctrls.h                    |   22 +-
 include/media/mpeg2-ctrls.h                   |    4 +-
 include/media/vp8-ctrls.h                     |    2 +-
 include/uapi/linux/v4l2-controls.h            | 1824 +++++++++++------
 include/uapi/linux/videodev2.h                |    4 +-
 76 files changed, 4195 insertions(+), 3629 deletions(-)

-- 
2.30.1

