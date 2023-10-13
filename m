Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64AA7C83E5
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjJMLBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjJMLBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:01:17 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315F5BD
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:01:16 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qrFuT-0006xJ-RA; Fri, 13 Oct 2023 13:00:49 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 00/13] media: rockchip: rga: add support for
 multi-planar formats
Date:   Fri, 13 Oct 2023 13:00:21 +0200
Message-Id: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUjKWUC/42NQQ6CMBBFr2K6dkwpRoIr72FYTMsAE2tLpkAwh
 LtbOYHL95L/36YSCVNS99OmhBZOHEMGcz4pN2DoCbjNrIw2pa6LK0h0LzfwCNIjvGc/8egxoIB
 uK1fVtrBYlyrPLSYCKxjckA/C7H2Wo1DH69F7NpkHTlOUz5Ffip/9o7QUoAFt11aVuWmk8jFS6
 OdJYuD10pJq9n3/AhyUKKvaAAAA
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v2 of the series that adds support for the V4L2 multi-planar API
to the Rockchip RGA driver. Once the RGA driver supports the
multi-planar API, it is easier to share buffers with other V4L2 drivers
that also support the multi-planar API and may not expose planar formats
with contiguous planes.

v2 fixes the smatch warnings and compile errors of v1. Furthermore, now
the DMA mask is set to 32 bits for coherent, too, and the gfp_flags are
configured to ensure that buffers are allocated in the lower 4GB area.

With non-contiguous planes, the U and V planes may not start at the same
offset as with the continuous planes. Therefore, the RGA driver cannot
rely on its calculation of the plane offsets based on the format and
frame size anymore, but must remember the offsets when it created the
mapping. Therefore, I also reworked how the DMA mapping is handled.

As a bonus, the RGA driver should now work correctly on devices with
more than 4 GB of memory. Video buffers should now be allocated within
the 4 GB boundary and an import of buffers that have higher addresses
into the driver should fail.

Patch 1 fixes the swizzling of RGA formats. While testing all formats of
the driver on rk3568, I discovered that the color channels of the RGB
formats are wrong when converting to NV12. I didn't test this on other
SoCs with an RGA and I am not sure, if they behave differently regarding
the color channels. Please report, if this breaks the color conversion
on other SoCs, and I will make this SoC-specific.

Patches 2 to 6 are the rework the DMA descriptor handling for the RGA
MMU. The patches clean up, how the driver uses the DMA API, and make the
creation of the descriptor list more explicit. Furthermore, the driver
is changed to keep the mapping per video buffer instead of using a
single mapping that is updated with every buffer.

Patches 7 to 11 prepare the driver for the multi-planar API including a
cleanup of the format handling in the buffer, and finally switch to the
multi-planar API.

Patch 12 updates the code that creates the DMA-descriptor mapping to
correctly handle buffers with multiple planes. The driver has to iterate
all planes and make them the continuous for the RGA.

Patch 13 enables the NV12M format, which is the multi-planar variant of
the NV12 format.

Michael

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Fix smatch warnings
- Fix cast to dst_mmu_pages/src_mmu_pages to fix compile error in Patch 2
- Remove check for upper_32_bits when filling the DMA descriptor table
- Remove useless dma_sync_single_for_device()
- Set DMA mask for DMA coherent
- Set gfp_flags to __GFP_DMA32
- Link to v1: https://lore.kernel.org/r/20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de

---
Michael Tretter (13):
      media: rockchip: rga: fix swizzling for RGB formats
      media: rockchip: rga: extract helper to fill descriptors
      media: rockchip: rga: allocate DMA descriptors per buffer
      media: rockchip: rga: split src and dst buffer setup
      media: rockchip: rga: pre-calculate plane offsets
      media: rockchip: rga: set dma mask to 32 bits
      media: rockchip: rga: use clamp() to clamp size to limits
      media: rockchip: rga: use pixelformat to find format
      media: rockchip: rga: add local variable for pix_format
      media: rockchip: rga: use macros for testing buffer type
      media: rockchip: rga: switch to multi-planar API
      media: rockchip: rga: rework buffer handling for multi-planar formats
      media: rockchip: rga: add NV12M support

 drivers/media/platform/rockchip/rga/rga-buf.c | 162 ++++++++++++++++------
 drivers/media/platform/rockchip/rga/rga-hw.c  | 146 ++++++++++++--------
 drivers/media/platform/rockchip/rga/rga.c     | 189 ++++++++++++--------------
 drivers/media/platform/rockchip/rga/rga.h     |  35 ++++-
 4 files changed, 328 insertions(+), 204 deletions(-)
---
base-commit: 2c1bae27df787c9535e48cc27bbd11c3c3e0a235
change-id: 20230914-rockchip-rga-multiplanar-0d7c79b1ba93

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>

