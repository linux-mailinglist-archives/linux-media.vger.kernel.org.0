Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CD5430A9F
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344167AbhJQQY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344141AbhJQQY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:24:28 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C8C06161C;
        Sun, 17 Oct 2021 09:22:18 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 187so12808759pfc.10;
        Sun, 17 Oct 2021 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RCEoG8Wj2tmwZyFp/O9zov7pfmqwLlm4/WHvu/B4JGg=;
        b=Z1p4eOchvxAp5l+wigxWGKeDDJs8rgMtFBNZtjv2J79ZwStYOkwddbXjidCjEoiOxr
         PLHcnizsaha8B1bh3YH2i2ceEn5Y2XUQ0JFSxn2/rgtsvb/Vrvipfrxmprh18Qpzl5bk
         uGdcaHwqzwqVgu7eGFOJCVJSiJ+/AgP8nfMrTjEuh/KfpetwxbxfbkQZjiEICI67kGb8
         ZrgQWnGzNRS/xmylnO6Aylzw1F+roEm3lplVBMuQGNwuoH2raAmV4zq/69uALDB6QP11
         HLOcFjzPjdd8UIvcf6D6+0/l61vMuh/MCllsWkIFfSMVz54VtTXmmaud9ylCV6YQLEnx
         kmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RCEoG8Wj2tmwZyFp/O9zov7pfmqwLlm4/WHvu/B4JGg=;
        b=XN8QSIeLt4HdeAvN2YJo3Yvt/020leOPD3QiQ2Wwb60fmbZR8jrV6Da8tjFWMny/AX
         GaB2GF8xa+PmJhhy9KKl5ZF8XKtT4aj6+SApAXM2vq8WKDV8OeW0NMov37cqhij4qNA6
         sG9832vneRLxXzNPJt1sfP23kiIGCSB8OG4meSZluCw/G8EmX22TYy3jtMejPFv70ena
         1FA6Pkn+qRwcR/4v8B1qLPxvjNx3cW5Twj70q83ZGOf9Ybch5IoHNwCBpJPJF3aq/r8v
         HmWwzQdEGnNB9zBtMmhMudmwccgq5qL35FCkvuc0nyZZ1nFse8hEv70khQOFU6ZqHgBu
         WOiw==
X-Gm-Message-State: AOAM531gE3ERbAwj2yhTJoLymGnUE2QVwkbrJvB/IQZS3TUAShvGF3Bz
        2J9ZB+BT3R4aCWA80azroac=
X-Google-Smtp-Source: ABdhPJy8wEdxruvSGQ5pt9lgh0xLrvT4JJBQmL2x3YAjOBh+L38/MudY/thtGQOoNk43Ibawc5PrJw==
X-Received: by 2002:a05:6a00:23d6:b0:44d:8426:e2bb with SMTP id g22-20020a056a0023d600b0044d8426e2bbmr19956794pfc.30.1634487738125;
        Sun, 17 Oct 2021 09:22:18 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:17 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 13/17] media: atomisp: pci: release_version is now irci_stable_candrpv_0415_20150521_0458
Date:   Mon, 18 Oct 2021 01:19:53 +0900
Message-Id: <20211017161958.44351-14-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we made atomisp work with firmware version
irci_stable_candrpv_0415_20150521_0458 also for ISP2401, the
release_version for ISP2401 is not irci_ecr-master_20150911_0724
anymore.

So, use the same release_version for both ISP2400 and ISP2401 (i.e.,
irci_stable_candrpv_0415_20150521_0458).

Referred to the following diff to make this patch:
- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/staging/media/atomisp/pci/sh_css_firmware.c?id=3c0538fbad9f1d07d588f631e380256d941e3d3a
  ("media: atomisp: get rid of most checks for ISP2401 version")
  changes for file sh_css_firmware.c

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../pci/isp/kernels/hdr/ia_css_hdr.host.c        |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr.host.h        |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr_param.h       |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr_types.h       |  1 -
 .../staging/media/atomisp/pci/sh_css_firmware.c  | 16 +---------------
 5 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
index 698550cc2fcc..85a02b6adb52 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
index 04599ab590cd..83277b683c47 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
index 97a89fd3cfda..998c6d801756 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index 1b4090880201..175c301ee96a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index e1a16a50e588..94149647b98b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -56,8 +56,7 @@ static struct firmware_header *firmware_header;
  * which will be replaced with the actual RELEASE_VERSION
  * during package generation. Please do not modify
  */
-static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
-static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);
+static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
 
 #define MAX_FW_REL_VER_NAME	300
 static char FW_rel_ver_name[MAX_FW_REL_VER_NAME] = "---";
@@ -190,13 +189,6 @@ sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 {
 	struct sh_css_fw_bi_file_h *file_header;
 
-	const char *release_version;
-
-	if (!IS_ISP2401)
-		release_version = isp2400_release_version;
-	else
-		release_version = isp2401_release_version;
-
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
 
@@ -232,12 +224,6 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	struct ia_css_fw_info *binaries;
 	struct sh_css_fw_bi_file_h *file_header;
 	int ret;
-	const char *release_version;
-
-	if (!IS_ISP2401)
-		release_version = isp2400_release_version;
-	else
-		release_version = isp2401_release_version;
 
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
-- 
2.33.1

