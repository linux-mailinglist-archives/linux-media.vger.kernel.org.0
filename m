Return-Path: <linux-media+bounces-39215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F56B1F674
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D35E189BAB0
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4B727E04C;
	Sat,  9 Aug 2025 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MjJfsF7i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588127875C
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774278; cv=none; b=thjGKSF0v2XPr/6+RGYYoXI0Z5Pyy4q1vu3oG8KwcuQKKFYTEBrAM8V2/34ZSCjF8zgbnewKx+YRTTHeGC9ula1ZuBIpiL1wgPHiyigutLT03sDNpZ1pLuvml45Z4jRm48AOnH1hmafi9+QmYopkNeAud1T/A07xu0sMVEEph1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774278; c=relaxed/simple;
	bh=Zrsz+c5C/5e/vLrZ1fcFKZ9l8pG3FY7iBuzWZH93u18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDdYnyyqR+pz6pFBH82ynTCNKLluFKaF/IAZkw+hXxYCKoc9y3hhMW+86qew5nQhFrQDfvRWxJjv1KTBzzzvKPQ9Qa4cilTeIMast72DSDmJc3H8MbqHpY0VRnZ1rj3Tz+eqiNHpfal/qSIKmcTXo0VVOXBGPfhnE6eruu02Jto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MjJfsF7i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 31EEC162B;
	Sat,  9 Aug 2025 23:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774213;
	bh=Zrsz+c5C/5e/vLrZ1fcFKZ9l8pG3FY7iBuzWZH93u18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MjJfsF7ihTElYwJGZ1mU+L+QCSAGGia0EQobpKpmemolMoXpyIBaZIcXh0AJ0TXyK
	 xupKfpOcohjIB9DSA4yczvekJhQi/At7wtbEVa5SCL/v+OfZ6fOwKVJfFpTAkfSxLU
	 0yKknFrdgT5o3LBtgzVo7m+DXZT6nLnR/2akgtqs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Subject: [PATCH v2 21/76] media: chips-media: wave5: Pass file pointer to wave5_cleanup_instance()
Date: Sun, 10 Aug 2025 00:15:58 +0300
Message-ID: <20250809211654.28887-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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


