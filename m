Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC65E35D7C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 15:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbfFENHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 09:07:18 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48543 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727703AbfFENHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 09:07:17 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YVdJhm8dI3qlsYVdMhgFM4; Wed, 05 Jun 2019 15:07:16 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes/improvements
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <8a653d9b-8f4c-030d-3b37-39e5c3fd4504@xs4all.nl>
Date:   Wed, 5 Jun 2019 15:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLATlu2x92sP/whTiIMa4d94YrKd8m78HSfc0IzFtlfGFkW/wtY6IH9xejnQFaEa6fnVIP+2x4qBG37zFJydEMOiBcJlW0UDkVfM/A7k4kReRYAu2SuB
 caAPTOTG6YiS4KcIFGjBJmJGBCnwE6PknxpRF1o8cRwI0+qBDs0PhkyJPH2uY0l/sW0N5oXf+6A2sBHNX9VMrCm6AB7a4W3nMELaIv+z9eNbqiTy0UwcCW2g
 pxbRMd82VbY2HjOW5ytqEt8V/OE8t6JkhJYSlHNbWDMf9RMxDv61fC0FO+RFclak
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Nothing special, except for "media/doc: Allow sizeimage to be set by v4l clients".
Please review that again to check if your earlier comments are now all addressed.

Also note the cxusb revert patch. That's my fault, I never intended to accept that
patch (https://patchwork.linuxtv.org/patch/55944/) but I accidentally added it to
my PR anyway.

Regards,

	Hans

The following changes since commit 9b925365569eb4e845c006fdc254257e78fc12a4:

  media: vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs (2019-06-05 08:50:41 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3k

for you to fetch changes up to 4a6d854b95c02b69861ad95ecdddb36847b9a4d2:

  cxusb: Revert "media: cxusb: add raw mode support for, Medion MD95700" (2019-06-05 15:00:07 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (3):
      media: mtk-vcodec: replace GPLv2 with SPDX
      media: mtk-vcodec: avoid unneeded pointer-to-long conversions
      media: mtk-vcodec: constify formats

André Almeida (1):
      media: vimc: Remove or modify stream checks

Colin Ian King (1):
      media: vivid: fix incorrect assignment operation when setting video mode

Fabio Estevam (3):
      media: imx7-mipi-csis: Propagate the error if clock enabling fails
      media: imx7-mipi-csis: Remove unneeded 'ret' initialization
      media: imx7-mipi-csis: Remove extra blank line

Hans Verkuil (1):
      cxusb: Revert "media: cxusb: add raw mode support for, Medion MD95700"

Shobhit Kukreti (1):
      media: platform: Fix Warning of Unneeded Semicolon reported by coccicheck

Stanimir Varbanov (1):
      media/doc: Allow sizeimage to be set by v4l clients

Yunfei Dong (1):
      media: mtk-vcodec: support single-buffer frames

 Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst    |  15 ++++++-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst           |  13 +++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c     |  45 ++++++++------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h     |  15 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |  15 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  |  14 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  |  14 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     |  19 ++-------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c     |  34 +++++----------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h     |  15 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  15 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |  14 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h  |  14 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c    |  14 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h    |  14 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c    |  15 +------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h    |  15 +------
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |  26 ++++--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |  27 ++++--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |  30 ++++---------
 drivers/media/platform/mtk-vcodec/vdec_drv_base.h      |  22 +++-------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c        |  17 +-------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h        |  15 +------
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h       |  15 +------
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c        |  14 +------
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h        |  14 +------
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c  |  27 +++---------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c   |  26 +++---------
 drivers/media/platform/mtk-vcodec/venc_drv_base.h      |  25 +++--------
 drivers/media/platform/mtk-vcodec/venc_drv_if.c        |  19 +--------
 drivers/media/platform/mtk-vcodec/venc_drv_if.h        |  17 +-------
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h       |  17 +-------
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c        |  15 +------
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h        |  15 +------
 drivers/media/platform/pxa_camera.c                    |   2 +-
 drivers/media/platform/qcom/venus/vdec_ctrls.c         |   2 +-
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c   |   4 +-
 drivers/media/platform/vimc/vimc-debayer.c             |   5 +--
 drivers/media/platform/vimc/vimc-scaler.c              |   7 +---
 drivers/media/platform/vimc/vimc-sensor.c              |   6 +--
 drivers/media/platform/vivid/vivid-osd.c               |   2 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c               | 190 ++++++++++++++---------------------------------------------------------------------
 drivers/media/usb/dvb-usb/cxusb.h                      |   4 --
 drivers/media/v4l2-core/v4l2-ioctl.c                   |   3 +-
 drivers/staging/media/imx/imx7-mipi-csis.c             |  17 ++++----
 45 files changed, 177 insertions(+), 706 deletions(-)
