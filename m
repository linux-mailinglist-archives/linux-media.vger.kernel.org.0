Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE2D45436C
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbhKQJTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbhKQJTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:19:49 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1D8C061570
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 01:16:50 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nH3dmNViV1HGJnH3gmpCzj; Wed, 17 Nov 2021 10:16:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637140608; bh=9/7MVjrm0TR+bztMekG2XEk85y7EF/yz/i2IVX2bv9A=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Xx6UGMc8LVOsfTeL4oGH8Vq1w0L+2miMxgCIEdQt18I+q+p5oEkJYxGRxvgQRBxuc
         UDABSPT9GPkgmd0/A7REAGy+fvGCPx8zietAUsgFFTgqhXMjdP6S5DLtFrFQDJBhVb
         Tf798V3MKFZG0R1neAFSYZS1Hhs4aED/t730LameXlgI9NCkmNuWt62hDhE9Z4R8Ha
         SyvL6/Sqvce/3ewRqAmaYBRXiv/VQZc4ESGBRrKdVyoCEZOKRXY5YG47cJYNNoYcbh
         hsiQoxTrg1veolIrcNlFCS1VN50vDHfhUMwysO3gR4E7vey286ITkwmDjWvXPSTHBF
         K+jhHzRjrQybQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Hovold <johan@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] Various fixes/enhancements
Message-ID: <21f4ea07-24ea-7b8c-18a3-e69c0dbb095d@xs4all.nl>
Date:   Wed, 17 Nov 2021 10:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD+3fof9nuAWrOD+CAlrqJif6x3TKxaF+7WXeRLOLoCIoomC9NIflBMn0E3BlSSDed9J44nSt/P4afVKAWl6g9gka4RY8sDX5mIzqVN8fuvppiVxG+5s
 HYQmfr6JnO/rlHoAsANJCgKSQYs4yo6doIwy0wX7AiEvrol2uxiYb3ha1dLiGmsgpiGAG6Id36rdCE/DzfF2A/Ss2KAxIkptoNIqGsZhI8sDa0yFIUhB+q92
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 96977c97e2c76f48d5e1f28ff5c6cd6f83a91ced:

  media: atomisp: get rid of #ifdef ISP_VEC_NELEMS (2021-11-16 11:49:43 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17b

for you to fetch changes up to 27a538222948cee5f81140e0a49ecdc2097e7a38:

  media: coda: V4L2_PIX_FMT_GREY for coda960 JPEG Encoder (2021-11-17 10:05:49 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (2):
      media: mtk-vcodec: enc: add vp8 profile ctrl
      meida: mtk-vcodec: remove unused func parameter

Dorota Czaplejewicz (1):
      media: imx: Remove unused functions

Johan Hovold (8):
      media: mceusb: fix control-message timeouts
      media: redrat3: fix control-message timeouts
      media: flexcop-usb: fix control-message timeouts
      media: cpia2: fix control-message timeouts
      media: em28xx: fix control-message timeouts
      media: pvrusb2: fix control-message timeouts
      media: s2255: fix control-message timeouts
      media: stk1160: fix control-message timeouts

Martin Weber (1):
      media: coda: V4L2_PIX_FMT_GREY for coda960 JPEG Encoder

Niklas Söderlund (1):
      media: rcar-vin: Free buffers with error if hardware stop fails

 drivers/media/platform/coda/coda-common.c             |  8 +++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c    | 10 ++++++++++
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c |  9 +++------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  |  3 +--
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c       |  1 -
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h       |  1 -
 drivers/media/platform/rcar-vin/rcar-dma.c            | 10 ++++++++++
 drivers/media/rc/mceusb.c                             |  8 ++++----
 drivers/media/rc/redrat3.c                            | 22 +++++++++++-----------
 drivers/media/usb/b2c2/flexcop-usb.c                  | 10 +++++-----
 drivers/media/usb/b2c2/flexcop-usb.h                  | 12 ++++++------
 drivers/media/usb/cpia2/cpia2_usb.c                   |  4 ++--
 drivers/media/usb/em28xx/em28xx-core.c                |  4 ++--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c               |  8 ++++----
 drivers/media/usb/s2255/s2255drv.c                    |  4 ++--
 drivers/media/usb/stk1160/stk1160-core.c              |  4 ++--
 drivers/staging/media/imx/imx-media-utils.c           | 42 ------------------------------------------
 drivers/staging/media/imx/imx-media.h                 |  4 ----
 18 files changed, 69 insertions(+), 95 deletions(-)
