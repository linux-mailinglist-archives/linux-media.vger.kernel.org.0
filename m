Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386421DE0D9
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgEVHZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbgEVHZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:25:34 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027BBC061A0E;
        Fri, 22 May 2020 00:25:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e16so9118053wra.7;
        Fri, 22 May 2020 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x75i3phefTR1ORx78SyNoqoxRqG/EDeVxeevNjATQeU=;
        b=aSBx059HVjfRZfYYo4tcdNKvhRS60qhw9XTOESwG7HB/GkNu9mep0pZvm/YIhUT2tj
         WLLdW5JyDPTNRc0+tvgqXqnA+C3fJ61PNaVOMzpslIUUfbL2ckAqfqBCmEah9PkCwQGq
         EgvzT/KTrGaaybjAtO2Egrf4DjOkEOeF/NOm/TDSgd7tKCxIGt0/B1l8ZpISpUkUwNat
         BOAXjPUas3lzvtT41X/ZG/Ndy04BqemTVltecc75kPqOX2iR2E9VP3pQ3ufDWXruBhlF
         I2oADb+qEwxx7mg4qG9iw9lQoAX/QkuxDxpHoAtMvlThdtZL+oUzb/hhDsvGVjgKMQ/9
         oHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x75i3phefTR1ORx78SyNoqoxRqG/EDeVxeevNjATQeU=;
        b=AuatuF5LxAZb/y2H/hyLYoeu3KyGZTY7ZTq7t80HztOEFTktVLyUCOyB0Jfj2E5Fqj
         vK9uv0vWUIG7/QoYlW39Y1hU3ML2dMbrPCA6uC4zS/xmjhq1+bkh4F9KFjL0CQfcXRqL
         vZKQjMrob/6DTp3g/9t0Z9ZqE7KK3OH+zYtwMFYqjS0CnMT1Ik7CwYXHIAA+B7wFo01W
         gaAxZUpAAt7/rHXuWQcfq5rX3xp4HnwEAHEb76lmAdU6B4igiizr+NodYhj9C4HnaKt8
         Ai8OrOLenLMqmRUPoRjKnKAJ/5QtfFTyOcC8Z2xxpWmgM4ZJ/QfBvOGxfDOfKL0M60If
         6Nzg==
X-Gm-Message-State: AOAM533s8AsRzuRBAUuxoTW4U45trSBrstEcYG40WUGowJW3x0u3UBUf
        G7K1FjvIySWGJUh0flPSPrQ=
X-Google-Smtp-Source: ABdhPJzjAc5EN2K3mse8zYF53gQPuxy/iTC2y7LkytXy6k11JuJnEwAzwliXSlmQ81PWickoLvPEYw==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr2349097wrt.249.1590132332654;
        Fri, 22 May 2020 00:25:32 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:25:32 -0700 (PDT)
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
Subject: [PATCH v3 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date:   Fri, 22 May 2020 09:25:24 +0200
Message-Id: <20200522072525.3919332-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
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

