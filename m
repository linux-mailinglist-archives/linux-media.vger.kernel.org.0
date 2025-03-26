Return-Path: <linux-media+bounces-28768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0FA7155D
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B828177338
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93781DB15B;
	Wed, 26 Mar 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W8uM6OU/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA61C7015;
	Wed, 26 Mar 2025 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987424; cv=none; b=pzQewDazIs9Wy0v/dr3sQZYOqQbZ4+ZSOin34O/hBjBNLqYw89l5iUrTUboBIUv6XJEvmgxKbA34SVYyXJSei91bqr7lOqmblellPjx7At2P58FPpdXX2D80FKAYR974cW+oR5y3RKReDQwtJ0RkCs3feQhaOKNXSTetrMv2Hm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987424; c=relaxed/simple;
	bh=rClXTcoOQ5oDq+MUxDlxS/Yj1I0Y66txEryMU35AlQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjCWyLN8uFnyVUj5x9o7ZLyloyNhlnI+ims0a00ravKZ2qiKGrWLW+QZlP+oXb/gQgbTSiIc/yF8RcKX+JETY5e4HRzNBS7TOhboviGp9WM5ML+iYLNi/26N9Zpsw4rjFm7/mA/YLEkPugzQBuqHLw6X4yloYCh3vqaxq/nK5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W8uM6OU/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1C7699F;
	Wed, 26 Mar 2025 12:08:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987307;
	bh=rClXTcoOQ5oDq+MUxDlxS/Yj1I0Y66txEryMU35AlQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W8uM6OU/6zBaUlZPp4nfx0xLP5YGE1SY8yXxwiTCZU//PHTQu5WmKGqcUbEcWwH5Y
	 36YN4JffQ+J/IznPRb11yCo1oDX/eCnSzQGRRVzEP3TkJmFlCsOSAGQyegc0NMpb8L
	 JbaZZIysOYD02VSYnn9GtMNn/QMB7WyQdRGHzKIg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:23 +0200
Subject: [PATCH v2 01/15] media: rcar-csi2: Use the pad version of
 v4l2_get_link_freq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-1-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=rClXTcoOQ5oDq+MUxDlxS/Yj1I0Y66txEryMU35AlQU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CP3EWDuteu5f2sLp/0Fe0Jan/UVzkagqSvY
 Ng93+dBYQiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgjwAKCRD6PaqMvJYe
 9V8dD/9kS3Meif2Y4HD6A+m9ApTxVMXC20sTG6A35Wi3OqGoZUahoygTC2PG3SczlKTJEoR74w7
 1GfqUBxFUtp2v0YOvMVX6bBfomP+UyhXIyh939An8Be1mWzPzv7zMVHYCUcmkg+wY9U5iSri8Gh
 MFy6+CuI9eLmDZiPsg7PpoW2MArKcJQt7H5z3rMDKmUan2PmcBZ0Y54bga2QgDVRhRGP8j41dyY
 Y7FNhcO9Zrt4mJbCnZ7CcO8sQynNH3MlwG6Fp/UKUx/6RJjWl6CjxbVdst9n5hQCWNJ4h6rvffx
 SyKzdvsJby3/1tMupHy9onA4/eA+ELzhT/av68aOoqJhGuPXUwcF8PhoeQDxbLa+lSzgdlWxJWg
 re9b/Nngmyjctp3/QbXAkZAR3osK5Zs/EkoMA1mUyhn0BLN45vuGYXSXNbvSV+qojGLuL1ezamu
 E+om4x6FhXNgW/EybQWz+rZOg/4B18qulDO80LOYEp6s5ZlMIXnFiyEMqaGyDhMI2ZyHMVj56XZ
 KTJ12AQMChCFih5HO3UhDDnvV80b0KpMk1rbucD+HcO6HQvUBdnrkdojH8dPYSH2LwbEdO2XagX
 wc7WyDe1TQ4bZ4H+ljQK41vgoYVsYxwvfKciThMzWJ95h76LsdHnner4fxaSUWCcUuVwrblIWD/
 TMBMB8RZ77cRGVQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new version of v4l2_get_link_freq() which supports media_pad as
a parameter.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 9979de4f6ef1..ddbdde23c122 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -954,6 +954,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 			   unsigned int lanes)
 {
+	struct media_pad *remote_pad;
 	struct v4l2_subdev *source;
 	s64 freq;
 	u64 mbps;
@@ -962,8 +963,9 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 		return -ENODEV;
 
 	source = priv->remote;
+	remote_pad = &source->entity.pads[priv->remote_pad];
 
-	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
+	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
 	if (freq < 0) {
 		int ret = (int)freq;
 

-- 
2.43.0


