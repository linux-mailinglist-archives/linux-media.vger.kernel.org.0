Return-Path: <linux-media+bounces-33668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D911AC9092
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1934A7CB1
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCC722B8A7;
	Fri, 30 May 2025 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DN2gFnwT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E815E97;
	Fri, 30 May 2025 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613094; cv=none; b=CwwziEd57v5e0Fgs2za/jQXFKoXiB+uy+qgQG61HyuAQctpAdp56GVqxiMNP/NpkBlySJY+u5nWyoeZZ1OLFuYssUahETk+E4GqCXi+SGM/hWZk5OIS2570ZgomALg+Pg3Ic8JJ2TenEZy3cgwXGw61BXmjdZjUHKT2WqiruFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613094; c=relaxed/simple;
	bh=rClXTcoOQ5oDq+MUxDlxS/Yj1I0Y66txEryMU35AlQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PL/NklWmSS6Gcbcikr3i9iCgv/fFRADNt4deQF3N+46HdEg/2DM7MkZYX2n+AgOKavH86uIsN1K/Vgb594nfElIsucYwSOhIn3vjyrrUS3LMM+MWpOb3RsEAb+x8kmrUeB6gKl0DELXver39evgWnjeVWsvyG+l0HaEEKi7xTP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DN2gFnwT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD404A44;
	Fri, 30 May 2025 15:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613062;
	bh=rClXTcoOQ5oDq+MUxDlxS/Yj1I0Y66txEryMU35AlQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DN2gFnwT1dixlrrPu08Bgw4Jn7FaBkOjSrYpzfrXaWFjLlqkl4FaNKcwB0aRBWtKe
	 GSz0t5embdR/T8HFxjIUULsi/YB+qL3SACLR1c3FEji3gCseXSwdivf7AokG+5lF/7
	 LjPy0woOsIWBXgf/WdJJzlVT5zhYbuW8FUWIozbE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:30 +0300
Subject: [PATCH v3 01/15] media: rcar-csi2: Use the pad version of
 v4l2_get_link_freq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfaMz4EZRCJRUzt6/Lmm2n9ZZIOumQhImuap
 GC7j2CgZ6qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm32gAKCRD6PaqMvJYe
 9TjmD/934GA4LtTEpBJU7GdFaElyldmUOrbKxlBnfPvz7aWg0Ca1jZAPb5maM3YxsrxEtCpkEoa
 RN7YryajxzXtqXOL4U4Be9sJBS4uuqp4nKogBH4o8noQhpBSCUeATTT7MrpFYt0is5uQK8GQBq5
 dLT1qHoIUu8U3EyBsLXDpKbXXfN2akQ+u/y9GKf8snWTDPpzXAwEe8PvNyvIbZq3tKjT8apkfO8
 QT9Wu3hJOne4DV8Sn4OjX/5JpeXh5MbMNjAiGBBysmwumPzicDaWPp+r4/AxzoQt1Z/NUWMD65P
 UHmjsUopoxVI5vw7E6fkhvPAy5TvziyQ1TzaGAjK5jJg6ltw37XFiAvfZ/6gwlVdlCY0j8lOdoq
 0kBP/An1xdL2hjobte9Jm7OsDRxatlIm2Fk4/kbqnbjCNEQ/DFzmsqIPbgK3eA+esCgoC/XANK5
 +WrY9s8Pvvp5OuFPdVsT3bxQeg61ScONIP/sO7EnJzbM28nfMHOO3oaTQViZCxCiAA/IcYLAkYh
 jVak+p1huohbdx0TtG8UB3IXZsgH2S472zwHSVJbMTiJfAXYVCIkYZ/mWCshMG0j6AHhMvSQalo
 5csqhhkuNzUr2O7OApfYWF1lSbyFXChvhapipDv+njQ0LQA3r45WalxW50o0GXhoNh9CeYxF+wQ
 EMvT5Ef9Ip0zkJg==
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


