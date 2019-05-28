Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B95FA2CB7D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfE1QPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44222 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfE1QPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so12527916wru.11;
        Tue, 28 May 2019 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lc9tkqKyrUQ5ybnMKprgGIZIid5kSZLfkgDo+bRAOdQ=;
        b=fwQLKvh5/S7iFzkUlVTAYUVkkE/lVKgHJmIDwwiVBqggvIzhiGITP3ApoPrypCyb9F
         diNds2S+qxoXdduel3jePDqml5+sOKA3uLGy328bUBXS+29giS69GXO2aUKHAwSLQnAC
         If79va1gLrApIMvfqA44I4qUnXwgQtLPmCFHh9aHTLf1k748Zp75c6eWbqJBVr1n+5Li
         v5wfvpj4xYNf/SViB6fd5tm8gxkiV7Qgr4aZJDeAYrPRkbDZzCtcDmYG1RsyLwNBYSJx
         fu4G8ekdfQQd9bbQOv2FqYOb3MFr+knpfmHFoHyhhY5agWq+6RKufaUJ6J4Vf5/XsNlB
         KS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lc9tkqKyrUQ5ybnMKprgGIZIid5kSZLfkgDo+bRAOdQ=;
        b=m0TgRg5dZOqnXgNvhB3uuAPz5Pwa2/TJhBvqnLK2qQ4HCt6GHRq/uwNuyJPcxTfBel
         eUMqUP+XMxWFzAXniGxKG5W9rXREvZNni53DNwmR9Rv4d4Mr78mWeHenurTcrZ8Yjt8c
         vuGFt4QHhKZD5fuTyJnEwoLph9BmvAFwOfMotAJT94lPVBchYTpo2Ay26rgwSqpCq3jh
         FCWNkLZfazq0NrdIpEvQr6Rxgt+NMKKsw2J1WzjkiVoL5+I6memvhwqh/I3XPxPehTSC
         Hva4TFd9kcX7IyuxGrDmlYsSFZQVRJW5aSjBpwhfphmZs5dgKV92cMTOkh5WiEeLr3O9
         5xeA==
X-Gm-Message-State: APjAAAXRJNp+BFePK+a5u1Yr6U1e/ycnVvW653U7FMVwau2hpD/RkK53
        KhS6CZJ6YFndZ5yWjwQEInA=
X-Google-Smtp-Source: APXvYqwL0cL3QCeeaDPY071jkNLGK3/vjrUceMyKFnaAy+HZOfNPOmfTRE3d4/jH96rR456TgdwZlA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr2525397wrp.149.1559060101572;
        Tue, 28 May 2019 09:15:01 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:00 -0700 (PDT)
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
Subject: [PATCH v3 06/12] dt-bindings: media: sunxi-ir: Add A64 compatible
Date:   Tue, 28 May 2019 18:14:34 +0200
Message-Id: <20190528161440.27172-7-peron.clem@gmail.com>
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

