Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1271F48FF49
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbiAPVwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbiAPVwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369940;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6GkPcX6WL4buAzlb3rvJP7uOMUndloDC4nSNGhGS+Z0=;
        b=gmlKtmHhWBLymYMJFzTAs0IXQANiouaJ2C68AbH7nn4+Zp6NXK5gxTzdipnHLU9h/fVIpi
        do295HUuHGpa1kFHcflk7xECctiZFCQYeAJkw3/U/bumDb5xCrG/51WxbKglZd74FrZk76
        OWTalka72/WB5FrOHNe6aGfm6jNr3J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-CK_GYErHO8y5tyGduLrODw-1; Sun, 16 Jan 2022 16:52:18 -0500
X-MC-Unique: CK_GYErHO8y5tyGduLrODw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99DFB1083F60;
        Sun, 16 Jan 2022 21:52:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A52712E37;
        Sun, 16 Jan 2022 21:52:13 +0000 (UTC)
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
Subject: [PATCH 3/9] media: atomisp: Use irci_stable_candrpv_0415_20150423_1753 fw for byt
Date:   Sun, 16 Jan 2022 22:51:58 +0100
Message-Id: <20220116215204.307649-4-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no irci_stable_candrpv_0415_20150521_0458 build for the
isp2400/byt version of the atomisp2. There is however an
irci_stable_candrpv_0415_20150423_1753 version which according to:
https://github.com/intel/ProductionKernelQuilts/blob/master/uefi/cht-m1stable/patches/cam-041

Has the exact same fw ABI, so use that on the isp2400.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 94149647b98b..dd688f8ab649 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -56,7 +56,11 @@ static struct firmware_header *firmware_header;
  * which will be replaced with the actual RELEASE_VERSION
  * during package generation. Please do not modify
  */
+#ifdef ISP2401
 static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
+#else
+static const char *release_version = STR(irci_stable_candrpv_0415_20150423_1753);
+#endif
 
 #define MAX_FW_REL_VER_NAME	300
 static char FW_rel_ver_name[MAX_FW_REL_VER_NAME] = "---";
-- 
2.33.1

