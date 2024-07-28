Return-Path: <linux-media+bounces-15385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D532D93E66D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1B41F2188D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D492285285;
	Sun, 28 Jul 2024 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIw5fJ/f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E6384D29;
	Sun, 28 Jul 2024 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181485; cv=none; b=TslxL/KXZPXAiu+GqdGWXfm7o0Ni8W+CYS16hQksEdJsZASXcXoMmNuIkBkLwCE4DHwvnudBUwKeji7CRhiv7Tb4Q8KJzf68ntE9+d2M67rfe7K2SBZR2c50OCx6h03Opi6uKXypPVASj9Ncbgp1+SexKtsktZrDkgA0jAk4baE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181485; c=relaxed/simple;
	bh=aPXY2bS+iagZhIqduJqASpuHL14PKnSZEa8uBdHBJc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snjcwUzhGEi9FpbEd3aPB3/yKT85gi5xqzi2Qt7a0Aler2ceF7X9X9531bsIw5tRgH+0Fpogqr0SKPaShQYj5O3ns0CirUvb0Gc0Zcrbdf1nqBTZ5tMxjAheIsrPjj1GIP+jnobY21zvyWHDWYYOHvg9ZnV9tRhNmYP3fUn89OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIw5fJ/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1279C116B1;
	Sun, 28 Jul 2024 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181484;
	bh=aPXY2bS+iagZhIqduJqASpuHL14PKnSZEa8uBdHBJc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIw5fJ/f41gAwq6tTTn6DgDh3wB7kiuU9kHYWieISn7TatQFHcL9GbuaGlyl6UN+B
	 /Tn/I5iILeepubLHIP6AU5qrAg5m1/yXydUBi44GnfOx6ukgHwX6UEJjUuKkYWhFc5
	 4CIuXxHv/5/MWrZT1zETnYw7bEacvr+PdTiCS9QFwQSJTBtt32hnwzcYDl3GC6FlPP
	 Of2yRkCfoWJvf5TIX5auoMFNCwesNNWIjVKTZzJzwr4Br64gDvLk0v22lFSDVjFPHS
	 w/newCJ9Lit9ru/z1VvedbvTxkXQdGQ7sjdECz7VSF6mG/bTbUmrjqRcNk9CI5cEZ6
	 DH93aYeTCnt4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 25/34] media: uvcvideo: Remove mappings form uvc_device_info
Date: Sun, 28 Jul 2024 11:40:49 -0400
Message-ID: <20240728154230.2046786-25-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 8c40efeda94108d65c52038ea82ee83b2fb933e2 ]

We do not have any quirk device making us of this. Remove from now. It
can be easily reverted later if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 27 +--------------------------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4b685f883e4d7..27cf6d4d3c1dc 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2623,32 +2623,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
-	/*
-	 * First check if the device provides a custom mapping for this control,
-	 * used to override standard mappings for non-conformant devices. Don't
-	 * process standard mappings if a custom mapping is found. This
-	 * mechanism doesn't support combining standard and custom mappings for
-	 * a single control.
-	 */
-	if (chain->dev->info->mappings) {
-		bool custom = false;
-
-		for (i = 0; chain->dev->info->mappings[i]; ++i) {
-			const struct uvc_control_mapping *mapping =
-				chain->dev->info->mappings[i];
-
-			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
-			    ctrl->info.selector == mapping->selector) {
-				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-				custom = true;
-			}
-		}
-
-		if (custom)
-			return;
-	}
-
-	/* Process common mappings next. */
+	/* Process common mappings. */
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
 		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3653b2c8a86cb..817fce547898b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -524,7 +524,6 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
-	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_status_streaming {
-- 
2.43.0


