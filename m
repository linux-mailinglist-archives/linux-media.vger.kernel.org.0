Return-Path: <linux-media+bounces-13608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B4C90DCAC
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD6372822F9
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC7816CD31;
	Tue, 18 Jun 2024 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N9P120Jl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7316CD27;
	Tue, 18 Jun 2024 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718739726; cv=none; b=ivZkC7ohr3YrwHa68mi1iZfP9+ZWk/MIprcIaDnw0IzY6+VQQMQxpRgEv8b9XSt24p+veWiGiPnXRrmPl98I+z64AtTWGZDvPgfiw83ynHCA4qoXiXN5n1ypu4/MCAP5e7dC8OT33/Z4KMeuGpq7JruCp+lwPMPgEud16x9zzI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718739726; c=relaxed/simple;
	bh=YY23Lw7s+ZuKEwzkyuhdLZNGpe/RkyrwvbD2vOL7wCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mnZGGRTbzUcrsqhCkiDnwQ2cm3FtwhrvX11DdKuQyxWqUWPkTOxZ1jwJLf6Snz8oXd3oTZQuR1RuEobljoEO2kBgpLwNbNAmPUnRq2cffzkhGb2+8lQYbkiEoYVB1g0L8cR7KGpn9dy/t6UBTWI4EvhBJLEwZ9EMNjIdNRaMu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N9P120Jl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3209908;
	Tue, 18 Jun 2024 21:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718739705;
	bh=YY23Lw7s+ZuKEwzkyuhdLZNGpe/RkyrwvbD2vOL7wCw=;
	h=From:To:Cc:Subject:Date:From;
	b=N9P120JlMEiu60uIJOa5IboQEMxIAPPMuMQ40hBXawFvTeKbIxOEex0ehuhZGeaxt
	 JqmIHSpE7IIMeNZuRpFI9ZsHJaQafoMGN9fMMoAdewG/WAFb3A9/alsOxttqbEmifA
	 PLwDfKPk5q+XQ1pw8uOkZaJOjutRMPiGXov8wjcU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: renesas: vsp1: Print debug message to diagnose validation failure
Date: Tue, 18 Jun 2024 22:41:40 +0300
Message-ID: <20240618194140.26788-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When formats don't match between a subdev and a connected video device,
starting streaming returns an error without giving the user any
indication as to what went wrong. To help debugging pipeline
misconfigurations, add a debug message that indicates the cause of the
failure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_video.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 5a9cb0e5640e..d6f2739456bf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -78,8 +78,14 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
 
 	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
 	    video->rwpf->format.height != fmt.format.height ||
-	    video->rwpf->format.width != fmt.format.width)
+	    video->rwpf->format.width != fmt.format.width) {
+		dev_dbg(video->vsp1->dev,
+			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
+			video->rwpf->format.height, fmt.format.code,
+			fmt.format.width, fmt.format.height);
 		return -EINVAL;
+	}
 
 	return 0;
 }

base-commit: 91798162245991e26949ef62851719bb2177a9c2
-- 
Regards,

Laurent Pinchart


