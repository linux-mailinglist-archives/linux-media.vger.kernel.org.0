Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3682AC7B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfEZWZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:50 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44418 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfEZWZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id w13so6617743wru.11;
        Sun, 26 May 2019 15:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lc9tkqKyrUQ5ybnMKprgGIZIid5kSZLfkgDo+bRAOdQ=;
        b=klAOx+HfmYTw/8Yq5Z9Z7zoBFd0OBdip2dn3Rmyo4lHbtZsRaeyaDNO7P9DSMFFGdN
         glJOISUhVbNcyEGaatP61u8UYu9Xaa3Yqqo2N/4y+VbCpAxvUE2gNrAEy/COEyn3oh3/
         jkIaplzNNdkTrkPsgeMyzXiW9lcq/WwXneLVDkNJErDm9sf+23Wq+7ZD0al9sqwuVl81
         PSIXQY53c6iXav4ck3FsJyS9S6pLwvKdoJ8YJ4NJX23yGKFuVzLIZt/L0ZO4vkXjkiOT
         93Vp60xAKV+vac25lK13kKK8bAun4yyuJq6hfLY/VTDotDIX0DFNcXUMjCBcxAc6wBE4
         fusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lc9tkqKyrUQ5ybnMKprgGIZIid5kSZLfkgDo+bRAOdQ=;
        b=bD71EDy+FWYp3QoQZKJSc97E8Q/nKQ6ynlJ2vLoGdSh2MQo/QRMZOPj+wJKdbKPh1y
         EKeX70ewI3rMRo+3vStD6/tqWfQojUxCJ0CjPuihZG0w9n2sHKgYVL0MiMAEMcYt4XT/
         iZ7FvPgXGVDXl7jJMXlJiXeCAXNafa8XZIkPqbwCo76Uf86ZrV4jVvJQg2R2v+D9cwVl
         vY5oLu/VmbYcB9OXgYg7bFLAwID/Lq4jhoBqaL8HJkMiwMcO5+cw4Ni4mwIj7bd7lADF
         NAZ2tR7mgIWXOQB+vMCTlUJ+kqWLNmNsoXBsl4TALMKGPIFvJQO+8ldPmvGOCUaqkMEH
         FXQw==
X-Gm-Message-State: APjAAAVn5DZ3xNxy0AB6V48aBJXegnIgnuHy39WnITzAD/xMlIshXIFE
        IfBvPhEVoJUKErqY2MDxMeY=
X-Google-Smtp-Source: APXvYqxsbYPyxTGP5DkswvSnejLVACIIPGGCwxeFSFdOifI61ffIiR4kdft4KEdZ6jhd1Ba8cfpkSg==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr10869878wrv.25.1558909548083;
        Sun, 26 May 2019 15:25:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:47 -0700 (PDT)
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
Subject: [PATCH v2 04/10] dt-bindings: media: sunxi-ir: Add A64 compatible
Date:   Mon, 27 May 2019 00:25:30 +0200
Message-Id: <20190526222536.10917-5-peron.clem@gmail.com>
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

There are some minor differences between A31 and A64 driver.

But A31 IR driver is compatible with A64.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
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

