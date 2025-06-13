Return-Path: <linux-media+bounces-34771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 366DCAD9163
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 182E43AA364
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D54A1F1921;
	Fri, 13 Jun 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Q2DeKzMZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e3O1B+6O"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CA61EF0BE;
	Fri, 13 Jun 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828913; cv=none; b=h4gQrDLgmRbe0VBCkvtHCSlCFKznzX/IJnLAdssdD8+PQ2BPkSuoO9bMZejKToyUb8JJ/l6CD83Ht//XeXEbX5C8llkOCPUiiu7f8PvP+9Kc3NBRSAXJ+8asiqXzQGL7NO15EbdTcLKt3NEEhG+jYeNjmLQ9w0dFAadLQOTJHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828913; c=relaxed/simple;
	bh=3kHAV9OhjfhoCoy/q0rmsXyUSvFbLZPCa03kJlx7J+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fw7JEsLtg+cXmxzpDU6RelH1v2Ixwie57lsEafGBFVI3POxteYutRlSvJP7niXj/ZjKhm6KX5its1AWPGWj43KLBsTwEeY5ZNCUsHL2KnRp4/lWHOuyffExa2Pxi/5824b3UOXITFKUX/2HYxB5uW3Q2thUd8WT2J06Hq245j+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Q2DeKzMZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e3O1B+6O; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 51A7D1380389;
	Fri, 13 Jun 2025 11:35:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 13 Jun 2025 11:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828910;
	 x=1749915310; bh=/dFKTJhtmTCudVGDszzO8S6+wU6CqhQh+wpqOgKpr6A=; b=
	Q2DeKzMZId4f8FXtJsEdP71VIn4OCbWkIdJ/gmzY6LnVXCQiAXkX3zVCkHiP1D8N
	R51OFP74cTuUaaO+U+tDtJK+N5c8oPcIA4FBuKcorohYDxIAmZq23/z1lUSy8eBY
	7AC9X3B5PEfCGsmRHNjppq6XNC6AbYf/O21kjUxyA2rBWiI7Azwp3W9ET4ghROaA
	I57ES/pRn6QTI0LZKM43/omSrWmc+FSHaNfZQAbLW+46xuVs8r9V9ouecIk7ubmE
	GcmeH8JeqNTMZZGWcMDkLr7q2O9UvRAk7mgI+JbiKPtz6MUnDfAGL2AWLKHOqw4+
	faOkaLHxilZF/0TM8PGJgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828910; x=
	1749915310; bh=/dFKTJhtmTCudVGDszzO8S6+wU6CqhQh+wpqOgKpr6A=; b=e
	3O1B+6Ol5g1B5iDBaJMysC9FI8rIvtXvzo+uJgkEklilYdyYXtgeLojlxsXEzqVe
	rUwXeezajX+o818AKDdAWpIFoUbXr8VLLJcEzDOeanijZj9MgDQKP2z2uL+FDsKG
	Wiyl481LYeGdzV0KAOjlu0Wyd95oTJkGZe8AC7XA1HRHN6Fi39JX7Y4IXUJD6YoQ
	R/YgyRxXxnwKPy6GVgMdtRkNl0byWDDY3K5KLXHgBWncOQwqRTG0wN91S1TSiQ8z
	a46+xAAqhDh0zwqiYOfnXB3WXjPVF/KSZpqi5eRVk5Uejr5UPqzRqbsqtdsdPF/M
	QUJSLyC40iGyAyirSiWUw==
X-ME-Sender: <xms:LkVMaOF1ZJxtfFBQJdcKWsiWGswVAK3_pujPLpcLgMTGKJbW3gdjig>
    <xme:LkVMaPVyEOr_QXYSiFggdwSVjJZLFMwOmVo1mUQbSbdbAFRFnjiCIPolswy6dvOZm
    R-It5lAD1B6BVhDCRE>
X-ME-Received: <xmr:LkVMaIJohdeYJPJXyAVGev3LRnts9E0j3iVeM0jAPuccrqw5czMhxWLs3RVbe2y4qSJmGn1bOkiWbmzoC9CzP346>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:LkVMaIG3bfhAhB7FUz0kffBvABNStQOEQSlqnu4ovQTLzseDqrpk8w>
    <xmx:LkVMaEXMxJ6m0QdCvDvu8OAQOTZso3UqAT-_NnLrLZlXpQ-BlLifuA>
    <xmx:LkVMaLOT0w-8b0EWwhCsMiKU3TeBe_dB3x18EkWIu7bjB3lPt8ejSw>
    <xmx:LkVMaL1Gaqmyj7r11uo7f_avYJqR5Ncfx3WZRQPFRISJVVxEvwmOGA>
    <xmx:LkVMaLwB2wlydA3AT-PG1KyISWjbYDg9VRZfJNnBIUtRQA1UaBr6rSq_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:09 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 01/13] media: rcar-vin: Use correct count of remote subdevices
Date: Fri, 13 Jun 2025 17:34:22 +0200
Message-ID: <20250613153434.2001800-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When extending the driver with Gen4 support the iteration of over
possible remote subdevices changed from being R-Car CSI-2 Rx only to
also cover R-Car CSISP instances. In two loops updating the bounds
variable was missed.

This had no ill effect as the count the two values have always been the
same in the past. Fix it by looking at the array size.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- Use ARRAY_SIZE() instead of updating the incorrect define to
  RVIN_REMOTES_MAX.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 846ae7989b1d..cf5830d7d7b1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -213,7 +213,7 @@ static int rvin_group_entity_to_remote_id(struct rvin_group *group,
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	for (i = 0; i < RVIN_REMOTES_MAX; i++)
+	for (i = 0; i < ARRAY_SIZE(group->remotes); i++)
 		if (group->remotes[i].subdev == sd)
 			return i;
 
@@ -262,7 +262,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = NULL;
@@ -284,7 +284,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = subdev;
-- 
2.49.0


