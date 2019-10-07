Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9111CCE33E
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfJGNVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:16 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37019 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbfJGNVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id w67so9267647lff.4;
        Mon, 07 Oct 2019 06:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtunKeo/Z/Gny4X+yFZnXKaRyWAlxIelYmZYNvgXgHc=;
        b=Ka5bOMMFJ/ZtuOb7sfZzbQVHCDB9ieZBWcybhs0o7p2HT5/c7YYfbYzB8uFc3tECiV
         ihOtsMEI2B9JFYaja39ed+gX6i72rHW0//AGpJfPc8bhltEz0e9JE9N87IckWvDjt8qI
         bWoO1nwqqwUS4ZrxWL+NQhAXZwun7uwqPsRqEvanlKH3Kd43giJiJvcgehm8XJB/ZuHt
         RDXSAPXN3cwSQp61B3zEPS0CJmWq6oVU6dfvaS/hSChRqfbSxvZ1ZEIF9YGWDtjK8G3i
         F7tm8LVUHS4pKUkvy6T/sDoPuUQqcOTug41Migk6yXmFzNjGN/cfRKbg+I/qqSNl1EI9
         13vg==
X-Gm-Message-State: APjAAAUPhTaaoePV19ff3jnqK1Y7/Ut+dW3RaLef8iAdaGjHHQ9BcNoA
        XkI8/+k7xLYmDDCmhJpfnZQ=
X-Google-Smtp-Source: APXvYqz5Ank+tQbMh1INUagugHlpRR8z9/MgJYX3dFe2x4wABZiMRjkJRW5Yv+VHcApQQ7hb/2QDOw==
X-Received: by 2002:ac2:4902:: with SMTP id n2mr17058988lfi.0.1570454472955;
        Mon, 07 Oct 2019 06:21:12 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:11 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 4/6] ad5820: Add support for of-autoload
Date:   Mon,  7 Oct 2019 15:20:45 +0200
Message-Id: <20191007132050.27298-8-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132050.27298-1-ribalda@kernel.org>
References: <20191007132050.27298-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since kernel 4.16, i2c devices with DT compatible tag are modprobed
using their DT modalias.
Without this patch, if this driver is build as module it would never
be autoprobed.

There is no need to mask it with CONFIG_OF to allow ACPI loading, this
also builds find with CONFIG_OF=n.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ad5820.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 76aab651f217..5651609e5095 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -364,12 +364,19 @@ static const struct i2c_device_id ad5820_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ad5820_id_table);
 
+static const struct of_device_id ad5820_of_table[] = {
+	{ .compatible = "adi,ad5820" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad5820_of_table);
+
 static SIMPLE_DEV_PM_OPS(ad5820_pm, ad5820_suspend, ad5820_resume);
 
 static struct i2c_driver ad5820_i2c_driver = {
 	.driver		= {
 		.name	= AD5820_NAME,
 		.pm	= &ad5820_pm,
+		.of_match_table = ad5820_of_table,
 	},
 	.probe		= ad5820_probe,
 	.remove		= ad5820_remove,
-- 
2.23.0

