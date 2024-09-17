Return-Path: <linux-media+bounces-18333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF997B113
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8281F22942
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A268E1662FA;
	Tue, 17 Sep 2024 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aQzhEj40"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB519BBA;
	Tue, 17 Sep 2024 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582210; cv=none; b=ddxar7NizKEO7lDe029ka4j9OzTLOx/PeGtFWoJJzx1XNYoprNgo8jkKcrRoccyzib3E0qx88s8V0IfuCIldL/LpB7xuuMzRSjFCWsuPdgwT2EWXsB0wzizpziZ2XQp5TLBq4Xd6tbsNOmc8sGNZUL6x77PycBSgJoWoh9tFO04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582210; c=relaxed/simple;
	bh=dJi12s2uuOavLgRJd+8G/40diMcWbmgczahPyVn/RCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jakKC+mtUxj/X0QW51Omiw3JbuK6t+pfa+/KkVaGtwZBeBlQBMPlIx5xIS7bztbyw1sAiprGA8wiVYmK4j5ySK3nKrMiRMikmVuDPPvTF02igI1Qdavlb1aJThpjFYnPdHQQqX8eM9rGYsut2yIIRMZg8bcCRzGX99kfkvXoFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aQzhEj40; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE7466B5;
	Tue, 17 Sep 2024 16:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726582124;
	bh=dJi12s2uuOavLgRJd+8G/40diMcWbmgczahPyVn/RCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aQzhEj40fqqXhL4kwCu2fy8doPaf0e39W8BFTMw0uAQZUEfRrNM/HcZTYenEcNcuX
	 GwoNZ1kFcjfcvhCS41GdMDevsu419mU1Eh7AT4mFiEt+IsRs7MubNsGjXYYO0qceQ/
	 W3IrHcqgTc77VzFbOU6RBSRcxBb1K5xO0IgsPJlY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Sep 2024 17:09:29 +0300
Subject: [PATCH 1/4] media: v4l2-subdev: Add cleanup macros for active
 state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-scoped-state-v1-1-b8ba3fbe5952@ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
In-Reply-To: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=h+utgyyppaqOqSvoQJ+8vFfC8hzW6qWNmGY5TYaanVw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm6Y27dHyTQ+/AekiRMk2DsfelvLw8zpOyIuR05
 FcVQj9J5qqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZumNuwAKCRD6PaqMvJYe
 9d/hD/9HgsqpkJr4FALWv264jckzXVna2IvdhY9BWKXoLMRo60ts1PA9TZfoQyPZS7LM23Mxfbu
 tDC1PaiZTS1ThXWgtpR5c7j/Bm5lRowe9p8CBHLwTuHxfDWueMdfUPaxM9HK44mVi6wmRSC8TfX
 AafPEwkXUzHd5CG8nugCUvWEG83UYCsP+p0WZYy92gydPvzdo+COqDjTL+PZ/7VOKaJtNOntJM4
 BGNElZKdKpyvx+avumgcGq4eIg5ejIDpciQPTatI3wjek2E27n910JsbaJcquq1aoeoWzhUDzyJ
 A6VEe/j4TcVQ/ZNKoVCArQQVePNDT4UKKzf/o1wQ0bUxUEW4mEK2rSrBo3nf0VFdQVukU+X6Dbr
 E01A/qRLUYFKK/5GBMa49FKojhyaJxpnX6IXA64EQI8+0nfoat4G/15FipW9OXKwhI3vpi4lXgy
 Yj4SB2h2G97OqVgktWCpkzV3FLTYwD55RNaIwzUjDRa7CQP71SpWPorl+bFLpezlefvfnwLdQuy
 V4r74oy54cj447iQcNWpte/qPIlYTtLo4gzYHcQvhXTT/x4XEu+ZfdsaHb4v4pD2eYq4JoBRkew
 sZ8Ag8Lug1PKLWlpLWnpYEuYASdFStieBzMxcmE0Kw/76e2O1/omeK7akCAyJPPWEey0Bazgz1J
 zg4xSbFqfW6olyA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add cleanup macros for active state. These can be used to call
v4l2_subdev_lock_and_get_active_state() and manage the unlocking either
in unscoped or scoped fashion:

This locks the state, gets it to the 'state' variable, and unlocks when
exiting the surrounding scope:

CLASS(v4l2_subdev_lock_and_get_active_state, state)(subdev);

This does the same, but inside the given scope:

scoped_v4l2_subdev_lock_and_get_active_state(subdev) {
}

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bd235d325ff9..699007cfffd7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -8,6 +8,7 @@
 #ifndef _V4L2_SUBDEV_H
 #define _V4L2_SUBDEV_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/v4l2-subdev.h>
 #include <media/media-entity.h>
@@ -1854,6 +1855,15 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 	return sd->active_state;
 }
 
+DEFINE_CLASS(v4l2_subdev_lock_and_get_active_state, struct v4l2_subdev_state *,
+	     v4l2_subdev_unlock_state(_T),
+	     v4l2_subdev_lock_and_get_active_state(sd), struct v4l2_subdev *sd);
+
+#define scoped_v4l2_subdev_lock_and_get_active_state(sd)              \
+	for (CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd), \
+	     *done = NULL;                                            \
+	     !done; done = (void *)1)
+
 /**
  * v4l2_subdev_init - initializes the sub-device struct
  *

-- 
2.43.0


