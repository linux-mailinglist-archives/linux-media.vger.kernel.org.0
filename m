Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7894F2ECD9A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbhAGKP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:15:56 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45871 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725974AbhAGKP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 05:15:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xSJykm2VZbMeAxSK1kTF5V; Thu, 07 Jan 2021 11:15:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610014513; bh=F4ENIB8Pw6ZE1YlMDG5ZrTQGBOWNOSBozBQglrz7cdI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AuFeyJvljdEyyrHOl7/QtZxZxQj4pP/23dp34Pt34PhIC6zyOv3ARNzkyKncYn2n/
         kWU8ufPaLIc2ExuD97TjONzYf1pRwTpcA2asseF95C5xNRrcFREBYE4v9VjRrMBAzB
         68fx6PjhroYxF1vQK2ePZWn49w3+X0Y+RdBZNEWhNytIQU33d9uBFTf0FM20/+vBI/
         wV9jWv7llIN8jpENAOPxPZ/T4uy8yy4Wj/qZu/34soNWzyIKuom1IQAWWP2KvWHXsJ
         O3PFSuItY4fta94oZ93lzemVtr1S19tPFKQU1wu+2soP6O7z6ION1OIHrPxbG2bFxO
         HnD30sjEkSe8w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Various fixes/enhancements
Message-ID: <02de968e-c955-55fc-407f-bf2dab0627f4@xs4all.nl>
Date:   Thu, 7 Jan 2021 11:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAHl9NEU9C5Q1bLS6bIP8xGYaMzuKG00AcLLjShWJAbyGdg47fhkuXvDpqIf7UaIUXSVc0Ez4v+dIk+lZjd4uj04oD7oCHiSMveBFiPUdZHBE33lbitO
 oChpdc+PrfeU4035Q0Vy+hwE1hmP+YqIuDxcMiM6gyau4WeQipB41Zfbx4u2fzD6B5AcObwowBAavwkbYYZK191vNTv8ve6dlvc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ecd07f4b9d2173694be9214a3ab07f9efb5ba206:

  media: allegro: rename stream_id to dst_handle (2021-01-04 13:22:54 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12a

for you to fetch changes up to cba0332488a47cd7e42f9ae3b4011d45b4c21271:

  media: aspeed: fix error return code in aspeed_video_setup_video() (2021-01-07 10:57:45 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: ti-vpe: cal: avoid FIELD_GET assertion

Christophe JAILLET (1):
      media: vsp1: Fix an error handling path in the probe function

Dan Carpenter (2):
      media: camss: Fix signedness bug in video_enum_fmt()
      media: camss: missing error code in msm_video_register()

Dinghao Liu (3):
      media: em28xx: Fix use-after-free in em28xx_alloc_urbs
      media: media/pci: Fix memleak in empress_init
      media: tm6000: Fix memleak in tm6000_start_stream

Enrico Weigelt (1):
      drivers: staging: media: remove unneeded MODULE_VERSION() call

Ezequiel Garcia (3):
      media: imx: Unregister csc/scaler only if registered
      media: imx: Fix csc/scaler unregister
      media: imx: Clean capture unregister

Geert Uytterhoeven (1):
      media: sh_vou: Drop bogus __refdata annotation

Kieran Bingham (1):
      media: vsp1: Use BIT macro for feature identification

Lukas Bulwahn (1):
      media: MAINTAINERS: correct entry in Amlogic GE2D driver section

Martin Kepplinger (1):
      staging: media: imx: Kconfig: support VIDEO_IMX7_CSI for imx8m

Matwey V. Kornilov (1):
      media: pwc: Use correct device for DMA

Nigel Christian (1):
      media: cec: fix trivial style warnings

Sebastian Fricke (1):
      media: rkisp1: isp: Add the enum_frame_size ioctl

Travis Carter (2):
      staging:hantro: Fixed "replace comma with semicolon" Warning:
      staging:rkvdec: Fixed "replace comma with semicolon" Warning:

Zhang Changzhong (2):
      media: mtk-vcodec: fix error return code in vdec_vp9_decode()
      media: aspeed: fix error return code in aspeed_video_setup_video()

Zheng Yongjun (1):
      media: platform: davinci: Use DEFINE_SPINLOCK() for spinlock

 MAINTAINERS                                          |  2 +-
 drivers/media/cec/core/cec-adap.c                    |  4 ++--
 drivers/media/pci/saa7134/saa7134-empress.c          |  5 ++++-
 drivers/media/platform/aspeed-video.c                |  6 +++---
 drivers/media/platform/davinci/vpif.c                |  3 +--
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c |  3 ++-
 drivers/media/platform/qcom/camss/camss-video.c      |  3 ++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c  | 34 ++++++++++++++++++++++++++++++++++
 drivers/media/platform/sh_vou.c                      |  2 +-
 drivers/media/platform/ti-vpe/cal.h                  |  2 +-
 drivers/media/platform/vsp1/vsp1.h                   | 20 ++++++++++----------
 drivers/media/platform/vsp1/vsp1_drv.c               |  4 +++-
 drivers/media/usb/em28xx/em28xx-core.c               |  6 +-----
 drivers/media/usb/pwc/pwc-if.c                       | 22 +++++++++++++---------
 drivers/media/usb/tm6000/tm6000-dvb.c                |  4 ++++
 drivers/staging/media/hantro/hantro_v4l2.c           |  2 +-
 drivers/staging/media/imx/Kconfig                    |  9 +++++----
 drivers/staging/media/imx/Makefile                   |  2 +-
 drivers/staging/media/imx/imx-media-capture.c        | 10 ++--------
 drivers/staging/media/imx/imx-media-csc-scaler.c     |  4 ----
 drivers/staging/media/imx/imx-media-dev.c            |  7 ++++++-
 drivers/staging/media/omap4iss/iss.c                 |  1 -
 drivers/staging/media/omap4iss/iss_video.h           |  1 -
 drivers/staging/media/rkvdec/rkvdec.c                |  2 +-
 24 files changed, 98 insertions(+), 60 deletions(-)
