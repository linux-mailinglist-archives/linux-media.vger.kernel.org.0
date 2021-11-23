Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F3E4598C3
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhKWADm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbhKWADg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:36 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61FCC06175B
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:28 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so494724wmb.0
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N5VLlSGrPMPQfxfPi/xiMtdvJoInSe41Unx5TPzmG8w=;
        b=kU79JDH+dF8FIUpNKxA7uIEvH5Dnj4JtOAP9Xg5bTVMzvKoCpxOgNofdEZ41XYko3Z
         6XetyMvzFHMx5lKbmCwUrU3+OkRiLx8EX/FGv/FT+jiA6nnjMI6lsT9U2vANX5hIJ5XH
         lb+xp2gKK8ienzCqXTLx4NOLr/rxpgxwFNJ3+SdMfNu9SfjwnYLtt3oMOOz/U6Pi/6MJ
         U0nQhFhStBA4SigO5Is46tDTyWGFqfeBdvfLVY6t16gxsZSc99HCrtEDdjw63MWGDmI4
         NwDtf/vHQjsFW2pf2LlXGZWFVIr9WQHfntvBkfYVcXU8II6keFr0HOGQd60033rN5Ee2
         lZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5VLlSGrPMPQfxfPi/xiMtdvJoInSe41Unx5TPzmG8w=;
        b=oD0Lziu0goVswSU3P/K15Itlb2aZn8RHWDWuFXnSeHs1XosvTZdFz1XxT5P/lhac1P
         eaTny9yEpIZf4B7lmmsdouW1Cd5UEltnL5WlizC44up3OjYxfyUNYjqodS9ChaaT1YRd
         eKSef5lBBFz4icQQRdn6jRDWW9rcCQfAoxwLnYK6qFQqRtDMoFJQHaFNk4P3dygBhZ4H
         2Wu44ddnHqIThlMomRFLr0+W60v0/rZQT8Q8W7FbSGeSyTPP4k6iyKa00ZfYhre9hX6I
         8pXnXgNzFZEFgkNqMvP3kANTHnEDWVpglNfCTCwjUZMa6fRho60L3v4GX2/JL+kphqz1
         iNJg==
X-Gm-Message-State: AOAM530oceyyjsc0OyZ2OqqH675WGkr6Ir170JxxqSyWjGqeItFthrR/
        ZUet9AQV6nixERALE8qT/Q4O7iPygaE=
X-Google-Smtp-Source: ABdhPJxjXoZJG26E5yGkWSEgDVMI/BslWv6uqGBwpLu1uQTY6pMn3wxbhBZvgk5jg2arvUZZIBpa3w==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr1366524wmd.143.1637625627363;
        Mon, 22 Nov 2021 16:00:27 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:27 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 03/17] media: i2c: Add ACPI support to ov8865
Date:   Tue, 23 Nov 2021 00:00:03 +0000
Message-Id: <20211123000017.43187-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 sensor is sometimes found on x86 platforms enumerated via ACPI.
Add an ACPI match table to the driver so that it's probed on those
platforms.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fe064e716ea8..9f1c0d66c4f9 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
@@ -2948,6 +2949,12 @@ static const struct dev_pm_ops ov8865_pm_ops = {
 	SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
 };
 
+static const struct acpi_device_id ov8865_acpi_match[] = {
+	{"INT347A"},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
+
 static const struct of_device_id ov8865_of_match[] = {
 	{ .compatible = "ovti,ov8865" },
 	{ }
@@ -2958,6 +2965,7 @@ static struct i2c_driver ov8865_driver = {
 	.driver = {
 		.name = "ov8865",
 		.of_match_table = ov8865_of_match,
+		.acpi_match_table = ov8865_acpi_match,
 		.pm = &ov8865_pm_ops,
 	},
 	.probe_new = ov8865_probe,
-- 
2.25.1

