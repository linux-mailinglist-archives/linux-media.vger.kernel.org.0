Return-Path: <linux-media+bounces-29706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D72A819EF
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 02:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4E001906302
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50516F073;
	Wed,  9 Apr 2025 00:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UUclWd4x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FBC73451;
	Wed,  9 Apr 2025 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159131; cv=none; b=UmUZABE0s0q+djCSWXK+Y/RvyrZQM8ElOVbfEEcg5G1/5JviHnbwVnh4vDXXB2gJeE++X3tYdW3Jjt2AXkgfNlGF+2fRxhTDTF1XUbu57oqG2e0sRhEwi9qyJ0U1jGombFqQVccbOtXYm5uYUdR/A5OXJ1CFZVFKghCORKN4us4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159131; c=relaxed/simple;
	bh=WDsbe6gAxPto9qi3a8rTGyS4U8X1ENeX8pWBEDMU5iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfRNAQ/Gk5Lk+KAVEOJiiUN24pirrMg/6bezO/BKCCTENBqYN6qMpgFcU7DWhDkhp4xFh0zTwUn0ob7vfnKXEr6i6Qh+jYH+VkBa5nrZRRIo5KwtiTDqyOlmzB5opAxi7iRjG3ALqm6fVCDs2xqsuJIrVU4uCUHMFY/ulKCZaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UUclWd4x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9DD482E;
	Wed,  9 Apr 2025 02:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159007;
	bh=WDsbe6gAxPto9qi3a8rTGyS4U8X1ENeX8pWBEDMU5iw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UUclWd4xKJGV6gDZT877nCe6KeIJ/+6GJTfRyGVE1jOoMgf44TOPmmuEvVFJlAT72
	 wpjoNCL4xyHjLRZertTjDFwga1r6JRMKW+47wjUxYcatuI04nVNoVfRr5BQKezVrZB
	 rNh6UdpxXftVCsCy97gmqrOo4Rb42DqmjcARJ85w=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 4/6] media: renesas: vsp1: Fix media bus code setup on RWPF source pad
Date: Wed,  9 Apr 2025 03:38:13 +0300
Message-ID: <20250409003815.10253-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RWPF source pad media bus code can only be different from the sink
pad code when enabling color space conversion, which can only convert
between RGB and YUV. If the sink pad code is HSV, no conversion is
possible. Fix the pad set format handler to reflect this hardware
limitation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9d38203e73d0..1b4bac7b7cfa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -76,11 +76,20 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == RWPF_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *sink_format =
+			v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
+
 		/*
 		 * The RWPF performs format conversion but can't scale, only the
-		 * format code can be changed on the source pad.
+		 * format code can be changed on the source pad when converting
+		 * between RGB and YUV.
 		 */
-		format->code = fmt->format.code;
+		if (sink_format->code != MEDIA_BUS_FMT_AHSV8888_1X32 &&
+		    fmt->format.code != MEDIA_BUS_FMT_AHSV8888_1X32)
+			format->code = fmt->format.code;
+		else
+			format->code = sink_format->code;
+
 		fmt->format = *format;
 		goto done;
 	}
-- 
Regards,

Laurent Pinchart


