Return-Path: <linux-media+bounces-36750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB21AF84C0
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 02:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8A24A7DF2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A736C28DB3;
	Fri,  4 Jul 2025 00:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QBxTFOsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5B76D17;
	Fri,  4 Jul 2025 00:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588332; cv=none; b=DGc9ZAwqzhseX71UeNatn4bd+WrbaGNw58VXuHSX3+/MMG+IwidSomW62wei1PrJRWhDMKfNBa/MjP0rRmx9cDfYehangmTmZ7NMWcfwQhaA6UA677EMxrHxYPCzhn5iBh96Fgh+GY80bCkv+zOcv38jmIe8Vg3YbkcrMqKZehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588332; c=relaxed/simple;
	bh=c+/Sy/qzgQe2oq1g9MGqbcr9SdFKx91JTaIB6p3/Bzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPjSLkuJixhj8bVJrVFJpR8YrznsOnZ77dl80HLRkoTW9rlMcJAyor5PGqqX8Iz97CpWsvr6UYxD+0Q6juGLuN/NNMx+Kc49P23j9vLjDavgQfqhK0KuslhYQCpIXogBjAjwqsggEo3BFdapN76cMIqPUjdEKDCLtZhA/9xCp0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QBxTFOsQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D7C66E45;
	Fri,  4 Jul 2025 02:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751588303;
	bh=c+/Sy/qzgQe2oq1g9MGqbcr9SdFKx91JTaIB6p3/Bzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QBxTFOsQC5lHiXoyVXXIZ9QCdk3DIyXuGUXT2ES08sfTZ1snUzAcI+/pAWBdkHEgA
	 zPj2IxBdktuCYElSUw6QC8ZA3dokd+pLrgCdE26HYUlDjw5G9fJeWi6UDg/7PEAqGR
	 mnpYrtgYKKdUvaOc+MsNIi+YEJfB/JNqSeb2o3ss=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 5/8] media: renesas: vsp1: Fix crop width and height clamping on RPF
Date: Fri,  4 Jul 2025 03:18:09 +0300
Message-ID: <20250704001812.30064-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp1 driver doesn't enforce a minimum value on the RPF crop rectangle
width and height. Empty rectangles are accepted, leading to incorrect
hardware behaviour. Fix it by adding minimum width and height
constraints to the value clamping.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index ffc1b3ab54e2..ccc7608f538d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -261,9 +261,9 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 
 	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
 	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
-	sel->r.width = min_t(unsigned int, sel->r.width,
+	sel->r.width = clamp(sel->r.width, min_width,
 			     format->width - sel->r.left);
-	sel->r.height = min_t(unsigned int, sel->r.height,
+	sel->r.height = clamp(sel->r.height, min_height,
 			      format->height - sel->r.top);
 
 	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
-- 
Regards,

Laurent Pinchart


