Return-Path: <linux-media+bounces-9371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0518A4E69
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73ED61F21B8C
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CC26BB51;
	Mon, 15 Apr 2024 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hx4Z7Uc7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83BA6D1A1
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182591; cv=none; b=dSYdglHSlFiE2B47yTiJ87Xoml5HLx4rPCeWkmmd9pGAf2+O0N8rrO+vwE3L18fI5eDAc2PChLr9htyUFFU55mLXt5Zrv97R6PO8gVQUl2syTVkI8xqoZCKYZulAQntPc7Cl4KEInr1QA0M4+UV/kxfDXHF2ppmj6rB+aK2+Ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182591; c=relaxed/simple;
	bh=4A12lSJA6l8U+R4GmtlhI1T51PVdJMQlR4um/eO9V9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kW14p0HHYOm5ykju4jWDjkcUIzqdGzlEvoQ+IjyY+KytXDNeQGhBjLIjvEFLg6rxDbEEfmZeJR/NSTrwdnMU1n92PkfM9siz6g8ozwDcYQHppI/o83yva8J7ufOOLSS6JUULdGCQRGq3jNElpP6axrDa0AORqCksMl/bN+vb4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hx4Z7Uc7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j4bIkIOaw3L+Fr90uYhfAwyVujSHhjyH9BvjoJY9NuA=;
	b=hx4Z7Uc7oh7aoGoaSVTITrtz/9iYTOpd1MFAWoNfIlWkHJmY+/6nH+EpLosEdViOGuI9Ph
	o+PwtXlIT4xDTaPRmwk3kN6aXEC/Ic147+0viGNfp/IM153nB1Vvdhrt1UDhTgcfCfFVDe
	TCDsO6VA9gnnEsHPWuUnat6C3s+4dmw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-RMtv7UeqP2uCRKq65icPkQ-1; Mon, 15 Apr 2024 08:03:06 -0400
X-MC-Unique: RMtv7UeqP2uCRKq65icPkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEB8B881E66;
	Mon, 15 Apr 2024 12:03:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B736EC15771;
	Mon, 15 Apr 2024 12:03:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 22/23] media: atomisp: Cleanup atomisp_isr_thread() spinlock handling
Date: Mon, 15 Apr 2024 14:02:19 +0200
Message-ID: <20240415120220.219480-23-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Refactor the code a tiny bit to avoid the need to have 2 different
paths with spin_unlock_irqrestore() in there.

While at it also remove the non helpful dev_dbg() message.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 335f142c1fc5..2c95fd6505e0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -959,18 +959,15 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 {
 	struct atomisp_device *isp = isp_ptr;
 	unsigned long flags;
-
-	dev_dbg(isp->dev, ">%s\n", __func__);
+	bool streaming;
 
 	spin_lock_irqsave(&isp->lock, flags);
-
-	if (!isp->asd.streaming) {
-		spin_unlock_irqrestore(&isp->lock, flags);
-		return IRQ_HANDLED;
-	}
-
+	streaming = isp->asd.streaming;
 	spin_unlock_irqrestore(&isp->lock, flags);
 
+	if (!streaming)
+		return IRQ_HANDLED;
+
 	/*
 	 * The standard CSS2.0 API tells the following calling sequence of
 	 * dequeue ready buffers:
-- 
2.44.0


