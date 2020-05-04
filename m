Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82301C359F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgEDJ0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgEDJ0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:44 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3D0A18B4;
        Mon,  4 May 2020 11:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584399;
        bh=RTswVnVvkrphvGZQrtudfR0gweDjJJ+wd4T7jlg4Oh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ajzgpJ1Ovu5pMLJwEds+7+ghgJUFKjFW3pdB+F+2+9n0fo71WlqSxfzB1ZX7fy57D
         gkqDG3nOoXpzl6BFmexhufrATjaGt5529v7uy+/volmsvC4NS9qI1jo2/X60ptjWVz
         tktJsTBw4UI8asPW5beweV+SbAuLJhXKg+wn9kP0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 21/34] staging: mmal-vchiq: Update mmal_parameters.h with recently defined params
Date:   Mon,  4 May 2020 12:25:58 +0300
Message-Id: <20200504092611.9798-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

mmal_parameters.h hasn't been updated to reflect additions made
over the last few years. Update it to reflect the currently
supported parameters.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../vchiq-mmal/mmal-parameters.h              | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index 80a99128f5f3..926392d754c7 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -580,7 +580,37 @@ enum mmal_parameter_video_type {
 	MMAL_PARAMETER_VIDEO_ENCODE_H264_LOW_DELAY_HRD_FLAG,
 
 	/**< @ref MMAL_PARAMETER_BOOLEAN_T */
-	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER
+	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T. */
+	MMAL_PARAMETER_VIDEO_ENCODE_SEI_ENABLE,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T. */
+	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_VECTORS,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_RENDER_STATS_T. */
+	MMAL_PARAMETER_VIDEO_RENDER_STATS,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_INTERLACE_TYPE_T. */
+	MMAL_PARAMETER_VIDEO_INTERLACE_TYPE,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_INTERPOLATE_TIMESTAMPS,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_SPS_TIMING,
+
+	/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_VIDEO_MAX_NUM_CALLBACKS,
+
+	/**< Takes a @ref MMAL_PARAMETER_SOURCE_PATTERN_T */
+	MMAL_PARAMETER_VIDEO_SOURCE_PATTERN,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_SEPARATE_NAL_BUFS,
+
+	/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_VIDEO_DROPPABLE_PFRAME_LENGTH,
 };
 
 /** Valid mirror modes */
-- 
Regards,

Laurent Pinchart

