Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70166CE3AA
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfJGN3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:29:07 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45942 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGN3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:29:06 -0400
Received: by mail-lf1-f67.google.com with SMTP id r134so9243943lff.12;
        Mon, 07 Oct 2019 06:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqYD4jTL26Lkbsq1KtcLnT62csNab9jmgl1QSZGOUz0=;
        b=HwpPyQy5MQQ/Wi7GTUG/tRb/7MfSNtVgjW7FTxduVp5StaSEnX3kkChL4bCxkOFUOd
         6v4UcsmKAbmgwMzEkkdhYcDqIN0fNG4jyKgIv/quGZtZrCGbL1fz+sQMdT0n+2wwwHTh
         1T9QsweUSpn+SbSkxkhjn25hez4OfMQkZKtzn47Bk3TrEsmRcGEu8rY4q8QyqxN9PShY
         3Il2P1f6jARXhN/gVLf9dOGRJOhAbrR+O50NUAd7rJ5ZcfNtdfbnHT5pYR8SYjCAfbxU
         QX7R2gouNpp7YGmO4JDHyTDsPB3jPRvgz9IFK0uxbs8ntIbIruHHeqIHE64wPzSIjSw6
         XZGg==
X-Gm-Message-State: APjAAAX9/uQgxe+za2aahXwcpQnKFQnROwYsmTJaTrBy6tSmTicw0y+E
        LrCEmh3XH3sQmTww7ccBWU3R+UsEVRsYag==
X-Google-Smtp-Source: APXvYqyNQpxEHd5z1D3Qz5m5IShyRZbwN+ND3vrGJDazyPxUYYpX8ZIHxfsV/SZf1y1JaBb9QFF/bA==
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr17121965lfp.21.1570454944104;
        Mon, 07 Oct 2019 06:29:04 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id f22sm2702245lfk.56.2019.10.07.06.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:29:02 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 2/6] media: ad5820: DT new optional field enable-gpios
Date:   Mon,  7 Oct 2019 15:28:52 +0200
Message-Id: <20191007132856.27948-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132856.27948-1-ribalda@kernel.org>
References: <20191007132856.27948-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document new enable-gpio field. It can be used to disable the part
without turning down its regulator.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/ad5820.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
index 5940ca11c021..db596e8eb0ba 100644
--- a/Documentation/devicetree/bindings/media/i2c/ad5820.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
@@ -8,6 +8,11 @@ Required Properties:
 
   - VANA-supply: supply of voltage for VANA pin
 
+Optional properties:
+
+   - enable-gpios : GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is
+active low, a high level on the pin enables the device.
+
 Example:
 
        ad5820: coil@c {
@@ -15,5 +20,6 @@ Example:
                reg = <0x0c>;
 
                VANA-supply = <&vaux4>;
+               enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
        };
 
-- 
2.23.0

