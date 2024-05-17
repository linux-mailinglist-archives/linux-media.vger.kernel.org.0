Return-Path: <linux-media+bounces-11584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A98C82C1
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31F11F21653
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B08F18041;
	Fri, 17 May 2024 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="pABNboXn"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022971DA3A;
	Fri, 17 May 2024 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715935918; cv=none; b=OD2qwNG5MvJ667466MbqEx8tb0zysveQ5A/7Z/96SA1r/mU2Xx8PhwqOZaR7RPD65GR8oryLhqgTVXGZY3rJTSUuH3SX+JsN9iVJ7uQK9AJOPC6lAYiS4uavU+hB8Sigi/gJJ9cnWtwUP6JI5aeWMpwPOUk9vfORYdIdso1EOU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715935918; c=relaxed/simple;
	bh=X7GFFM7iw31IS/5O1olChpoW2S6sJjRPbROWhft5nXA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hpUGT7S5PMYNA9/tQw/Wpok9rH7Qd0Ev8Gib2nOyzNbKUIxP3t06LvNerTtQamcYzn5RGLb8RYLtX6rqfDMmJ++XjQR3SfyuIK0oONYtcZczBfTFjji0Wx3uCaYfiTpF2dMpSD9N0AzTw+vfEFyUFWM1WEr5PCKmK83j8YveV24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=pABNboXn; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1715935913;
	bh=+02doYrDq26RDi4/MQOrPZivqGn3gXpcDG+SNpsy4QM=; l=1392;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pABNboXniYhpXVkzDGPCCX861Q3h7ULTZvDZSey/n4UOCjJMcAMGka+ovhkKWf5Vl
	 L5q4hlb3jP+pHILuW8W1b6cdRBAQuwCgwH8W+Cehe/EWIyUfozXB7e970Jb+XrLu8e
	 EwC7rh0EddHuoR+NBLQf/o1Mlt5C+HxFlaoG0lWOiIavybYccSeEIpD9qoxm6oUrDM
	 aIyL1ByzC1mQacEg7IcvRm6Si0tZS3bhtYGpnuTj72NTlX3KaIA1lWyt1klW0RIVVV
	 Gb/MKsl2PIC0lLJNY4viKlwbgVNVNy6mKaP6QIBftyEDvlyGhz9G74BK2RzblX1+Vp
	 YfI0x8tPb13aw==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(3213199:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 17 May 2024 16:51:39 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 17 May
 2024 16:51:39 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 17 May 2024 16:51:39 +0800
From: <cy_huang@richtek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Daniel Scally <djrscally@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH] media: v4l: async: Fix NULL pointer dereference in adding ancillary links
Date: Fri, 17 May 2024 16:51:29 +0800
Message-ID: <57fca5dbcb8e157371deeba019eba430bf7148b2.1715935535.git.cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

In v4l2_async_create_ancillary_links(), ancillary links are created for
lens and flash sub-devices. These are sub-device to sub-device links and if
the async notifier is related to a V4L2 device, the source sub-device of
the ancillary link is NULL, leading to a NULL pointer dereference. Check
the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().

Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi:
  Following the comment to revise the patch title and commit message.

The previous patch discussion is at the below link.
https://lore.kernel.org/lkml/e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com/
---
 drivers/media/v4l2-core/v4l2-async.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3ec323bd528b..9d3161c51954 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
 		return 0;
 
+	if (!n->sd)
+		return 0;
+
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
 #endif
-- 
2.34.1


