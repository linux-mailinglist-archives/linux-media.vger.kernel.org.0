Return-Path: <linux-media+bounces-12463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A388D83C2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242722819B8
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC5812D747;
	Mon,  3 Jun 2024 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CnbmaE22"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D712C491
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420867; cv=none; b=T4unTxzKJ1oRj+jLceXwadWrJRP9JkeNP9YR3geFiW9ZRR7Ngr9LtmAm4dshx0TmLE84azbS3z+FmTI3w5JaEV9PlAW2TTgOTpnfCbRuNOHhHxM0recVjNUvTteQ01r4MSgdj73E41b+PYwTTjXGF6FEGHMCT10V4gCFdvYN/Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420867; c=relaxed/simple;
	bh=NXw9nCtkI1f8co+Ud3DCEg89rss/axt+7n5r0ur1Tp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pyqo8KoVRHnOCyvtEoSusHNzCk9qkMJJBAF3eV+rVCjGI+l21tULu0fRvruBEMUu0EkxJMpzCm8QAKi1IXrlUL3t9cedc2CaAHvoM0nK/n266alSPlErH3DUO96xuo4meIP1Efm4Pkkrvmi+m0Eirk9VdymdCCqxEIsTo535ORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CnbmaE22; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717420865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7oXGDm/SNy832yxtqns/YI95WzFQEbZ2sxWnGAEr+E8=;
	b=CnbmaE22oFvXWQZEaFa/a4aL/xnQlce4ewuzLBGriwY+ufkWWYxn7izue9fScbso81KfCJ
	9UmxrduP4gY/8HzcVcOkwC9A2DH4PW/S7B2GRuG34h1CeUnCXyh5H71h39e0BOJ1gySNx8
	+mBZEhq3PvDoUi2mjtDzIIEfjK7RlEY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-h0AFabFgNs-fzF06jkaILQ-1; Mon,
 03 Jun 2024 09:21:02 -0400
X-MC-Unique: h0AFabFgNs-fzF06jkaILQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0E0D29AA38A;
	Mon,  3 Jun 2024 13:21:01 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 520B95624;
	Mon,  3 Jun 2024 13:21:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
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
Subject: [PATCH 2/5] media: atomisp: Remove firmware_name module parameter
Date: Mon,  3 Jun 2024 15:20:54 +0200
Message-ID: <20240603132057.255917-2-hdegoede@redhat.com>
In-Reply-To: <20240603132057.255917-1-hdegoede@redhat.com>
References: <20240603132057.255917-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

There is no need for the user to be able to specify a different
name for the firmware being loaded. Most other kernel drivers do not
have this and work fine without it.

Drop this unnecessary module parameter.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 8b522baf2e66..cfdfbf96c3fe 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -66,10 +66,6 @@ module_param(dbg_func, int, 0644);
 MODULE_PARM_DESC(dbg_func,
 		 "log function switch non/printk (default:printk)");
 
-static char firmware_name[256];
-module_param_string(firmware_name, firmware_name, sizeof(firmware_name), 0);
-MODULE_PARM_DESC(firmware_name, "Firmware file name. Allows overriding the default firmware name.");
-
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
  * exports extra. If these are kept at the 10x8 that they were on, in yuv
@@ -1101,23 +1097,19 @@ atomisp_load_firmware(struct atomisp_device *isp)
 	int rc;
 	char *fw_path = NULL;
 
-	if (firmware_name[0] != '\0') {
-		fw_path = firmware_name;
-	} else {
-		if ((isp->media_dev.hw_revision  >> ATOMISP_HW_REVISION_SHIFT)
-		    == ATOMISP_HW_REVISION_ISP2401)
-			fw_path = "shisp_2401a0_v21.bin";
+	if ((isp->media_dev.hw_revision >> ATOMISP_HW_REVISION_SHIFT) ==
+	    ATOMISP_HW_REVISION_ISP2401)
+		fw_path = "shisp_2401a0_v21.bin";
 
-		if (isp->media_dev.hw_revision ==
-		    ((ATOMISP_HW_REVISION_ISP2401_LEGACY << ATOMISP_HW_REVISION_SHIFT)
-		    | ATOMISP_HW_STEPPING_A0))
-			fw_path = "shisp_2401a0_legacy_v21.bin";
+	if (isp->media_dev.hw_revision ==
+	    ((ATOMISP_HW_REVISION_ISP2401_LEGACY << ATOMISP_HW_REVISION_SHIFT) |
+	     ATOMISP_HW_STEPPING_A0))
+		fw_path = "shisp_2401a0_legacy_v21.bin";
 
-		if (isp->media_dev.hw_revision ==
-		    ((ATOMISP_HW_REVISION_ISP2400 << ATOMISP_HW_REVISION_SHIFT)
-		    | ATOMISP_HW_STEPPING_B0))
-			fw_path = "shisp_2400b0_v21.bin";
-	}
+	if (isp->media_dev.hw_revision ==
+	    ((ATOMISP_HW_REVISION_ISP2400 << ATOMISP_HW_REVISION_SHIFT) |
+	     ATOMISP_HW_STEPPING_B0))
+		fw_path = "shisp_2400b0_v21.bin";
 
 	if (!fw_path) {
 		dev_err(isp->dev, "Unsupported hw_revision 0x%x\n",
-- 
2.45.1


