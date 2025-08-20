Return-Path: <linux-media+bounces-40406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6916B2DD0F
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7475174019
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC4D31985A;
	Wed, 20 Aug 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QMhgQCTn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3B306D49
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755694530; cv=none; b=KTG6b+tzUYPLqYbkKqK3FoyBKlNk3ze97zSx7aGyTRnSi18tIqDS+5smURpFVsUhtJzLhfiTNrOJfNTY3K2Y08zE2FkTkuLu80afrbLosqBKfKg6KXkzaFgaYQRk3Sx91yLupaiAgQHGvpFrXQjWUvdyDpBt0u4iVUqOBGdVkS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755694530; c=relaxed/simple;
	bh=lL8x/9KDpVicQ/pWxB+BmbZOpVSGoD7P8hoG3VKVMYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZDQqDBTGTvU012woJGzA+OB2vWmEk2MICXVI+nEhzH05+zNUsFM76DZuxzZbbk0e3EA6M/avlttV0eAjb3s9RG59YAgC5l6YMrGG0w8f+G1+rO19740F3SN13BeaRvUbDnyBLSPj56ZJg6ZUCIbQ8sq0DLBxskWfKOtM5V1jO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QMhgQCTn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755694528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dm1NRLchXLDSQBjMe4pkfY+BF3IXkVG44fzPD1wqdVQ=;
	b=QMhgQCTnK3Fgr9dKcCrrk/iASPHJq+I8A0Gyf+rI8oOWBKbHRUQFRPp+cpc5MmFeoKNGnc
	8pFqOddGGhlPaW2FjDBDH/MwiMhJYqgD/m0KCjEpKLrUKonvD07YxziDvwk6+uk/+iSqqp
	mYFaN/DuQLOHJfWwJdApoRbn28HDE8M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-SzdwF1EAPnCny74lnWenmA-1; Wed,
 20 Aug 2025 08:55:24 -0400
X-MC-Unique: SzdwF1EAPnCny74lnWenmA-1
X-Mimecast-MFC-AGG-ID: SzdwF1EAPnCny74lnWenmA_1755694522
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 767321800370;
	Wed, 20 Aug 2025 12:55:22 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A84A219560B0;
	Wed, 20 Aug 2025 12:55:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-spdx@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: mxl5005s: Replace GPLv2 boilerplate text with SPDX
Date: Wed, 20 Aug 2025 14:55:16 +0200
Message-ID: <20250820125516.494408-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Thomas Huth <thuth@redhat.com>

The FSF does not reside in "675 Mass Ave" anymore, so we should
not ask the people to write to that address in case they need a
copy of the GPL.

Anyway, all other mxl* files in this directory (including the
corresponding header mxl5005s.h) already had their boilerplate
text replaced by a proper SPDX tag in the earlier commits, so
let's do the same in the remaining mxl5005s.c file now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 drivers/media/tuners/mxl5005s.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
index 0e811c5eae6cb..eeacebf0a8752 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
     MaxLinear MXL5005S VSB/QAM/DVBT tuner driver
 
@@ -20,21 +21,6 @@
     Copyright (C) 2008 Jan Hoogenraad
       Functions:
 	mxl5005s_SetRfFreqHz()
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
-    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-
 */
 
 /*
-- 
2.50.1


