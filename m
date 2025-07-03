Return-Path: <linux-media+bounces-36732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519DAF838F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D40546060
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5262C08BE;
	Thu,  3 Jul 2025 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fua19bRm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF02BF013;
	Thu,  3 Jul 2025 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582353; cv=none; b=Zl+1lsqohIvw8WqXWqO4CuzAxrlPYhRGA1/O47Ry9v26sf+JHvgxo1cvsyQEZXevVHJdRCEtuW/BaPFcYe5PDDDTmO+V4ZTNpP/zA+QYg6KlsndeB+jzXKjnjBa5vF9TkZxQvXvfmgeb+qTIs/e4602jsBlFLK3l7xIJT39a9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582353; c=relaxed/simple;
	bh=c+/Sy/qzgQe2oq1g9MGqbcr9SdFKx91JTaIB6p3/Bzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eg9dRz0shq6RYoazRcXHXjqy6Hlio68rY6VA7ZeSkLXMNLYMrYJrZqu0ttvkdQYMCMVqQsWmX/begPpDLzUxNUkAhWpfOI/g4M40sFc+q5r+RgBaGmAH7rTseAq9JTiVFGDky0enfV32/SfXsSEcyYiBNSc7ID025J3EIQDLPUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fua19bRm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9407A11DD;
	Fri,  4 Jul 2025 00:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582318;
	bh=c+/Sy/qzgQe2oq1g9MGqbcr9SdFKx91JTaIB6p3/Bzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fua19bRmuud8PCFVAcbTWdRNX85yOEdbly1YVUWOOLknJcOnSKs60NyY81q0K8Tnr
	 btDgVjhN9bWalwsvdZe7Wa8Ka80OMuapfNebbrSZ7o8fzPrCaZQlEMvRHsJsyAdE5I
	 MnWK3MCUNCr4pPSvZ1uVtTIyZFNn7Ja97OYt2I68=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 5/8] media: renesas: vsp1: Fix crop width and height clamping on RPF
Date: Fri,  4 Jul 2025 01:38:23 +0300
Message-ID: <20250703223826.10246-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
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


