Return-Path: <linux-media+bounces-20862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8A9BC72C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728E11F21F17
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F291FDFAF;
	Tue,  5 Nov 2024 07:42:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E92AF0B
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730792526; cv=none; b=WPE6uG3iKjI+D8O/fZ3E5OxAgoGZLslMQwBhuG62sSAhO9ZAv3G/Tne3stRZxfaC9pb1WA1JK/sELoH8S1JOyt80bxRxr9DdcAHXAZ6IQFH6hqSqJtxWqbRcicvtI3YLRHwi63r2X0kOs9kvcP7gHQnZWql0p4rxdUkO4uonMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730792526; c=relaxed/simple;
	bh=6ZPVxVNcv9ZPGPNkvlOuIJN73NOs0fKpEwPX/PF8iNo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=rsfatXaPjjUITCf7X5wd1SxqiGMgyJpCuT0bGf/5aHFxS1mVUW1gCSiZcHDkqzTYVe1jWRuc9v/ylhzNdOECgEQ6cJlv6Ar0wMATBbsdQT957evCyt+6LsVgVdt/2kpH0q4EIMmdeZS9zf5Y/UdELXXNB3R11y/Vpq6ppHQOHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246FAC4CECF
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 07:42:05 +0000 (UTC)
Message-ID: <ddb6e006-7440-41c5-8aaa-685b058418b4@xs4all.nl>
Date: Tue, 5 Nov 2024 08:42:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] media: v4l2-core: v4l2-ctrls: check for handler_new_ref
 misuse
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

An out-of-tree driver created a control handler, added controls, then
called v4l2_ctrl_add_handler to add references to controls from another
handler, and finally added another control that happened to have the same
control ID as one of the controls from that other handler.

This caused a NULL pointer crash when an attempt was made to use that last
control.

Besides the fact that two out-of-tree drivers used the same control ID for
different (private) controls, which is obviously a bug, this specific
scenario should have been caught. The root cause is the 'duplicate ID'
check in handler_new_ref(): it expects that drivers will first add all
controls to a control handler before calling v4l2_ctrl_add_handler. That
way the local controls will always override references to controls from
another handler.

It never considered the case where new local controls were added after
calling v4l2_ctrl_add_handler. Add a check to handler_new_ref() to return
an error in the case that a new local control is added with the same ID as
an existing control reference. Also use WARN_ON since this is a driver bug.

This situation can only happen when out-of-tree drivers are used or during
driver development, since mainlined drivers all have their own control
ranges reserved in v4l2-controls.h, thus preventing duplicate control IDs.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
Changes since v1:
Improved the comment.
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 34 +++++++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..8fac12e78481 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1676,6 +1676,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	u32 class_ctrl = V4L2_CTRL_ID2WHICH(id) | 1;
 	int bucket = id % hdl->nr_of_buckets;	/* which bucket to use */
 	unsigned int size_extra_req = 0;
+	int ret = 0;

 	if (ctrl_ref)
 		*ctrl_ref = NULL;
@@ -1719,13 +1720,32 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
 		if (ref->ctrl->id < id)
 			continue;
-		/* Don't add duplicates */
-		if (ref->ctrl->id == id) {
-			kfree(new_ref);
-			goto unlock;
+		/* Check we're not adding a duplicate */
+		if (ref->ctrl->id != id) {
+			list_add(&new_ref->node, ref->node.prev);
+			break;
 		}
-		list_add(&new_ref->node, ref->node.prev);
-		break;
+
+		/*
+		 * If we add a new control to this control handler, and we find
+		 * that it is a duplicate, then that is a driver bug. Warn and
+		 * return an error.
+		 *
+		 * It can be caused by either adding the same control twice, or
+		 * by first calling v4l2_ctrl_add_handler, and then adding a new
+		 * control to this control handler.
+		 *
+		 * Either sequence is incorrect.
+		 *
+		 * However, if the control is owned by another handler, and
+		 * a control with that ID already exists in the list, then we
+		 * can safely skip it: in that case it the control is overridden
+		 * by the existing control.
+		 */
+		if (WARN_ON(hdl == ctrl->handler))
+			ret = -EEXIST;
+		kfree(new_ref);
+		goto unlock;
 	}

 insert_in_hash:
@@ -1746,6 +1766,8 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,

 unlock:
 	mutex_unlock(hdl->lock);
+	if (ret)
+		return handler_set_err(hdl, ret);
 	return 0;
 }

-- 
2.45.2


