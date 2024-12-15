Return-Path: <linux-media+bounces-23439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FD9F24AF
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 16:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 573187A10BF
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 15:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDDD191473;
	Sun, 15 Dec 2024 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="BJ/HHXGS"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1841DDE9;
	Sun, 15 Dec 2024 15:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734277697; cv=none; b=JBGVdL/sxnivwjVf7b/lDH/vOHWyuwtxV6VOQCD2/C3W3Vp/0VnVRbShwFxgeIaBxnVwIgN8N6dXC19L7QJqFNgKievJGGzea6ZOsBebrN0b8qsjJUVCrFQJANPVxk7hDBVroHYDfaQy73UTuBPjG+2vG8moBRSBqUxm3Z3PpZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734277697; c=relaxed/simple;
	bh=sjNcIyS7gyyHC624+7ywvIykaZwDF0oSCQT3CmE5pn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJy16avhEFrA12OQJrY9xBek9fDcXyymZ428rFFlKu2RU1MfGX3tUOOwSj+SVHCht0CyVUMEVVpM5DhgoLIrRZomIEmNW1pFBNSBOPiPDhDssorjxTO74MteSCKcKABtb138Cy+qsW/TrJFqa/QFZEp59mOSsdTje9nQo6NDat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=BJ/HHXGS; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 56DCA16335E;
	Sun, 15 Dec 2024 16:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734277347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=odORpqUzDWRo7qBTJRlTcJS/r0IrdhcfWLNccLZRh4c=;
	b=BJ/HHXGS04JTTv9Qf1pIVN4HS3KXA7DktSRQtxlCZJu6RoZUh+I3x1aHmF3Yrw4M8M2Zn8
	EULRTuW+BrViB1V2Ps5XWnzPzvxtEejc2dID5MWHPoXxB7LP0khgej0iRCCWtOqEBGsl60
	0AgvmqeoJw9BUHuJKd2oq3uU9ser2cI=
From: David Heidelberg <david@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: Documentation: PHY information can be obtained from OF endpoint too
Date: Sun, 15 Dec 2024 10:41:49 -0500
Message-ID: <20241215154219.1490022-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bus-type endpoint property contains the information.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/driver-api/media/tx-rx.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git ./Documentation/driver-api/media/tx-rx.rst ./Documentation/driver-api/media/tx-rx.rst
index dd09484df1d3..6e4f253082d1 100644
--- ./Documentation/driver-api/media/tx-rx.rst
+++ ./Documentation/driver-api/media/tx-rx.rst
@@ -79,14 +79,15 @@ where
    * - link_freq
      - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
    * - nr_of_lanes
-     - Number of data lanes used on the CSI-2 link. This can
-       be obtained from the OF endpoint configuration.
+     - Number of data lanes used on the CSI-2 link.
    * - 2
      - Data is transferred on both rising and falling edge of the signal.
    * - bits_per_sample
      - Number of bits per sample.
    * - k
-     - 16 for D-PHY and 7 for C-PHY
+     - 16 for D-PHY and 7 for C-PHY.
+
+Information on whether D-PHY or C-PHY is used, and the value of ``nr_of_lanes``, can be obtained from the OF endpoint configuration.
 
 .. note::
 
-- 
2.45.2


