Return-Path: <linux-media+bounces-17325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B729683BD
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EE1DB2440B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 09:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C051D4169;
	Mon,  2 Sep 2024 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7Iv2Gwz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1334187332
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270772; cv=none; b=P3FQjSDqccTvevv3H/gr4l8ML+Gc8c3J1XbVqOgsjqwD089oFGr/SeBDiVD2WpumlLULwuMNfkK5Q3Hy+DyQTjttkWoDtlblx7cdz+cSgBY2sA+GgrrIHCdlHekFS958B8jzemwUy53sjy6MiG5cIaMJoPVoypZeCn67FU/gyVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270772; c=relaxed/simple;
	bh=hZz8I77YivhhpEFBXZ/amfv+bBmHpUfUltI2hYcuBsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHB3jSfrEE0TcI5srXymFep+cGCeIysw7R57BdcgL0gm7aIUZm3ABrb5zYQBzbEO3MSzMo09zhx//WIFG3yj4l91lmQYjeLMkk9MvuBHxPDozLvt/KGHHlSOiLZd0TWjSBStSxGBhi7wRZ2hKBORE58XHML9UImWslNWlLLFfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7Iv2Gwz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725270769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtC4KYb3iyXHJoZxcnXTu2Dp+yTI4OYJuVKL8UUquA0=;
	b=Z7Iv2GwzUN5MiLkGi3LGtLDbgAk6V5I0p2UK1BUDWnOlLI3MHZo4QpGlwuwxBG0YB0xksg
	RKnnMdhECn3T7nr9rqUqG+CWhfH8NTOdQ3m6oREEm49LzzOZnjbzgF+pjSj9kZM5pvq4qU
	wl5wPLfFWZuswC8Q6xCw/n/enQgrKTE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-yDCJ8D_cNkqE5AabShy2wg-1; Mon,
 02 Sep 2024 05:52:44 -0400
X-MC-Unique: yDCJ8D_cNkqE5AabShy2wg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDC1B1936188;
	Mon,  2 Sep 2024 09:52:42 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.30])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD03219560A3;
	Mon,  2 Sep 2024 09:52:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/3] media: atomisp: Drop dev_dbg() calls from hmm_[alloc|free]()
Date: Mon,  2 Sep 2024 11:52:28 +0200
Message-ID: <20240902095229.59059-2-hdegoede@redhat.com>
In-Reply-To: <20240902095229.59059-1-hdegoede@redhat.com>
References: <20240902095229.59059-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Debug logging every alloc + free just polutes the debug logs without
adding much value, remove the alloc + free dev_dbg() calls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 3e2899ad8517..e8c5d728fd55 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -204,9 +204,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		goto bind_err;
 	}
 
-	dev_dbg(atomisp_dev, "pages: 0x%08x (%zu bytes), type: %d, vmalloc %p\n",
-		bo->start, bytes, type, vmalloc_noprof);
-
 	return bo->start;
 
 bind_err:
@@ -231,8 +228,6 @@ void hmm_free(ia_css_ptr virt)
 {
 	struct hmm_buffer_object *bo;
 
-	dev_dbg(atomisp_dev, "%s: free 0x%08x\n", __func__, virt);
-
 	if (WARN_ON(virt == mmgr_EXCEPTION))
 		return;
 
-- 
2.46.0


