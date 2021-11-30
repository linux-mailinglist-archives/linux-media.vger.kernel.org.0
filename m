Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44593463658
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242110AbhK3OUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242098AbhK3OT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:19:59 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 660BC181E;
        Tue, 30 Nov 2021 15:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281798;
        bh=8TJugrUWCyKKW9TOvD/ZZtkomjVXNlJhQvIy6/Ae+Xo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ge3Umjh3PZ9TMXyr7GLcFjboIyCQe2X9hRGZFefyIwBgYn+4shwWJDxf+0IdSUZ8I
         VtibyJHAkEOWaVe/g6HjBTCY1CCUyjTH2amW78luJXgDys37RzGA1+qziN5JtYLxDm
         IoimOYfX7iruScUZh64tbFTtRKm1AVDgmW/D7Sgw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 06/38] media: Documentation: add documentation about subdev state
Date:   Tue, 30 Nov 2021 16:15:04 +0200
Message-Id: <20211130141536.891878-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation about centrally managed subdev state.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../driver-api/media/v4l2-subdev.rst          | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 7736da077fb8..db012729f8e3 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -518,6 +518,34 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
 :c:type:`i2c_board_info` structure using the ``client_type`` and the
 ``addr`` to fill it.
 
+Centrally managed subdev active state
+-------------------------------------
+
+Traditionally V4L2 subdev drivers maintained internal state for the active
+configuration for the subdev. This is often implemented as an array of struct
+v4l2_mbus_framefmt, one entry for each pad.
+
+In addition to the active configuration, each subdev filehandle has an array of
+struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the TRY
+configuration.
+
+To simplify the subdev drivers the V4L2 subdev API now optionally supports a
+centrally managed active configuration. A subdev driver must use
+v4l2_subdev_init_finalize() to initialize the active state between calls to
+media_entity_pads_init() and v4l2_*_register_subdev(), and must call
+v4l2_subdev_cleanup() to free the state.
+
+The active state must be locked before access, and that can be done with
+v4l2_subdev_lock_state() or v4l2_subdev_lock_active_state().
+
+The V4L2 core will pass either the TRY or ACTIVE state to various subdev ops.
+Unfortunately not all the subdev drivers comply with this yet, and may pass
+NULL for the ACTIVE case. This is only a problem for subdev drivers which use
+the centrally managed active state and are used in media pipelines with older
+subdev drivers. In these cases the called subdev ops must also handle the NULL
+case. This can be easily managed by the use of
+v4l2_subdev_validate_and_lock_state() helper.
+
 V4L2 sub-device functions and data structures
 ---------------------------------------------
 
-- 
2.25.1

