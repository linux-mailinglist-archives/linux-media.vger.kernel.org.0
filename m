Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9527D934D
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbjJ0JQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbjJ0JQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694F4C0
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B7D4BBB;
        Fri, 27 Oct 2023 11:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398191;
        bh=LBer8TYJo4VpJiTI7tYHxsfrCBXBXUCeStL2R5TzSUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KPYreMdmI228MJ4y0deBc/fw9BRGn1CgVm5qKuzmRRQZfsSZvEFKvdsPJ5HC+o2QM
         h/oWBx72XSGy2BM+9v9tQRKQUvKLX8wFT+Y4zgCBsaxMzgWOWs7JvhC+j64/FxPheB
         Ygbs4Vl8fiA9/sbFi2eysCIgk/nzyDNwtWreni1g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/9] media: v4l2-subdev: Fix indentation in v4l2-subdev.h
Date:   Fri, 27 Oct 2023 12:16:41 +0300
Message-ID: <20231027091649.10553-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a simple indentation issue in the v4l2-subdev.h header.

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/uapi/linux/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..0401385fd8e9 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
  * set (which is the default), the 'stream' fields will be forced to 0 by the
  * kernel.
  */
- #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+#define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
 
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
-- 
Regards,

Laurent Pinchart

