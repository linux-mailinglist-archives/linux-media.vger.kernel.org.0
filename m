Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA03356E47
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348154AbhDGOQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:16:34 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60459 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242625AbhDGOQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 10:16:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8yglSP3zMxedU8yjlIlFr; Wed, 07 Apr 2021 16:16:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617804981; bh=Cx3sLRN4Lq89COHvgS7PTmx+95NRFs4/XKZB8C/kaic=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=iHTCM58Lxn3wwaCH8VUgl00l3IxEf2zl/RoQXluPC2stuuO1kqvioxvQ/a2caePrz
         3D1y3ffoJ+Rtm9p1wfXwyLS3An5IXLQkL6CloKaxYH85B/0xanwtoLa4SlCPP1CnpT
         sLbtNSJKpembxYJraiZ6opGQ28SM2CH8gAk2YZFJhHS1iGCe8WzL9r/fbeYSR82q3K
         WAETKlW5RSQsz2tDj4lVBHCrkhJ0PNkwlMyPw+sSXvDDwqilY6c3akoiH3oBVvQLJn
         a4kfbHqo/1++Wq0BrgyY9DItpYtDZcUBPxFvQlk5w0wMNuMVHmOaHouS0OtomHmBj7
         Qa5UGxAtVF0yg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] adv7842: configure all pads
Date:   Wed,  7 Apr 2021 16:16:17 +0200
Message-Id: <20210407141618.196617-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407141618.196617-1-hverkuil-cisco@xs4all.nl>
References: <20210407141618.196617-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGyGCop30MyFVBBPIP6FFYHLC/LuTcnNd1bp6n37Fa/QzDP8Db/JUnkKB/hEJED6XM74/Ioj+ZO0wERvYS6iJb6b/CHvvhsHUoiTE8ueK9684aalyraf
 j4NGQ9C7yy/WUnz9ptdAQJPBlGvo8nr1d43vlmwKn/D8Gwgd5K1avGmAN9EJUow9PhA+AplnylOO43LHBYeqwbc9nVBxo7jY7wf59IyTfv3bdo9BlX2fR87M
 V2tU3EEucbxR+OLfNkMUHg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only the first pad was configured, but there are 4. This causes
set_fmt to fail with -EINVAL since the passed pad is > 0.

Configure all three sink pads and the source pad.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/adv7842.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 21dbb7a594fb..10a1a9a711e6 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -88,7 +88,7 @@ struct adv7842_format_info {
 struct adv7842_state {
 	struct adv7842_platform_data pdata;
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[ADV7842_PAD_SOURCE + 1];
 	struct v4l2_ctrl_handler hdl;
 	enum adv7842_mode mode;
 	struct v4l2_dv_timings timings;
@@ -3429,6 +3429,7 @@ static int adv7842_probe(struct i2c_client *client,
 	struct v4l2_ctrl_handler *hdl;
 	struct v4l2_ctrl *ctrl;
 	struct v4l2_subdev *sd;
+	unsigned int i;
 	u16 rev;
 	int err;
 
@@ -3532,8 +3533,11 @@ static int adv7842_probe(struct i2c_client *client,
 			adv7842_delayed_work_enable_hotplug);
 
 	sd->entity.function = MEDIA_ENT_F_DV_DECODER;
-	state->pad.flags = MEDIA_PAD_FL_SOURCE;
-	err = media_entity_pads_init(&sd->entity, 1, &state->pad);
+	for (i = 0; i < ADV7842_PAD_SOURCE; ++i)
+		state->pads[i].flags = MEDIA_PAD_FL_SINK;
+	state->pads[ADV7842_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	err = media_entity_pads_init(&sd->entity, ADV7842_PAD_SOURCE + 1,
+				     state->pads);
 	if (err)
 		goto err_work_queues;
 
-- 
2.30.2

