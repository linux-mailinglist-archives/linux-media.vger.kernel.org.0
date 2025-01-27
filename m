Return-Path: <linux-media+bounces-25313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF878A1DA45
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 17:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C1A7167B40
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 16:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6FB155C87;
	Mon, 27 Jan 2025 16:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9213BADF;
	Mon, 27 Jan 2025 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737994209; cv=none; b=isbzkxi+IjLvBUMhDacqIEraNidxmSEMt18Pj9RHriUmcy+ClUZMCAMZVsFxSXY2pFICvV4jjMfbYvWYUgLoeDA3EJWY6mdzRYw6By0FCvZiivkJRKhVEcveeniKvQe3JxOCYeqYBgRH5YRxY5woo32SKMk/T1+USoQkW2B7xi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737994209; c=relaxed/simple;
	bh=u0KL/ETHFUIzhDJitPabFgS8aFvgM4oYOJnlXpy1u2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEnL2PuFT3p1xdyfQMBvGA8cskKPtLZaqMtSxLPczl07V2SfLDb7iFs8Y1hPNr8pB/pjzEcjjDOl+Rmrc1+QXMvobfz+0QTeFJDd1VOt5DtPqnhex2V7OxEdb9essVOn2lgRVcak9cflEZ1847Wewmc7+XaOVXMegaHscYLSObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 35B4753E74;
	Mon, 27 Jan 2025 17:00:03 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 2/2] media: admin-guide: add mgb4 GMSL modules variants description
Date: Mon, 27 Jan 2025 16:59:57 +0100
Message-ID: <20250127155957.5254-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250127155957.5254-1-tumic@gpxsee.org>
References: <20250127155957.5254-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Document the (new) mgb4 GMSL modules variants.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 Documentation/admin-guide/media/mgb4.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
index b9da127c074d..f69d331e3cb1 100644
--- a/Documentation/admin-guide/media/mgb4.rst
+++ b/Documentation/admin-guide/media/mgb4.rst
@@ -22,7 +22,9 @@ Global (PCI card) parameters
 
     | 0 - No module present
     | 1 - FPDL3
-    | 2 - GMSL
+    | 2 - GMSL (one serializer, two daisy chained deserializers)
+    | 3 - GMSL (one serializer, two deserializers)
+    | 4 - GMSL (two deserializers with two daisy chain outputs)
 
 **module_version** (R):
     Module version number. Zero in case of a missing module.
-- 
2.48.0


