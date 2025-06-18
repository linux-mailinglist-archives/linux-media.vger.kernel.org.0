Return-Path: <linux-media+bounces-35119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20390ADE0F4
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 04:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE19189A541
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 02:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E02199223;
	Wed, 18 Jun 2025 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pN8ts+fT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B02904;
	Wed, 18 Jun 2025 02:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212129; cv=none; b=jwOISlAex95JNDuGgYhnSQad7V5o/mIjotT7sdZGukgob/cepMrdCLr1h+GjhWSndf4Da8d68FXGe4HkUnEcuLkXqLrvQc8gKMQ9BPiF39GCAHPIAfKwJHbdtI14cxOLdbmLj8TwDXaH5pzGknzltDjbI4umMtHZJvuzDT9Ntz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212129; c=relaxed/simple;
	bh=VmfzymCXR8BqvvKDBBWL507qnJk5QVaTLWxyd4mGGiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vzf2B+dzZUWU18le1wRjwKVO0OTFlLOnHxaq3S+o+Fc1SCL0gPMMpX1cWKJR2CEKDArZ9TAPYa1f3iYdr00q2gfei2nJdxdMK91q2zSAlXa7ig2nfYTYzUICFjtFV3HabPZujQiIEU/7IgnirY975XiZ32stF8Y2KbuZK9wpcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pN8ts+fT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E3402C5;
	Wed, 18 Jun 2025 04:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750212113;
	bh=VmfzymCXR8BqvvKDBBWL507qnJk5QVaTLWxyd4mGGiY=;
	h=From:To:Cc:Subject:Date:From;
	b=pN8ts+fTirdK/yrPBmhSI46IMOhedW077tznELD1xIocVj/TojBzXY3y9CgiW9YX+
	 f+fdJIwdXzZSX/YCrprwuFAE5ZHauiPBAuQNs26be9VwyEp+QnuTFj6SGOXP4/w+w8
	 dfs9YUj60Q/vvfuYn3j6E75M8pTp2E2nmTySMAUU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH] media: vsp1: Use lockdep assertions to enforce documented conventions
Date: Wed, 18 Jun 2025 05:01:49 +0300
Message-ID: <20250618020150.9863-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few functions have documented locking conventions. Documentation is
nice, but runtime checks are better. Enforce the conventions with
lockdep assertions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c   | 5 +++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index c660f8539ff5..d732b4ed1180 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/gfp.h>
+#include <linux/lockdep.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
@@ -612,6 +613,8 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
 	struct vsp1_dl_list *dl = NULL;
 	unsigned long flags;
 
+	lockdep_assert_not_held(&dlm->lock);
+
 	spin_lock_irqsave(&dlm->lock, flags);
 
 	if (!list_empty(&dlm->free)) {
@@ -639,6 +642,8 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
 	if (!dl)
 		return;
 
+	lockdep_assert_held(&dl->dlm->lock);
+
 	/*
 	 * Release any linked display-lists which were chained for a single
 	 * hardware operation.
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 3cbb768cf6ad..5d769cc42fe1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -9,6 +9,7 @@
 
 #include <linux/delay.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/sched.h>
 #include <linux/wait.h>
 
@@ -473,6 +474,8 @@ void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
 {
 	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
 
+	lockdep_assert_held(&pipe->irqlock);
+
 	if (pipe->state == VSP1_PIPELINE_STOPPED) {
 		vsp1_write(vsp1, VI6_CMD(pipe->output->entity.index),
 			   VI6_CMD_STRCMD);

base-commit: d20469375306163719ee458dd83b7d6c1c93d4d1
-- 
Regards,

Laurent Pinchart


