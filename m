Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04933600C2
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 06:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhDOEGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 00:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhDOEGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 00:06:10 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583B1C061574;
        Wed, 14 Apr 2021 21:05:48 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d8so11311266plh.11;
        Wed, 14 Apr 2021 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sRt5ZSfzZrNH+/vIrpbdOEkZRwCFEc37YSHooSbUBKA=;
        b=LndwqKwTpoRk/WExNAkIilCvQnzV+ZGWK2soDcLd/hNr31g2cflN0P7fQotHy12oGB
         AnGcNzyGfaPDbBhLfHPQDs6HD00RMjVcFHib7Gz8Vo2x1tPeXt4ZR/Ib6Cc7G5DyfFoz
         Iu5R2efFdf7RX3Nls8KdkDTeIKAOOd8Rmv2q86sE0VoFssHTZ3Q53eFzrWYIYQvNJ6/G
         KW8KyBq5Rz7Hg5Bz55TiD8bgqEdPtbwWx8Mt2tAErw9jkqza3vNHCCnEo7Y0gJRT40r9
         aGSH9mBtz2QiFpEFBAMHEB16DKBvxOz9b2gxCJZU+xkYChU9TmY2bYnAUYnmJ7wuVj+t
         E7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sRt5ZSfzZrNH+/vIrpbdOEkZRwCFEc37YSHooSbUBKA=;
        b=MOz7h441XcMU4il5tLJ7v3SgN3eT/0cPbnILJ4oAExeq94esa5UAKD9LTRcIxFlxhO
         tijSh+IV2nU+GtJ3U5FuMNrXfTSQhXTf3Tf6sLO9e41Y58Q2czmT4q9rad87/IR8W2Gy
         dLOU1QcQXPhqYPjGWYY5SJrHZGDhDkZ5yZEgZjWxAztGNJk5ZYE5RLArcII1T3xpkvyJ
         ciozC7Ux5H8TGvb7Wf5PITAxXlF2UZoCiedYv5FTw/npOBUwG8pekBiHqiwRGG/bHavI
         UhkCVDwykYBDaYcUwGtu94izLOb7r9h1tp4KGSlIoHONLojqViGfSJsjtW5ahneaz772
         N5kQ==
X-Gm-Message-State: AOAM533WWsD+A1qhxc0G2JngFnUlT1LUdShYxOVX8vnFjvowo88S6T6X
        kdQlErQbhlogKn4DWMZmlTk=
X-Google-Smtp-Source: ABdhPJwe99HBzVASC8b4DL49BixBYW3NjzNd4D13jDUY2Qv3Jqe54t5z6C3Pia4LJ+6XhFeDKIA2Iw==
X-Received: by 2002:a17:902:a38e:b029:eb:3963:5aee with SMTP id x14-20020a170902a38eb02900eb39635aeemr1761525pla.78.1618459547966;
        Wed, 14 Apr 2021 21:05:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id i17sm714406pfd.84.2021.04.14.21.05.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Apr 2021 21:05:47 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        shawnguo@kernel.org, krzk@kernel.org, linux@rempel-privat.de,
        s.riedmueller@phytec.de, matthias.schiffer@ew.tq-group.com,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: add dasheng vendor prefix
Date:   Thu, 15 Apr 2021 12:05:32 +0800
Message-Id: <1618459535-8141-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Add vendor prefix for DaSheng, Inc.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
v3:
- move v2 patch 4 to v3 patch 1
- add 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>'

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..4ec28488c963 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -309,6 +309,8 @@ patternProperties:
     description: DPTechnics
   "^dragino,.*":
     description: Dragino Technology Co., Limited
+  "^ds,.*":
+    description: DaSheng, Inc.
   "^dserve,.*":
     description: dServe Technology B.V.
   "^dynaimage,.*":
-- 
2.7.4

