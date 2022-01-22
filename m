Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4DE496AFC
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 09:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiAVITR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 03:19:17 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58962 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiAVITR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 03:19:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 62D70B81FC3
        for <linux-media@vger.kernel.org>; Sat, 22 Jan 2022 08:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A25C004E1;
        Sat, 22 Jan 2022 08:19:14 +0000 (UTC)
Message-ID: <76d19a65-7ca0-092d-2e50-f1ee9cf4cd54@xs4all.nl>
Date:   Sat, 22 Jan 2022 09:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Chen-Yu Tsai <wens@csie.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] hantro: jpeg: Various improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 5da908b7af4c3ebd6748069d7223dc7a1a98d834:

  media: stm32: dcmi: create a dma scatterlist based on DMA max_sg_burst value (2022-01-14 09:48:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18h

for you to fetch changes up to b64388c09c2cbee4b2a1d70a8aecb7ae2f33041d:

  media: hantro: jpeg: Remove open-coded size in quantization table code (2022-01-20 15:18:23 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Chen-Yu Tsai (7):
      media: hantro: Fix overfill bottom register field name
      media: hantro: Support cropping visible area for encoders
      media: hantro: jpeg: Add JFIF APP0 segment to JPEG encoder output
      media: hantro: jpeg: Add COM segment to JPEG header to align image scan
      media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
      media: hantro: output encoded JPEG content directly to capture buffers
      media: hantro: jpeg: Remove open-coded size in quantization table code

 drivers/staging/media/hantro/TODO                        |  7 ------
 drivers/staging/media/hantro/hantro.h                    |  1 -
 drivers/staging/media/hantro/hantro_drv.c                | 41 ++++++++++++++++++++----------
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c        | 41 ++++++++++++++++++------------
 drivers/staging/media/hantro/hantro_h1_regs.h            |  2 +-
 drivers/staging/media/hantro/hantro_hw.h                 | 11 --------
 drivers/staging/media/hantro/hantro_jpeg.c               | 86 ++++++++++++++++++++++++++++++++++-----------------------------
 drivers/staging/media/hantro/hantro_jpeg.h               |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c               | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c | 44 +++++++++++++++++++-------------
 drivers/staging/media/hantro/rockchip_vpu_hw.c           |  6 -----
 11 files changed, 204 insertions(+), 114 deletions(-)
