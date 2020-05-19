Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8B91D8D0A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 03:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgESBRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 21:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgESBRG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 21:17:06 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9FEC05BD09
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:17:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m18so3506814ljo.5
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=QY2FcltY0EU5SZNLeQZ/bghwB586RniSqq2Ul+aCeaU=;
        b=M8ZM1SoMkxd47Lromp+963VReUpjvPpHbVv3ObLi4Id6r2e2fZqM8oiAovSpnEXPVy
         JzwAyJSwspm+N3YFoak3QZdCaibZLS1xSH2hVruJShCv2SxIpmEvOOBIwPvCxKMEMmTF
         3QcYKEj1DZ7+kN3+Xn0YkgSPZ12x1++yz8es5kVd3QuodInBo2xaZ1sbdI1a283o/xvQ
         anGw67YXxLmZ8lybkh6LolDwI58vX0zL/c9/j0j0TvowcPnCzO87PWQwGcBzma38D2J0
         GZyBhl+wbrC9IeJ7KE/n1BZyVQZvF6LlVIf5RZXVZBe7PN9CiXDVuQYNPW3aXPSDvwe/
         lh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=QY2FcltY0EU5SZNLeQZ/bghwB586RniSqq2Ul+aCeaU=;
        b=JPiG+OD/1kkZbkNiZ0lAI/OQR823KV9siFzJgzCG4fljYbwlFkf1STwutlV+lXMTMM
         PPERlIAuDUlL1Aaks1zciTi1La2O/O6q3SWiGcx35NvC6L93s74EeITSv0VF1D+ldqLC
         0sE0SWwat3yOZRboG5E5/c+wPeLpYAJfUM/X+emvJfLIOXKYmvGJToZ/3MQd+x62Ioae
         talZwZlNY5Jw2A4wbCbBRD8DULJk+HuPwjFLioqB9P4lQB/ny/JRKWkLNnPrK9aAGUFm
         /j3MGAQo6EoWxQS3fu93nEx1/NJ+DpP26sAn4gAjdOeniovbMFRt1wFwAtnhbZTiF3J5
         b7tQ==
X-Gm-Message-State: AOAM532VSGmjw/LGD5gHCl5HzcrKB1G686mEB84I7C06xyWPkcDQHIf/
        4BrcRbZK/xvi2qVx0FCOyQaWCw==
X-Google-Smtp-Source: ABdhPJwnGIquuk4Es/g66AqivQwR0BXPGS+TOz2v2aoAyrgSBcJh0g1WaEYtdHV4/uMMQ4+TxEAPDQ==
X-Received: by 2002:a05:651c:1207:: with SMTP id i7mr11981865lja.86.1589851023349;
        Mon, 18 May 2020 18:17:03 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:17:02 -0700 (PDT)
From:   Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Luis Oliveira <lolivei@synopsys.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: [PATCH v2 6/6] media: dt-bindings: ov5647: Add property for non-continuous clock
Date:   Tue, 19 May 2020 04:16:21 +0300
Message-Id: <d7c647ee8e886560e59ebaf96c7a7daa3643756c.1589850165.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add optional clock-noncontinuous property to configure whether the
clock is continuous or not.

Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
---
 Documentation/devicetree/bindings/media/i2c/ov5647.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
index 70f06c24f470..fefba0a69b07 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
@@ -12,6 +12,8 @@ Required properties:
 
 Optional Properties:
 - pwdn-gpios: reference to the GPIO connected to the pwdn pin, if any.
+- clock-noncontinuous: presence of this boolean property decides whether the
+		       MIPI CSI-2 clock is continuous or non-continuous.
 
 The common video interfaces bindings (see video-interfaces.txt) should be
 used to specify link to the image data receiver. The OV5647 device
@@ -33,6 +35,7 @@ Example:
 			port {
 				camera_1: endpoint {
 					remote-endpoint = <&csi1_ep1>;
+					clock-noncontinuous;
 				};
 			};
 		};
-- 
2.17.1

