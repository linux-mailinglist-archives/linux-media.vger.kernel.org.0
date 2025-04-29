Return-Path: <linux-media+bounces-31349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540AAA3C33
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 01:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA303B55B7
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 23:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9B32DCB42;
	Tue, 29 Apr 2025 23:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fpH6TzHq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB62BE0E7;
	Tue, 29 Apr 2025 23:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969363; cv=none; b=Nk4wZTKacT+Yjk46P3j1uMtoBy8XwRgVUVNtSSeSE0xHnE0QUCyZCN1C+na96XGQ4KsMwcMn2OlX4H9TrN7+bwq4VaDsmPg/JaX6Fg1gdSZlLvfQ1BAzLNP9DbdqMkvxgr97sbFAFIW0q4Z80EkeJ+b3mmSa5j8TT2cz18pLSdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969363; c=relaxed/simple;
	bh=SJuUTyRYOsmV+4BOdS6vSBVWQOZghh/+2abrSbuis9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCEdei6OjAJZyeJppLDnXh8714BIka7DAoLlJAA866e+y4GNLzNxf9/99Og8TReKRwknCpHic/BpQZc9asOZDxeJxxHWDjpf1cCWraZ3DTrwE8wTXpSnZH7BcLrlkkYQWoClKkwuPwkP0heOlAk7RnunCoNV+7/aqtofcDn0cNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fpH6TzHq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32D6667;
	Wed, 30 Apr 2025 01:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745969351;
	bh=SJuUTyRYOsmV+4BOdS6vSBVWQOZghh/+2abrSbuis9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpH6TzHqOPzkAiNa+zVZZG+JYlwBsF+yxOUjYFQu8XW9wPkLiwANjXNrywroK1pFK
	 UmpqXrShDR/TeT8sIWzFqttRgiwDWCVEv2ZS4cKzzYp3B0k6hpcWvmitofZ5yS1Uld
	 ricxvnUBmexITkUGDrpHyo80xsaknDBfLmGcCe4Y=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 4/9] media: renesas: vsp1: Fix media bus code setup on RWPF source pad
Date: Wed, 30 Apr 2025 02:28:59 +0300
Message-ID: <20250429232904.26413-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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


