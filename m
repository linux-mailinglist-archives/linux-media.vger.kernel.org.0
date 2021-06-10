Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5E23A2EC6
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhFJO6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbhFJO6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7729C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 07:56:40 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50C40E54;
        Thu, 10 Jun 2021 16:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336998;
        bh=1/b8K8frJbUQ6faQfE/dfg3UEyaJphZX6XHIrSJtBhU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uAIsyLv62UbENXikTWw+YD5+JVhPxH/0ghnNDJ7IIKxoV90uEVMXNUZx0OgyYWboF
         oIO2V76Bvzg8bPw43/syNCgG+EA0nSRyWUHRCXb3WMZu0gjviv95Yz+XHCjVFFnJ6B
         H9sMssjKin1COvgkrcyjwX6lMonPlQShotWS0HkU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 8/9] media: usb: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:05 +0300
Message-Id: <20210610145606.3468235-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch "media: v4l2-subdev: add subdev-wide state struct" changes how
subdev state is managed, adding a new struct to hold all the v4l2 subdev
state.

This patch does the required changes for drivers/media/usb/

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/usb/go7007/s2250-board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index b9e45124673b..c742cc88fac5 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -398,7 +398,7 @@ static int s2250_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int s2250_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
-- 
2.25.1

