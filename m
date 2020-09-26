Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A237A279C78
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 22:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIZUwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 16:52:34 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:40091 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZUwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 16:52:34 -0400
Received: by mail-ej1-f67.google.com with SMTP id p15so3201308ejm.7
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 13:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+8Oh61VDkKJm8ATQ6jeOPbqJJMPXYpW1qx7rAsBes8k=;
        b=A7hla6cBruWJG1xinh2LPAjNYUNMldLStEX1Y6Z3grfhTXL8HfBw0BQh+jokVCSDPw
         s0tWEaA/uGWMJ5Ygnp1D/Zo2gljR9MGGkdJfTWfTw4tBzQ6Q5HrMeF38x/qcb/IB+f6y
         TzFkN2rNs9+Um38lhC4nltMkYLSVpyHJV1B7CAzqB5By2w3WqkGXoZfCR+dMMOc/ZAJC
         gzZYr317jUMcEH5YHZXgDCRzJc2qoU62PQcYpMdxy9bEacEPpZQjnV7/5GW+MnWj68Lj
         jkKiIH2vs4eUiJCqrJNO7eWRZXvq3zM5Wm+FsNGcL9usUcbnqMJrARAlj0pZtTanlAjs
         OHWQ==
X-Gm-Message-State: AOAM530qSOlWfORkDVjjNj6FsCilniiSObjstj8AootXLRPTPzZ0Xc+C
        atPfoSvboamX+yHIDQ+QZDJD4g==
X-Google-Smtp-Source: ABdhPJy70ndEkfLf/+WblrSk/UwDwosqtjfmRLEbzIM2w+dXQYJKs0F5avEWRJwBwLIFK8CxgFh61A==
X-Received: by 2002:a17:907:264c:: with SMTP id ar12mr9129730ejc.80.1601153552469;
        Sat, 26 Sep 2020 13:52:32 -0700 (PDT)
Received: from x1-carbon.localdomain (dynamic-2a01-0c22-a405-1400-4d77-6706-ca6f-bab0.c22.pool.telefonica.de. [2a01:c22:a405:1400:4d77:6706:ca6f:bab0])
        by smtp.gmail.com with ESMTPSA id p1sm5064178edx.4.2020.09.26.13.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 13:52:31 -0700 (PDT)
From:   gary@apache.org
Cc:     Gary Yao <gary@apache.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: clean up block comment style issues
Date:   Sat, 26 Sep 2020 22:50:58 +0200
Message-Id: <20200926205103.189041-1-gary@apache.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gary Yao <gary@apache.org>

Clean up block comment style issues to follow kernel coding style
and clear checkpatch warnings.

WARNING: Block comments use * on subsequent lines
WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Gary Yao <gary@apache.org>
---
 .../pci/isp/modes/interface/isp_types.h       | 41 +++++++++++--------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
index ae273c826808..d1c42c77fa50 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
@@ -1,26 +1,29 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
-*/
+/*
+ * Support for Intel Camera Imaging ISP subsystem.
+ * Copyright (c) 2010 - 2015, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
 
 #ifndef _ISP_TYPES_H_
 #define _ISP_TYPES_H_
 
-/* Workaround: hivecc complains about "tag "sh_css_3a_output" already declared"
-   without this extra decl. */
+/*
+ * Workaround: hivecc complains about "tag "sh_css_3a_output" already declared"
+ * without this extra decl.
+ */
 struct ia_css_3a_output;
 
-/* Input stream formats, these correspond to the MIPI formats and the way
+/*
+ * Input stream formats, these correspond to the MIPI formats and the way
  * the CSS receiver sends these to the input formatter.
  * The bit depth of each pixel element is stored in the global variable
  * isp_bits_per_pixel.
@@ -37,8 +40,10 @@ enum sh_stream_format {
 };
 
 struct s_isp_frames {
-	/* global variables that are written to by either the SP or the host,
-	   every ISP binary needs these. */
+	/*
+	 * Global variables that are written to by either the SP or the host,
+	 * every ISP binary needs these.
+	 */
 	/* output frame */
 	char *xmem_base_addr_y;
 	char *xmem_base_addr_uv;
-- 
2.26.2

