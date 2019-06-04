Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B4D34D59
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfFDQaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40039 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbfFDQaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so55008wmj.5;
        Tue, 04 Jun 2019 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqR/4nQ0kMEXVQlzSnSXdJ4vrq0kGPr980mhH5i0djg=;
        b=nSnqqJ5cuqApbvO6Zl2Uv0dVoByi7t1WiwNqSFE6gb9a0EWyQfyBtIpKT0E/KaLwUY
         yzFVmHox83ftJWu2EMewdS0c8ixUUWTZxqWOUG5FLAVk/giYGuvWWBONxL3L61SiNfO9
         j47HWYuBieoTifiT3kAV5ppM5lmZobqU3+kNiiscyFUHa744LdRb5XmxAWVGrGkDBtcy
         rJzDa/pygKGBN8M02ZJFGaAtdjkOxgj825Me/+vHHCGE7fxaNkiIFFm/D+6isx7e8Qv4
         zf+gvQuW8PN1koeCLMLvoeDBnPGQ5DbwqlKly7fQ7EulewDgrWwfmdxQiRg03svlwRLh
         7hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqR/4nQ0kMEXVQlzSnSXdJ4vrq0kGPr980mhH5i0djg=;
        b=ZKL8rQ+Rs6NpTim8WDmZ05qBtGARgXzr5aaJcUjwcFZWt9N/CAkFKXp7TYvAuRSjWO
         KtbQLJMlkxfJKJ71B7XtdFGUStc6ssJiQo9WCQPEcTC/HCt7GwoEcFyygwUJlDUn+iSU
         paHPUyRYnsKPvRjWaFEzM/+z1WwZZd6Vp3nMFm0ByyAhHbfxD3bAVxXEnC2nmrbMfb9q
         bGrSYQbFA01nYGdE6qkS0rtRhhZ8neGPrAwZC19bSJ7BTOhzyBMlQMJWgt/cUotd+rIo
         Qi0z7jMJ+zIgcApM5G/6h3rnatoD1wprPNwd9FK2w2wJ9SADhLeQGKhFoXtdBeZ3yFuX
         mGoA==
X-Gm-Message-State: APjAAAUYZNKjlQ03cw8wpmL6hjLlIMxvZbWzNpFDoiyXHTgyw0pi14vu
        zz3f6V9q32hcMsZLsCmGbgo=
X-Google-Smtp-Source: APXvYqyAO097WF3oXNFY33nhIC/Nq8fAGV5LLmxWhXgKSyLYoGxkJbnbHdr7cfUTxxf2leTuZ9JxkA==
X-Received: by 2002:a05:600c:218d:: with SMTP id e13mr18973082wme.101.1559665817974;
        Tue, 04 Jun 2019 09:30:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:17 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 10/13] dt-bindings: media: sunxi-ir: Add H6 compatible
Date:   Tue,  4 Jun 2019 18:29:56 +0200
Message-Id: <20190604162959.29199-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some minor differences between A31 or A64 with H6 IR peripheral.

But A31 IR driver is compatible with H6.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 Documentation/devicetree/bindings/media/sunxi-ir.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 1dd287a4ab3a..81eaf95fb764 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -6,6 +6,7 @@ Required properties:
 	"allwinner,sun5i-a13-ir"
 	"allwinner,sun6i-a31-ir"
 	"allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"
+	"allwinner,sun50i-h6-ir", "allwinner,sun6i-a31-ir"
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
 - clock-names	    : should contain "apb" and "ir" entries;
-- 
2.20.1

