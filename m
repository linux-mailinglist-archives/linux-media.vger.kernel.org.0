Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E057A0C5B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjINSQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbjINSQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:16:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1ADE1FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:16:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A48C1ABC;
        Thu, 14 Sep 2023 20:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715319;
        bh=mnDicsv+PVPG1sQ1fGklsSgyENSEIUvqGjY/2df5fEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jxowFjy/sJlpr9CSjNuZvtNFgCWJuA+CiQ1VT2mUyvYTgXu9sZq6z6Q64ee7nMw5N
         Xv7+PrVeVmNCtfPQtVgkg6CamoknusOiCGinhQWkcsaj6YcwxLQK0caZ5IyYgw4BiC
         USC2QKh059oF1aK/BgffaTZN44icncdzsL5HPDmk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 01/57] media: v4l2-subdev: Document .s_stream() operation requirements
Date:   Thu, 14 Sep 2023 21:16:08 +0300
Message-ID: <20230914181704.4811-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .s_stream() operation must not be called to start an already
started subdev, or stop an already stopped one. This requirement has
never been formally documented. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d9fca929c10b..282914ea9d45 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -446,7 +446,9 @@ enum v4l2_subdev_pre_streamon_flags {
  * @s_stream: start (enabled == 1) or stop (enabled == 0) streaming on the
  *	sub-device. Failure on stop will remove any resources acquired in
  *	streaming start, while the error code is still returned by the driver.
- *	Also see call_s_stream wrapper in v4l2-subdev.c.
+ *	The caller shall track the subdev state, and refrain from starting or
+ *	stopping an already started or stopped subdev. AAlso see call_s_stream
+ *	wrapper in v4l2-subdev.c.
  *
  * @g_pixelaspect: callback to return the pixelaspect ratio.
  *
-- 
Regards,

Laurent Pinchart

