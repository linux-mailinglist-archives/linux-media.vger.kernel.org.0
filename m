Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23E94AD73B
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 12:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376352AbiBHLcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 06:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357511AbiBHLZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 06:25:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16763C03FEC9
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 03:25:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7B4461589
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 11:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29E0C004E1
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 11:25:04 +0000 (UTC)
Message-ID: <d8cfded5-dc29-f7b7-c09d-7b6296e6ebae@xs4all.nl>
Date:   Tue, 8 Feb 2022 12:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Various fixes
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

These are a number of old patches that lingered in my TODO list.

I've been cleaning up my TODO list and these 5 patches are good to go.

Regards,

	Hans

The following changes since commit 127efdbc51fe6064336c0452ce9c910b3e107cf0:

  media: atomisp: fix dummy_ptr check to avoid duplicate active_bo (2022-02-08 07:31:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18k

for you to fetch changes up to 567706ae6680b3d62d044ab405bcdcb7e6cea328:

  media: camss: csiphy: Move to hardcode CSI Clock Lane number (2022-02-08 11:43:53 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (1):
      media: vimc: Add support for contiguous DMA buffers

Maxime Jourdan (1):
      media: s5p_mfc_dec: set flags for OUTPUT coded formats

Neil Armstrong (1):
      media: mexon-ge2d: fixup frames size in registers

Robert Foss (1):
      media: camss: csiphy: Move to hardcode CSI Clock Lane number

Tom Rix (1):
      video/hdmi: handle short reads of hdmi info frame.

 Documentation/admin-guide/media/vimc.rst                 | 13 +++++++++++++
 drivers/media/i2c/adv7511-v4l2.c                         |  2 +-
 drivers/media/i2c/adv7604.c                              |  2 +-
 drivers/media/i2c/adv7842.c                              |  2 +-
 drivers/media/platform/meson/ge2d/ge2d.c                 | 24 ++++++++++++------------
 drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c | 19 +++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 17 ++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c         | 21 +--------------------
 drivers/media/platform/qcom/camss/camss-csiphy.h         |  7 +++++++
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h          |  1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c             | 18 ++++++++++++++++++
 drivers/media/test-drivers/vimc/Kconfig                  |  1 +
 drivers/media/test-drivers/vimc/vimc-capture.c           |  9 +++++++--
 drivers/media/test-drivers/vimc/vimc-common.h            |  7 +++++++
 drivers/media/test-drivers/vimc/vimc-core.c              | 10 ++++++++++
 15 files changed, 113 insertions(+), 40 deletions(-)
