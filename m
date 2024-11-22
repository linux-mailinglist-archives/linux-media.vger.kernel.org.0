Return-Path: <linux-media+bounces-21840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 519F49D5FF8
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 14:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4D51F230C5
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 13:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CDF6A009;
	Fri, 22 Nov 2024 13:51:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEF12E7F
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732283493; cv=none; b=QRyCW79BnAiUSXEDJKPCB0WDQA+ab9TkJ9JZ2SBag83S38h9J51vHNOw+UEMpfl200/dODUmtYcyZXqvZ1t5E6WWMibEoSh/V96xoYcvlslvWDkwUxie2SGQ5ZYCsEOxVgTHysdyW/zM8YRK1VGiyrrd0+e62vCUejieSx2Farc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732283493; c=relaxed/simple;
	bh=NHM9ctAWwTPLWfSDvzpuT5JMWpyt30/2fO7Wvk7c++4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OK39ouCuHDXqqo+IaOSS7QiH9+33jQ6Inyt7/zZkRTvY+B1rpMD5v9eDBWuI1FQZeObW4LRnZyMPBSmQivhQHtL6w+FsUgGONYcYA2nZVGP0W9dd1vnzyry/PwAw/6ppoRQI7on2fPp39iBTH6XUzIaNgcqlco7/bCL+YhYE17o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD66C4CECE;
	Fri, 22 Nov 2024 13:51:32 +0000 (UTC)
Message-ID: <d399804a-3c18-4514-9eec-69b0935fef71@xs4all.nl>
Date: Fri, 22 Nov 2024 14:51:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] media: v4l2-ctrls: unlink all subscribed events
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The v4l2_ctrl_handler_free() function must unlink all subscribed events
of the control handler that is being freed, but it only did so for the
controls owned by that control handler and not for the controls referred
to by that control handler. This leaves stale data in the ev_subs list
of those controls.

The node list header is also properly initialized and list_del_init is
called instead of list_del to ensure that list_empty() can be used
to detect whether a v4l2_subscribed_event is part of a list or not.

This makes v4l2_ctrl_del_event() more robust since it will not attempt
to find the control if the v4l2_subscribed_event has already been unlinked
from the control.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Cc: stable@vger.kernel.org # 6.7.x
---
This is v2 of a very old patch from 2022:

https://patchwork.linuxtv.org/project/linux-media/patch/66246ea5-2bd7-6c9e-56c8-9d683ec58ffc@xs4all.nl/

It looks like I forgot to follow-up on Laurent's comments. Recently
we had to upgrade to a newer kernel and apply this same patch again
since it was still failing, at which point I realized that this fix
wasn't in mainline.

This issue only happens if you have a larger pipeline consisting of
several subdevs, and one of the subdevs is forcibly unbound.

Changes since v1:
- fixed Laurent's comments
- add locking
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  8 ++++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 10 +++++++++-
 drivers/media/v4l2-core/v4l2-event.c      |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 95a2202879d8..96c3e40f589f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1249,13 +1249,17 @@ static int v4l2_ctrl_add_event(struct v4l2_subscribed_event *sev,

 static void v4l2_ctrl_del_event(struct v4l2_subscribed_event *sev)
 {
-	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(sev->fh->ctrl_handler, sev->id);
+	struct v4l2_ctrl *ctrl;

+	if (list_empty(&sev->node))
+		return;
+
+	ctrl = v4l2_ctrl_find(sev->fh->ctrl_handler, sev->id);
 	if (!ctrl)
 		return;

 	v4l2_ctrl_lock(ctrl);
-	list_del(&sev->node);
+	list_del_init(&sev->node);
 	v4l2_ctrl_unlock(ctrl);
 }

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..9fb9b81a8a4f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
 #include <media/v4l2-fwnode.h>

 #include "v4l2-ctrls-priv.h"
@@ -1569,13 +1570,20 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 		list_del(&ref->node);
 		if (ref->p_req_array_alloc_elems)
 			kvfree(ref->p_req.p);
+		if (ref->ctrl->handler != hdl) {
+			mutex_lock(ref->ctrl->handler->lock);
+			list_for_each_entry_safe(sev, next_sev, &ref->ctrl->ev_subs, node)
+				if (sev->fh->ctrl_handler == hdl)
+					list_del_init(&sev->node);
+			mutex_unlock(ref->ctrl->handler->lock);
+		}
 		kfree(ref);
 	}
 	/* Free all controls owned by the handler */
 	list_for_each_entry_safe(ctrl, next_ctrl, &hdl->ctrls, node) {
 		list_del(&ctrl->node);
 		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
-			list_del(&sev->node);
+			list_del_init(&sev->node);
 		kvfree(ctrl->p_array);
 		kvfree(ctrl);
 	}
diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 3898ff7edddb..3ad6318c9908 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -246,6 +246,7 @@ int v4l2_event_subscribe(struct v4l2_fh *fh,
 	sev->flags = sub->flags;
 	sev->fh = fh;
 	sev->ops = ops;
+	INIT_LIST_HEAD(&sev->node);

 	mutex_lock(&fh->subscribe_lock);

-- 
2.45.2


