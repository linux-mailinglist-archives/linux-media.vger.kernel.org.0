Return-Path: <linux-media+bounces-16801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC895F1A6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2B51C217A1
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE49186600;
	Mon, 26 Aug 2024 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cc2JKB5K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79C18755F;
	Mon, 26 Aug 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676079; cv=none; b=ie7ib09QmfxWWk8BnzriaUEk2C3aZO2yG0YPdWkihDJPG3ICtHiwDXJgJOHF1DDS4qwRS1p/DM7SU5fceU4SkE5Cc3use7MT2a8ncqMisw5X1Xm0phao1xUql4VrxiZU18u+qTPGyienWCv/PldIOqzAgbVtbCEe5Wydn4ToOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676079; c=relaxed/simple;
	bh=scQkDIL05VQp5Mauo9cfSnC/NPA9wVIB97pdzpBE5UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPcwGO/uZrwE/uH4SbWCGy4pUxnq0nTeMSmhhOtS7XITVFDNVbEVztWAKzblkKCnp41KLCO+pBxA+DJ37r+rvH+Q9vv5WHPwhCC+Ehk4qIVexV5qeqs/mJqR1g7vZhXMkU9NziomUWU4HhjvHlKrsxO+//XJvpmc5+07RTGsAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cc2JKB5K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8F349FF;
	Mon, 26 Aug 2024 14:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676009;
	bh=scQkDIL05VQp5Mauo9cfSnC/NPA9wVIB97pdzpBE5UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cc2JKB5K3mjkVUZvlSi/gydBbFcICpqPcFF7RuaRUnil/8XUXaZqlAkBUIkG4hTFs
	 6Ze0+mf6ro02CJ/4RP40rgpnfFCdZTtWJqB6HGwe9kpeBk5KnZ2aRCSPjwp7u5AXE7
	 msIJDAQujLqRiRGr+lyWPXzLv7hSmpSgqnkxxaEo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 3/7] media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video device
Date: Mon, 26 Aug 2024 15:41:02 +0300
Message-ID: <20240826124106.3823-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() function is a helper designed to
validate links whose sink is a subdev. When called on a link whose sink
is a video device, it only prints a warning and returns. Its usage in
the sun4i_csi driver is wrong, leaving the link from the sub4i_csi
subdev to the capture video device unvalidated.

Planned improvements to the v4l2_subdev_link_validate() function will
turn the warning into an error, breaking the sun4i_csi driver. As an
interim measure, move the warning to the sun4i_csi driver in a custom
validation handler, and drop the call to the helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index dbb26c7b2f8d..d07e980aba61 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -35,8 +35,15 @@ struct sun4i_csi_traits {
 	bool has_isp;
 };
 
+static int sun4i_csi_video_link_validate(struct media_link *link)
+{
+	dev_warn_once(link->graph_obj.mdev->dev,
+		      "Driver bug: link validation not implemented\n");
+	return 0;
+}
+
 static const struct media_entity_operations sun4i_csi_video_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
+	.link_validate = sun4i_csi_video_link_validate,
 };
 
 static const struct media_entity_operations sun4i_csi_subdev_entity_ops = {
-- 
Regards,

Laurent Pinchart


