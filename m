Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D4A4C3A25
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbiBYAI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbiBYAI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:56 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9656145AE1
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s13so2030322wrb.6
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxe1bGBQvU+qHoK6BXAjb1tBsY6UWhftXYepdsiUR7M=;
        b=ENc+/RqLKdmTS5Rd2fFK81WNTpH8PXmV2preCG7wmyREI8mVUkNh1eNWW+CwJVYgFI
         eWGLFUm4lJvdS/HTQv5shWK/v8psssGeA2oIejudN2R3daGTihu5GCpH127jKNPvs1MN
         Z4T+LLkjhew2oE1zHgJjNoh/7kfdoJOeTZbozSQR3FpH1Qun2yNW9CGzgnCPPNQfO42W
         fp4co4HYwxD3g47ZnQgwLV+GVMsomKoxV6rHHYmXsWn/9ErBlTxKic8UAVjpsYEDxfM+
         kY3enZGPYWWBYJVs8sHvnNkzwQiHDCUP3gAj1j7Z4tusMhpmp1AzBYwvEHU+n0W4Ywjg
         V+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxe1bGBQvU+qHoK6BXAjb1tBsY6UWhftXYepdsiUR7M=;
        b=NRmFgPTbpgg0EwqdntZWTOsFXNwd71bZ3MBn4XH5c/J5rDcxAmwP39skT8mREHBpWm
         Z9ha2a1EDBkCaYh6/+DgVEU8gfA3dxYTLWWaNFicCQKXcLh4umC6nxdEFlc+H6wS+eM8
         JJhZwf58NFVJj3DQ71s0WlweQwSqg2LF0JzkPrndnuNeSzJuSP7LnaqEHZMaGGupU7Vh
         c8/RreovV73Cj4edJ1kJR3xRhf+7sMk9BXs30dblpcD63QKghK4hkte9cqYyQLF99I2J
         325LKRea7TH4f6A0lQRNLRTU8I7pJKgQI803Q+qS+EPxjjoJkmHTS62qPsswmR2Wvf9R
         CTjQ==
X-Gm-Message-State: AOAM5335jTtGXYslcOafmwwPdFwon+wRASqO9CNkxzmphFyc3E8frvw+
        Rl5Vl5hDDb4mtPW10Pbu4iH0oSz7kRvU/w==
X-Google-Smtp-Source: ABdhPJw69F5EJha/sQEbUZj8thdpm6PhEJi2GG9uq4v6XlqSE1BGE3G9BVEfcH6pvckbjToTDW1SGg==
X-Received: by 2002:a5d:6f1a:0:b0:1ef:6254:bca3 with SMTP id ay26-20020a5d6f1a000000b001ef6254bca3mr314631wrb.119.1645747704478;
        Thu, 24 Feb 2022 16:08:24 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:24 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 11/11] media: ipu3-cio2: Add INT347E to cio2-bridge
Date:   Fri, 25 Feb 2022 00:07:53 +0000
Message-Id: <20220225000753.511996-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OVTI7251 sensor can be found on x86 laptops with an IPU3, and so
needs to be supported by the cio2-bridge. Add it to the table of
supported sensors.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Switched to 319.2MHz link frequency

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 6bcec05ee5a8..74a971ea05cc 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -25,6 +25,8 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV8865 */
 	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
+	/* Omnivision OV7251 */
+	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

