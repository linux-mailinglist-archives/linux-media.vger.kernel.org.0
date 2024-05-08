Return-Path: <linux-media+bounces-11175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3108C066D
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 23:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE38D1C21575
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D890E13281F;
	Wed,  8 May 2024 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Au5roWwO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D944132483;
	Wed,  8 May 2024 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715204459; cv=none; b=N4vTEsYZ5+BaWMSuu0IsQXogsvgCTuLEAmDCM4z6B+SSL5cs19oNRyJplHqYfXW8ace7CQdVUx6Nd8BX8bBc/M1PtPlVkhzgX2LhSkp5ZX3Qls6bgu8XAIYIL9XxTNckH94kjQkFYpMGJUUhSYjoQWIBc0cyK6UPAQPLw9iBr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715204459; c=relaxed/simple;
	bh=ve9t/Y3usH4BO78+BB5FxHWk4otvPB0zxV74NSyc/OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqdt8RnovAW4sk8935w2/oi7lAf5iNPDuZU+5ZsvSIhZR/6PEXjJDoHSC9UwJOou9upcCGpmRLfDjMoCIT05sWlBunxnXVRcYRRSphh4TyjMP++enUTgn3pRiIY+yYnVD4usuMNk2xmozQxi/gBpIpgVk1xUyhFPJumNKt3JmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Au5roWwO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9399819FA;
	Wed,  8 May 2024 23:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715204452;
	bh=ve9t/Y3usH4BO78+BB5FxHWk4otvPB0zxV74NSyc/OI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Au5roWwOF4OjBFBJ0p1QVPwBKx1W3hIqup0QAMedIUXqWGNLiqo2MknWv+KkC7cz6
	 czQNeqFi7mbelavOAfVgxf/LdlmmkpAV+QBVOF2/a1JZrQ8dY4w1a6dyqGEp0qysKw
	 +++IuLQ+gMcEdPDV1pCwhnU7Wp6se79erxX3dXXE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 1/3] media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation
Date: Thu,  9 May 2024 00:40:43 +0300
Message-ID: <20240508214045.24716-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation of the v4l2_subdev_state_get_format() macro
incorrectly references __v4l2_subdev_state_get_format() instead of
__v4l2_subdev_state_gen_call(). Fix it, and also update the list of
similar macros to add the missing v4l2_subdev_state_get_interval().

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e30c463d90e5..b25b6e97ecbd 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1340,12 +1340,12 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
  */
 /*
  * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
- * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
+ * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
  * macro below is to come up with the name of the function or macro to call,
  * using the last two arguments (_stream and _pad). The selected function or
  * macro is then called using the arguments specified by the caller. A similar
- * arrangement is used for v4l2_subdev_state_crop() and
- * v4l2_subdev_state_compose() below.
+ * arrangement is used for v4l2_subdev_state_crop(), v4l2_subdev_state_compose()
+ * and v4l2_subdev_state_get_interval() below.
  */
 #define v4l2_subdev_state_get_format(state, pad, ...)			\
 	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
-- 
Regards,

Laurent Pinchart


