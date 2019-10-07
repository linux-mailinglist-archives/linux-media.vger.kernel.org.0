Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6265ACE331
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfJGNVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:21 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35130 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbfJGNVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:20 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so13637799lji.2;
        Mon, 07 Oct 2019 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85dVJxc5Go/ZeDNecXfIZl1Or+Zhk6XQDSwO01sY1ps=;
        b=Wcoeo6mzx3dncHyYoUB6QXVPbMPJgY0JzBpYJxcpjrhVGruroDOpyg7d6+UOAPAP4W
         LbMt47VIPh7Pt8918clafZPMYmprN1m0vySSdItMxwNM16nS4oAxhLvsXof3Zz+VL6iI
         Y0leTFn8pjESVNztS+Mr6fBBQ4hSaS6tH4TLtJQYHoOhsE2UD3Rkx8YxbF9sscr8KPca
         nBxaw6GSzWWtrW8++b7K/WzN/TtjsOJ/qcTO4qA1TXFCYqlgJzB7Dm2rmPV/jh5wtiIW
         VdRJ7IGCyCdXa++gO/VSuH94JEMbKNjJ3wD2XWlCffnQEYvWs0aPNXcdN6czgchz8S94
         Qhag==
X-Gm-Message-State: APjAAAXZ3LGKcEMwg56KdecFkk6Pea1uOSmaieF+3h3vbuA+UrVJwrbS
        bylRzLXGS9qfj/KqqGtICbU=
X-Google-Smtp-Source: APXvYqwiLSTKdVOFIY8WgaeBunLsCGFVcf3kuoeei/5/yKb+L3k/LDhcTnI6Y1NHVwQ5NjvySirDVA==
X-Received: by 2002:a2e:9652:: with SMTP id z18mr14259586ljh.249.1570454477573;
        Mon, 07 Oct 2019 06:21:17 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:16 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 5/6] ad5820: DT new compatible devices
Date:   Mon,  7 Oct 2019 15:20:47 +0200
Message-Id: <20191007132050.27298-10-ribalda@kernel.org>
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

