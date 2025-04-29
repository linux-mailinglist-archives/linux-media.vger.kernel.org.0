Return-Path: <linux-media+bounces-31343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC0CAA1C50
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 22:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FD9D7B27E5
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 20:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A59263C77;
	Tue, 29 Apr 2025 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iWPjb9jW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383F269832
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959174; cv=none; b=Kavw4gDxIsupIKBfQZENnHk781w8mjWFR1360EDePqwa+YgWhEf5fbYVdQDeeRi3eDNNMGQvZW8hvytSfrRBUI04aTqaJqKa26OY00d+Cg7Zl+OhT+bQPuwwQ7kh7Fq6i/w2nUWpG84UzKnHhM/tJc9mykHCd4HdKrj+r3bPip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959174; c=relaxed/simple;
	bh=P7H6bZoUDfDdMODt5oGqUJkfYcMDXfEJRQKY5EzhnUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrFqzbBfTnF6qX8zp0OavTJyUQFl242wLhas6JXsomDFSG1+I1jqsfbPfxEZwR3Ydr5PiPhdXTT5Xp9IjpmTgswd4dHh41bHTGxxO2g5s1y8FRuVYDWfjiby/2iw+M0mO2DxFDMCaiZWHq35HHEe7Wp4V8P3t/vxi4RFrNlpkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iWPjb9jW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21AFA6A8;
	Tue, 29 Apr 2025 22:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745959164;
	bh=P7H6bZoUDfDdMODt5oGqUJkfYcMDXfEJRQKY5EzhnUM=;
	h=From:To:Cc:Subject:Date:From;
	b=iWPjb9jW0cIQLJmeR8vUkxM1jtUAmvoOumUiW3KLXu6vuoR5We/3rk0o4HO9OPf2/
	 mvBP4uUAYK8tFEngTAlPQlYwFMagS/xgtLZmdHoR2T9XZ0Lj53tE7ASIEEZPbXamhK
	 cl0n6pPB1ynTfTtEVyPy3EeYJSbSVZH4adP4kEwg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [v4l-utils] [PATCH] v4l2-compliance: Don't perform blocking DQBUF test on MC_IO devices
Date: Tue, 29 Apr 2025 23:39:22 +0300
Message-ID: <20250429203922.23078-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Streaming on MC_IO devices can't be tested by v4l2-compliance as it
requires setting up a valid pipeline first. The blocking DQBUF test
therefore fails to start streaming on those devices. Disable it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 572973b2b755..30f2b5d17c4f 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -3119,7 +3119,7 @@ int testBlockingWait(struct node *node)
 	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
 	int type;
 
-	if (!can_stream || !node->valid_buftypes)
+	if (!can_stream || node->is_io_mc || !node->valid_buftypes)
 		return ENOTTY;
 
 	buffer_info.clear();

base-commit: dc3a7b9f5453941f951654704a558b7b70fef2d2
-- 
Regards,

Laurent Pinchart


