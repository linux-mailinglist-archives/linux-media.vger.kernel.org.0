Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333202CB6B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfE1QPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54156 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbfE1QPH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id d17so3613296wmb.3;
        Tue, 28 May 2019 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfFUA/FtBsg0My+1YWgyWmibdI4dMuoplvWrY93VZPg=;
        b=FbE7VNe6zJsNuuwtVyQngMaaBCRylWn6YroOYn6qPwakGwJjZEPQ0B/Cthylt1qvuN
         mZxE/Sc4mxe2++lDqeh2bqbFpGIYSHeDFYBEIOsrASzWRULECjr7ZUdXqsipldUA5KDj
         q57HOKbTjNJTf+H1Z1PjfjFHq3bZWMzEkyEhJ0kNun+m3jhMJrEmYUKlbGMkN2PMJNOL
         CLEUhOcDcZsto9LdWRUEk8SrdlqBDA7ucy5iUnS+/7u1AlJjUx4+2Yx5pXXh3BxJXqjz
         /CDhXhhC06PZAfIqoyw8qB9wrsObdzSoxrvI64VHrqfBUr0hfLbzEuKsiJDvDsf6LLQJ
         cemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfFUA/FtBsg0My+1YWgyWmibdI4dMuoplvWrY93VZPg=;
        b=bT51sge6qzZEVUojYsm4OsNYy4/kadoy6021Bctrwqx+kGz3JvVCYS//orFJv0tgLP
         7OIanyk55E45/TPZWyHdfmmrcvfP0O92xXLYe5JewmugiFkArcnXJMkATgWGN4o22ByL
         u8fkH9b+EnwRLIKMJbMnYfZ+UiR4Qb3se5axH0n9mebNNm3LcOa655XNpQLSkj93Bvnu
         ejWrFwtfiJgvaDWI9v/8mdbI30NV+2Rq4w9gOM+nSK8HTF6T02JiN6Sz7GsEpfz7c/H/
         J2BUBmTNXAfG0LbhBa/W9rz3yvlf8sf5J9dU7LblGtedWW3Eq523dUMuaIPqGgAU/451
         PMvA==
X-Gm-Message-State: APjAAAXIC0BwdFHSza8TmzeSU1W5sVaYNbdGC0ywzJwxU9c2Ea5lSn3G
        BGInNYXN7tBvfERs/PdmWWk=
X-Google-Smtp-Source: APXvYqyOe1RfR1bZXRwUuiofj7zQ4yGMR5FXQfdvTPgmVpDJJLSumvYusoAbSBiyS2xvw8LEIY+ejg==
X-Received: by 2002:a7b:c5ca:: with SMTP id n10mr3490534wmk.136.1559060105292;
        Tue, 28 May 2019 09:15:05 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:04 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 09/12] dt-bindings: media: sunxi-ir: Add H6 compatible
Date:   Tue, 28 May 2019 18:14:37 +0200
Message-Id: <20190528161440.27172-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
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

