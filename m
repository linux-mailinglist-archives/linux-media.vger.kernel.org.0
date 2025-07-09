Return-Path: <linux-media+bounces-37210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA41AFECDA
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 16:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20640644545
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 14:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B632E7F13;
	Wed,  9 Jul 2025 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuWQCA5T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758F2E62C2;
	Wed,  9 Jul 2025 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752073038; cv=none; b=mHH6TXKLJXA/TtfL7h5Iq8kdFAjnYMFAj8n4q76NegYvrHuVZMW3fzONZtJUoMDrnvDiDD1wWeWQ2ntnVdwSzTCHp2qBpJz7JoMyeABjyUsGOjGFD+VK0ujia0bEnVC7mVAMIGrgfmGNKI/JiwFxE6OpPl921pBo1pSX95ErMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752073038; c=relaxed/simple;
	bh=spBVLzp4goF65+k84GXkCH1Ow6kEAqHCrAHfgZzrE8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b3ASYYayaN2BZBKsw2QIw1q+M3Uo312+4/pHwyk+68WWWSabiRhEgR3tLNonqX/2I5dEJ9BReav5N2hK6VpFx4ThlXLgr99dalIKFg7j9Pss9wZImS+AbDDhPwqnAMURvS8IVEH3WG+5jvOyBcgOxxLK4lkN7BF5ZoHY5VlAXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuWQCA5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784D3C4CEEF;
	Wed,  9 Jul 2025 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752073034;
	bh=spBVLzp4goF65+k84GXkCH1Ow6kEAqHCrAHfgZzrE8o=;
	h=From:To:Cc:Subject:Date:From;
	b=MuWQCA5Te0PfHAyy27RJ/ceRYg0R4G0YouKDSMr6lmkjpLhn0a1TtoQ/WvEARsYLt
	 CSFlxOVDL4MGMX7bOh/joTrmMN28RDOMwbukprXD+IqvcqGzy07YcRmAS7ZSJtxIMj
	 j/RkHK6qbs128by3gZiTMgd1JuMLj5kLKm+muV5dtMQ5s7uqEVOqbFDJLC4pKCwPjj
	 jEBfBsBszRAH1ozJYXH6kDkw0H/Utf1sDbZp5e8v2Bv9dfMjfFUs2F3POIjdlBmHVN
	 JFwW2kCvQquPCfjsfXVC2bDvsjdEVcNhbr6btqOOU6tsR+atz4CtEqu2+u9eEAw+rt
	 4sneTPaT9AGUg==
From: Arnd Bergmann <arnd@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging/ipu7: avoid division by 64-bit value
Date: Wed,  9 Jul 2025 16:56:56 +0200
Message-Id: <20250709145710.102669-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On 32-bit targets, this causes a link failure:

x86_64-linux-ld: drivers/staging/media/ipu7/ipu7-isys-csi-phy.o: in function `ipu7_isys_phy_config':
ipu7-isys-csi-phy.c:(.text+0x1509): undefined reference to `__udivdi3'

Note that this does not divide a 64-bit number by a 32-bit one as usual,
but the other way round, which is something that the compiler should
really be able to figure out but does not (as of gcc-15).

A few lines higher, a similar division is done using the incorrect div_u64()
that truncates the 64-bit divisor to 32 bits.

Change both to use the safe but slow div64_u64() helper.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 4407750c7f40..b8c5db7ae300 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -734,6 +734,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 	u16 reg;
 	u16 val;
 	u32 i;
+	u64 r64;
 	u32 r;
 
 	if (is_ipu7p5(isys->adev->isp->hw_ver))
@@ -806,8 +807,8 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
 	}
 
-	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
-	if (r != 0)
+	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
+	if (r64 != 0)
 		deass_thresh++;
 
 	reg = CORE_DIG_RW_TRIO0_2;
@@ -815,8 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
 				   deass_thresh, 0, 7);
 
-	delay_thresh =
-		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
+	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;
 
 	if (delay_thresh < 1)
 		delay_thresh = 1;
-- 
2.39.5


