Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D333D2DB9
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhGVTxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhGVTxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:54 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135B9C061757;
        Thu, 22 Jul 2021 13:34:28 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l4so76112wrs.4;
        Thu, 22 Jul 2021 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vzW8GMtaQ4KcRpdIHbGNsw4JG8M1qRceMOo6dYenjfc=;
        b=oCHwo2CcmBrFYiWf9q1Uit4Tvthunuo8sQPnOPNSfTW1nf2jwcU6ztjs5VwPOkuRqa
         Z+ePwWK1Qwpo3ErzxW9IctM/2K7CxDlplnA6wU92AByhujI+y6nLk6mdGhFOx+opPq4D
         Blsm/PN/c6MM1P0+JiCMz7JgCD4x7wmdrRvy6ldI+ddbwndkc4d5UVFvVnNTv89tn58E
         3SGvRpzuGCy9pHmpTn+t/I6KSWoicmYprniVZ/4tfD8xsmo/djdnZ/uKtTdXG0R8mO5a
         JSn/pDFBNTRRpqDTETXtHxSkFFIPDb6GlKQy5pEnqGzSyQPh1GPCjb9vCEi8PU0fVIby
         OODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vzW8GMtaQ4KcRpdIHbGNsw4JG8M1qRceMOo6dYenjfc=;
        b=dpIL1WgI0/nYQBBruPadmre33CoU2NPMhbRqfGWUsq9aHXn9bT5aR5EQJO5B9r0jDO
         4SoL56tpdTKIedMp+6fBpkqAtEEpUFjCtSuuPAkvjfV948FAcWekfJyqH7DfURVPebX/
         M7l51I1SZShS0QPY5H99CjGGG3JTUI7JRIVlNs818KqiBZXDPUqgZZEu3UWcO1N/uW0v
         DoVxB9q7lBBHX+bpf7kBm0yc+KXejqaVGaFavZY1MKzJRKzZdjtokVVgK8jOU8VTLoLY
         SMA05b94VtJpWtvaYi4vEdUbXSQX/dtG4NEp3LPIocSTZWBtqI2Vrz1oX6xkRjWuHSgx
         BEKg==
X-Gm-Message-State: AOAM533Cr6PNgHbg0JvIR0aR9z7wy/pRWrAh4IV/Az/xjAtoe2UrrlYZ
        /420tHO2HAPVBha16kBOpJbnJyVXBL4=
X-Google-Smtp-Source: ABdhPJx2zSqDwrfDSNQRKtL1DeWx08i0724Uqu1FwG5Z85/i5PjwlRGxfP0IKnMByzKpT9VcIpLFdg==
X-Received: by 2002:a5d:4522:: with SMTP id j2mr1685636wra.43.1626986066693;
        Thu, 22 Jul 2021 13:34:26 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:26 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 01/13] media: i2c: Add ACPI support to ov8865
Date:   Thu, 22 Jul 2021 21:33:55 +0100
Message-Id: <20210722203407.3588046-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov8865.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ce50f3ea87b8..fe60cda3dea7 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -5,6 +5,7 @@
  * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2946,6 +2947,12 @@ static const struct dev_pm_ops ov8865_pm_ops = {
 	SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
 };
 
+static const struct acpi_device_id ov8865_acpi_match[] = {
+	{"INT347A"},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
+
 static const struct of_device_id ov8865_of_match[] = {
 	{ .compatible = "ovti,ov8865" },
 	{ }
@@ -2956,6 +2963,7 @@ static struct i2c_driver ov8865_driver = {
 	.driver = {
 		.name = "ov8865",
 		.of_match_table = ov8865_of_match,
+		.acpi_match_table = ov8865_acpi_match,
 		.pm = &ov8865_pm_ops,
 	},
 	.probe_new = ov8865_probe,
-- 
2.25.1

