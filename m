Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4BE3BEA8F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 17:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbhGGPWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 11:22:08 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47299 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbhGGPWH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 11:22:07 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4AAB8E0011;
        Wed,  7 Jul 2021 15:19:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] media: v4l2-subdev: Introduce post_register() core op
Date:   Wed,  7 Jul 2021 17:20:00 +0200
Message-Id: <20210707152003.136272-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
References: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce the post_register() subdevice core operation.

The operation is meant to be called after the subdevice has been
registered.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/v4l2-subdev.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 95f8bfd63273..4c226c4b69a6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -187,6 +187,8 @@ struct v4l2_subdev_io_pin_config {
  *		     for it to be warned when the value of a control changes.
  *
  * @unsubscribe_event: remove event subscription from the control framework.
+ *
+ * @post_register: called after the subdevice has been registered.
  */
 struct v4l2_subdev_core_ops {
 	int (*log_status)(struct v4l2_subdev *sd);
@@ -213,6 +215,7 @@ struct v4l2_subdev_core_ops {
 			       struct v4l2_event_subscription *sub);
 	int (*unsubscribe_event)(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 				 struct v4l2_event_subscription *sub);
+	int (*post_register)(struct v4l2_subdev *sd);
 };
 
 /**
-- 
2.32.0

