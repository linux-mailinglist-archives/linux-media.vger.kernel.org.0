Return-Path: <linux-media+bounces-40635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6491B2FF59
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FBB41D006A6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D266322C98;
	Thu, 21 Aug 2025 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OzY5iibV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B22FB605;
	Thu, 21 Aug 2025 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790990; cv=none; b=mgSwcKm4SaOr/KQCuvwe1YSiO2anQhPwsPgLMqd8dzbcCurQ6lIdnnKebEmgSWTlr4LNOYLxG28JLNtnDxxG95J3BtLA1IQp5wQGEGOmWvBLtGnSGceXVj7x67PrUMANOhhVBXdQsievRj+tIZtinHJQti6J/TC25uf32MOcFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790990; c=relaxed/simple;
	bh=dqI9ccZ+sO54brP3l8X9fP/TrCFzKHG50zqhrFuVAA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iaXPvn3H3GQBZVzewXRbJRE1ToxP/qHu2yMK+sTsCZf6zTDJsrvPSKt6XiWtJIwuGC3/AS6sjncTvHwP7iE13pDG7pecW8PdMR877r/SmzHBCqVvvtGy8RU6W3TeWCmgQcXMV99/ikj7rdJhA3bBAbesDiwH3gv4WvAXWamOaz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OzY5iibV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B1E4C605;
	Thu, 21 Aug 2025 17:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755790925;
	bh=dqI9ccZ+sO54brP3l8X9fP/TrCFzKHG50zqhrFuVAA8=;
	h=From:To:Cc:Subject:Date:From;
	b=OzY5iibVW2NbhXDFYXy6ALjLi+j4ndM+yLieRQveYXm5k1ftjlgStLa5I8lATgpM2
	 dob0nTnRdSIr9nDK/1NoVx7UESphlQao0lyPH9ZpS2CLqNZSQU9qNNJIj5tgbYJh/g
	 xKUZhjpeqHo5HIA0etonAMfwODsHoug1AB+4nNYE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	stable@vger.kernel.org
Subject: [PATCH] media: vsp1: Export missing vsp1_isp_free_buffer symbol
Date: Thu, 21 Aug 2025 18:42:41 +0300
Message-ID: <20250821154241.24348-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp1_isp_free_buffer() function implemented by the vsp1 driver is
part of the API exposed to the rcar-isp driver. All other symbols except
that one are properly exported. Fix it.

Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
index a754b92232bd..1673479be0ff 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -286,6 +286,7 @@ void vsp1_isp_free_buffer(struct device *dev,
 	dma_free_coherent(bus_master, buffer_desc->size, buffer_desc->cpu_addr,
 			  buffer_desc->dma_addr);
 }
+EXPORT_SYMBOL_GPL(vsp1_isp_free_buffer);
 
 /**
  * vsp1_isp_start_streaming - Start processing VSPX jobs
-- 
Regards,

Laurent Pinchart


