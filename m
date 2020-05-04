Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7984E1C359C
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgEDJ0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbgEDJ0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0AED122D;
        Mon,  4 May 2020 11:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584397;
        bh=pcrrfsQlmR7SGkG1+Y+oygWKbVvk+y5ojBGVU0ZYFJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ltVQBUsknkLvRmLx5zTmapkNYE/b1XdY8hnrSL+sZGpo8B4cj79f1VnwGqxIzrzsm
         0yC4wK+HKoEIo/ZVUeMrFz9EzqYjECMIoK6yW48kv9oOLhMlW5ReSmRlVGTLTOvBPE
         Xt8AyXvpOavgKPNRdVv8vMrmobXFdUaQ/cWPeI0c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 19/34] staging: mmal-vchiq: If the VPU returns an error, don't negate it
Date:   Mon,  4 May 2020 12:25:56 +0300
Message-Id: <20200504092611.9798-20-laurent.pinchart@ideasonboard.com>
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

There is an enum for the errors that the VPU can return.
port_parameter_get was negating that value, but also using -EINVAL
from the Linux error codes.
Pass the VPU error code as positive values. Should the function
need to pass a Linux failure, then return that as negative.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 5e7d4263e39b..4e559f88d828 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1395,7 +1395,8 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 		goto release_msg;
 	}
 
-	ret = -rmsg->u.port_parameter_get_reply.status;
+	ret = rmsg->u.port_parameter_get_reply.status;
+
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
-- 
Regards,

Laurent Pinchart

