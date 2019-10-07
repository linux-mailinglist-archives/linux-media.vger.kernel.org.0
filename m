Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AED1CE3B0
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbfJGN3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:29:09 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43675 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfJGN3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:29:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id n14so13622125ljj.10;
        Mon, 07 Oct 2019 06:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtunKeo/Z/Gny4X+yFZnXKaRyWAlxIelYmZYNvgXgHc=;
        b=kBfPkGuw4B8aHiaCh32bNFCUYURftznPeGgnHK62Y0UpOVqhiRCgvriJ7NBbOAuRFt
         tZ4zQxQ7bhVHl3A/FFoA6pnxEw4lz+sYFx4wqT2mh3L5/UNoZzJ+7RyHsk9gToTFHXxO
         AdmhaDZVGcfr4VDFMrc+Qe9zooBO/j1UccCzPzlBAkhp3T59vt+wI7i1LKDZCrSEGtRk
         CaZjWXx3Kx1Cx65xEe9STzyVzalKx8y9zJJhJ1M3bdy05xXJ0q4pyTl9aToJRBmC4VVE
         JPiM77HE93kIE83GU48yDtafwmRohPHNBOANmuiGZxnxtDuRGboH5AndDa+JUm+i+ZBs
         l22A==
X-Gm-Message-State: APjAAAXV/S5jVYlCLdpKTUIhLBjFUMWk3SxM1dTa/PiIByhkQXzv9f3C
        x2gbYXG0WNUlaO+6ddWcCGtqFGnmhAFvoA==
X-Google-Smtp-Source: APXvYqxalSmfg6q+qv8f/BniET3NASRNV7MHxeUy6OZB8VLsBDuCMnnu5niKocFxK5OGfqOeOkn+RQ==
X-Received: by 2002:a2e:9e4e:: with SMTP id g14mr16223258ljk.253.1570454946791;
        Mon, 07 Oct 2019 06:29:06 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id f22sm2702245lfk.56.2019.10.07.06.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:29:05 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 4/6] media: ad5820: Add support for of-autoload
Date:   Mon,  7 Oct 2019 15:28:54 +0200
Message-Id: <20191007132856.27948-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132856.27948-1-ribalda@kernel.org>
References: <20191007132856.27948-1-ribalda@kernel.org>
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

