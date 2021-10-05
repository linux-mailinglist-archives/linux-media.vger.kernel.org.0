Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2160422168
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhJEJAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhJEJAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:10 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0858C140C;
        Tue,  5 Oct 2021 10:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424299;
        bh=9AwUjeitWXs7h3b2sT3W/y4MVB1Z7W2saChjmImIOuk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mX8fMvjZ1hNEvqK3PmsfkYWP32TXWsKhMcpfk+CSFGiDqbaKSsvg+PsaJ5ENE/ja1
         l8Q5dBB/CxAC5jkBJ9y9Av/RmV7ve2ysIh7FMsfqlmeQBNc/lQ/f/BG5yf1eDk/krV
         1EQN7wxFxcbXleIxzTAvLNHmvzzEwa5arLLv5UTM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 06/36] media: Documentation: add documentation about subdev state
Date:   Tue,  5 Oct 2021 11:57:20 +0300
Message-Id: <20211005085750.138151-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
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
index 7736da077fb8..c3fd57fff668 100644
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
+In addition to the active configuration, each subdev filehandle has contained
+an array of struct v4l2_subdev_pad_config, managed by V4L2 core, which
+contains the TRY configuration.
+
+To simplify the subdev drivers the V4L2 subdev API now optionally supports a
+centrally managed active configuration. A subdev driver must use
+v4l2_subdev_init_finalize() to initialize the active state between calls to
+media_entity_pads_init() and v4l2_*_register_subdev(), and must call
+v4l2_subdev_cleanup() to free the state.
+
+The active state must be locked before access, and can be done with
+v4l2_subdev_lock_state() or v4l2_subdev_lock_active_state().
+
+The V4L2 core will pass either the TRY or ACTIVE state to various subdev ops.
+Unfortunately all the subdev drivers do not comply with this yet, and may pass
+NULL for the ACTIVE case. This is only a problem for subdev drivers which use
+the cetrally managed active state and are used in media pipelines with older
+subdev drivers. In these cases the called subdev ops must also handle the NULL
+case. This can be easily managed by the use of
+v4l2_subdev_validate_and_lock_state() helper.
+
 V4L2 sub-device functions and data structures
 ---------------------------------------------
 
-- 
2.25.1

