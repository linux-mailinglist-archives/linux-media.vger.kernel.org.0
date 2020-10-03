Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BD728272C
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 00:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgJCWoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 18:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgJCWoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 18:44:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09E1C0613D0
        for <linux-media@vger.kernel.org>; Sat,  3 Oct 2020 15:44:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so103581pjb.5
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2020 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vQAokBEj20y8i6bpc3pIuIOLRwMaUyJNGYhF/oqnuvU=;
        b=Q8Rv2QmoPC8gDn+nklL1DEEJGmzfW7tvdtNtLJZbV4sBTczxspxTONqBgztM0OcA6E
         H76q3+aC7Vn80XT4tOCm1zSRxqPN9GJHolXOhv7m0ibe3rqmp7a2fwdcQIe4Ml6i5GQc
         AjoVGwdj8s7RgGIZJM7BEyDlzFJoD2gU8rugA3PRCeI7XTXrF2cXLB+oamiFBMpnRM/j
         MQe3SrtaOm/Bss1Wvm9ho3zxD25GBmBmXDOHyGei8n4uu0Em5YMraWif1JN2L7BoFc50
         yprgBG6MCywzUj0y1b0cD9K3DlewV738q/RT0HnUgQI6C6O8ejGchhpl0cBUybtOU1uR
         5/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQAokBEj20y8i6bpc3pIuIOLRwMaUyJNGYhF/oqnuvU=;
        b=fFOCkRkQmbXOmSjCEAXLje9LnuGhfNS481y9xCZ8L1H8CVDYz5R7i3Ir8MMH/Zw6iC
         Jx45uuLfzfq+imq8tG/4cv6j8vdsuojLIW/+VP+s6mkLrXh0kFQZJXVijwFfTUmkC+cs
         TZfUw2pUytJxBNLDt0oD71t98I8WGmL4LGdsdb5BkhCAJiJ5UEW3uIKjMFjeMgJEi2Tk
         NWrChokQDBEuKwgs4G/E3OszQWAzRziAnMB3coWHMYJuwU6YWOhgM9vTtz4WQIP/UVMm
         rZyggI7JN8nrnMpk9MXFjX0EZoR6XachEqxLUIGnJmSf3zhJPeWO3y8ow4TT6ydM6Z2q
         /aJQ==
X-Gm-Message-State: AOAM531qYpgw16C4ejKbgP8FsOQg9IA6g0VFeAKXfTsXUZhML+5ze8pT
        zDlrBDjAXBLKgveQ4eiOqjhdJ599RhNzjg==
X-Google-Smtp-Source: ABdhPJyLxhCETbSHVxoYOe3G1/4gsyR6we8ufjPdtWKGsQl9E+cHP3ZkKOSTSb8VwLQE6Lzg8QX32g==
X-Received: by 2002:a17:90b:4003:: with SMTP id ie3mr8779942pjb.1.1601765078845;
        Sat, 03 Oct 2020 15:44:38 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id l10sm5777777pgp.25.2020.10.03.15.44.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 15:44:38 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] clang-tidy: add a bunch of const
Date:   Sat,  3 Oct 2020 15:44:35 -0700
Message-Id: <20201003224435.37725-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201003224435.37725-1-rosenp@gmail.com>
References: <20201003224435.37725-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with cppcoreguidelines-interfaces-global-init

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libv4lconvert/processing/autogain.c              | 2 +-
 lib/libv4lconvert/processing/gamma.c                 | 2 +-
 lib/libv4lconvert/processing/libv4lprocessing-priv.h | 6 +++---
 lib/libv4lconvert/processing/libv4lprocessing.c      | 2 +-
 lib/libv4lconvert/processing/whitebalance.c          | 2 +-
 utils/cec-compliance/cec-test.cpp                    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/libv4lconvert/processing/autogain.c b/lib/libv4lconvert/processing/autogain.c
index 7b4f91f7c..aef06b057 100644
--- a/lib/libv4lconvert/processing/autogain.c
+++ b/lib/libv4lconvert/processing/autogain.c
@@ -213,6 +213,6 @@ static int autogain_calculate_lookup_tables(
 	return 0;
 }
 
-struct v4lprocessing_filter autogain_filter = {
+const struct v4lprocessing_filter autogain_filter = {
 	autogain_active, autogain_calculate_lookup_tables
 };
diff --git a/lib/libv4lconvert/processing/gamma.c b/lib/libv4lconvert/processing/gamma.c
index 73129637e..d65068f03 100644
--- a/lib/libv4lconvert/processing/gamma.c
+++ b/lib/libv4lconvert/processing/gamma.c
@@ -57,6 +57,6 @@ static int gamma_calculate_lookup_tables(
 	return 1;
 }
 
-struct v4lprocessing_filter gamma_filter = {
+const struct v4lprocessing_filter gamma_filter = {
 	gamma_active, gamma_calculate_lookup_tables
 };
diff --git a/lib/libv4lconvert/processing/libv4lprocessing-priv.h b/lib/libv4lconvert/processing/libv4lprocessing-priv.h
index e4a29dd92..9f0b74934 100644
--- a/lib/libv4lconvert/processing/libv4lprocessing-priv.h
+++ b/lib/libv4lconvert/processing/libv4lprocessing-priv.h
@@ -61,8 +61,8 @@ struct v4lprocessing_filter {
 			unsigned char *buf, const struct v4l2_format *fmt);
 };
 
-extern struct v4lprocessing_filter whitebalance_filter;
-extern struct v4lprocessing_filter autogain_filter;
-extern struct v4lprocessing_filter gamma_filter;
+extern const struct v4lprocessing_filter whitebalance_filter;
+extern const struct v4lprocessing_filter autogain_filter;
+extern const struct v4lprocessing_filter gamma_filter;
 
 #endif
diff --git a/lib/libv4lconvert/processing/libv4lprocessing.c b/lib/libv4lconvert/processing/libv4lprocessing.c
index b061f5041..cbe5a8393 100644
--- a/lib/libv4lconvert/processing/libv4lprocessing.c
+++ b/lib/libv4lconvert/processing/libv4lprocessing.c
@@ -27,7 +27,7 @@
 #include "libv4lprocessing-priv.h"
 #include "../libv4lconvert-priv.h" /* for PIX_FMT defines */
 
-static struct v4lprocessing_filter *filters[] = {
+static const struct v4lprocessing_filter *filters[] = {
 	&whitebalance_filter,
 	&autogain_filter,
 	&gamma_filter,
diff --git a/lib/libv4lconvert/processing/whitebalance.c b/lib/libv4lconvert/processing/whitebalance.c
index c74069ae2..367dcb7ff 100644
--- a/lib/libv4lconvert/processing/whitebalance.c
+++ b/lib/libv4lconvert/processing/whitebalance.c
@@ -205,6 +205,6 @@ static int whitebalance_calculate_lookup_tables(
 	return 0; /* Should never happen */
 }
 
-struct v4lprocessing_filter whitebalance_filter = {
+const struct v4lprocessing_filter whitebalance_filter = {
 	whitebalance_active, whitebalance_calculate_lookup_tables
 };
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 8633171a0..8a9ea2afe 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1414,7 +1414,7 @@ static struct remote_subtest post_test_subtests[] = {
 };
 
 
-static struct remote_test tests[] = {
+static const struct remote_test tests[] = {
 	test_case("Core",
 		  TAG_CORE,
 		  core_subtests),
-- 
2.26.2

