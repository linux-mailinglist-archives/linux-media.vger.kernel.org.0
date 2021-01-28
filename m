Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385D4308216
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 00:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhA1XsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 18:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbhA1XsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 18:48:03 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A9CC061573
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 15:47:23 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id dj23so8575830edb.13
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 15:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxF95Zt/GG7qY57hm1gODfTs0qW6vbXTUyTv/KspY6s=;
        b=HkRToUHrzqUD5jy+52VFi6KiXs8Ro2FdmP3IA0EmtNsvY3BRCvW0x8SlWUxpdVzw7i
         QsomK4NBNXvECG5l1LmxhtAGzvh3XNdU55mcxW0rdyGy+FYOdMZXSFjfkK/XsTotPjyO
         5H+TJsUmIAvIG9MG7ZSUyoAxqV6P7E3qKGEn6OoTc7X214zBBMEJGI/Aop0cj6a5H0kE
         CQIQbbVPwS7QBjPeY/PomLtLWdumHEMgVtq4plBlmZmQ4ytZkpYxd+aeylC/hbjtSps6
         3FncIKHIYIR8xi2tixITiIMwyLuDznl1Op2xYxt5wwtxMhZ67Ncbb5D7/2BvYJg4uayR
         Q9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxF95Zt/GG7qY57hm1gODfTs0qW6vbXTUyTv/KspY6s=;
        b=WFQ9ppu4TGzkC3YtxF9d9yAfA0phaqLzFLQwWppNoMQ2ImEsDZ5rUUzJSpVqcWFEgd
         S8BfwPTUjplzHhKrMvGqypCFreZZW6kdKhh0Wu5KN+1ry1exhRwiDEgFek+VITo9DzZA
         yEnVXN3joSqbyvc1T5+YuUzeJ4gGucPcrdY3jvTRd1p0YZspLKncUSa03HjZnYHmCDaW
         IFseQUu8u83AMagBSfzIVChEmTKIub6lsLSAvC7ubfDZHPINKz9tW7IxYEA63WBTZFrK
         W8hFwP7QNqgU2GC/Ne0m0GI0TSBZUsAdtjHqa0K5dHIZbN+QFCnTunhR2gxzm1UTCccw
         4mrQ==
X-Gm-Message-State: AOAM531O/JavnRjWFkVM/PbYEUwh9bb1E68IPNK1ZZ4HoanN15FIzo5k
        801G+vgo5Xo2xUm7CaNrKZ86H7UhogwJGctn
X-Google-Smtp-Source: ABdhPJyNXDun+awvMdFbWUjosaE0T0+6l/Ae1vuWgUmRn3MGpzn1aLJaLiqMxJk44KnhPKs/jhxDrQ==
X-Received: by 2002:aa7:df0c:: with SMTP id c12mr2327599edy.304.1611877641691;
        Thu, 28 Jan 2021 15:47:21 -0800 (PST)
Received: from localhost.localdomain ([90.254.100.128])
        by smtp.gmail.com with ESMTPSA id gj9sm2988857ejb.107.2021.01.28.15.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 15:47:20 -0800 (PST)
From:   Simon Liddicott <simon@liddicott.com>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Simon Liddicott <simon@liddicott.com>
Subject: [PATCH] dtv-scan-tables: latest UK changes
Date:   Thu, 28 Jan 2021 23:46:22 +0000
Message-Id: <20210128234622.75009-1-simon@liddicott.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

only includes transmitters where there have been changes

Signed-off-by: Simon Liddicott <simon@liddicott.com>
---
 dvb-t/uk-MoelyParc   |  6 +++---
 dvb-t/uk-Saddleworth | 14 +++++++-------
 dvb-t/uk-Storeton    | 10 +++++-----
 dvb-t/uk-WinterHill  | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/dvb-t/uk-MoelyParc b/dvb-t/uk-MoelyParc
index 39655a0..6f7b23d 100644
--- a/dvb-t/uk-MoelyParc
+++ b/dvb-t/uk-MoelyParc
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CH7 5UU>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Moel y Parc
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2021-01-28
 #
 #----------------------------------------------------------------------------------------------
 [C45 BBC A]
@@ -43,9 +43,9 @@
 	STREAM_ID = 0
 	INVERSION = AUTO
 
-[C51- SDN]
+[C33 SDN]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 713833000
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/uk-Saddleworth b/dvb-t/uk-Saddleworth
index f1c9ec2..56e70f5 100644
--- a/dvb-t/uk-Saddleworth
+++ b/dvb-t/uk-Saddleworth
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/OL3 5RU>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Saddleworth
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2021-01-28
 #
 #----------------------------------------------------------------------------------------------
 [C45 BBC A]
@@ -18,9 +18,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C39+ D3&4]
+[C39 D3&4]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 618167000
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 2/3
 	CODE_RATE_LP = NONE
@@ -43,9 +43,9 @@
 	STREAM_ID = 0
 	INVERSION = AUTO
 
-[C51- SDN]
+[C33 SDN]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 713833000
+	FREQUENCY = 570000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -55,9 +55,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C52+ ARQ A]
+[C36 ARQ A]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722167000
+	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/uk-Storeton b/dvb-t/uk-Storeton
index 5d51e4e..ce31b72 100644
--- a/dvb-t/uk-Storeton
+++ b/dvb-t/uk-Storeton
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CH63 2RH>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Storeton
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2021-01-28
 #
 #----------------------------------------------------------------------------------------------
 [C28 BBC A]
@@ -67,9 +67,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29 ARQ B]
+[C30 ARQ B]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 538000000
+	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -79,9 +79,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30 L-LIV]
+[C43 L-LIV]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	FREQUENCY = 650000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/uk-WinterHill b/dvb-t/uk-WinterHill
index 97895b5..13dc78f 100644
--- a/dvb-t/uk-WinterHill
+++ b/dvb-t/uk-WinterHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BL6 6SL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Winter Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2021-01-28
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -18,9 +18,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C59 D3&4]
+[C34 D3&4]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 778000000
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 2/3
 	CODE_RATE_LP = NONE
@@ -30,9 +30,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C54- BBC B HD]
+[C35 BBC B HD]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 737833000
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 2/3
 	CODE_RATE_LP = NONE
@@ -43,9 +43,9 @@
 	STREAM_ID = 0
 	INVERSION = AUTO
 
-[C58 SDN]
+[C29 SDN]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -55,9 +55,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C49 ARQ A]
+[C31 ARQ A]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
-- 
2.30.0

