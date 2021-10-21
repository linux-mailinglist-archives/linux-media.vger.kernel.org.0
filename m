Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A4A436CF4
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhJUVqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbhJUVq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:26 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDB8C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id o24so997447wms.0
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHrUsYFVYm+IkCidB9wUGrczs/x78/ITOW6ys69BRks=;
        b=LlMNKP/J6vlxUvOjfHav6NuhYch26Feoz2LDmkB2ABpNm41LB2DsOZVafnud9AIagf
         Ae8N92ZrJAfOTj8OVb3dbym4XAhVnubs6EYJWQa8gE87340OnNoCjGdjwjz8GsmZk7wK
         7tQZC62L7dfOpWOY/pGSbPsKo/SY1jpReP9lLoLkhdIfWmH6Xgwx0Haihn1dbuGs379H
         jjn8jUP7tld+ShvZRRHnWc7erXP7nNS1IzqyAya6DtjKFaobYWQwHCkDxUe40sc+kpAM
         g56m7Xb2ti2MY/SOfcL7JLVHOtGqA69YZo2CAdrllDpwIxAokEGSDBuThtNUx6WIIqrl
         jekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHrUsYFVYm+IkCidB9wUGrczs/x78/ITOW6ys69BRks=;
        b=SiggLeSzKApz1wIqwtr3vdjRqyxXjjoj84x8W//reu6Lsq2ZcQK2+zbc4NUtPdFkv6
         rkgLw2+dDN/2f/lvvTMdsYcdutAkWjPsQhXT5zo7W+1BU783D8uhc+shY+vN/h9CKFHX
         cvRDLfzpl6XvJxVIe2t3XrBVRcb/JtEazypFSaknidWY8shTD8pfPpui4PqUM06vdrMB
         yvpiHCRKR79CkWDFT7bZ5nlJ1VTRPfwHwtq9cH1DKvecPNFFuSr+/tn4+Nq/wjY7MtVu
         KyIitU9iGnAaVS/CAlVhoE5h8fjsywhYbIpXxdrk4joFXzxRMAGVg6/s6g8TfOQxIY5O
         YEgw==
X-Gm-Message-State: AOAM53318cGE9Wol+o88q9x5LpFc9ipHTxCFihKQoGWCwI0EzDdYTg9b
        XXOVM20ePnWgGPj6tEUn8ABh+21w6AE=
X-Google-Smtp-Source: ABdhPJxk0V0gdHC+Azy/CDp+kZlkAHqz2Ty0lVC1tOh2ovOjvYvTSaji6BspBb9l+IYwGfWhavxoBg==
X-Received: by 2002:a05:600c:21c4:: with SMTP id x4mr24303974wmj.111.1634852648944;
        Thu, 21 Oct 2021 14:44:08 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:08 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 15/16] media: ipu3-cio2: Add INT347A to cio2-bridge
Date:   Thu, 21 Oct 2021 22:43:30 +0100
Message-Id: <20211021214331.1188787-16-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
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
Changes in v3:

	- None

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 59a36f922675..fb7d708b16e2 100644
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

