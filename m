Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532CC34D62
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbfFDQav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33859 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbfFDQaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so2656089wmd.1;
        Tue, 04 Jun 2019 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMV7ju67dnALzanKXh4JjC//iaUgaVunyZA1YYfWVI4=;
        b=DCoh8E9BkPijkg7yg9/4DPPpnIwGDDmPR57Us/q7Aj6s6TX3XyWobi+3Xv+tqX4T8b
         7sU3JGk1FvnWGoB4wIN/vaCumT1W+CCXYH6IePP8KfZPzNVLFUQVgWPCgXi1xJZxcjGF
         dzrG5DC/mehYVBXye8JsJqx/7N2WoG+EG1ZyynlAZmFf9EKaYRqfUNW+AhiBPbrKZCGY
         Hi1R+aaMhqAXKu4NQHIPC6UpGokjTcDm39WPq4YElNhorHq1GYmWE7vVwLC1gHo9LyRH
         Xtk1fg5Uu0UlHFccWWTr3PEDwXbnYkpu4+giknBjqXI43AJ54N2lX+Sl1GFYVViqwcPq
         s9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMV7ju67dnALzanKXh4JjC//iaUgaVunyZA1YYfWVI4=;
        b=YzC+FPyBxhQqQkkG13cTJMdFaRRD4uU4EnH5GySLkjOc1fLNtG3hq4ME2FF7YgLZlj
         Lgv9rVHe8DI1M9gGwvwqqeKd1fAlfb76NUudrScmtodyU9Myb6d/KEaRktdkybbX28TQ
         qhXnwipEPIP7rjyGOFvIYbzC1azb+n97SwkBsm7NVz1AM/r+PVKmeLfbbdmPuSVyJytF
         eW2H/0ZKKbFxc0fA3XOKVy/Dz8PwWrx2u2PAweOWORN+DlaV2wBS0aOBX3jJkbEBcu4O
         JYcTZgw/g1XPrdwVAv1ESK4pOZvbMXKzd43vJ6OSMRRcI9Gysb2x15Cov3J6WjT1vA1t
         ZjTQ==
X-Gm-Message-State: APjAAAUTu74OsyvMeeJfCGFrOuHZRZsFizWLaG2EAu4w/7zYA0IGddUt
        pPDwNmyY9CM+nXSNSakQGGY=
X-Google-Smtp-Source: APXvYqyiIHwvp/J88wh/a2vXFZ112RokaYYJkHbL7nMpef5MAfOOL93Z/xT6uSngXS4GT+4sL3/OOA==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr7449245wme.51.1559665814303;
        Tue, 04 Jun 2019 09:30:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:12 -0700 (PDT)
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
Subject: [PATCH v4 07/13] dt-bindings: media: sunxi-ir: Add A64 compatible
Date:   Tue,  4 Jun 2019 18:29:53 +0200
Message-Id: <20190604162959.29199-8-peron.clem@gmail.com>
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

There are some minor differences between A31 and A64 driver.

But A31 IR driver is compatible with A64.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 Documentation/devicetree/bindings/media/sunxi-ir.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 2e59a32a7e33..1dd287a4ab3a 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -5,6 +5,7 @@ Required properties:
 	"allwinner,sun4i-a10-ir"
 	"allwinner,sun5i-a13-ir"
 	"allwinner,sun6i-a31-ir"
+	"allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
 - clock-names	    : should contain "apb" and "ir" entries;
-- 
2.20.1

