Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED6922DD95
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgGZJPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZJPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:15:11 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79119C0619D2;
        Sun, 26 Jul 2020 02:15:11 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k1so7573124pjt.5;
        Sun, 26 Jul 2020 02:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gqsz2+R48srpESLq+ec96ZXtSgH1w2eJBdh6duitcjs=;
        b=rqW9TyJPPGeHjxPLemQmlKL8ITcw+Hx2rBaR2fL8cFQCuByvgN4XFxxaSm3Xvj1rvj
         58sNFDKRJfaZqlWzvcJxg6Y1awM4Uhlxh8QU0uxjhZCgy1+vwLVLw7UF8fHNHcEB1vbN
         eDGzpcDhqToR9D5EoSWoemqvr/lJhL+aWjtWJ3qqfPbqCyU1IficLgTBvNmEBT/nA2rB
         GxYuNQt9GmikOg7xhxbPDYJzX4DDmALTqXQzrcE1GXwUhVJxPNXtosysVgzJGWIE5FK6
         VvI8VamMvEZIjSPLblRWJc+zpU2JK46m9NBqttpK09QyeDVYybkJjxAWzhkxWBFhfaQQ
         JBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gqsz2+R48srpESLq+ec96ZXtSgH1w2eJBdh6duitcjs=;
        b=fMmwKL5e6+9JwQYDz8pLR6qOdahhEJj5VyYLBfMWAC/g9bNI3Yn4LAPQ3F31ehlb1u
         aPZ/gJrpQYhPhJQjANJuHBVcgHV5gcMdcKMtMAxvVGwiCsRiAA8tojPbPemZiTlvpNxw
         k4ymxlMLTOlBzub8VlHRmcN3XtPpccY0DXdFcSkeoWuWQRavWpHvSTYRJ9o6uwZ6R17n
         dnZAd6oAsIBP3j7xmvScCt2XL589IHVeyCeBV/qJ13ycy2qZ2UjmV7eN9dISvTIjjde+
         Llg6xXOmpF/IhItYmia3cu44imXrg50jj8NTtaBa5FHGC3BaFBPSty/erhnM5KJ68sn4
         Awpg==
X-Gm-Message-State: AOAM532FGZFDKJYOpkyJNBhLgM6qDLN6WrYQX0sF+ru6tXQwbG/t6ZQ4
        Kq7IsH/NwF0IZN2KSST4/mo=
X-Google-Smtp-Source: ABdhPJy1GXHYwnH0qCgksHECal1EE5PZaUsJgsr/UBBcTcxGQJXfIy2IVlYBLr66WYfcrTsoQ9Z+Jw==
X-Received: by 2002:a17:90b:ec8:: with SMTP id gz8mr7662770pjb.87.1595754911011;
        Sun, 26 Jul 2020 02:15:11 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id a129sm1608215pfd.165.2020.07.26.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:15:10 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Subject: [PATCH v3 4/4] staging: media: atomisp: fix line length exceeds
Date:   Sun, 26 Jul 2020 14:35:16 +0530
Message-Id: <20200726090512.20574-4-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patch fixes the line length exceeded error from checkpatch.pl

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v3: change patch subject prefix
v2: split patch into sequence of patches 
v1: fix all coding style issues in single patch

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 2208453cbef0..6e8f45e38804 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -243,7 +243,8 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
 	binaries = &firmware_header->binary_header;
-	strscpy(FW_rel_ver_name, file_header->version, min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
+	strscpy(FW_rel_ver_name, file_header->version,
+		min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
 	ret = sh_css_check_firmware_version(dev, fw_data);
 	if (ret) {
 		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
-- 
2.25.1

