Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59BD36642A
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 05:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbhDUDtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 23:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbhDUDtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 23:49:50 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26524C06174A;
        Tue, 20 Apr 2021 20:49:17 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id p12so28477873pgj.10;
        Tue, 20 Apr 2021 20:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xxLFAFZQUIZW732KBou/dWNLhMht8QRwgvcIsgiwG04=;
        b=oBvubQGac1FUCl0SggSELRYAv5MclmnbKUQ6i6riBcOC1Wgo/oTIUJJqHh5wrGIeqv
         kkaRGDN0nop++fq6l3b1HC4PfkfVKusmYs41JGbiEdbbPxVX6mzDMXWHYs2xH9R/hMma
         ALKW0XT511un5AqkHFkVfpHbEyM4y8mhZuh4lAUgEawfdyb5WalqMfpm56WcdrjtdtM1
         2pH1EW9AA/G0i67li0U+qrxBbh9t/J2N18Wq4237CkiM/WkI0Ov3UNUpLtFtCiF//aov
         0084HFEEHW9YS5kFc88h/wtwfX7qZw7PpOXhr87EChxusiDm+E8DM9JJ0qq5TsBFmXk4
         /HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xxLFAFZQUIZW732KBou/dWNLhMht8QRwgvcIsgiwG04=;
        b=fIqBqDXCE02eSIN1aA7d1k0xDcJukR2+cPnaGrONEMDZFRGKEVENOMpqtEREzOr6lr
         bI6kH4+8o+OM8ilHzGgj9ykT7tYhhKba/Nb3z6N/OCYlCQWdu9Y9tlxKckme1BO3pwrr
         3kM+RO/k13lara0OAjUUnsJZprnIuhQwPktO+8GAh8/cMlK6EP+lDOKEdd1xNVFv7F84
         b4/0PefaXHvYV8T8HmqgyosabDF9keAhxxPkowK5ZLolmRjzB0/Cnx5tfoR7SsTNNW/1
         1lmilbZlLBHM7HqsPHiyBO4o98Epfqu8d7sr101h/gsxLtqHMB8oqhe+vd1/vSN1e8e/
         7EZg==
X-Gm-Message-State: AOAM531rXHCfblDtEkWmI5dD9tbh+Ptfh17uOoeUhzdB/gmeYXEWykf/
        KRzdbRAr8XLc579CyPESble5g84+Jn3PeQ==
X-Google-Smtp-Source: ABdhPJwLxJ3PUXOv1B7JRm6jApHVEU8oMDR4KjY9Utvi1ZIQizbc3PZbLJRBSOPaodcukb6d7WO9EA==
X-Received: by 2002:a62:878d:0:b029:257:ba2e:b6b2 with SMTP id i135-20020a62878d0000b0290257ba2eb6b2mr27048288pfe.11.1618976956798;
        Tue, 20 Apr 2021 20:49:16 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id s43sm382555pfw.164.2021.04.20.20.49.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 20:49:16 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: add dasheng vendor prefix
Date:   Wed, 21 Apr 2021 11:48:55 +0800
Message-Id: <1618976938-20834-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
References: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Add vendor prefix for DaSheng, Inc.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v4: add Reviewed-by, Acked-by

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

