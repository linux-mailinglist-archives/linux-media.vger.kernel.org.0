Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710F239C24B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 23:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhFDVYS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 17:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhFDVYS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 17:24:18 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513F4C061766;
        Fri,  4 Jun 2021 14:22:31 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id u30so10750901qke.7;
        Fri, 04 Jun 2021 14:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u2ehOPdLCxDGJlmzkQMD3kIcddHWnEQ5Jk2pA+91fIU=;
        b=k8dPMztRjjyTsNv226sWB48DA8xKH+e968NzONYGYa76lTxOyDXrh89SZ+nEwdJrn9
         952+WU3vG3tQYM02ZI2vd/N66/ET7LnpPwku9eLp33U7PFNcZtWJM7t7HrZKGaieyPCh
         RvkvoObyfQYC2mVJLHU87pBXUgiT2HfCmjbWl+mB6WhWp6ZjXZ2ovdbxqDcff4eEbhQo
         RAAdD0lrpcqk6RtEJEGf72TJMmGL2UtlVXA99QOiQ6IH029CVCgaRFnJwHIafTKuabfL
         eVSq0mkvlP0qPTAL/vMf9tDTYdEF3Iv6MG4p9EQN7agYMAfS+Ezq91sPoneQkPwG+mUt
         2TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u2ehOPdLCxDGJlmzkQMD3kIcddHWnEQ5Jk2pA+91fIU=;
        b=MiAs6+Z1tjPRMGUYQ46HktFwZUNAMYsntKenhjUDyxqOdNdvRp5mCTEGWqm5nzbAgc
         on/qWWnXsRR/BG3rK+PL8ChFh1cH/ROiCTUOMrX7OBBfM4PlLlanqK4qYTglo9TBAsY6
         wnMZpw5hftYbhnXs4eF1QzFectU9aKcn+dPItmGE5qx3DSN6TC0rhUNRLSZitnHb0UFs
         uIQ8mjs7MlWv7ssTzmgM1hT4e0MKvo5+CM81ubRHXxJzAqg8DpQmzBmxvGXSwR9ASrC+
         E9sEk7IzCYsbzt6CsgKo6iBNRmpOXbQPav1CKC+zguQzlZ8g3G0OOg2/K1epdWZ4hhVv
         gu5A==
X-Gm-Message-State: AOAM532GWwGzBy8dSPsx5EO2IZ11QEN3NvWzFGuNYq69QDDC4AX6UPBu
        kpjPKYD9DyqFVHLYBLwJC8Y=
X-Google-Smtp-Source: ABdhPJwz/U/aqSU+Zamv8vU01Ojuv1XBaMsJE+Mr786dAVgxaTexdul9clfvIeKVMgpCiifWD9+Iyg==
X-Received: by 2002:a37:6b47:: with SMTP id g68mr6268767qkc.89.1622841750443;
        Fri, 04 Jun 2021 14:22:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:5e11:28ac:75e2:dfae])
        by smtp.gmail.com with ESMTPSA id h5sm4213892qtu.75.2021.06.04.14.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:22:30 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, matthew.michilot@gmail.com, tharvey@gateworks.com,
        linux-media@vger.kernel.org, niklas.soderlund@ragnatech.se,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: adv7180: Introduce 'adv,force-bt656-4' property
Date:   Fri,  4 Jun 2021 18:22:16 -0300
Message-Id: <20210604212217.70518-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Captured NTSC video would be out of sync when using the adv7280 with
the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) need to
be configured properly to ensure BT.656-4 compatibility.

Introduce the 'adv,force-bt656-4' property to allow the ADV7280
behavior to be consistent with the ADV7180, where BT.656-4 timing
is used by default.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Remove the part number from the property name (Rob)

 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index bcfd93739b4f..83e47b0c9fa2 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -35,6 +35,11 @@ properties:
   powerdown-gpios:
     maxItems: 1
 
+  adv,force-bt656-4:
+    description:
+      Indicates that the output is a BT.656-4 compatible stream.
+    type: boolean
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
 
-- 
2.25.1
