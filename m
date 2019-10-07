Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3B2CE399
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbfJGN3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:29:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40059 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfJGN3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:29:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so13657579ljw.7;
        Mon, 07 Oct 2019 06:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85dVJxc5Go/ZeDNecXfIZl1Or+Zhk6XQDSwO01sY1ps=;
        b=gzNNeeBszqp3/KV+na3cTXka/kkqVPVugqBXLgWKMFoCoXTBSHjHHko9SwborGKmro
         i3FOMrRfuAr6eNVgbbb+STpckXS9/1u07qLcHEDcUdktf28+PGsEg4k7i33rf6+KrclB
         MdhvzaV5dXo+P7ECoAeCtiSR45lJhpXOLUsCGLnrVz5n2RuKZcC6+9La7sxCqEKvoSBC
         PYxzMsBbyC4W7BmPArWDiN8CiA/WdhMV7FgYkij8D+7W+ysd9qWcAoygLZuT+T5dJ/ur
         ThoZ5lG9RtdKOWLdqy06dX0BtqdZ3w+gzsfARcx41q3qDKz9OqVF4H4QIaApr/feYFDV
         9yHg==
X-Gm-Message-State: APjAAAWXvLxNY05aRBsPf5PO4+Ohoojzd2CibXZ4zeGIRwnmj5UqHuHQ
        M+IbXCUzzDy7J8yWANfxUN8=
X-Google-Smtp-Source: APXvYqwvWME0xvLnEG+UUjHxN+U6aEntTPN2I+EsnnNToVC4+03YuG+aEVvV70wTSxZ0eO6UvOobTw==
X-Received: by 2002:a2e:84ce:: with SMTP id q14mr11639389ljh.250.1570454948315;
        Mon, 07 Oct 2019 06:29:08 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id f22sm2702245lfk.56.2019.10.07.06.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:29:07 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 5/6] media: ad5820: DT new compatible devices
Date:   Mon,  7 Oct 2019 15:28:55 +0200
Message-Id: <20191007132856.27948-6-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132856.27948-1-ribalda@kernel.org>
References: <20191007132856.27948-1-ribalda@kernel.org>
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

