Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6485CE338
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfJGNVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37925 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGNVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id b20so13631729ljj.5;
        Mon, 07 Oct 2019 06:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqYD4jTL26Lkbsq1KtcLnT62csNab9jmgl1QSZGOUz0=;
        b=h9XAge8jlyIGu1caaQLjorMgjmYP0S3VCLWBz94CIewBBZzprA7dYoVI0N7aZ2X53x
         NuHUyUa7wW2rf4Ue3NnGrxfeSmG/PU8Y1xjtpzDh84vt3LcbC3Zpkv6Q3O5ODoFloNkT
         kzIJq/AihzjP2dCkP5dqMLMNvm5WltARL737mbpB2dZ3OA5BnfpaeBqCgCV47iNgGAol
         pmIW5j6RsGiq1SkHpohZ+9ClNteDJVVcyF7bUmpNW1203f5ogVYQiU8s1nKqXpHzpCzl
         jNLvmc0l9/PFDtSMC3UhuW5bBzZeu+OSajirFDOYupfas1qwXTlc4cJtlWH3skDcs2VG
         ASCw==
X-Gm-Message-State: APjAAAU7+JGyGjefnY77SQCtzuintCGfUPl4ewNvk8EEQHHZXB+lbHt3
        qSYEq471M8ZL4Kgvu7MKLcMcShxrDAOXCQ==
X-Google-Smtp-Source: APXvYqwDfIe/mUugzv8kxQDjhZLESln0lMjXZDCO2ggmeNmsqhWgcYP0/h8lg4VykblEfTyDhUmIkw==
X-Received: by 2002:a05:651c:1102:: with SMTP id d2mr18864276ljo.74.1570454463705;
        Mon, 07 Oct 2019 06:21:03 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:02 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 2/6] ad5820: DT new optional field enable-gpios
Date:   Mon,  7 Oct 2019 15:20:41 +0200
Message-Id: <20191007132050.27298-4-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132050.27298-1-ribalda@kernel.org>
References: <20191007132050.27298-1-ribalda@kernel.org>
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

