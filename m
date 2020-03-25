Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB16B192A71
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 14:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgCYNwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 09:52:01 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:40025 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727316AbgCYNwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 09:52:01 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id H6RnjMKHiLu1fH6Rrj05ps; Wed, 25 Mar 2020 14:51:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585144319; bh=E82g3bAlHQRhLwgWcS4OMvuWyXjxuvCJu7c42w5wcdc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YDejTGv6hLnsFwvk5PJHPs/MV2soXlZ/0pc8V5Mb/iKM+iSnrQCxrm//N2m/D/cuJ
         mibHtORB4VmlK33BD7KYrI9thUCIFfUByDZe0vle5dEKN/rPii4wxo2neNPiXqoviv
         Vl1Y/jom9Wt0vVKxvFSx0MqfmgnA5zOE9+NTbIhHBSFGo2QY4HVT4WVg8rKjbhIkLR
         XB61Ov8ha139lwevazDvlJknoZKGQ9ewqo3BaiW1QVqvI773W8LMuu9W2k+NBDJvxV
         ++bYcvV6gE6Yh/EMVIe+jE1Bq/3Feu/vCTyNX+et081Tcrb83Zd4mWaVHBuFu4CzsW
         beAdleGtNqnGw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] ti-vpe/cal and imx7-mipi-csis cleanups/fixes
Message-ID: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
Date:   Wed, 25 Mar 2020 14:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHsyeG9/TbHqQajiVNEQd95522nq3KoBS6piG6KgMfx/RQg3imr11WV3O6f4+n+XgypBxR8cUrSsXm4TmItR8mbjUCm6zqiuGKbkabb17iDD92QDzujX
 mZjQX11htylGnofRP0PAuxRSA1N+vGAvc0p1DKawKw9bsIPJmZ6GgAxTBSw5kj8ojKnvI+09mpZ2c9RxhU41NpQR0IgxEJzB/W6ccuadqV8eTwU++EGPvqKS
 +f6wOIJvddX7wvDgi7WYPd5/mO4039sPT6PMevdwuHQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ad71693f41aa60217eaf1c29afb49b3aa0a2db5d:

  media: mtk-vpu: load vpu firmware from the new location (2020-03-24 17:11:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7n

for you to fetch changes up to 938b4f6cbbd7c7bd2236f4594ef37431c519f7a7:

  media: ti-vpe: cal: fix stop state timeout (2020-03-25 13:21:59 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (14):
      media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
      media: imx: imx7-mipi-csis: Centralize initialization of pad formats
      media: imx: imx7-mipi-csis: Add missing RAW formats
      media: imx: imx7-mipi-csis: Expose correct YUV formats
      media: imx: imx7-mipi-csis: Fix MEDIA_BUS_FMT_UYVY8_2X8 data alignment
      media: imx: imx7-mipi-csis: Add MEDIA_BUS_FMT_UYVY10_2X10 support
      media: imx: imx7-mipi-csis: Rename data_alignment field to width
      media: imx: imx7-mipi-csis: Align image width based on format
      media: imx: imx7-mipi-csis: Never set MIPI_CSIS_ISPCFG_ALIGN_32BIT
      media: imx: imx7-mipi-csis: Align macro definitions
      media: imx: imx7-mipi-csis: Remove link setup on source pad
      media: imx: imx7-mipi-csis: Cleanup includes
      media: imx: imx7-mipi-csis: Don't use imx-media-utils helpers
      media: imx: imx7-mipi-csis: Implement the .enum_mbus_code() operation

Tomi Valkeinen (19):
      media: ti-vpe: cal: fix DMA memory corruption
      media: ti-vpe: cal: improve enable_irqs
      media: ti-vpe: cal: fix use of wrong macro
      media: ti-vpe: cal: use runtime_resume for errata handling
      media: ti-vpe: cal: drop cal_runtime_get/put
      media: ti-vpe: cal: catch error irqs and print errors
      media: ti-vpe: cal: print errors on timeouts
      media: ti-vpe: cal: simplify irq handling
      media: ti-vpe: cal: remove useless CAL_GEN_* macros
      media: ti-vpe: cal: remove useless IRQ defines
      media: ti-vpe: cal: use reg_write_field
      media: ti-vpe: cal: cleanup CIO power enable/disable
      media: ti-vpe: cal: fix dummy read to phy
      media: ti-vpe: cal: program number of lines properly
      media: ti-vpe: cal: set DMA max seg size
      media: ti-vpe: cal: move code to separate functions
      media: ti-vpe: cal: improve wait for CIO resetdone
      media: ti-vpe: cal: improve wait for stop-state
      media: ti-vpe: cal: fix stop state timeout

 drivers/media/platform/ti-vpe/cal.c        | 397 ++++++++++++++++++++++++++++++---------------------
 drivers/media/platform/ti-vpe/cal_regs.h   |  21 +--
 drivers/staging/media/imx/imx7-mipi-csis.c | 446 ++++++++++++++++++++++++++++++++++++----------------------
 3 files changed, 518 insertions(+), 346 deletions(-)
