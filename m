Return-Path: <linux-media+bounces-21025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB49BF8C4
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 22:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64962838A2
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 21:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FC21D9A48;
	Wed,  6 Nov 2024 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dk1aoUgf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09381D88D7
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 21:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930123; cv=none; b=m/YtccdeSzpyr2qC4ZluDKc5MEReL1PgGzf6FCZ1EEpNrNFO4UoLJhZ/sqEjQVxuHf7PFZVnG5RME12XivI90zNIPOk3lydnmnX25BFzMm9uM50UP0+i5lQsmnRLniSW5ylYPzaSUta3sCIIzQQ4roZgRf2mqo2Ecl7Dj22ypdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930123; c=relaxed/simple;
	bh=2rAd1MnVecSU/tu628TNkkv6PsrupzayWEJPWEk6hVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9IaZU6s1shcHHtlwVuK9z+YDHa29u5Acx10QlweHSDOy7/ViPT+zJlqVF/jf0gidCdjOMAYqF7/QIuEBYoTkB/EhBUTU46AdBMrbt4qy4OSBhGUiWbYUaU3Fq92vwyuOmkJoHOHenB7W1U9tyh5wIy7d2I49VPIB9QVFAk3QRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dk1aoUgf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730930118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=binWOKCnq2uKrWUxdWuj6KlQuZL72pWuKK2ogVB/QoA=;
	b=Dk1aoUgfea0HWcbX3eAnHKxLHXh89kc/1sRx2WNd6XeKIFsDClAKYcFCrBZLHi2jsIgycR
	NUs9HHOqvSGKSR4MHE9hTMmPfOTgeMKkcpv6lGOfURMv7Bvp2credKw0dyJ9XZK9i/vsqK
	jZokB7vLznXo+neRGHhWWYFEG/kmDiU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-pIm9eDLFOI-x59ITC4gBgA-1; Wed,
 06 Nov 2024 16:55:15 -0500
X-MC-Unique: pIm9eDLFOI-x59ITC4gBgA-1
X-Mimecast-MFC-AGG-ID: pIm9eDLFOI-x59ITC4gBgA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 875EB1956096;
	Wed,  6 Nov 2024 21:55:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.71])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B91619541A5;
	Wed,  6 Nov 2024 21:55:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Avoid picking too big sensor resolution
Date: Wed,  6 Nov 2024 22:55:09 +0100
Message-ID: <20241106215509.40205-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

atomisp_try_fmt() is limiting the width of the requested resolution to 1920
before calling the sensor's try_fmt() method. But it is not limiting
the height. In case of the old mode-list based t4ka3 driver which has
a mode list of:

736x496
896x736
1936x1096
3280x2464

This results in 3280x2464 being selected when try_fmt is called
with a requested resolution of 3280x2464, which is not supported because
its width > 1920 .

Fix this by also limiting the height when in preview mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 02ccf80e6559..10462c5db36f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3784,9 +3784,14 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			return -EINVAL;
 	}
 
-	/* The preview pipeline does not support width > 1920 */
-	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW)
+	/*
+	 * The preview pipeline does not support width > 1920. Also limit height
+	 * to avoid sensor drivers still picking a too wide resolution.
+	 */
+	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
 		f->width = min_t(u32, f->width, 1920);
+		f->height = min_t(u32, f->height, 1440);
+	}
 
 	/*
 	 * atomisp_set_fmt() will set the sensor resolution to the requested
-- 
2.47.0


