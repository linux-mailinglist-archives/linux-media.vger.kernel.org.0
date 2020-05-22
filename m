Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85071DE686
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 14:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbgEVMPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 08:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbgEVMPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 08:15:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7858C061A0E;
        Fri, 22 May 2020 05:15:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f134so8465258wmf.1;
        Fri, 22 May 2020 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P4yNx1y9U5EgzuiFpfmnXPZkM6PmgiQitcz5MxCPQ2c=;
        b=W1EQgOzYXSJQprjQLjvwtwJslRvrFbEUVhfTY06l99jlCnYkt0QrECz4ixvFb+WzkF
         nI5KWI9hssaaSX0BF/ddFhWF+YZwDoqE/JvniLs6z4NRUltpgVrkVVzc6YGvwjHxjR61
         rsMhc5f3wyCCj08QWQq2x5BAoCTxbaaiKhZBVts4UiaobRd/E4UPwgStLYpEcyBRD8nz
         VAsZiCjCtQQOAgvPObvDR0Eq9uIbCLYVEU59KtTQLieH3H89HUjqITJhUO+SNIfYa1R4
         L7p5yIUoOLPyibrL1KFoerfbax7JzrmV9gDnkzxWCalRSO83m1yUuHpmvkEST4KltoWo
         bM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P4yNx1y9U5EgzuiFpfmnXPZkM6PmgiQitcz5MxCPQ2c=;
        b=FMv0SmQnbaEN1tQeaqHmtsKhjOZvzoLa771o10aPcniVG5QFB61aI+9ezM70HXNkBQ
         JRjI58oPNZgFlc2hE0qyI76h4iUtEfL89Y1P7D5YVQlI0km6hRVJzIhU4J5BHjQXOt+Q
         xYtoQv0VCEIwBkytLZmI7hJfBp6kOV9wTsVVUOnqDLyPq5c39SH4f5XfWOf0FRciHW0X
         vcn2Gw3qPKlTSrkC+R+4FdYFDy8Wg0+nYi3Zbde04lHwTeZlDAKtCrM/MeiSE8dzZES4
         8HPKZh+O0TtFyGLMNLWCgJzRmlj1EdViTw6RHgG2JneZJHuLhPE3FnuMGj4I5YySopsx
         DKxA==
X-Gm-Message-State: AOAM531Mwky+0G26Z/Cl9586sBx/Ri3dKGBI92SslPIquVSO/p1iW4+D
        MpjJVXJqcbbkxkr7MgRCUZQ=
X-Google-Smtp-Source: ABdhPJzx/3cvIYVr1YzP8V+5en8oMTO7gk7yIRawx1VQsZ5Waso3HWY83zQu4HfIjZirndiO+apE1Q==
X-Received: by 2002:a1c:3bc2:: with SMTP id i185mr12764224wma.157.1590149731455;
        Fri, 22 May 2020 05:15:31 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:15:31 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date:   Fri, 22 May 2020 14:15:23 +0200
Message-Id: <20200522121524.4161539-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added brcm,brcmnand-v2.1 and brcm,brcmnand-v2.2 as possible compatible
strings to support brcmnand controllers v2.1 and v2.2.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: no changes.
 v3: no changes.
 v2: add new patch.

 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 05651a654c66..44335a4f8bfb 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -20,6 +20,8 @@ Required properties:
                      "brcm,brcmnand" and an appropriate version compatibility
                      string, like "brcm,brcmnand-v7.0"
                      Possible values:
+                         brcm,brcmnand-v2.1
+                         brcm,brcmnand-v2.2
                          brcm,brcmnand-v4.0
                          brcm,brcmnand-v5.0
                          brcm,brcmnand-v6.0
-- 
2.26.2

