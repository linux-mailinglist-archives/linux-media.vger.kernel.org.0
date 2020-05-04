Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792DD1C3593
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgEDJ0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbgEDJ0e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:34 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22BD811F9;
        Mon,  4 May 2020 11:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584391;
        bh=ntdxwDQmZU4bWN8xfDwY3ZlZ286reJx4q9xY8xWN940=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ShPm053EI3WHSM8jS8gxaDssxlTIWemm0l3WNzV3GWycEh3F089lZ0KYPBIOXyB0/
         2I53ENGYP20rW/ETz8FphJMvIKwysDUjogryiIv6WVTUjFfb9CCTjhteBE83OF6PF7
         xGDjpdETQShzD1iSOFxPA0Sy/RYwc0UEgI6bQL5Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 10/34] staging: mmal-vchiq: Make timeout a defined parameter
Date:   Mon,  4 May 2020 12:25:47 +0300
Message-Id: <20200504092611.9798-11-laurent.pinchart@ideasonboard.com>
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

The timeout period for VPU communications is a useful thing
to extend when debugging.
Set it via a define, rather than a magic number buried in the code.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 1ac27755df51..12c2f86b02ad 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -38,6 +38,12 @@
  */
 #define VCHIQ_MMAL_MAX_COMPONENTS 64
 
+/*
+ * Timeout for synchronous msg responses in seconds.
+ * Helpful to increase this if stopping in the VPU debugger.
+ */
+#define SYNC_MSG_TIMEOUT       3
+
 /*#define FULL_MSG_DUMP 1*/
 
 #ifdef DEBUG
@@ -686,7 +692,7 @@ static int send_synchronous_mmal_msg(struct vchiq_mmal_instance *instance,
 	}
 
 	timeout = wait_for_completion_timeout(&msg_context->u.sync.cmplt,
-					      3 * HZ);
+					      SYNC_MSG_TIMEOUT * HZ);
 	if (timeout == 0) {
 		pr_err("timed out waiting for sync completion\n");
 		ret = -ETIME;
-- 
Regards,

Laurent Pinchart

