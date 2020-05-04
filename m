Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D04F1C359B
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgEDJ0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728391AbgEDJ0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:42 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2788211F9;
        Mon,  4 May 2020 11:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584396;
        bh=2dJL4ojmUStJrhldPp5h5wFsjYl4Yt2L1vo8/xiB8UM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LQmywnNuNtJ0JUfW5mnA1a5t3sRySmWmAeIuh//OYZLyBM8eSN5458lrr+ESavR2F
         OsYoaI9vDF1lOddoDEFdhqZEiEUc6qjN9K5nyxa0l/wXxWL9maVUSX7SJo5ezewNig
         LVdN0LsOvGBkzxV7WQqpDwZks6c1ToLzwVgJzfOM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 18/34] staging: mmal-vchiq: Always return the param size from param_get
Date:   Mon,  4 May 2020 12:25:55 +0300
Message-Id: <20200504092611.9798-19-laurent.pinchart@ideasonboard.com>
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

mmal-vchiq is a reimplementation of the userland library for MMAL.
When getting a parameter, the client provides the storage and
the size of the storage. The VPU then returns the size of the
parameter that it wished to return, and as much as possible of
that parameter is returned to the client.

The implementation previously only returned the size provided
by the VPU should it exceed the buffer size. So for parameters
such as the supported encodings list the client had no idea
how much of the provided storage had been populated.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 5872690b404d..5e7d4263e39b 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1407,11 +1407,12 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 		 */
 		memcpy(value, &rmsg->u.port_parameter_get_reply.value,
 		       *value_size);
-		*value_size = rmsg->u.port_parameter_get_reply.size;
 	} else {
 		memcpy(value, &rmsg->u.port_parameter_get_reply.value,
 		       rmsg->u.port_parameter_get_reply.size);
 	}
+	/* Always report the size of the returned parameter to the caller */
+	*value_size = rmsg->u.port_parameter_get_reply.size;
 
 	pr_debug("%s:result:%d component:0x%x port:%d parameter:%d\n", __func__,
 		 ret, port->component->handle, port->handle, parameter_id);
-- 
Regards,

Laurent Pinchart

