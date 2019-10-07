Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7CCE343
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfJGNV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40465 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbfJGNVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id d17so9258388lfa.7;
        Mon, 07 Oct 2019 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85dVJxc5Go/ZeDNecXfIZl1Or+Zhk6XQDSwO01sY1ps=;
        b=bOEgEkYrl3e33BL4fx711tKjOG+0B6XMHsnIZX0KGXjWN+UMGAF3Mlk/EujtqZTBL7
         OkjS37cWG1M5cZoFyDsrXyZUOdfU4lhe2N/HaS8aGtPOkEH9pghH9ulrvcUEbXNMNV1j
         tMwvSkTNePn9dUWJtnBSUIByb6f9eZaKBgrNp9KxpPbkOah8xb82GdvUEodzvOEXDUTJ
         877OBi0qs6WTsMnb9jbtTnvqinimv17g/pX/Sm16cbAyq388IxP56zX1wATBjm0GKoin
         nJcJc7tL6wq5Z/qYy49RAaI6Paa9RrMS9vqoeqmuy2rD2tCOP0euHhxmJdw8dl50CB4y
         u0Wg==
X-Gm-Message-State: APjAAAV8Km0fvhKypaQhoxWORt05vMq6gNjELUtdi+IBJmnDLTMLWPqp
        06ezL4xHnEFvHZCUr1Mrjk8mkdfyjIq8LA==
X-Google-Smtp-Source: APXvYqzwfVmA2n/9U6jKmKyrIDlwdZ3QqHt0oLnPp98Dew2HCDTkMUXX5gZMf8Ci3KfU31PLFFoasw==
X-Received: by 2002:ac2:4289:: with SMTP id m9mr13069519lfh.139.1570454480038;
        Mon, 07 Oct 2019 06:21:20 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:19 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 5/6] media: ad5820: DT new compatible devices
Date:   Mon,  7 Oct 2019 15:20:48 +0200
Message-Id: <20191007132050.27298-11-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132050.27298-1-ribalda@kernel.org>
References: <20191007132050.27298-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document new compatible devices.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 Documentation/devicetree/bindings/media/i2c/ad5820.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
index db596e8eb0ba..5764cbedf9b7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ad5820.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
@@ -2,7 +2,10 @@
 
 Required Properties:
 
-  - compatible: Must contain "adi,ad5820"
+  - compatible: Must contain one of:
+		- "adi,ad5820"
+		- "adi,ad5821"
+		- "adi,ad5823"
 
   - reg: I2C slave address
 
-- 
2.23.0

