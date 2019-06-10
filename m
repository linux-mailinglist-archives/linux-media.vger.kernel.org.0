Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED463BDE0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 22:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfFJUzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 16:55:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59292 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbfFJUzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 16:55:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B8B8127FD62
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/5] media: Access videobuf2 buffers via an accessor
Date:   Mon, 10 Jun 2019 17:55:21 -0300
Message-Id: <20190610205526.2629-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patchset introduces a new vb2_get_buffer accessor and then
uses it on all the drivers that are accessing videobuf2
private buffer array directly.

I'm skipping Intel IPU3 driver here, since the code goes beyond
just accessing the buffer. It also modifies the buffer queue
directly. I believe this driver would need some more cleanup
and love from its maintainers.

Note that OMAP2/OMAP3 display driver is videobuf1 and so not
affected by this change.

Lastly, note that I'm doing the minimum changes to drivers I can't test,
only using the new accessor and avoiding any further changes.

Changes from v1:

* Address feedback from Boris, and drop redundant check.

Thanks,
Ezequiel

Ezequiel Garcia (5):
  media: vb2: Introduce a vb2_get_buffer accessor
  media: mtk-jpeg: Use vb2_get_buffer
  media: mtk-vcodec: Use vb2_get_buffer
  media: sti: Use vb2_get_buffer
  media: rockchip: Use vb2_get_buffer

 .../media/platform/mtk-jpeg/mtk_jpeg_core.c    |  2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 +++++++++---
 drivers/media/platform/sti/hva/hva-v4l2.c      |  4 +++-
 .../media/rockchip/vpu/rockchip_vpu_drv.c      |  9 ++++++---
 include/media/videobuf2-core.h                 | 18 ++++++++++++++++++
 5 files changed, 37 insertions(+), 8 deletions(-)

-- 
2.20.1

