Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D0B3ABA6E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 19:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhFQRRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 13:17:43 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38287 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbhFQRRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 13:17:43 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E0F10E0003;
        Thu, 17 Jun 2021 17:15:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC 1/4] media: v4l2-subdev: Introduce post_register() core op
Date:   Thu, 17 Jun 2021 19:16:08 +0200
Message-Id: <20210617171611.80542-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
References: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce the post_register() subdevice core operation.

The operation is meant to be called after the subdevice has been
registered.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0e9a5bdb08b..6925dc2f69ac 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -184,6 +184,8 @@ struct v4l2_subdev_io_pin_config {
  *		     for it to be warned when the value of a control changes.
  *
  * @unsubscribe_event: remove event subscription from the control framework.
+ *
+ * @post_register: called after the subdevice has been registered.
  */
 struct v4l2_subdev_core_ops {
 	int (*log_status)(struct v4l2_subdev *sd);
@@ -209,6 +211,7 @@ struct v4l2_subdev_core_ops {
 			       struct v4l2_event_subscription *sub);
 	int (*unsubscribe_event)(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 				 struct v4l2_event_subscription *sub);
+	int (*post_register)(struct v4l2_subdev *sd);
 };
 
 /**
-- 
2.31.1

