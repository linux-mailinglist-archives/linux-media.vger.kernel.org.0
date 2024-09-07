Return-Path: <linux-media+bounces-17872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374A9701E4
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 13:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D9128486A
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 11:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E51155CB3;
	Sat,  7 Sep 2024 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBgDZbWL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC926208D7
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725707830; cv=none; b=LfifIsBxH3Ucv0TgeEza9j6Msygis0p/nh3bZsDRNaPdj1ZfCFbmFBQRR2VsjFuhfQ8CsYWejarqIZoEH//P70oSBB26QcyUre09qCKd8IogbBQmRsrJ2XNDzV++279ycWLtYUQ8x1ByOg7de+lHFRBrn/BJ3MaQekgprjX1Qy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725707830; c=relaxed/simple;
	bh=jsDLd/y3bPmdHYBWWLTb3pUm/Nm9Vnp3KztmmZBpl1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTotR3+A8Tg8fphIBG76t62bPINC6/Aqjm4jZ2rGRSTBaURUgU6nXnRaR9/WTdl8CWQEUbzKpJjI1Tus93zSbsQm59QFmmNRrQblu800fJ14osboHYlE6mq6QaSvXswx5ngR1JOXgwyZVoML1DItIvifhbPqiVOpavY2eck0Pns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBgDZbWL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725707827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F+/3l4ZOp+/26sc73GXRleP7DOmLQcWfOfSN9trgwVs=;
	b=PBgDZbWLjTpC7A2NV5lZXxBS9epxvrEPiSE9R7ZYYV2izAm/5rvF7VCCKaJqtfZLM+PwzG
	h2gLxOnxqLeKeAuuMuOzJe86+tliF31ZGuI2h2StvNbc66ee8HA1geW6NJ8+udDbiWov3J
	soEOei/9tSn5uSC1l2J0NA0ZHpcTa78=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-i3AGA1GBOe6mO_OqWK_kWg-1; Sat,
 07 Sep 2024 07:17:06 -0400
X-MC-Unique: i3AGA1GBOe6mO_OqWK_kWg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD588195608A;
	Sat,  7 Sep 2024 11:17:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.32])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 542F41956048;
	Sat,  7 Sep 2024 11:17:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Fix eed1_8 code assigning signed values to an unsigned variable
Date: Sat,  7 Sep 2024 13:17:01 +0200
Message-ID: <20240907111701.8493-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

ia_css_eed1_8_vmem_encode() is assigning values with a range of -8192 -
8191 to e_dew_enh_y and e_dew_enh_a both of which are of the VMEM_ARRAY
type which maps to u16.

This causes the following smatch warnings:

drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c: drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:177 ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_y[0][base + j]'
drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c: drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:182 ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_a[0][base + j]'

Convert the e_dew_enh_y and e_dew_enh_a arrays to a new SVMEM_ARRAY type
which maps to s16 to fix this.

Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Closes: https://lore.kernel.org/linux-media/20240906081542.5cb0c142@foz.lan/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/vmem_local.h   | 4 +++-
 .../atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h      | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
index d0ba59cedc92..6f0a8fe868bd 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
@@ -20,8 +20,10 @@
 #include "vmem_global.h"
 
 typedef u16 t_vmem_elem;
+typedef s16 t_svmem_elem;
 
-#define VMEM_ARRAY(x, s)    t_vmem_elem x[s / ISP_NWAY][ISP_NWAY]
+#define VMEM_ARRAY(x, s)	t_vmem_elem x[(s) / ISP_NWAY][ISP_NWAY]
+#define SVMEM_ARRAY(x, s)	t_svmem_elem x[(s) / ISP_NWAY][ISP_NWAY]
 
 void isp_vmem_load(
     const isp_ID_t		ID,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
index 6fb3b38f49e7..b9eeeb592ec8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
@@ -94,8 +94,8 @@
 
 struct eed1_8_vmem_params {
 	VMEM_ARRAY(e_dew_enh_x, ISP_VEC_NELEMS);
-	VMEM_ARRAY(e_dew_enh_y, ISP_VEC_NELEMS);
-	VMEM_ARRAY(e_dew_enh_a, ISP_VEC_NELEMS);
+	SVMEM_ARRAY(e_dew_enh_y, ISP_VEC_NELEMS);
+	SVMEM_ARRAY(e_dew_enh_a, ISP_VEC_NELEMS);
 	VMEM_ARRAY(e_dew_enh_f, ISP_VEC_NELEMS);
 	VMEM_ARRAY(chgrinv_x, ISP_VEC_NELEMS);
 	VMEM_ARRAY(chgrinv_a, ISP_VEC_NELEMS);
-- 
2.46.0


