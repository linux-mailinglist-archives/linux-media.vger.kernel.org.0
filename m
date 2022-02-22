Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BFD4BF3A0
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 09:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiBVI2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 03:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiBVI2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 03:28:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D4AB5608
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 00:27:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0687161325
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98A9C340E8;
        Tue, 22 Feb 2022 08:27:43 +0000 (UTC)
Message-ID: <19a007e4-e287-145a-1891-ecde68aaa95a@xs4all.nl>
Date:   Tue, 22 Feb 2022 09:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Move tegra-vde out of staging
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

This series converts the driver to the standard V4L2 stateless decoder API
and removes the legacy API. This allows us to finally move the driver out
of staging.

Thank you very much, Dmitry, for working on this!

Regards,

	Hans


The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18p

for you to fetch changes up to 1988a49f6baeb8292953682d219e6a15d28b5495:

  media: staging: tegra-vde: De-stage driver (2022-02-22 09:11:16 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dmitry Osipenko (6):
      media: v4l2-ctrls: Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
      media: staging: tegra-vde: Factor out H.264 code
      media: staging: tegra-vde: Support V4L stateless video decoder API
      media: staging: tegra-vde: Remove legacy UAPI support
      media: staging: tegra-vde: Bump BSEV DMA timeout
      media: staging: tegra-vde: De-stage driver

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst          |    6 +
 MAINTAINERS                                                                  |    2 +-
 drivers/media/platform/Kconfig                                               |   17 +
 drivers/media/platform/Makefile                                              |    2 +
 drivers/media/platform/tegra/vde/Makefile                                    |    3 +
 drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/dmabuf-cache.c |    2 +-
 drivers/media/platform/tegra/vde/h264.c                                      |  946 +++++++++++++++++++++++++++++++++++++++
 drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/iommu.c        |    2 +-
 drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/trace.h        |    2 +-
 drivers/media/platform/tegra/vde/v4l2.c                                      | 1018 ++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/tegra/vde/vde.c                                       |  551 +++++++++++++++++++++++
 drivers/media/platform/tegra/vde/vde.h                                       |  242 ++++++++++
 drivers/staging/media/Kconfig                                                |    2 -
 drivers/staging/media/Makefile                                               |    1 -
 drivers/staging/media/tegra-vde/Kconfig                                      |   10 -
 drivers/staging/media/tegra-vde/Makefile                                     |    3 -
 drivers/staging/media/tegra-vde/TODO                                         |    4 -
 drivers/staging/media/tegra-vde/uapi.h                                       |   73 ---
 drivers/staging/media/tegra-vde/vde.c                                        | 1358 --------------------------------------------------------
 drivers/staging/media/tegra-vde/vde.h                                        |  125 ------
 include/uapi/linux/v4l2-controls.h                                           |    2 +
 21 files changed, 2791 insertions(+), 1580 deletions(-)
 create mode 100644 drivers/media/platform/tegra/vde/Makefile
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/dmabuf-cache.c (99%)
 create mode 100644 drivers/media/platform/tegra/vde/h264.c
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/iommu.c (98%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/trace.h (97%)
 create mode 100644 drivers/media/platform/tegra/vde/v4l2.c
 create mode 100644 drivers/media/platform/tegra/vde/vde.c
 create mode 100644 drivers/media/platform/tegra/vde/vde.h
 delete mode 100644 drivers/staging/media/tegra-vde/Kconfig
 delete mode 100644 drivers/staging/media/tegra-vde/Makefile
 delete mode 100644 drivers/staging/media/tegra-vde/TODO
 delete mode 100644 drivers/staging/media/tegra-vde/uapi.h
 delete mode 100644 drivers/staging/media/tegra-vde/vde.c
 delete mode 100644 drivers/staging/media/tegra-vde/vde.h
