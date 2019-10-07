Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B569CE339
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfJGNVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42996 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbfJGNVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so9252841lfg.9;
        Mon, 07 Oct 2019 06:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqYD4jTL26Lkbsq1KtcLnT62csNab9jmgl1QSZGOUz0=;
        b=N0L/q4RhwlTDYjQL3qyvAE/u8NXu9WXKRH75QjMnab8Vf39ZquOaIpz0K/YmdwopH8
         f52ENi/wk/NASP0/D2FE34oCbp5wX5BqWFL23zbbbAy7+Rba4U5aTDrkcL2VKZAuzEPM
         IeAorZGmE/Tfe5IMsitVvTjm6lVRsDJvohoVmMG7MDbRQWlpkyRdjOXvYTtqDhjl9Cu7
         jeJT06mdEFgHKR0McA3zXa+OH8tlKN/7Zl4pH/1gw4YU61EFFZ5wkZOo7S1JImPzR2oy
         l2wptcGmwq7K12Sbbpxtf/MEtctTi1OmoSic9H8NrULI0sldB83TpRuK5HVt+YIfuCf7
         8SfA==
X-Gm-Message-State: APjAAAWh4R/ZQ6KaCbnL91wxkEFvBc+GWRbmdM+Za8ttt7LupXxOQAPu
        0Ni2upSMjS9cnXe03hSUy7Q=
X-Google-Smtp-Source: APXvYqxIVbxcggiIaXX0a4HyTjY38j2zcYaCHKHhIx5HIBWlTeAvmyKaGK6vXDy0GRtbYosRkRKyWw==
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr17100501lfp.21.1570454466311;
        Mon, 07 Oct 2019 06:21:06 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:05 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 2/6] media: ad5820: DT new optional field enable-gpios
Date:   Mon,  7 Oct 2019 15:20:42 +0200
Message-Id: <20191007132050.27298-5-ribalda@kernel.org>
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

