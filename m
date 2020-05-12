Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67B31CEE1D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgELHeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729008AbgELHdk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:33:40 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73F0C061A0F;
        Tue, 12 May 2020 00:33:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m24so10962888wml.2;
        Tue, 12 May 2020 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wKq0OblocqgUWBq4FWdZOwAZXIyc1/tnZx0SSOmf9GY=;
        b=AaC+PLz40PrYk1QteaLXTxbS33yMEGk2kdK9ESxDU17sZXwVCgmJ/MhsfJT+PDC0GP
         OJ90A9e3bNFgSaTkyjgkoJU50p/FofrEmIqAsMqPgyxEG4/Qp/SbxmFR7DNxs3OKZuUC
         Bp4L78a8pijD3F7VtK4VzCKTo4DQn4Sd3v9gPX/Yf8gygv8nUtuSCxtvQzgwvf5PJ7Hx
         dET4SQmz8nm7aUAiB+/Xr7XscRQ9F4JRD6ILitJAz7yUw+HSA7i4XruGCMHt+R+mxyio
         JaGFxlHQbm0hGE8FINJl9W5pkPbB6nVLur3SYeefLaGZHkjQwLTSFcPp59Gp/3ufUvIO
         ulFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKq0OblocqgUWBq4FWdZOwAZXIyc1/tnZx0SSOmf9GY=;
        b=LkHRi3Xvq7WNn2DSAnZecCZCefiFp/sZkc/pEPAVrVsJf+jz8ovLBBuTeqlHerCPPW
         kxGqVQQNTYnXCYxnO7SFCMdsmYzlaPp0830kG0M2/YsmUO7fikwJamngfMNS4zB2io3w
         YTq/znawTj1usrCRgwDA9Dlo/JhvYxNivgH5cffVqkOMcPAIXFzrxYQ7b3lmaTeRC6yl
         p2LFr7KxG3/Fkeg00eO/RklmrBrjO3yvC0NyGJ0ZD7ET9jhrImBr8kZlSrTH6oyDjTFt
         1WS92OxdR8nY/rUa8pkTdlfNF13GXyAfcqHmS9JRvtlzWGSFci91eG2AEpJxG8mFAjIt
         UQcg==
X-Gm-Message-State: AGi0PuYee+aAZPWieGhXGuCdZmPsNVJZz6PPS3OpToldAMDuz0AwDc1C
        nrQ8P1R14ijtl6Fsv/hibsQ=
X-Google-Smtp-Source: APiQypKpQU+sRBnu4YugVLYHjTcTRmLyX7V4CIuyHUXUHwnJzx9zFlbWQdFPuVC8uZJ2zsgvyvFG2w==
X-Received: by 2002:a1c:108:: with SMTP id 8mr13028297wmb.148.1589268818521;
        Tue, 12 May 2020 00:33:38 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:33:38 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date:   Tue, 12 May 2020 09:33:28 +0200
Message-Id: <20200512073329.742893-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
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
 v2: add new patch

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

