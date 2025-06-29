Return-Path: <linux-media+bounces-36220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FAAED121
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBFBB3B5B3A
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F0823F417;
	Sun, 29 Jun 2025 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkRIyvsd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CA23DEAD
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230615; cv=none; b=FrW5Vow/GGevFADmrf3P2xH3YX7E8yXeeKSS57DnGXaqlQYVU5ET0cqNiaoj/uxlALxJF0THS+v9i87WMA5imwWXq4KlPbANDVChr9S60clp7PLNluNhgjnoraocHngibaXbLWd8us1AymXS/Qt7/pFjzeSvhr2fq7w/ewBMgiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230615; c=relaxed/simple;
	bh=PEBReUBE1pUBbNNLtOEs2w2svTSiOeJ2bBHaZx/FGFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZsMVCZLRfigTYnwJhPsBBZS5cliYjPybLGC9KSvm5YlMwZfBzq/Gt0Kc9s3Q0quRB59dFzjNfvQc/b//zFirX6r0p059zih6GgEC9F/l8WFaJMLK6BHoKFZ9UpxJN9+oFUDW4kaDGXU3R18MKSV/DUouuOTl/tt1Ygp3NAy1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkRIyvsd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096DBC4CEEB;
	Sun, 29 Jun 2025 20:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230615;
	bh=PEBReUBE1pUBbNNLtOEs2w2svTSiOeJ2bBHaZx/FGFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tkRIyvsdJPZlN1YHLnQPe9S1uqn8S/W4jS4s6xt3c5f0PnrvVel6XhCxm76sHR7mk
	 au4hZymbQDS4dtBHWXXyeuzC6F/hYVh1wOCKRBeez3zypJnlq8X2SM2mK3q6X2c6LW
	 LpvK0kfdxJU4OKxa6KQyUaNkewjmTYD6gLNV7f55XJm5AP30MKEm0rXrbHTrfKEEaW
	 uAfnI76J69KlSK+zOh5HQkFmuRp51gcQFkMPf+kAX5axgCA7lD559VMzJ/cBrv5oGF
	 eAavMViMAhBoepbb8UJ7qMwVba/tR5rCSaR243GlrT0f5u/T1KxzXu1F4g7GrdFQN0
	 MrthNPYUtFULw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 12/15] media: mt9m114: Don't allow changing the IFP crop/compose selections when bypassing the scaler
Date: Sun, 29 Jun 2025 22:56:22 +0200
Message-ID: <20250629205626.68341-13-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scaler is bypassed when the ISP source/output pad's pixel-format is
set to MEDIA_BUS_FMT_SGRBG10_1X10. Don't allow changing the IFP crop and/or
compose selections when in this mode.

Instead of returning -EINVAL simply return the current (noop) crop and
compose rectangles.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- This is a new patch in v3 of this patch-set, which comes from splitting
  up "media: mt9m114: Fix scaler bypass mode" into multiple patches
- Add src_format local variable
---
 drivers/media/i2c/mt9m114.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 1f305bba180e..1280d90cd411 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1963,7 +1963,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *state,
 				     struct v4l2_subdev_selection *sel)
 {
-	struct v4l2_mbus_framefmt *format;
+	struct v4l2_mbus_framefmt *format, *src_format;
 	struct v4l2_rect *crop;
 	struct v4l2_rect *compose;
 	unsigned int border;
@@ -1976,6 +1976,13 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
+	/* Crop and compose cannot be changed when bypassing the scaler. */
+	src_format = v4l2_subdev_state_get_format(state, 1);
+	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		return 0;
+	}
+
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
 	compose = v4l2_subdev_state_get_compose(state, 0);
@@ -2022,9 +2029,8 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	}
 
 	/* Propagate the compose rectangle to the source format. */
-	format = v4l2_subdev_state_get_format(state, 1);
-	format->width = compose->width;
-	format->height = compose->height;
+	src_format->width = compose->width;
+	src_format->height = compose->height;
 
 	return 0;
 }
-- 
2.49.0


