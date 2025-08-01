Return-Path: <linux-media+bounces-38723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08712B183CA
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 16:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437FA1893A13
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 14:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE53426E6F3;
	Fri,  1 Aug 2025 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDOw6ZJh"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB44A1D
	for <linux-media@vger.kernel.org>; Fri,  1 Aug 2025 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754058562; cv=none; b=Qp5PfVWn4Q6wdxWIub/+HsC7jGjpbNtT6MUg5UDgxu7yrRFx+H1FXqRtf4n4unz/aRbhXMKVr7MtrBse8kLuDgU4WNJbRz8cyH6xQMMmyHyfx/zKrIAVeZ/yu2X58yCydyPL6PDEa6IhbZJBhh/qljSXYUdZfA31DcQWEdGsb6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754058562; c=relaxed/simple;
	bh=pzLInYE2T4FA2HuRv2+KH8MVOqyQtP2jwo7Tnyk0ge4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RFZlfmNEq75fuxVQrxKCMrevOLupWwcZrcBoe9gQtA44tP6s02maLhFaYJXnFBOJ4GgTdJy03oJFwaTtd0V50A+r1IwkiF+N9NKblcSDIg1Jl02duMxOLpnqi+hb0BrlKGpFGpKquBjueG52p6CwxDMQfpIkZWfcnUYRWSr+cbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDOw6ZJh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754058559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Po6QeoxP4AkYuTcSujxbpu8JHxcCowvdsZgxmuI0io=;
	b=VDOw6ZJhijgvHPmXznl0ai7Oa9x5BxUQ6MzM2G9Haip6STI8dxNwRKEKV6AHSxU3Bm4C3W
	FB6Eo21ullAbGRVADGQ2TamFrK+sUE+XfpigOkSX+iCxndC+MYRGwGcf8GyoshDcVVIWne
	H7HphMOY+eXgXaSscRkRbd6aoK8mSW4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-M3GFcp_RNbWnRA9D1dJ_rA-1; Fri,
 01 Aug 2025 10:29:16 -0400
X-MC-Unique: M3GFcp_RNbWnRA9D1dJ_rA-1
X-Mimecast-MFC-AGG-ID: M3GFcp_RNbWnRA9D1dJ_rA_1754058555
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30B0A180048E;
	Fri,  1 Aug 2025 14:29:15 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.137])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61D833000218;
	Fri,  1 Aug 2025 14:29:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-spdx@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2] media: pci/ivtv: Replace GPLv2 boilerplate text with SPDX
Date: Fri,  1 Aug 2025 16:29:10 +0200
Message-ID: <20250801142910.749361-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Thomas Huth <thuth@redhat.com>

The FSF does not reside in 59 Temple Place anymore, so we should
not ask the people to write to that address in case they need a
copy of the GPL.

Anyway, all other files in this directory already had their boilerplate
text replaced by a proper SPDX tag in the earlier commit 1a59d1b8e05ea
("treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 156"),
so let's do the same in the remaining files now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use the correct "media:" prefix in the subject

 drivers/media/pci/ivtv/ivtv-driver.c  | 15 +--------------
 drivers/media/pci/ivtv/ivtv-driver.h  | 15 +--------------
 drivers/media/pci/ivtv/ivtv-streams.c | 15 +--------------
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index ecc20cd89926f..65f557373879f 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
     ivtv driver initialization and card probing
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
     Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 /* Main Driver file for the ivtv project:
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index a6ffa99e16bc6..a919fcf51a38c 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -1,22 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
     ivtv driver internal defines and structures
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
     Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef IVTV_DRIVER_H
diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/ivtv-streams.c
index ac085925d3cb7..3e79e4f1d8c84 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
     init/start/stop/exit stream functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
     Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 /* License: GPL
-- 
2.50.1


