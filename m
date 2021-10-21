Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1684364E9
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 17:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhJUPDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhJUPDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:03:08 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD44C0613B9
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 08:00:52 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dZYjmlHknqPdpdZYmmwGII; Thu, 21 Oct 2021 17:00:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634828448; bh=OVJKx8bTm54R2oo7E3LzY71j7it2GJYHGW/UPBhCWHU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=I8n4ypE09b4Naq+hVIWuE3dIPFQZfb0AYSULEqOis+afk7dbuPPiXltY+OcvCu6zw
         1NbL7GDiRitrJhW8vJlnNrOWkua5MmIx7XsyECVcmcrYkw0h+neP0W5o2TmbMJ3X3e
         IXu6OZh4WhGGcFqkP74EBIQpyP9hhSPCJfanxeBxPmO0tIQa7tx5h67YNcXE0jCrL/
         ATN4cs7guBBSjWa3zFC7RLWoFAEHGDiCgTC8NLyatQw25D5FIso06lPFz0VUSZQrQU
         K5vEW4j49EYq0hVnsbCilTJWtLvVKN3X7G2s1wiiT31sIN8dDuD+4GDa2K2Czl8kRR
         hewIKul3Ag5VQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dillon Min <dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] v2: Add support for DMA2D of STMicroelectronics
 STM32 Soc series
Message-ID: <8270d145-882d-82e4-307f-6a0f058cb0cf@xs4all.nl>
Date:   Thu, 21 Oct 2021 17:00:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKxe8f5IBzrun1ezhzegnUAUGQ8a2GSLjPb1CdrQ+FbalM4a6tl8YLk2W1jD/hb6h0Xn8BzjMg+beAtLpO4SiM46vJcyqQQ4MtURfIGYG4PeMi1A/dUK
 91vxKi2Seu8rdWtYtqeL1ZdTbYLQtMSe3zOzIbU7cSI3IbgOw5suZjgGI33sMku6OK21UO1fILmJ1Xm2BleO+Ehrfcm5VcuuoimuIBllbf8TVtTcHfqcSUiq
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v2: dropped the clk patch, on second thought that really should
go in through the clk subsystem.

Regards,

	Hans

The following changes since commit 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:

  media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 14:26:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16k

for you to fetch changes up to 38c3c6a58fc8619eebba57bfec022d22f448f709:

  media: stm32-dma2d: STM32 DMA2D driver (2021-10-21 16:58:01 +0200)

----------------------------------------------------------------
tag branch

----------------------------------------------------------------
Dillon Min (7):
      media: admin-guide: add stm32-dma2d description
      media: dt-bindings: media: add document for STM32 DMA2d bindings
      media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
      media: videobuf2: Fix the size printk format
      media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
      media: v4l2-ctrls: Add RGB color effects control
      media: stm32-dma2d: STM32 DMA2D driver

 Documentation/admin-guide/media/platform-cardlist.rst       |   1 +
 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml |  71 +++++
 Documentation/userspace-api/media/v4l/control.rst           |   9 +
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
 15 files changed, 1268 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
