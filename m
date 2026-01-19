Return-Path: <linux-media+bounces-51031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 317CFD3A478
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397D13067653
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89972367B5;
	Mon, 19 Jan 2026 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RId2wrW/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988DC2737E0;
	Mon, 19 Jan 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817299; cv=none; b=rfHNGqQuC43O3hnA4oGd/4SoKuSC7a5NwffnUxKlgxnkBKdlxv5oSbNQ8mWlQr52CWyeUzJGuP58I0q3tFTO88riu4Rn/XzFmIytdfWrYMTSzlvj8iakpf1LieCCCnAtPGJfphedaJyFDeNQzsvTRpTgPhyX6UFaajp1dZiFmlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817299; c=relaxed/simple;
	bh=K4W/oFQVL26lt9eixtgIwCYKDitc7zgK6f6KUFP+tSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3f9jPIc9azv7NmDXbKHfkETQglXKM1DQXv+QNeL3ku7vVbXGIf96GSEEDuNGVPboQCStyB1fPyK0XmlYISiG3oQ3i6ACv7RBOS7M6cFgGvlNqe9QHZFwD8TQxOKErThatPEEFYRDFlePsA4vi46kQ3kEkGfRGxM3eKOlvuyZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RId2wrW/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A4112D9;
	Mon, 19 Jan 2026 11:07:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768817258;
	bh=K4W/oFQVL26lt9eixtgIwCYKDitc7zgK6f6KUFP+tSE=;
	h=From:To:Cc:Subject:Date:From;
	b=RId2wrW/U6QrdljAWoCF5c8MW95Z8DV8XOG2naU1N5xjB5uPZTbaaKka+P2aSQFE+
	 dxD0j8+V5VIX7iJJYoxa5c0vILFjjzV6jFa6h/6Fg/39617/GgmG29PjbkSZDeciA1
	 E+dZPgOH83eGMs+yYANCL+F05cAa4znll2Ol1mX4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH for v6.19-rc6] media: mali-c55: Fix wrong comment of ISP block types
Date: Mon, 19 Jan 2026 11:08:00 +0100
Message-ID: <20260119100801.865809-1-jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some bad copy&paste happened in the description of the ISP block types
and AWB_CONFIG got mixed up with SHADING_CONFIG.

Fix it by assigning to each block the correct type.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Do we still have time for v6.19 or is this too late ?
Can I help fast-tracking this somehow ? Nothing critical, but it would be nice
if this lands in the same release as the driver it fixes.
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index be0e909bcf29..c03a6120ddbf 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -43,9 +43,9 @@
  * @digital_gain:	For header->type == MALI_C55_PARAM_BLOCK_DIGITAL_GAIN
  * @awb_gains:		For header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS and
  *			header->type = MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP
- * @awb_config:		For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
- * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
- * @shading_selection:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
+ * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
+ * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
+ * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
  * @data:		Allows easy initialisation of a union variable with a
  *			pointer into a __u8 array.
  */
--
2.52.0


