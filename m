Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A21187366
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 20:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732477AbgCPTdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 15:33:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51844 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732366AbgCPTdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 15:33:20 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CAFCD293369
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        niklas.soderlund@ragnatech.se, mchehab@kernel.org,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 0/4] media: add v4l2_pipeline_stream_{enable,disable} helpers
Date:   Mon, 16 Mar 2020 16:33:01 -0300
Message-Id: <20200316193305.428378-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
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
that participates in the stream, i.e. it follow link from sink to source
(and not the opposite).

Which means that in a topology like this https://bit.ly/3b2MxjI
calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
.s_stream(true) for rkisp1_resizer_selfpath.

stream_count variable was added in v4l2_subdevice to handle nested calls
to the helpers.
This is useful when the driver allows streaming from more then one
capture device sharing subdevices.

This patch came from the error I was facing when multistreaming from
rkisp1 driver, where stopping one capture would call s_stream(false) in
the pipeline, causing a stall in the second capture device.

Also, the vimc patch https://patchwork.kernel.org/patch/10948833/ won't
be required with this patchset.

This patchset was tested on rkisp1 and vimc drivers.

Other cleanup might be possible (but I won't add in this patchset as I
don't have the hw to test):
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/omap3isp/isp.c#n697
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/qcom/camss/camss-video.c#n430
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/stm32/stm32-dcmi.c#n680
	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/xilinx/xilinx-dma.c#n97

Overview of patches:
====================

Patch 1/4 adds a new iterator function to follow links from sink to
source only.

Path 2/4 adds the helpers in v4l2-common.c, allowing nested calls by
adding stream_count in the subdevice struct.

Patch 3/4 cleanup rkisp1 driver to use the helpers.

Patch 4/4 cleanup vimc driver to use the helpers.


Helen Koike (4):
  media: mc-entity.c: add media_graph_walk_next_stream()
  media: v4l2-common: add helper functions to call s_stream() callbacks
  media: staging: rkisp1: use v4l2_pipeline_stream_{enable,disable}
    helpers
  media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers

 drivers/media/mc/mc-entity.c                  | 34 ++++++-
 drivers/media/platform/vimc/vimc-capture.c    | 28 ++++--
 drivers/media/platform/vimc/vimc-streamer.c   | 49 +--------
 drivers/media/v4l2-core/v4l2-common.c         | 99 +++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-capture.c | 74 +-------------
 include/media/media-entity.h                  | 15 +++
 include/media/v4l2-common.h                   | 30 ++++++
 include/media/v4l2-subdev.h                   |  2 +
 8 files changed, 204 insertions(+), 127 deletions(-)

-- 
2.25.0

