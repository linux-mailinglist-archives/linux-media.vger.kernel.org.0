Return-Path: <linux-media+bounces-39294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABEDB1F7A6
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5928D3BFA25
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58021C07C3;
	Sun, 10 Aug 2025 01:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m7V2FdOo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40141BFE00
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789518; cv=none; b=RYGZy/GLXLNtpvs6StZM9wBa61+1vbXcVPcPEUEkOFEA2vDhQ49L+/sriLlJzsdkHyaKkImmXOPhc+lGr9G7heq+0gZJPtlH8PVfP7dezoqdEOAKUNpQ4M1dk5CO+EKd3gx3sw/RELzRmSZKdRFZ1knInx+3h/7NRFmMwxWSuzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789518; c=relaxed/simple;
	bh=N2RV+V1b85YzDGVUeAjFyE8yOKIGxjavMk5X22a+BYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBnGfI0aaCuNqnTU3pjocQxcHlDxpboU55N6A8cIZLsvLoydtGRoUJ96nbzv/m7N98ahWSfEI/LMFBmdB8r1WQ0zoIBOfRES8UdSEdqs4dSaw9v4qZBdwBa+qpcjbnN0J3GLD6RyEt1vv8Ud5hGmIQvdqkD6vGtPkFeGzLLC44o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m7V2FdOo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49C5418B9;
	Sun, 10 Aug 2025 03:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789464;
	bh=N2RV+V1b85YzDGVUeAjFyE8yOKIGxjavMk5X22a+BYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7V2FdOogvgKj11rz7LRqX1vuYX15Dd6OAanaeay2aNVXoOu5Oh41BKqUPFVssYwP
	 N209yNFQ+Kj8kd8pQ7wErXBwx4R4kcpXjiwhVCoIAZ3QEYmA3BE9F+W7FyE4C2LJtd
	 bUlJ9vrDHrzCeNg6UXjFrLMqQ4IbKfJUv5n4qorQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Subject: [PATCH v3 21/76] media: chips-media: wave5: Pass file pointer to wave5_cleanup_instance()
Date: Sun, 10 Aug 2025 04:30:03 +0300
Message-ID: <20250810013100.29776-22-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for a tree-wide rework automated with coccinelle that
will need to access a struct file pointer in the
wave5_cleanup_instance() function, pass it from the callers. There is
not functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/chips-media/wave5/wave5-helper.c  | 4 ++--
 drivers/media/platform/chips-media/wave5/wave5-helper.h  | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 031dea0ee61c..ed8ff04a899d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -27,7 +27,7 @@ const char *state_to_str(enum vpu_instance_state state)
 	}
 }
 
-void wave5_cleanup_instance(struct vpu_instance *inst)
+void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 {
 	int i;
 
@@ -78,7 +78,7 @@ int wave5_vpu_release_device(struct file *filp,
 		}
 	}
 
-	wave5_cleanup_instance(inst);
+	wave5_cleanup_instance(inst, filp);
 
 	return ret;
 }
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 9937fce553fc..976a402e426f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -14,7 +14,7 @@
 #define MAX_FMTS	12
 
 const char *state_to_str(enum vpu_instance_state state);
-void wave5_cleanup_instance(struct vpu_instance *inst);
+void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp);
 int wave5_vpu_release_device(struct file *filp,
 			     int (*close_func)(struct vpu_instance *inst, u32 *fail_res),
 			     char *name);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index fd71f0c43ac3..f3188d720ed3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1840,7 +1840,7 @@ static int wave5_vpu_open_dec(struct file *filp)
 	return 0;
 
 cleanup_inst:
-	wave5_cleanup_instance(inst);
+	wave5_cleanup_instance(inst, filp);
 	return ret;
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1e5fc5f8b856..b69a1206fa12 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1784,7 +1784,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 	return 0;
 
 cleanup_inst:
-	wave5_cleanup_instance(inst);
+	wave5_cleanup_instance(inst, filp);
 	return ret;
 }
 
-- 
Regards,

Laurent Pinchart


