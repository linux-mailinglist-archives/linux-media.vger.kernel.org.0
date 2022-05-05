Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDC7451CC77
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386565AbiEEXIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386551AbiEEXIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616F05F8D6
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x18so7906062wrc.0
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJMUrxy1YxL+MfI3BMJM4GqCEZgOTfQRNKAvaXiVyIM=;
        b=XWhA7V4bCFG8NiwTH5s2sJHG41CzALB8x5VlzYiPxd0IOZJ3ZqMK/x60S0SRWb2oz6
         OmaIfakE5QOxgXd3QNeIvHzAWcGe7jGyWcWTPTqA9ge3bAfX2EuXfG4uyK/J2v/j7j1X
         +Na0Xze8bzPoPOuSJfJZIS77A5MLK9vNlcTU7EvhmN5QGR97CYuB12kmieCXDHB+1JyN
         XOZaNtNURpE7XM/cGbrZAKHPyGWiUyyXBQH+S/bY+91nZoAUd2yWsCh2JrTIX+HKx8Zc
         ZcuAHEp90K5FIe6n5gdBcQVrdSdyF4RWEHmSGC/Jwxmxe2YCypmHJsLu+wVWb4v/nkay
         +ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJMUrxy1YxL+MfI3BMJM4GqCEZgOTfQRNKAvaXiVyIM=;
        b=gvBkRu775cYWj96SvnmDfpMHiYN/HvIRyEfUytMV+nkJJUFP/gjnKfhXgnwsQsiUd+
         OP+2DLxjnZd8DwaAF9yNnaP+n+ftVeWXLcQySkZAtgPBPqipmnSbyIe75OFpwVIhFysd
         COj/ElJomXkT2vFkLU/QKWQ5zs/JyXFihmsd4PKdwX9ZCuPONeIDnkqR0/UN55DOTaa7
         fZ6PX3RIq5WTGEVnBuMUOQZ+X16hH9SmK/LZmPn2EYbpTY1mGKs3dr+3VwHOus50H9Vf
         70OMSbbKMJ0gmyOsncYWv/7sp8mv8IFnn427BNziQ8tH0NbBtuxpJnSPM4JGmoq9cIwv
         pghw==
X-Gm-Message-State: AOAM533pWtvqwqXATlNEQj4osQJiGBV4W1PzfTF7T2DnMWmNCo+Rze/I
        Pw4nIjWFo4owjBHY8+jN/5Yx+1dAfHE=
X-Google-Smtp-Source: ABdhPJzAccEtlK+1CsYt+bFClc0EpxsOGgZXbA5+aBvT2ntK9n9bTfesqnMZ03VKYgGAU7BZiHzgQw==
X-Received: by 2002:a05:6000:1f02:b0:20c:9be6:3e04 with SMTP id bv2-20020a0560001f0200b0020c9be63e04mr289590wrb.456.1651791862027;
        Thu, 05 May 2022 16:04:22 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:21 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 11/15] media: ipu3-cio2: Add INT347E to cio2-bridge
Date:   Fri,  6 May 2022 00:03:58 +0100
Message-Id: <20220505230402.449643-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
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
Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- Switched to 319.2MHz link frequency

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 7ccb7b6eaa82..df6c94da2f6a 100644
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

