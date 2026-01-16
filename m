Return-Path: <linux-media+bounces-50891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3DED3176B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 907A8300B37A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C280423C512;
	Fri, 16 Jan 2026 13:02:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0823909F;
	Fri, 16 Jan 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568565; cv=none; b=Kf4icnzzleIGVy1K8FPTM/KSSdINpErja/EhNmZyDufYmVjPNwRv21K9OTMu7ust7ldLh3gInniwkhKTtbNFWtdoNiK/W8+4zZOMCqqly3pR3iYzPwpERv4n+F4ghoszoK++XBAoU8G9B4Z2loKORTOwJkbn0JRS45HRoX07ubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568565; c=relaxed/simple;
	bh=jBXyuL0bcI2OsiSX1Kdp+SG1qpoO1B++OCIxsNmjdE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mUS52px7MmIPOh4Lg/sNSam3f0QSa0f/WRA07pENNNjTEYNh6h7euOxMNFtsTsFaXWcdRI5PLxVAA+kAjaYRWlmkmBWUxZIgKnhqKWMYWYr0A8Bi6zZe0xCJDErk/9WFC+DkZ6ryu8Oe4hMco1jBbwZopSgy6B2ZkY5qXW5/W64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id BDF087BE0A;
	Fri, 16 Jan 2026 13:56:12 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH RESEND v3 3/3] Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modules info
Date: Fri, 16 Jan 2026 13:55:55 +0100
Message-ID: <20260116125555.5287-4-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116125555.5287-1-tumic@gpxsee.org>
References: <20260116125555.5287-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add the mgb4 GMSL1 and GMSL3-coax modules info.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 Documentation/admin-guide/media/mgb4.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
index 5ac69b833a7a..0a8a56e837f7 100644
--- a/Documentation/admin-guide/media/mgb4.rst
+++ b/Documentation/admin-guide/media/mgb4.rst
@@ -31,9 +31,11 @@ Global (PCI card) parameters
 
     | 0 - No module present
     | 1 - FPDL3
-    | 2 - GMSL (one serializer, two daisy chained deserializers)
-    | 3 - GMSL (one serializer, two deserializers)
-    | 4 - GMSL (two deserializers with two daisy chain outputs)
+    | 2 - GMSL3 (one serializer, two daisy chained deserializers)
+    | 3 - GMSL3 (one serializer, two deserializers)
+    | 4 - GMSL3 (two deserializers with two daisy chain outputs)
+    | 6 - GMSL1
+    | 8 - GMSL3 coax
 
 **module_version** (R):
     Module version number. Zero in case of a missing module.
@@ -42,7 +44,8 @@ Global (PCI card) parameters
     Firmware type.
 
     | 1 - FPDL3
-    | 2 - GMSL
+    | 2 - GMSL3
+    | 3 - GMSL1
 
 **fw_version** (R):
     Firmware version number.
-- 
2.52.0


