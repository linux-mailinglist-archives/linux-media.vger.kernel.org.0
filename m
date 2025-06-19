Return-Path: <linux-media+bounces-35436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82281AE0EB9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D88583B93D2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B7C25D90C;
	Thu, 19 Jun 2025 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SPyo7xed"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D3238C2F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366061; cv=none; b=NrqPOuS7oAkT3hjtByzUEz3S1gQd0wLbwo8+VndWB/1WVEkhm+EbcGxRIRRO2WoJYEYsXqs/YdqQdWBfBEniwETdNq86lIPd4V/9ErZtjZem+SHKgH/CIkZeFrXx3iMDQ/pVdoUrrVA+Ba85oa5rFx/Pzjln7sUXFxOZWPskwQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366061; c=relaxed/simple;
	bh=rB0UKbTWCyK67NlD4wEpfLZSmw+6HcMAHOTB4TDUOzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ishk4kmjsx73eSPFqbs/TZw+5NWEMoy0glRaleGM9C/AUhg4XB56IwukrskgNL7DJMzKKHHH4IMWqMCdKfFjqA5nYTKHZIiiJ0/qkO5QQUUzMvGmiuq3GOfNIg+ayohBRwTOqfASp0uxj6GhxElhhvGVCctsFAnrToVXo2JNyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SPyo7xed; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B08029CE;
	Thu, 19 Jun 2025 22:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366040;
	bh=rB0UKbTWCyK67NlD4wEpfLZSmw+6HcMAHOTB4TDUOzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SPyo7xedTF2jssq+N6HyfwGDiuaFM1G/qYm2UKNBtqfe3zfrhL44SR+bbjkDPGDy3
	 wpLTHC+S2sBBxglNLfX/anLnX5wc0bOhhLyaPYrfZPYmTGuFAxV3KOfwL00AyKSxXi
	 mSItZQvXMlAOmaabXJRAoSJ5GGvDFHacUc+3VT+I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] media: i2c: ds90ub953: Drop check on number of active routes
Date: Thu, 19 Jun 2025 23:47:10 +0300
Message-ID: <20250619204712.16099-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev core now limits the number of active routes to
V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub953
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332..c80f5061a13a 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -456,14 +456,6 @@ static int _ub953_set_routing(struct v4l2_subdev *sd,
 	};
 	int ret;
 
-	/*
-	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
-	 * frame desc is made dynamically allocated.
-	 */
-
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
-		return -EINVAL;
-
 	ret = v4l2_subdev_routing_validate(sd, routing,
 					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
 	if (ret)
-- 
Regards,

Laurent Pinchart


