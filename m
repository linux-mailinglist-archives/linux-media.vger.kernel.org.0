Return-Path: <linux-media+bounces-29865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B3A839CD
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E8701B80137
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AFC204F80;
	Thu, 10 Apr 2025 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MLjz7XME"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A45204C17;
	Thu, 10 Apr 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267795; cv=none; b=tmVdem4xzTk3dZlGHcYphB9nJGvuyT+3FVPTMGtDl54o/aIgz3XcZiX5PcXLxk3iYVGoBpkQ4Gr1L4ujkx0EKI/DumhOWajk0usEqBJzVx/D/gGnoR7Quf3jTahVvYVKaOpKj//L3aCizqrv/VXbsKX3k7L8L7NQImbhwKBEOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267795; c=relaxed/simple;
	bh=4MJSk39sy9UrQBNk5KWmQcjTHvyHa4DM84YIW+K0a9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YV1m1OxWtEsmCN7fQqKfpvqWA7h+1fSWPUMS4NOlFeLTEU+0Rwtw21cEVAMFFJNYuy+7uTMqVI8ntUbajd0k52YJtMguBN+dtKoioWVLkYKPt0RsPeVC09PHd8N55OH/flM+mtvMue3B7rfCXrCysySfK7Ze6eLdDkgAxEzPVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MLjz7XME; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCE24EE4;
	Thu, 10 Apr 2025 08:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267674;
	bh=4MJSk39sy9UrQBNk5KWmQcjTHvyHa4DM84YIW+K0a9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MLjz7XMEEMsQ43axbfJu8EMOKH8a82VRBNtsvieoLwx5oyvUuli3mZSNOgd/MDWdo
	 IE9kCLfOdsPFauS93FzE58KEQIxtPZtt2h1zY/w5cuGA9uklxhERuo3lB6aiMnJgag
	 qK2BlzBiVV/ojrV/uNKZJR+Feug8KN5nrP2f/Dn8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 10 Apr 2025 12:19:01 +0530
Subject: [PATCH v2 3/6] media: ti: j721e-csi2rx: Fix source subdev link
 creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-probe_fixes-v2-3-801bc6eebdea@ideasonboard.com>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4MJSk39sy9UrQBNk5KWmQcjTHvyHa4DM84YIW+K0a9w=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n3zvxxTycjjaPdDsUjo15N3YY4sZsMUtUWQ
 SvLj/g5ib6JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp9wAKCRBD3pH5JJpx
 RTLwD/9n+E3J4ejn7WDOa55/9mtuSlcMLtbtLAUPeNTLFlDHhX05WxElNTFMRX2SWIVs2yzzajB
 XOacNBHTUuXUk0Aqjcl1x/BUMIcgpJrkoSetolyEspEZNaFQHf4EywLIl5DCSWmbPVBLT1XcMe+
 YEOcQPz7OJMcd7d9xEKr5I+MuC/UGMFJa2ajz9bHHEyhxfHmQUcE3Y6AkxShyu/XhaAU5b8/DON
 yXkwbMnvMbgt5LfGGlpUrG6LS/SOtdmju5AtT00Ubu0SSyoNFbsU5Z1sqPh7Vyz9HxnEPtWo0ll
 P3nx9Ff1VLlMSpHsYMKljfTbbw9rdf9wQhG13VurjtFeXvNeapjTDKy53AU7THDji2wGiT3Eccz
 OcPFRpKCKdUS9NlZofLwpWvzUvaejKgz2XBrTKWIxJnFDGH6HY5rPBLSH4ciRhDRD8KPAUhsVen
 FoBDF/K5D3EAFzimXxQhplWeKYSojhw2lEVZEne/X80doNzj2OLRMKY3CIwgBYdxlBT/wvOAuVx
 w9azpPeQlKgwj5QQTJWtYpWic2OnAJkje+IfFrFbH1LohTHQsVNS9NteNshtgYQnauNr1Q3xL3S
 dk4MnifEMOIbyfxGUkkVtlsKfoA8+4vL6mvYZknRkjBTTmdnPYKC+VUGJv3v8zbe+Oke3yo7tHG
 QKDo9Nq59HrJkbA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

We don't use OF ports and remote-endpoints to connect the CSI2RX bridge
and this device in the device tree, thus it is wrong to use
v4l2_create_fwnode_links_to_pad() to create the media graph link between
the two.

It works out on accident, as neither the source nor the sink implement
the .get_fwnode_pad() callback, and the framework helper falls back on
using the first source and sink pads to create the link between them.

Instead, manually create the media link from the first source pad of the
bridge to the first sink pad of the J721E CSI2RX.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Cc: stable@vger.kernel.org
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6d406925e092660cb67c04cc2a7e1e10c14e295e..ad51d033b6725426550578bdac1bae8443458f13 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -53,6 +53,8 @@
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
+#define CSI2RX_BRIDGE_SOURCE_PAD	1
+
 struct ti_csi2rx_fmt {
 	u32				fourcc;	/* Four character code. */
 	u32				code;	/* Mbus code. */
@@ -427,8 +429,9 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	if (ret)
 		return ret;
 
-	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
-					      MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	ret = media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE_SOURCE_PAD,
+				    &vdev->entity, csi->pad.index,
+				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 
 	if (ret) {
 		video_unregister_device(vdev);

-- 
2.49.0


