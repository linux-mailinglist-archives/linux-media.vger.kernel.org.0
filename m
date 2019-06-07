Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153743997F
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbfFGXLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45340 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731535AbfFGXLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:18 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so3613891wre.12;
        Fri, 07 Jun 2019 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMV7ju67dnALzanKXh4JjC//iaUgaVunyZA1YYfWVI4=;
        b=D1taeFuKpCeBaakZK2JwO1C7JIOUxjBNTYJw37vy8WucA2FDWY/rutXj/Qpw0AjJy0
         VBvMIEcqseMpghp7l60/6XYSARUTqS1r8y748t7abeL/nUGz+bkQCML250KaoDSlacUL
         1lgvYSuMrdaLNylilrM6CiNyQNt5V1udU9RO2iGKVLgUWOd3sbN1KWhyeRxJlupFSe5h
         HVt5KZ6OsyqnjPa/cptFB5mmOT83rN/yR+2h41ZkJ4yWd5BSZc9QifvpSygjcAD63py6
         PTvqI2rGwGIQ99gbJ/rndapD+EwIjPn2mwbOjYxF5C5lDmOEwMHQGJhZkeCqDwBJaiJA
         AWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMV7ju67dnALzanKXh4JjC//iaUgaVunyZA1YYfWVI4=;
        b=TSYHxceDN1o6YKsIopYSUlu4GjoPoAAtBq6PXU72IttJ912+/y1S4zOW3+56E38cJW
         bB1dEFMQe7fvy+5JZMgyvjfbT2sbLW4vJ9bwDEqeiEJVMT/wcj4gNwyXI2N3YR4AtHz9
         amvWrfJzEwZLx3i7f3vWrRVoZaKSQz0vfWjKoI1ur1D62TBos7gNeQKy5lmPP+Nylvl7
         1T0neQptWFCBzMh219FjiNESvOBg8n9G0uJYfHwQ/RyVRMHWXwIQyZknTALRF7B68TpW
         jnEcdzHWwHnjmbwhfd2/7Z3e0JEfGCefX9JGfhYLlLR3l1SqrTUA4QFA6wEvTwTu9v7f
         4+dg==
X-Gm-Message-State: APjAAAUtZwPxFZINrIvI4IENxLjXreeCB+WAmGjRw/c9xzi0Yo0kQMWH
        uX2mdDFsNUlunGJSOOP7UQk=
X-Google-Smtp-Source: APXvYqxYMEndAiQdGKsc700CrHbdzz2vLIx6Fq//z6TYlZ9joSLtaGD3Pk68PpctIHwk6bcRFCWzTw==
X-Received: by 2002:adf:dd82:: with SMTP id x2mr11606520wrl.27.1559949076178;
        Fri, 07 Jun 2019 16:11:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:15 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 07/13] dt-bindings: media: sunxi-ir: Add A64 compatible
Date:   Sat,  8 Jun 2019 01:10:54 +0200
Message-Id: <20190607231100.5894-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
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

