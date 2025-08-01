Return-Path: <linux-media+bounces-38722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2EB1820F
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 15:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD571C270C2
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 13:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442D5247281;
	Fri,  1 Aug 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cktUmeaX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152152E413
	for <linux-media@vger.kernel.org>; Fri,  1 Aug 2025 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754053279; cv=none; b=eXQ9deBuderEpGqXJyUknaxdnQCrQJsfi4xEA+vKEW4gFAO4mN7XjHaqXyFE++auGhio3iOyeGdOiH0QAqBTSPe4FZ/IOkYbPY4ifX782w4VnVp76av/hFTR9qfa3ObXj1mYZYOsOsMzbDrb4kX5B3aUnQmepHrRlhAEJBYkatc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754053279; c=relaxed/simple;
	bh=Ko/PmmGly9flC1nHS11rvUo03vm7sUtlC62ShImOumE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hiTxednicOCmXkznAPt5Hm6LmJ5z+cVPY7zH4bLpZt6RoNEPEr5U2k/iiQ4jNqEaIKN53wyd8HVHkrf7Htx8Wz1qoOC3mH7gCGW/bnm42DJ9UPwP5Jg5/iz+5GIzBxFZchRN0nBd0f9zjhpoaFNBDBHF2sAbh70z8zdcQ1Te2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cktUmeaX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754053277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=71n7MYcfm7nEVKQH+Z8Ac57p6JXerij32gNeqUFKIgE=;
	b=cktUmeaXLOJ+0colq+4Ac0fSaTcg9XlZhbkmFl7pySjkczht5xKcnAUhdZji/FhwX9r0CW
	0omAC2YUTahx67gRFLVQPx40153VtNyUw+64UlsDGTR/EFJHRVS8EP0U+VXQJRWwOr9llA
	MRMbGqcTtOxbVPxMPduueanUxAp8H94=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-282-M8K5otiNNdOgkpf-Cyn7iQ-1; Fri,
 01 Aug 2025 09:01:13 -0400
X-MC-Unique: M8K5otiNNdOgkpf-Cyn7iQ-1
X-Mimecast-MFC-AGG-ID: M8K5otiNNdOgkpf-Cyn7iQ_1754053272
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 063571955EA5;
	Fri,  1 Aug 2025 13:01:12 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 089A818003FC;
	Fri,  1 Aug 2025 13:01:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-spdx@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] drivers/media/pci/ivtv: Replace GPLv2 boilerplate text with SPDX
Date: Fri,  1 Aug 2025 15:01:07 +0200
Message-ID: <20250801130107.533196-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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


