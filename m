Return-Path: <linux-media+bounces-36219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D22AED120
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9681C3B5407
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498A023F40F;
	Sun, 29 Jun 2025 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9goJQ56"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06E23DEAD
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230613; cv=none; b=gElbLjhc0xzmjbVpOEOpPRrSml7iCStEFCVodeN3tjs69BqQXlR3Fe57Gy/H6BEWfyNqsI5drk9tyxh2Kn2I44V4gR0X4JCwnrfZ1Eq8Eq1sUUjW3AzR2iSXmiuWpiI84+aQBw+QoaOBswmhvxeO5chrDAH+WsdKOS4ynIZ9+YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230613; c=relaxed/simple;
	bh=PWyXLZlztkJUuxUpeIf14/caWPAn+0+SerZzV5ps7nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDDwBchkS1YpCpbHkVeyItSO6bzZszYvbxXuF9+FoUZM+Op1FHMLqTw0yNoUwqWvey7QCBXUGpPsHyMMnWWJ8ZnYhEnHbGSk03QfjRiAqI4Ht5CFHbwH3CQQxIZfPF5s43cou7P5gTWlYoQBNcQjSC8b3xkf6zscxS5MBS3scxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9goJQ56; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B97C4CEEB;
	Sun, 29 Jun 2025 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230613;
	bh=PWyXLZlztkJUuxUpeIf14/caWPAn+0+SerZzV5ps7nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9goJQ56FJlTq50vuiFxZNEfKJ8BhbZyj1gymjMODux35WGCDY/5kwaBSCyWkotiZ
	 +0z6dJija8MTMVDkb/hUV0/sdpuvmFYOlJRB2FyfM9DAcVvsNmF61XpjT9T+7fppw2
	 GfHfsqoFsqeRI2vA2RWBZsl0/u7MZpxYEgC+UrqDmVAiAjfGfcLyHf8/XGy+SoveI6
	 c/jf2C9T65PaWib8sWdYNKniif0PpxSbGRu3HCdfbxP4e0tT91hvVgJ4aD0F/kj1ib
	 tdi3bqL668VCcTEyw/r4egfa4HgNsmYFjMszo03x9kpDmRB6OvrKTpPBjOb8PDtgRm
	 36sBNMCicFg2A==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 11/15] media: mt9m114: Update src pad sel and format when sink pad format changes
Date: Sun, 29 Jun 2025 22:56:21 +0200
Message-ID: <20250629205626.68341-12-hansg@kernel.org>
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

Call mt9m114_ifp_update_sel_and_src_fmt() on sink pad format changes to
propagate these downstream.

This is necessary in 2 different scenarios:

1. When passing through RAW10 bypassing the scaler then any sink pad format
changes must be propagated to the crop/compose selections and to the src
pad format.

2. When the scaler is active, then the crop-rectangle cannot be bigger then
the sink pad format minus a 4 pixel border all around. If the sink format
change reduces the size then things also needs to be propagated downstream.

Rather then adding extra code to check for these conditions, simply always
propagate sink pad format changes downstream.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index ef27780384f2..1f305bba180e 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1871,6 +1871,8 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 		format->height = clamp(ALIGN(fmt->format.height, 8),
 				       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
 				       MT9M114_PIXEL_ARRAY_HEIGHT);
+		/* Propagate changes downstream */
+		mt9m114_ifp_update_sel_and_src_fmt(state);
 	} else {
 		const struct mt9m114_format_info *info;
 
-- 
2.49.0


