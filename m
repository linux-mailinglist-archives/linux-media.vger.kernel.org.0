Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F29C8525C66
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 09:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377821AbiEMHg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 03:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377820AbiEMHgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 03:36:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D64636E3E
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 00:36:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B44D1B820C1
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5883C34100;
        Fri, 13 May 2022 07:36:50 +0000 (UTC)
Message-ID: <0dd99c3a-09e0-a6ae-0d1e-1e66fa78ab5e@xs4all.nl>
Date:   Fri, 13 May 2022 09:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] mtk-vcodec: support for M8192 and MT8186 decoder
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit be938c70e292731f81226917fc214683e66da577:

  media: uvcvideo: Add UVC_GUID_FORMAT_H265 (2022-05-08 07:10:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19g

for you to fetch changes up to 21ee9bd79b5bb2af73fa0fb25bde07d1d35dd822:

  media: mediatek: vcodec: add h264 decoder driver for mt8186 (2022-05-13 09:18:47 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Yunfei Dong (21):
      media: mediatek: vcodec: Fix v4l2 compliance decoder cmd test fail
      media: mediatek: vcodec: Add vdec enable/disable hardware helpers
      media: mediatek: vcodec: Using firmware type to separate different firmware architecture
      media: mediatek: vcodec: get capture queue buffer size from scp
      media: mediatek: vcodec: Read max resolution from dec_capability
      media: mediatek: vcodec: set each plane bytesused in buf prepare
      media: mediatek: vcodec: Refactor get and put capture buffer flow
      media: mediatek: vcodec: Refactor supported vdec formats and framesizes
      media: mediatek: vcodec: Getting supported decoder format types
      media: mediatek: vcodec: Add format to support MT21C
      media: mediatek: vcodec: disable vp8 4K capability
      media: mediatek: vcodec: Fix v4l2-compliance fail
      media: mediatek: vcodec: record capture queue format type
      media: mediatek: vcodec: Extract H264 common code
      media: mediatek: vcodec: support stateless H.264 decoding for mt8192
      media: mediatek: vcodec: support stateless VP8 decoding
      media: mediatek: vcodec: support stateless VP9 decoding
      media: mediatek: vcodec: prevent kernel crash when rmmod mtk-vcodec-dec.ko
      dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for mt8186
      media: mediatek: vcodec: Support MT8186
      media: mediatek: vcodec: add h264 decoder driver for mt8186

 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml |    4 +-
 drivers/media/platform/mediatek/vcodec/Kconfig                              |    1 +
 drivers/media/platform/mediatek/vcodec/Makefile                             |    4 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c                     |   75 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h                     |    1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c                 |   15 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c                  |  166 +--
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.h                  |    6 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c            |   19 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c           |  276 +++--
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h                     |   41 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c                 |    5 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c                      |    6 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h                      |    1 +
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c          |  310 ++++++
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h          |  274 +++++
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c              |  438 +-------
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c        |  801 ++++++++++++++
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c               |  437 ++++++++
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c           | 2030 ++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.c                        |   37 +-
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.h                        |    3 +
 drivers/media/platform/mediatek/vcodec/vdec_ipi_msg.h                       |   36 +
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c                     |    2 +
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h                     |    2 +
 drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c                        |   53 +-
 drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h                        |   15 +
 drivers/media/platform/mediatek/vcodec/venc_vpu_if.c                        |    2 +-
 include/linux/remoteproc/mtk_scp.h                                          |    2 +
 29 files changed, 4448 insertions(+), 614 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
