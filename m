Return-Path: <linux-media+bounces-13626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4F90E091
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0228A1C21690
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2230F15B3;
	Wed, 19 Jun 2024 00:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KYnsqqmr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6D4A2F;
	Wed, 19 Jun 2024 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756276; cv=none; b=rtv3SquQmKXRA7DC2YkLCSrw34Rb3BgKSfxYFXipPmWSrjA+CpD7Bl7jqopr4r3xEaN3v452GIJHrxH691ycNzDfjWeiN4CwpaWuoGiuT6WXZs24QTU7XH3kikQZg2G9lQMD5nCjjnGpioWlyVBFoKwWnRjD8Z7VhDWeVEGJVOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756276; c=relaxed/simple;
	bh=L/Wk9fNpj4ZS+0ED7t315chtWYgOB3zdriWgerDXoS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brZboaY7qVrUf0fms2IKDmVWcPP3oKCQMxr9vSkVyajnAWkPyXqVOdgaRdXDuHEVbb0qlHr2vh/Vr+ciED42SPjwAKVsLkjdnYWO3nFUO2kTAAmDTob5+peNEOa2NtFTg0KX8BE9n5Y0YOAxwFzovw5hqJg8YyZCSNCqkgcForQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KYnsqqmr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D611207;
	Wed, 19 Jun 2024 02:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756252;
	bh=L/Wk9fNpj4ZS+0ED7t315chtWYgOB3zdriWgerDXoS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYnsqqmrcgTCwFp26Jl95HJwmvWW62TtNSGx5OLn9u0ZtJbP4dfBP6g+m2tZvLlYX
	 zSfjf8l8onoGGXmAEpzFPC2xvnnbTJad93j/KT15nc88Pag1//Trl6GNnqlys1Hb2m
	 RZs0NL6nyO6qZcYDS+MIT5OXFHLlupY8ofca0dVg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 04/19] media: renesas: vsp1: Drop brx_get_compose() wrapper
Date: Wed, 19 Jun 2024 03:17:07 +0300
Message-ID: <20240619001722.9749-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The brx_get_compose() function is just a wrapper around
v4l2_subdev_state_get_compose() without any added value. Drop it and
call v4l2_subdev_state_get_compose() directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 0eb4d8fe4285..05940d0427bf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -96,13 +96,6 @@ static int brx_enum_frame_size(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static struct v4l2_rect *brx_get_compose(struct vsp1_brx *brx,
-					 struct v4l2_subdev_state *sd_state,
-					 unsigned int pad)
-{
-	return v4l2_subdev_state_get_compose(sd_state, pad);
-}
-
 static void brx_try_format(struct vsp1_brx *brx,
 			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
@@ -157,7 +150,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 	if (fmt->pad != brx->entity.source_pad) {
 		struct v4l2_rect *compose;
 
-		compose = brx_get_compose(brx, state, fmt->pad);
+		compose = v4l2_subdev_state_get_compose(state, fmt->pad);
 		compose->left = 0;
 		compose->top = 0;
 		compose->width = format->width;
@@ -204,7 +197,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 			return -EINVAL;
 
 		mutex_lock(&brx->entity.lock);
-		sel->r = *brx_get_compose(brx, state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
 		mutex_unlock(&brx->entity.lock);
 		return 0;
 
@@ -253,7 +246,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	sel->r.width = format->width;
 	sel->r.height = format->height;
 
-	compose = brx_get_compose(brx, state, sel->pad);
+	compose = v4l2_subdev_state_get_compose(state, sel->pad);
 	*compose = sel->r;
 
 done:
-- 
Regards,

Laurent Pinchart


