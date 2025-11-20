Return-Path: <linux-media+bounces-47495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C5C74289
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5074530434
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF0C314B74;
	Thu, 20 Nov 2025 13:15:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42022B8D0;
	Thu, 20 Nov 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644547; cv=none; b=OUbrKuq47GlIN8aGPa9nQbxIgj1BcEZjK5WFCf9f24iZJewDNvmgHkEsUieR2BrMYepCl6niOV1g9FOtVFJlFwzm6LLMYh//rSWGDrhg89dtAPkXnKuixvzR/oWvYEDkKjVME1YuQza2WTg7daPrQ7D277ydJbyYtc/7SQnk3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644547; c=relaxed/simple;
	bh=rN2MIiZpEc7tvyZLRwdhaNJop8sP3ciBFaRBnYldgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lodpOhwWkW15DpT7bxrWXeyCTtmaFD5Ywvm7OMZJSdXZhRvQ35WfFj/RUkzuV2IQx2awXdNtd38XRe2vQyJ7K/N27OUUCRmQOkXc3LjklW/IiUCI+aOZP/iif96Z5ETdwxCDI0H1qg1CJ2sVJqSTfR1wYCEjee6/vzk73enBEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 69AF434381;
	Thu, 20 Nov 2025 14:08:37 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 3/3] Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modules info
Date: Thu, 20 Nov 2025 14:08:27 +0100
Message-ID: <20251120130827.1882-4-tumic@gpxsee.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120130827.1882-1-tumic@gpxsee.org>
References: <20251120130827.1882-1-tumic@gpxsee.org>
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
2.51.2


