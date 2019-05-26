Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD1D2AC80
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfEZWZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36925 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfEZWZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id h1so847102wro.4;
        Sun, 26 May 2019 15:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfFUA/FtBsg0My+1YWgyWmibdI4dMuoplvWrY93VZPg=;
        b=TmLyQMTzxNlDvMDpq/v4obLZ5cBfs+Eah78F1fP5yW3/ULBAsc8S6q/MYlBl7JnaIx
         cuY7bjgKYs2TpF+qrkAghyFpMKx/O2WNsISJKc/zPMDvZFVz5VaPy0fEQXzVrl0fZd8O
         xsrxhDIXZdMMywYDMF040JBk2hizL6lIKXLhCquwfdHGA1CSGGFb5WDucx4DXPelJhQT
         UPIUq5i81N/o5um8/RMKBN0bq2KkmlAQxzwB2AXv6AOQb7CSsYU2D6ipR7G6oY62sUPF
         5BUUDHAWyaHYHMJ95CJazAoZKqeJ81joOfoyzLP6uewG6Xts431qtFKeZ0NRkA675k5l
         02CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfFUA/FtBsg0My+1YWgyWmibdI4dMuoplvWrY93VZPg=;
        b=SKyoBL8tiGqqVvZ1YPW5vecM5/BNGHED4sf8aLXEUcUISDzgUqIVtLjp6DfZAzK0YD
         iI0fJqG5iQbAHTJPQm6TQddxZZwdGy+cySh0jzcXdbqYs8EnmzXoNGdaB1mcJBbre7Xg
         FwkrjHpi1G0V2QgELMnT6ZhHrsaVtSKExYka0vktfcdB55Rz8978lxGK/Ew07Kjj54cd
         noDyYU4N3evmwpIdcwO9wnuChhr6I0wK+7O0tc3cQY3KaTXVQ0z/NC19DiRhVMU+BCzw
         FZmKiQw8IEAPWSrrKyx5fuF6vrhLHf5/KkihFEQmt4XczTygQsqfBDH6EkoRgiKWND46
         W9vA==
X-Gm-Message-State: APjAAAWDfNFFsLEt5AcHIDiHU3FtqSCq6VJYEv2M/GlOl3GXqPiKT7dH
        96stbZtGTsljr4k++o59cdM=
X-Google-Smtp-Source: APXvYqyear9blP86T2MNWn79SUP2m1/FCW8iYuubkJwpsPjuck36zawUuWPezuETPh26SIP94gxRXQ==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr6520699wrl.76.1558909551466;
        Sun, 26 May 2019 15:25:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:50 -0700 (PDT)
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
Subject: [PATCH v2 07/10] dt-bindings: media: sunxi-ir: Add H6 compatible
Date:   Mon, 27 May 2019 00:25:33 +0200
Message-Id: <20190526222536.10917-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com>
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

