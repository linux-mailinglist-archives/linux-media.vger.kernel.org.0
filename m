Return-Path: <linux-media+bounces-3128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2809820B0C
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5719F1F21494
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D179D4;
	Sun, 31 Dec 2023 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtYAiR5/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462498486
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPGiWUadXxq4FZpK21b+4azGiGmvdobZBxIqZVv1gIg=;
	b=KtYAiR5/Ds6k24pWW3Hn2GS2pAMdbuXyWgxkVv4+2O32TClre8FHhyGmZ6uqndbt2OH5vH
	EivYCdL8wiZHTgKBw5s4o3qdXIN/E3lJwcPCzcsZOb/2mtlfLD3LzDypx9mbr4l+qRSxH2
	GnBCY5gwFAKubYXJQLCQw5SUAUdrSoQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-Iny2euLsMz2jhF4J2DuWTw-1; Sun, 31 Dec 2023 05:31:34 -0500
X-MC-Unique: Iny2euLsMz2jhF4J2DuWTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCCD832D1A;
	Sun, 31 Dec 2023 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9367492BC6;
	Sun, 31 Dec 2023 10:31:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/15] media: atomisp: Update TODO
Date: Sun, 31 Dec 2023 11:30:57 +0100
Message-ID: <20231231103057.35837-16-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Remove the TODO items for using the main (drivers/media/i2c) ov2680 and
ov5693 drivers and removing the atomisp specific ones, this has been done.

Remove the TODO item for gracefully handling missing firmware the
"media: atomisp: Bind and do power-management without firmware" changes
have fixed this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/TODO | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index d99cc898cd99..bfef99997a1d 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -29,16 +29,6 @@ TODO
 
 1. Items which MUST be fixed before the driver can be moved out of staging:
 
-* The atomisp ov2680 and ov5693 sensor drivers bind to the same hw-ids as
-  the standard ov2680 and ov5693 drivers under drivers/media/i2c, which
-  conflicts. Drop the atomisp private ov2680 and ov5693 drivers:
-  * Port various ov2680 improvements from atomisp_ov2680.c to regular ov2680.c
-    and switch to regular ov2680 driver
-  * Make atomisp work with the regular ov5693 driver and drop atomisp_ov5693
-
-* Fix atomisp causing the whole machine to hang in its probe() error-exit
-  path taken in the firmware missing case
-
 * Remove/disable private IOCTLs
 
 * Remove/disable custom v4l2-ctrls
-- 
2.43.0


