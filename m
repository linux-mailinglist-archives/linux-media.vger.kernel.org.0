Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E59019E057
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 23:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgDCVdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 17:33:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60606 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgDCVdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 17:33:32 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 985572935F9;
        Fri,  3 Apr 2020 22:33:27 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        skhan@linuxfoundation.org, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v2 0/3] media: add v4l2_pipeline_stream_{enable,disable} helpers
Date:   Fri,  3 Apr 2020 18:33:09 -0300
Message-Id: <20200403213312.1863876-1-helen.koike@collabora.com>
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

Overview of patches:
====================

Path 1/3 adds the helpers in v4l2-common.c, allowing nested calls by
adding stream_count in the subdevice struct.

Patch 2/3 cleanup rkisp1 driver to use the helpers.

Patch 3/3 cleanup vimc driver to use the helpers.

Helen Koike (3):
  media: v4l2-common: add helper functions to call s_stream() callbacks
  media: staging: rkisp1: use v4l2_pipeline_stream_{enable,disable}
    helpers
  media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers

 drivers/media/platform/vimc/vimc-capture.c    |  28 +++--
 drivers/media/platform/vimc/vimc-streamer.c   |  49 +-------
 drivers/media/v4l2-core/v4l2-common.c         | 117 ++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-capture.c |  76 +-----------
 include/media/v4l2-common.h                   |  28 +++++
 include/media/v4l2-subdev.h                   |   2 +
 6 files changed, 173 insertions(+), 127 deletions(-)

-- 
2.26.0

