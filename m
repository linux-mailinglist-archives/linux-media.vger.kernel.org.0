Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE25C51F893
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 11:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiEIJv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 05:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239863AbiEIJrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 05:47:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F839179098
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 02:43:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 35E38B80D3B
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 09:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31515C385A8;
        Mon,  9 May 2022 09:43:02 +0000 (UTC)
Message-ID: <24482012-ac76-0886-c5cb-c868c8ecec93@xs4all.nl>
Date:   Mon, 9 May 2022 11:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] Various fixes/enhancements
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

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19h

for you to fetch changes up to 2ac0836fb3177fd4d2a13401774a0fad5d94f1f9:

  media: hantro: HEVC: unconditionnaly set pps_{cb/cr}_qp_offset values (2022-05-09 11:41:24 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (5):
      media: hantro: Use post processor scaling capacities
      media: hantro: HEVC: Fix output frame chroma offset
      media: hantro: HEVC: Fix tile info buffer value computation
      media: hantro: HEVC: Fix reference frames management
      media: hantro: HEVC: unconditionnaly set pps_{cb/cr}_qp_offset values

Eugen Hristev (9):
      media: atmel: atmel-isc-base: use streaming status when queueing buffers
      media: atmel: atmel-isc-base: replace is_streaming call in s_fmt_vid_cap
      media: atmel: atmel-isc: remove redundant comments
      media: atmel: atmel-sama5d2-isc: fix wrong mask in YUYV format check
      media: atmel: atmel-isc-base: use mutex to lock awb workq from streaming
      media: atmel: atmel-isc: compact the controller formats list
      media: atmel: atmel-sama7g5-isc: remove stray line
      dt-bindings: media: microchip,xisc: add bus-width of 14
      media: atmel: microchip-csi2dc: add link validation support

Ming Qian (2):
      media: amphion: wake up when error occurs
      media: amphion: G/S_PARM only for encoder's output queue

 Documentation/devicetree/bindings/media/microchip,xisc.yaml |  2 +-
 drivers/media/platform/amphion/venc.c                       |  6 ++++++
 drivers/media/platform/amphion/vpu_v4l2.c                   |  8 ++++----
 drivers/media/platform/atmel/atmel-isc-base.c               | 34 ++++++++++++++++++++++++++------
 drivers/media/platform/atmel/atmel-isc.h                    |  8 +++++---
 drivers/media/platform/atmel/atmel-sama5d2-isc.c            | 53 +++++++++++++++++--------------------------------
 drivers/media/platform/atmel/atmel-sama7g5-isc.c            | 61 +++++++++++++++++++--------------------------------------
 drivers/media/platform/atmel/microchip-csi2dc.c             |  5 +++++
 drivers/staging/media/hantro/hantro.h                       |  2 ++
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c           | 36 ++++++++++++++++++++--------------
 drivers/staging/media/hantro/hantro_g2_regs.h               |  6 ++++++
 drivers/staging/media/hantro/hantro_hevc.c                  | 44 +++--------------------------------------
 drivers/staging/media/hantro/hantro_hw.h                    | 12 +++++++-----
 drivers/staging/media/hantro/hantro_postproc.c              | 53 +++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/staging/media/hantro/hantro_v4l2.c                  | 15 +++++++-------
 15 files changed, 184 insertions(+), 161 deletions(-)
