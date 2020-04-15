Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F811A9074
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 03:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392581AbgDOBbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 21:31:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50072 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbgDOBbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 21:31:00 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:79a2:b6f7:4033:5775:cc3a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACFE62A1BC8;
        Wed, 15 Apr 2020 02:30:54 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        skhan@linuxfoundation.org, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v3 0/4] media: add v4l2_pipeline_stream_{enable,disable} helpers
Date:   Tue, 14 Apr 2020 22:30:40 -0300
Message-Id: <20200415013044.1778572-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Media drivers need to iterate through the pipeline and call .s_stream()
callbacks in the subdevices.

Instead of repeating code, add helpers for this.

These helpers will go walk through the pipeline only visiting entities
that participates in the stream, i.e. it follows links from sink to source
(and not the opposite).

Which means that in a topology like this https://bit.ly/3b2MxjI
calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
.s_stream(true) for rkisp1_resizer_selfpath.

stream_count variable was added in v4l2_subdevice to handle nested calls
to the helpers.
This is useful when the driver allows streaming from more then one
capture device sharing subdevices.

This patch came from the error I was facing when multistreaming from
rkisp1 driver, where stoping one capture would call s_stream(false) in
the pipeline, causing a stall in the second capture device.

Also, the vimc patch https://patchwork.kernel.org/patch/10948833/ won't
be required with this patchset.

This patchset was tested on rkisp1 and vimc drivers.

Other cleanup might be possible (but I won't add in this patchset as I
don't have the hw to test):
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/qcom/camss/camss-video.c#n430
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/omap3isp/isp.c#n697
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/stm32/stm32-dcmi.c#n680
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/xilinx/xilinx-dma.c#n97

Changes in V3:
====================
Following up Niklas' comments in V2 https://patchwork.kernel.org/patch/11473681/#23270823

* I removed the limitation in topologies with entities with multiple enabled
links to its sink pads in the topology.
Now it enables all subdevs in the pipeline that have an enabled link going
from sink to source while walking from the video device, so it can be
also useful for rcar-vin driver.

To implement this, I added back in the series the patch from v1:
    "media: mc-entity.c: add media_graph_walk_next_stream()"

* "size" was renamed to "max_size" in function v4l2_pipeline_subdevs_get()
to reflect the maximum number of elements that can fit in the subdevs array,
with proper documentation.

* v4l2_pipeline_subdevs_get() returns a negative number for error, instead
of returning 0 and printing a warning.

* I also add if defined(CONFIG_MEDIA_CONTROLLER) around helpers to avoid
compiling errors.

Overview of patches in V3:
--------------------------

Patch 1/4 adds a new iterator function to follow links from sink to
source only.

Path 2/4 adds the helpers in v4l2-common.c, allowing nested calls by
adding stream_count in the subdevice struct.

Patch 3/4 cleanup rkisp1 driver to use the helpers.

Patch 4/4 cleanup vimc driver to use the helpers.

Changes in V2:
====================
The first version was calling the s_stream() callbacks from sensor to
capture.

This was generating errors in the Scarlet Chromebook, when the sensor
was being enabled before the ISP.

It make sense to enable subdevices from capture to sensor instead (which
is what most drivers do already).

This v2 drops the changes from mc-entity.c, and re-implement helpers in
v4l2-common.c

Overview of patches in V2:
--------------------------

Path 1/3 adds the helpers in v4l2-common.c, allowing nested calls by
adding stream_count in the subdevice struct.

Patch 2/3 cleanup rkisp1 driver to use the helpers.

Patch 3/3 cleanup vimc driver to use the helpers.

Helen Koike (4):
  media: mc-entity.c: add media_graph_walk_next_stream()
  media: v4l2-common: add helper functions to call s_stream() callbacks
  media: staging: rkisp1: use v4l2_pipeline_stream_{enable,disable}
    helpers
  media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers

 drivers/media/mc/mc-entity.c                  |  34 ++++-
 .../media/test_drivers/vimc/vimc-capture.c    |  28 ++--
 .../media/test_drivers/vimc/vimc-streamer.c   |  49 +------
 drivers/media/v4l2-core/v4l2-common.c         | 125 ++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-capture.c |  76 +----------
 include/media/media-entity.h                  |  15 +++
 include/media/v4l2-common.h                   |  43 ++++++
 include/media/v4l2-subdev.h                   |   2 +
 8 files changed, 242 insertions(+), 130 deletions(-)

-- 
2.26.0

