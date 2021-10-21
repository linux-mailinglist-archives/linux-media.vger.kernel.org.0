Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A835B4364A2
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhJUOsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 10:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhJUOsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 10:48:09 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C648CC0613B9
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 07:45:53 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dZKGmlCWEqPdpdZKJmwE4f; Thu, 21 Oct 2021 16:45:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634827551; bh=efKIbarlqotK+1Cmz2IVfUCw17tUIcnpxo29BTnodFs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s/oXjHRt0xmxSmzv2g21xMOg2HhN6MnHcuxltVoSCPCqnumo3NPdDWWZApdp0jwmc
         SFvuxFf/2L3l5Yz3e9lr+WbIcJr9MYpO+A/X1bDakhvYI3/Mo+YqZVt9VkzVBORjfG
         Ec3tWcC8B2K7QiV6pa2WIVmQTaN4X9gIPSDdCQugaq+MjDY+sjAT55r94urUM+du6c
         dR3eHI+0K+Rf0Jkj0c2MW1eNB2vCuOn18/ifU0usIpnyKSkO2yCxX7a+pkiD2KXrdY
         vpMaeAUOMHyW6A8+mLQPZh88K6+JiiN+XJ4OkJHke54Ytv/uDbuAVlZg0bIO5JP/Z1
         4HavZlWvnY2aw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dillon Min <dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Add support for DMA2D of STMicroelectronics
 STM32 Soc series
Message-ID: <126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl>
Date:   Thu, 21 Oct 2021 16:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMPjA33nBTef6GtBMuVEmR2Q3Frhpc+hKeRCD/ms2+CU7bZzXjm8pLI/rBnmWEQhvgkhhhLTZ3GKWzhEaZykDdq9ml1jPOwv/edpPIfw6zH9eDaxOHXf
 zoBxXYzVQtRebUW+cpRORgSbIFCD+rTUcd2n3e9mMQyZ7oVQwQ6eOcEe2WIy9Ph1gmgGWzE4lp0GX2SUFCkly/SD3DIecxnf38B6uCpKrYj49RebQ5wfg/dy
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:

  media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 14:26:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16k

for you to fetch changes up to b019395c863f436adb30237b50f22b027bec7351:

  media: stm32-dma2d: STM32 DMA2D driver (2021-10-21 16:14:57 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dillon Min (8):
      media: admin-guide: add stm32-dma2d description
      media: dt-bindings: media: add document for STM32 DMA2d bindings
      media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
      media: videobuf2: Fix the size printk format
      media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
      media: v4l2-ctrls: Add RGB color effects control
      clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
      media: stm32-dma2d: STM32 DMA2D driver

 Documentation/admin-guide/media/platform-cardlist.rst       |   1 +
 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml |  71 +++++
 Documentation/userspace-api/media/v4l/control.rst           |   9 +
 drivers/clk/clk-stm32f4.c                                   |   4 -
 drivers/media/common/videobuf2/videobuf2-dma-contig.c       |   8 +-
 drivers/media/platform/Kconfig                              |  11 +
 drivers/media/platform/Makefile                             |   1 +
 drivers/media/platform/stm32/Makefile                       |   2 +
 drivers/media/platform/stm32/dma2d/dma2d-hw.c               | 143 ++++++++++
 drivers/media/platform/stm32/dma2d/dma2d-regs.h             | 113 ++++++++
 drivers/media/platform/stm32/dma2d/dma2d.c                  | 739 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/stm32/dma2d/dma2d.h                  | 135 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                   |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                      |  21 ++
 include/media/v4l2-mem2mem.h                                |   5 +
 include/uapi/linux/v4l2-controls.h                          |   4 +-
 16 files changed, 1268 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
