Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990F248FF48
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbiAPVwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233782AbiAPVwT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZFdB7jwYQUHSXecJcxmujN77bcWVZz3CxOp+viiBVaM=;
        b=fq/NU92Z+Nh+zqNw6PBpTTdDwkoVCK3V/tkXT2aLUue2/qr22X6E0W2HA8HvbLCASNoA/5
        BO8a01hT2MKFbfL4mKTmtqh51Afqp9cYL3rQXOBmpvrFG+ICE2RGRltnFMc32Qp5T9S5Hc
        MrpvZD6AwaUpGPtDRLZDDHdVZ65Qrm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-pmX-fAClNvew1iIR29rqyw-1; Sun, 16 Jan 2022 16:52:15 -0500
X-MC-Unique: pmX-fAClNvew1iIR29rqyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A77D71083F60;
        Sun, 16 Jan 2022 21:52:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1CE6361F20;
        Sun, 16 Jan 2022 21:52:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 2/9] media: atomisp: Don't use ifdef ISP2400
Date:   Sun, 16 Jan 2022 22:51:57 +0100
Message-Id: <20220116215204.307649-3-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IPS2400 is never defined, for ISP2401 builds ISP2401 gets defined and
for ISP2400 nothing gets defined, so any #ifdef ISP2400 checks should
be #ifndef ISP2401 checks instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 1b240891a6e2..52a367feaeee 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1467,7 +1467,7 @@ static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id
 	 * remove the if once the driver become generic
 	 */
 
-#if defined(ISP2400)
+#ifndef ISP2401
 	if (IS_ISP2401) {
 		dev_err(&pdev->dev, "Support for %s (ISP2401) was disabled at compile time\n",
 			name);
-- 
2.33.1

