Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA372B274
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 12:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfE0Kv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 06:51:26 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34999 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725814AbfE0Kv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 06:51:26 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VDDvhaSt3sDWyVDDwhYnEE; Mon, 27 May 2019 12:51:24 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] imx fixes, cleanups
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Message-ID: <ae1358f4-2270-e696-39e0-17a832a11208@xs4all.nl>
Date:   Mon, 27 May 2019 12:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAsNgq+7YxGlKI0HabORtlgb4nAlepacLXFgiV29EkLzV84Q5USFZkPu38ahbwoqEUdlKcRrZzq7i7dx9oXkd+MUynOns3JYuPgyFen3r1mXKDUdy1dh
 wBgLxqciguUdL2SCo85+f/1WdxARACO3CkHVATqawOHr3Ann+9AiXPdy5z5yoNo6Ums+PlTys8+3ruUCm0SI3FrYjq2iEU+wW/WpsXN3ecsB4YKGRb0UCVDy
 g/DULlgGZihK38GOt+8kL0JeE3OvSGijqPjIDLum24XlFfP+6VqVdlHPqxVV4GZfWzpA9aDefYZWaV6jdgRKC1NRNQR4B+V9ZO7fXeQxwnQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various imx fixes and cleanups.

Fabio, I dropped your dt-bindings 1/8 patch from this PR since I don't have a
Acked-by from Rob Herring yet. You might want to ping him.

Regards,

	Hans

The following changes since commit 2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c:

  media: venus: firmware: fix leaked of_node references (2019-05-24 09:03:06 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3d3

for you to fetch changes up to e5498a2bda3f44af70dbc079d23f894afcf3e458:

  media: imx7-media-csi: Change imx7_csi_enable() to void (2019-05-27 12:41:22 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Fabio Estevam (7):
      media: imx7-media-csi: Acquire a single clock
      media: imx7-media-csi: Use devm_platform_ioremap_resource()
      media: imx7-media-csi: Propagate the correct error for platform_get_irq()
      media: imx7-media-csi: Propagate the correct error for devm_request_irq()
      media: imx7-media-csi: Remove unneeded break
      media: imx7-media-csi: Check the return value from clk_prepare_enable()
      media: imx7-media-csi: Change imx7_csi_enable() to void

Steve Longerbeam (9):
      Revert "media: staging/imx: add media device to capture register"
      media: staging/imx: Switch to sync registration for IPU subdevs
      media: staging/imx: Pass device to alloc/free_dma_buf
      media: staging/imx: Move add_video_device into capture_device_register
      Revert "media: imx: Set capture compose rectangle in capture_device_set_format"
      media: staging/imx: Remove capture_device_set_format
      media: staging/imx: Re-organize modules
      media: staging/imx: Improve pipeline searching
      media: staging/imx: Don't set driver data for v4l2_dev

 drivers/staging/media/imx/Makefile                |  18 +--
 drivers/staging/media/imx/imx-ic-common.c         |  68 ++++-------
 drivers/staging/media/imx/imx-ic-prp.c            |  36 +++---
 drivers/staging/media/imx/imx-ic-prpencvf.c       |  90 ++++++--------
 drivers/staging/media/imx/imx-ic.h                |   6 +-
 drivers/staging/media/imx/imx-media-capture.c     |  94 ++++++++++-----
 drivers/staging/media/imx/imx-media-csi.c         |  47 ++------
 drivers/staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/staging/media/imx/imx-media-dev.c         | 449 +++------------------------------------------------------------------
 drivers/staging/media/imx/imx-media-fim.c         |   9 --
 drivers/staging/media/imx/imx-media-internal-sd.c | 357 ++++++++++++++++++++++++-------------------------------
 drivers/staging/media/imx/imx-media-of.c          |  41 +++----
 drivers/staging/media/imx/imx-media-utils.c       | 170 +++++++++++++-------------
 drivers/staging/media/imx/imx-media-vdic.c        |  84 ++++---------
 drivers/staging/media/imx/imx-media.h             | 116 +++++++++---------
 drivers/staging/media/imx/imx7-media-csi.c        | 123 +++++--------------
 16 files changed, 884 insertions(+), 1170 deletions(-)
