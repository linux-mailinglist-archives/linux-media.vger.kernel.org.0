Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DA752DA3B
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242036AbiESQ35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242032AbiESQ3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:54 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF254D9E86;
        Thu, 19 May 2022 09:29:52 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id l16so7081908oil.6;
        Thu, 19 May 2022 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
        b=I6imaRrfGnZliOI69/LwjY0OorZ3F7ezKE/07z/jV5EhH/5ay2ypwNz8GeRjsqTc3C
         Qcp0Xv7cf1asBOHcy/1xF1bpujjPBb/e2jYz62I0AI2fArRfY5tNPBb7KHdibOpEOFiA
         vQd0jpq5B1tMNAk/IqR3ux5jRwvl4Ze6dzqixMXZWY8qcMqwKYQEwlUru9458f91HrJQ
         qVB4U8555+SZ9kPU50Krq1hzllXHxHY0uBgm04cfUsQnhvQdwcBD4HUcOJLYI0D1l9iz
         4jl8ttgynxGv44A5BRgNgDfANXr2h0QI9GQd8WjCQo3Qo/cfZmQtaVxTTrwi3Sz2OWl5
         EF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
        b=tLjeJWGFzEi9WJoMAkvAxcVsgHa2afh9NXwXlPwU7KK+/7g3eGIdj8Rarv2HiWWjI2
         jE74j60VSsBHlCiLW/JplS7Ezq5uvjmDPLukRqYmoin8Zzw9RHgAVG0ZaV0W4fNgyUZs
         KNl6GySpFw753itXRegnn57lssU/96T8BUC5ZivEpt34Usz84+rhV21GhBFw8d7nzv7u
         27Cr01x1YwaZ26iGmSJ0+tUMcnmyiiCsYbhyZhZChu7JPj8ZbDjg8QmVkIRd5HXHgd7o
         1JNab1vz4avjK9GS/THHhRLPGN8dAKT1CC/Eob24mg7jM2iJYxtxSWIsW1zKjTg8CUM4
         TyMg==
X-Gm-Message-State: AOAM530XN3o0iUvdnZhlyWHQ0QzETSy8r17TaKt4anUvYvmEd2AgQb70
        xMq6RUIe13Qlnp+xJy4kuEI=
X-Google-Smtp-Source: ABdhPJxvaEapVVMCSpa9P/lKDR01HM552ZAL24tsPY0z1yBhN8SghENEDuiSNbss5XiE7D5Mc1gRRQ==
X-Received: by 2002:a05:6808:1813:b0:326:a3fe:2259 with SMTP id bh19-20020a056808181300b00326a3fe2259mr3104120oib.292.1652977790795;
        Thu, 19 May 2022 09:29:50 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:50 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [RESEND 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Date:   Thu, 19 May 2022 11:29:30 -0500
Message-Id: <20220519162935.1585-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add vendor prefix for Geekworm (https://geekworm.com).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45..c0c7627c6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -455,6 +455,8 @@ patternProperties:
     description: General Electric Company
   "^geekbuying,.*":
     description: GeekBuying
+  "^geekworm,.*":
+    description: Geekworm
   "^gef,.*":
     description: GE Fanuc Intelligent Platforms Embedded Systems, Inc.
   "^GEFanuc,.*":
-- 
2.25.1

