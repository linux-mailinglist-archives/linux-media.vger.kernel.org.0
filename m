Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA1A372552
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 07:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhEDFLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 01:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhEDFLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 01:11:05 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6B9C061763;
        Mon,  3 May 2021 22:10:09 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id h7so4197715plt.1;
        Mon, 03 May 2021 22:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cv/4YiQsaH7ILIGN0BX1YpHcnVqqlfcrRxQBrip78ZU=;
        b=oEQ5Z53lf72w8mlKNkYHfqXIuXgInjxUe4K5glLj2T/9jM2PWYWx8iYRUXpSrwcCta
         P+2bWM/LD1oFoouhjuKC8FTp9nodACwV7MNdpgWgXXvo0iRRhzwcrSTL3yMmUpxS+0Ds
         1k7ZdvFnHtbxtYGmOZlrsuNOeEk6CLZQ+deiROvVCXH4Xag44t3G6I1JN/CgNRv2zq5s
         eV24EPkS+C+CYNVInUkOYA1ra1HJ6syofdsv/mSs9ce7+EFn4qUM435HX6T/1J2YXjfL
         8t77QZjqzNtKKmjSztCEO/avhBhKgOw6gqC13Qafp/uXvPCW3kjKI7/qk6oIDzCfDEyf
         60Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cv/4YiQsaH7ILIGN0BX1YpHcnVqqlfcrRxQBrip78ZU=;
        b=B6vvTQvcf7bX6Vyn5OSfH+XZ4QBREwWY2iOV8yfwl4bSyqwrrnZ5K/2oiTES++5lZk
         iOAuv9CSJ78AjE2a0tqc6/pJgErjrjejUiWw3vRgTn6IJpJ5dLjN1zw2pl0hyEdDHyAv
         /JwIrzZSFOeICZY9X7TRAU/uUD0sH6Ism0Ria9M8GZ7hdBEuP6EkzJizSRYvPcXpUZ2H
         Ic4wofusekgw2idbkyFB9qmfJ3PaMQe7e0OycebjPkVUhyAkAi4skZrDoISo6h7OA4OE
         3K7gEbassurmFKJemwRbG8lf/mK/b3FAzJj56A09plmuCDoACWVi+n51pdMw6NS2/3jc
         bGSA==
X-Gm-Message-State: AOAM532Tg+fn6cJdcWbzwN8S+WbIW25pDXMh7c5cHjGTUhJR6vEzeOmA
        qQbgHmkVUhSB+e1OpNDwbHE=
X-Google-Smtp-Source: ABdhPJy5zSTk208UZ0vHHKQZ7/sDLiiYH5Z+40uwBevEAH6t3ew+Pe4X49RpxXwWZNTZk3Kofmj5pQ==
X-Received: by 2002:a17:902:ee94:b029:ed:4204:5e44 with SMTP id a20-20020a170902ee94b02900ed42045e44mr24001350pld.60.1620105009587;
        Mon, 03 May 2021 22:10:09 -0700 (PDT)
Received: from localhost.localdomain ([63.143.61.57])
        by smtp.gmail.com with ESMTPSA id 3sm10457815pff.132.2021.05.03.22.10.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 22:10:09 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, mchehab+huawei@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 1/4] dt-bindings: add dasheng vendor prefix
Date:   Tue,  4 May 2021 13:09:50 +0800
Message-Id: <1620104993-5850-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
References: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Add vendor prefix for DaSheng, Inc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---

v5:
- no code change, just change my git author name from lower case to higher case

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
1.9.1

