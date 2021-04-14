Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B704135EDD3
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349488AbhDNGwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349480AbhDNGwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:52:45 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3668AC061756;
        Tue, 13 Apr 2021 23:52:23 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id w10so13728610pgh.5;
        Tue, 13 Apr 2021 23:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L4FIt3A4S0ABg8WN/VlydR1MHCToc62/wiiwBXWyDrQ=;
        b=P600k4txh0uTl6Z+W/F02nbyMxyyDkuHKm5T4s7pLmYBrFoF/WmvaFvvUj//GRQV+s
         a7UuLUMPIW+RxidyxTfCcLAIRnl+SdQuJS340biIpwFvUOiiHLwwpASHMik4cvYqnWeJ
         0CJL5CUfM9jzELZZ3YpanHjBsBvgnXQoFdsB6D+a1Um+S4ucvqkgPbg1+UJd14DPS/rN
         W9ueqoPQvXEtBim2u57olABjg9+yXdmRVjlMqLHFLGvIlMkoI3yNWN1L0vmyA2TPrH8y
         utJYELVO/LqkkysYeY3wZkMjLS9b6jTbqTTCDhAkvvKC3VULfpYiMotPq0mVoKUg81On
         ayFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L4FIt3A4S0ABg8WN/VlydR1MHCToc62/wiiwBXWyDrQ=;
        b=RDWsAH+bLzULboCSYB/Tsj3pVIkh1iMuoSfDvx5wv362H18dnIyeBDdrF5vNHWkUdI
         bvQG+fPRRMc+aUjZyc04mAsbGrkbUHtgRp/ct7sLxwua5QxFjOIh8jzyPXJS9Yua9LTP
         6tCmwVkpXCmKGVsRzcbgLfUNDiBjuvz9/RHAm2tNX/JMap/+iq8eFmS5pUHWrcs7BvD1
         pp1ghw/TzRTQ1DrvwJD6mAwfBFJbYcYv9UYo+6ZcWIN+D/2xPwsu65hFVV+qAhrPenbt
         d3bPCyApykCOHnNjZSBxstOkJpDLGx15aoJd+yaLyxV9fzD0l2y4GOmZ90fOQDbrqYaX
         K+Hg==
X-Gm-Message-State: AOAM533yIaAyrTGogi9oKhjWwETY72vRWLftoGp/FUAYeW6pM7lTpBbJ
        BuqucuqtcaXcDnWYL3QL/po=
X-Google-Smtp-Source: ABdhPJzwcuZxktQXRNqmqorOi+XRVx5xp8eQ4VQA9YsmaGQYV8CEPuLuBPcMwcgPcYAfVZiHtCpLhQ==
X-Received: by 2002:a63:d556:: with SMTP id v22mr3653632pgi.310.1618383142841;
        Tue, 13 Apr 2021 23:52:22 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id r11sm3775736pjp.46.2021.04.13.23.52.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:52:22 -0700 (PDT)
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
Subject: [PATCH v2 4/4] dt-bindings: add dasheng vendor prefix
Date:   Wed, 14 Apr 2021 14:51:57 +0800
Message-Id: <1618383117-17179-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
References: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Add vendor prefix for DaSheng, Inc.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v2: new add

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

