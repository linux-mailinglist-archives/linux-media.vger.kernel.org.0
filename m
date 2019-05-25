Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727B22A614
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfEYSKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:10:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33467 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfEYSJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id d9so12965588wrx.0;
        Sat, 25 May 2019 11:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R1TrUBLHizxFWFYnh82Tb6JksFQp4tXKDFJjPZlwuug=;
        b=bztJEtjGVEzLCQKBijd7LY00q29OKEZkESIIv4tobjgRIMG7FxRoCZhUYPHSAugj/F
         8BZKmLYzu1D4pwAaCqaEKHsLbQ6T3TF4Kr0SMWEFuyQrHXCRq+DQPrxS0fgY2jzELadM
         wZl+XsTvjJuTLWqaFodzUjj8zyum8ba9DE3o+YPy9vObFimXnv8JoTObrdj0LaXT/f6p
         wpHhU6h/+GRY8aQSiZhyycH3BErS8heKp+j4uShzgqs/s1/hZK17ijZR1gKdTiwqzX1u
         kBtJsesZH79A4pCweI5oyzyaOTeKE9pXl7u3AcuLDJRvZrgeeEmV19Xobw3zyU1G4RY2
         QzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R1TrUBLHizxFWFYnh82Tb6JksFQp4tXKDFJjPZlwuug=;
        b=Fqpstma4oY3HkLw96AFhOugXQ80g/Go1e40W57naLqDXoiNJStueOofIDbzHvInPcZ
         fAh3+sSJJbPhukIJetCXPS8r5jnQ8+v6G8BQtWLRqyBbhiGNHJZ2p/p+2utSWAQwdqB+
         adkcrpS2Z8aI46nc3jmbI88qA56Aczudm0VwsaiS4H0Yx521APSyFbNoWaup3vNVHWV9
         4qzeL5rjD1yKuK0lDiasSoKWPpo3qd+5FPC0clxdVqW+iayH6IzBauaUzHA/WoEwIR/t
         la3+xBgEgwvH+S81+U1Q/nMlY4h6wnzpNVmJf8H0akgCM6GeSbMbtcFuHI0o0tGqk+2f
         ZtHA==
X-Gm-Message-State: APjAAAVp2GKcyMRa6dI9fVtgAriK4RT1VMZbPOBZDV2ENDJ5t5gB7Dxy
        gFHHT0Bj+XmdNXQzCUBq1Dfxqnc41VusJg==
X-Google-Smtp-Source: APXvYqzrcZPJ2R6fswQPjolYgQ11yKyySqMZbDMfSQX7hfW1xFyWYxs21JhYCO7IdLiI733HYS4S8A==
X-Received: by 2002:a5d:400b:: with SMTP id n11mr18100396wrp.123.1558807776783;
        Sat, 25 May 2019 11:09:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:36 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 07/10] dt-bindings: media: sunxi-ir: Add H6 compatible
Date:   Sat, 25 May 2019 20:09:20 +0200
Message-Id: <20190525180923.6105-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525180923.6105-1-peron.clem@gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is some minor differences between A31 or A64 and H6 driver.

But A31 IR driver is compatible with H6.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 Documentation/devicetree/bindings/media/sunxi-ir.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index da5aeba843de..dc959ce84528 100644
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

