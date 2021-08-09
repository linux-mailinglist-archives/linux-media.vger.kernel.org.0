Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFF83E4FA7
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236965AbhHIW7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbhHIW7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1D1C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:11 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id l18so23523291wrv.5
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TFqdzyp5+BdbPnTT62GNKNhDomjZASMOd7s1EVnkV/o=;
        b=P5Zckll8y3OrZst94+PUhm5q5zRUC21VgQyFSZReHwD28orHoIYakmPWzbnmilVNSg
         uhDXDDAO0GYju0mlvKhwupnOnAs3gRTwBhmmA7vN4ccdM4i9FoQlIFy7VW7QlhpnEMlT
         +NGELhLHM3+W4B6Wyer7LuKanC3AKu7GXbYxgDKllaUPOxr/Sp9pqLuQeW3lnz16UskR
         EzI9k9Dxd5BKDys7kzM44Lvw8+KWxL1BkIEnPJguor+j2/NFUttj7EPoxSjN2IUq3te3
         EqlUNQlVLYevY3Pghg5OHgvUr3FJZZtCZT8Q6K2KzvnfWmP9QoUkhyn+hTu7qHK0EAOq
         QLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TFqdzyp5+BdbPnTT62GNKNhDomjZASMOd7s1EVnkV/o=;
        b=WlBkmuMam3yvvU985+p4lwvk2u+g1fFoe5/+IUw77jE3ozHxZ4x950aYrtj0HncMEr
         B+dlqGcYKEqJ72X7sVwI8gRAdbcJhehYWIpR6LijIdrOej7i4mHPiCakz5T9MWZPJUy2
         RcgkT6IM5kOYLCDuE20r5n4kQ8NjfqE8rn6D69zngWtoxSgV4/59smKhg3DKquD/LtvB
         NYV0ypHzMrFomb379uPmFMIILrU5odcI36crsULYcdRLQ2cPedfTqRjLTHIV/7RNXAOG
         RTQ46ww+V762iubc19Ck562aiVI27DuLuy6GNAagsMN4KNlnm2J5JEQxWUkG0xouXpZ/
         GNvw==
X-Gm-Message-State: AOAM530+UH6kAHshlURemWdtDT8le65t+zru+vWRu2czcOG4I2MUwsn1
        y//xz8LV3xVfycKo5L0zEqI=
X-Google-Smtp-Source: ABdhPJxSN+her5/ac0LviZFqRD8d8/OPH43S44ByjEGUk2EkjyxSJy1fg+AJLbzLUN9GmyQwJWTDpA==
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr26971292wrx.103.1628549949960;
        Mon, 09 Aug 2021 15:59:09 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:09 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 12/12] media: ipu3-cio2: Add INT347A to cio2-bridge
Date:   Mon,  9 Aug 2021 23:58:45 +0100
Message-Id: <20210809225845.916430-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ACPI _HID INT347A represents the OV8865 sensor, the driver for which can
support the platforms that the cio2-bridge serves. Add it to the array
of supported sensors so the bridge will connect the sensor to the CIO2
device.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in V2:

	- Ordered the list by ACPI _HID (Andy)

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 4657e99df033..18a31196a4a3 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -22,6 +22,8 @@
 static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	/* Omnivision OV5693 */
 	CIO2_SENSOR_CONFIG("INT33BE", 0),
+	/* Omnivision OV8865 */
+	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

