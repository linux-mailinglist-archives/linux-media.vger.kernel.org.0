Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B9B2D083F
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgLFXym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:54:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60364 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgLFXym (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:54:42 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ABF88D;
        Mon,  7 Dec 2020 00:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298839;
        bh=W23NSKc9b2bzT/qGr2PCT7+guEOmw7LQ4dHZEFK7a8s=;
        h=From:To:Cc:Subject:Date:From;
        b=kCFnJ2ZNqGOVFAVDePQ++UXNGnzgr7QWbQPHxPJhFxHe9awWaqMX04/MHoThcSmEz
         woJ6SqXZhlYGMeDD9cubeLqjr/OoclkT1j4IH7LcbpfBznHqJGjvIBT9e1MvTyEe+4
         xCmDI69r94SWZlU95gQ06t3wJaon2HsIwHLnTqxk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 00/24] media: ti-vpe: cal: Add media controller support
Date:   Mon,  7 Dec 2020 01:53:29 +0200
Message-Id: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds media controller support to the ti-cal driver. It
incorporates the review feedback received on v2, and has been rebased on
top of the media tree, dropping about three quarters of the patches from
v2 that have already been merged.

The end goal is to support pipelines where the image source is more
complex than a single subdev (for instance a SMIA++-compliant sensor, or
an FPD-Link source made of a camera, a serializer and a deserializer),
and to prepare for support of multiple hardware contexts, needed for
CSI-2 virtual channel and data type multiplexing support. These use
cases require configuration of the external pipeline from userspace, and
thus need support for the media controller and V4L2 subdev userspace
APIs.

The series starts with refactoring CAMERARX instances support by
splitting them to sudbevs in patch 01/24. Patches 02/24 to 06/24 perform
small cleanups, patch 07/24 implements the subdev operations and patch
08/24 uses them to configure and control the CAMERARX.

More refactoring and cleanup follow in patches 09/24 to 23/24, until
patch 24/24 that adds media controller support. As the existing video
node centric API needs to be preserved to avoid breaking userspace
applications, a module parameter is added to enable the media controller
API. Changes are otherwise fairly limited, and mostly involve the
implementation of MC-centric V4L2 ioctl handlers (which are far simpler
than their video node centric equivalents), additional pipeline
validation in the vb2 start streaming handler, and disabling control
handling in the video nodes.

Addition of a new Kconfig option to select the default value of the MC
API control module parameter has been left out from patch 24/24 until
the related discussions complete. This can easily be implemented on top,
without introducing any regression. Alternatively patch 24/24 could be
left out for the time being if desired.

The patches have been tested on an AM65x EVM with an OV5640 camera
module with the yavta test application, both in MC mode and in legacy
mode. As the ov5640 driver sets a default format identical to the
default of the ti-cal driver, capture in both modes can simply be tested
with

        yavta -f UYVY -s 640x480 -c10 --requeue-last /dev/video0

without requiring manual pipeline setup through the media controller
API. Usage of other formats or resolutions require pipeline
configuration before capture.

Laurent Pinchart (24):
  media: ti-vpe: cal: Create subdev for CAMERARX
  media: ti-vpe: cal: Drop cal_ctx m_fmt field
  media: ti-vpe: cal: Move format handling to cal.c and expose helpers
  media: ti-vpe: cal: Rename MAX_(WIDTH|HEIGHT)_* macros with CAL_
    prefix
  media: ti-vpe: cal: Replace hardcoded BIT() value with macro
  media: ti-vpe: cal: Iterate over correct number of CAMERARX instances
  media: ti-vpe: cal: Implement subdev ops for CAMERARX
  media: ti-vpe: cal: Use CAMERARX subdev s_stream op in video device
    code
  media: ti-vpe: cal: Don't pass format to cal_ctx_wr_dma_config()
  media: ti-vpe: cal: Rename struct cal_fmt to cal_format_info
  media: ti-vpe: cal: Refactor interrupt enable/disable
  media: ti-vpe: cal: Fold PPI enable in CAMERARX .s_stream()
  media: ti-vpe: cal: Stop write DMA without disabling PPI
  media: ti-vpe: cal: Use spin_lock_irq() when starting or stopping
    stream
  media: ti-vpe: cal: Share buffer release code between start and stop
  media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
  media: ti-vpe: cal: Drop unneeded check in cal_calc_format_size()
  media: ti-vpe: cal: Remove DMA queue empty check at start streaming
    time
  media: ti-vpe: cal: Use list_first_entry()
  media: ti-vpe: cal: Group all DMA queue fields in struct cal_dmaqueue
  media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending
    buffer
  media: ti-vpe: cal: Store buffer DMA address in dma_addr_t
  media: ti-vpe: cal: Simplify the context API
  media: ti-vpe: cal: Implement media controller centric API

 drivers/media/platform/ti-vpe/cal-camerarx.c | 374 ++++++++--
 drivers/media/platform/ti-vpe/cal-video.c    | 720 ++++++++++---------
 drivers/media/platform/ti-vpe/cal.c          | 395 ++++++++--
 drivers/media/platform/ti-vpe/cal.h          | 105 ++-
 4 files changed, 1082 insertions(+), 512 deletions(-)

-- 
Regards,

Laurent Pinchart

