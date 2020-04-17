Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13551AE774
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 23:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgDQVRm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 17:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgDQVRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 17:17:42 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A20C061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:17:42 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id c138so1656603pfc.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZA/N+2VOitkHuqOqVS3429twKkjwqbBcAVeBpabgcQ=;
        b=cw2fUff4o2t7a7uuTlK7MwSG60jrq44W05jwE1LsofuWjDJDu/457A+5GOjS0Sm2zi
         CYUxVbPh3ISeyN17IGj6iLqNqtMc1KZM6H0smZpwofsil8DmEPZVTXKUYmg4lr8zLw8h
         YVwirHhzcjjtgkfgnp8mYKA/DSrQXH5pQwKnhYL8eUdywzCB68NBmP8HImBMX7i2s6nH
         4CpPBEl51OqUtSaEG+EanFOcyPt8SOiKSjO5bE5aBb5US5JaczbEB6T07urgmoCvSgGL
         OUouhXcBCh3YC4LFdA51zQUGSQCeI7YEESDQXGmTTlhRsYNf2gRFULmPmCxGNN5yIvTv
         UW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZA/N+2VOitkHuqOqVS3429twKkjwqbBcAVeBpabgcQ=;
        b=qn54ACurXoTdbbRYtRnqbrm7eFLrDmKwbhrydHAhF4HGeNZ5+QkO1nye86ipX3N9i3
         +kL4RLzTY6jj47xjE4n+hLdsRW+/z92aMPlCaGRqfLm0jSfAz9UQZ4D5zViRXLAsxqSi
         eerM4YT8W0zqGNddP26GczEdlAB0THXT2zwTZAY4+R2GpEtuw9z6vLq47VEcLEdZa4cd
         oOiLznqC3rDcTkohx0S4vUPOXZjgDuI6nXa4ae4DN4NgVBd1RlkkmI7hfAZNvECpgcWV
         bakHttXCQRLBvyfOY8uh4Jce3tAeSY+hHDhGIIcu8cTOP763R0P7A3WsXQRprSub3BMx
         BObw==
X-Gm-Message-State: AGi0PuZvyuKKgmCht19OHiTXfncUwtRoGfmwd0HANyn5oOq5PRD4M1dZ
        4tKbSDrgf/+bp/UtdeUwtOAdWu/qVOk=
X-Google-Smtp-Source: APiQypIuM1ug8nVCU0CxuYfsJcYjB+jr0L+0u95py2A7EQIorMrzP8B89t/JJVWA0CDKa9+BVtfGhg==
X-Received: by 2002:a63:64e:: with SMTP id 75mr4817469pgg.342.1587158261508;
        Fri, 17 Apr 2020 14:17:41 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id a13sm8016155pfo.96.2020.04.17.14.17.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:17:41 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] utils: simplify bool returns
Date:   Fri, 17 Apr 2020 14:17:40 -0700
Message-Id: <20200417211740.4840-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with readability-simplify-boolean-expr

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 8 ++------
 utils/cec-follower/cec-processing.cpp   | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 576d59c6..d422a7da 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -113,9 +113,7 @@ static bool pa_are_adjacent(__u16 pa1, __u16 pa2)
 		return false;
 	if ((pa1 & trail_mask) || (pa2 & trail_mask))
 		return false;
-	if (!((pa1 & ~mask) && (pa2 & ~mask)))
-		return true;
-	return false;
+	return !((pa1 & ~mask) && (pa2 & ~mask));
 }
 
 static bool pa_is_upstream_from(__u16 pa1, __u16 pa2)
@@ -124,9 +122,7 @@ static bool pa_is_upstream_from(__u16 pa1, __u16 pa2)
 
 	if (pa1 == CEC_PHYS_ADDR_INVALID || pa2 == CEC_PHYS_ADDR_INVALID)
 		return false;
-	if (!(pa1 & ~mask) && (pa2 & ~mask))
-		return true;
-	return false;
+	return !(pa1 & ~mask) && (pa2 & ~mask);
 }
 
 static int arc_initiate_tx(struct node *node, unsigned me, unsigned la, bool interactive)
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 75000b73..e4056c55 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -214,9 +214,7 @@ static bool pa_are_adjacent(__u16 pa1, __u16 pa2)
 		return false;
 	if ((pa1 & trail_mask) || (pa2 & trail_mask))
 		return false;
-	if (!((pa1 & ~mask) && (pa2 & ~mask)))
-		return true;
-	return false;
+	return !((pa1 & ~mask) && (pa2 & ~mask));
 }
 
 static bool pa_is_upstream_from(__u16 pa1, __u16 pa2)
@@ -225,9 +223,7 @@ static bool pa_is_upstream_from(__u16 pa1, __u16 pa2)
 
 	if (pa1 == CEC_PHYS_ADDR_INVALID || pa2 == CEC_PHYS_ADDR_INVALID)
 		return false;
-	if (!(pa1 & ~mask) && (pa2 & ~mask))
-		return true;
-	return false;
+	return !(pa1 & ~mask) && (pa2 & ~mask);
 }
 
 static __u8 current_power_state(struct node *node)
-- 
2.25.2

