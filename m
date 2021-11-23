Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2214598DA
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhKWAEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhKWADu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:50 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE337C06173E
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:41 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d27so35752074wrb.6
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eBgM5YIUKdVJWZmB9Bdu+nzzi7aCarsQ2Djtv4VPP7w=;
        b=jmgNmeljKZxDQ8ypUvfQj1hXYQ7NX2p9+2EgzAvsHjxCE1qyPLpTiouc4HVVHG8qt+
         rECNUUyfucevmbny9f0u4ePsImSzTega970upIWXSQlSsm/XPUdaR7UjH3KGGk9xEAIU
         eD4Ndwu/COxxBj497eCKoOcpmUDr+HTBIMqtKs16xnVga/QoNtMHko7cVI9gst4vBF7R
         oLkw3KN1JCgZKr/LE0FVUd55J+OM76o/dz11X/GdES1Ww1jh/+S/Xr5Ksb3/gAgde2wg
         yEqcXNkSL8cV2/LklQPfQnjH3MGeUWz4wXLNoSTyWCl0Ve8VC6KDIBi/tOLr+Xv120MW
         LQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eBgM5YIUKdVJWZmB9Bdu+nzzi7aCarsQ2Djtv4VPP7w=;
        b=VGkIT3qhLEUTkN5UDMg+twg2vVR2CgxMP8A/kRqemZ751iyYBbo3Amw8ATXHotbB/8
         4DRIWbDHan4QB7GhwTW7QEBoa0sZW2Y0kY6Ph7gIKStEVB0cQN/e96DsVBpIbNtJ+b3c
         uFTJqKmTF79qDRIJaO3YGzZiaTNFluu++eqxz8+7csq9B0ApFdfPdrIX/Z6U90quhBoE
         LflGMyA7jPX+FIJwBqpIbxNp1+GMKvFm9nie95ATxoM3wUyoau0+lBkOvl86btdQ/y2a
         hjoIdi14OMnaDsrBY+91TSDOk0IyX6pxi04BcMi9oysfYqAPexeuSopGbLLKPr8xO53c
         52fw==
X-Gm-Message-State: AOAM530SOCz3Wb6JarttkkiOmtKZMw1lmeCIjZ+AJf/0fm89Irta81+s
        p27d0iyRXvGRMmUXhirTTeEwo6xJv58=
X-Google-Smtp-Source: ABdhPJx1AsUGxU8WbEHjG7ez5adJ+QVHAlCDaHp282cWptVQupr1GRfr9g9hpfa97r/zTfu86AjNvg==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr1750227wrq.196.1637625640651;
        Mon, 22 Nov 2021 16:00:40 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:40 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 17/17] media: ipu3-cio2: Add INT347A to cio2-bridge
Date:   Tue, 23 Nov 2021 00:00:17 +0000
Message-Id: <20211123000017.43187-18-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ACPI _HID INT347A represents the OV8865 sensor, the driver for which can
support the platforms that the cio2-bridge serves. Add it to the array
of supported sensors so the bridge will connect the sensor to the CIO2
device.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 0b586b4e537e..4550be801311 100644
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

