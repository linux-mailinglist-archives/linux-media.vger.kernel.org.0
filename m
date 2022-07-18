Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D277578A80
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 21:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbiGRTQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 15:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiGRTQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 15:16:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7382F675
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 12:16:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2425E616AF
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 19:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177B8C341C0
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 19:16:44 +0000 (UTC)
Message-ID: <6d662034-3a80-7217-6603-93b9e222e7a8@xs4all.nl>
Date:   Mon, 18 Jul 2022 21:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Various daily build fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches fix various daily build issues: documentation warnings and
smatch warnings and errors.

The following changes since commit 8bd1dbf8d580c425605fb8936309a4e9745a7a95:

  media: rkisp1: debug: Add dump file in debugfs for MI main path registers (2022-07-17 12:34:43 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20l

for you to fetch changes up to 2c5a90cde295463ff9e7771a6c833eb3adcff6a7:

  media: sunxi: sun6i_mipi_csi2.c/sun8i_a83t_mipi_csi2.c: clarify error handling (2022-07-18 18:10:22 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (3):
      vimc: wrong pointer is used with PTR_ERR
      media: videodev2.h.rst.exceptions: add missing exceptions
      media: sunxi: sun6i_mipi_csi2.c/sun8i_a83t_mipi_csi2.c: clarify error handling

Laurent Pinchart (2):
      media: Documentation: mc-core: Fix typo
      media: uvcvideo: Fix invalid pointer in uvc_ctrl_init_ctrl()

 Documentation/driver-api/media/mc-core.rst                               | 2 +-
 Documentation/userspace-api/media/videodev2.h.rst.exceptions             | 3 +++
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c           | 7 ++++---
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c | 7 ++++---
 drivers/media/test-drivers/vimc/vimc-core.c                              | 2 +-
 drivers/media/usb/uvc/uvc_ctrl.c                                         | 8 +++++---
 6 files changed, 18 insertions(+), 11 deletions(-)
