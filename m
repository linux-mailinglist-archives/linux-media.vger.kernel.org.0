Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9904423E7
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhKAXYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbhKAXYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:24:38 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F20C061764
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:22:04 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso410909wmd.3
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=raB+yqaMazWqnIzfftvYCdWRL+n0j3n1bjy8SRxzg+Q=;
        b=OkH08T6wBncos15ubXZLfIhutAvKjmwHR3J7eXgy5v1QNPg7o4a+fHhVDJUfWWvJAV
         Epgf1CAKbqo7dSc87LvgT64m2WsiK2jLPJiPAtNwPgD0Nep+Zu6xB2cPGWWPWBG4WLP9
         17RfGHNTjVlB0UEZMQXG6poYFGVdTnH5FqcSd6pgiB9/4TRbvKNLzXm4RUsOQeZ5yprl
         H1N0zRGB18RLFgo+9+JnAhDmaj0iOe215ZFDQyXrHhWO3DSTrdGXnOM4g4dUFmJfUlJk
         EpLeLtndO7C0ET2vu5i965pV0otrwr24xAjk2LwedldKl8fCjwyGdeuvNAzMzTNIhi3k
         1ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=raB+yqaMazWqnIzfftvYCdWRL+n0j3n1bjy8SRxzg+Q=;
        b=3qGR2sU96p9Y9Q4pwRmr2nBQkkxgwlZHbqFCAARw2mJr9KFKz/dkgV8NyKg4hEHQdM
         fjUDhaE9RCxJJZqUet8277fSeHcpyELaOAPFc7HD2SMf/auvdLVf8rNeiCT0b7vTMuT1
         tDiEFlZFC3Ydne+w7kyUfJFby+kIWo2fZ6RgAiu3TvVT+iiFb1DGWs8TyOkd5FU6eQ/j
         ZPgD1LDxOXwOfF6SdaY19r8Y9kNUHtCv/Hh/wcjQdVNjShemFTW63vEK57FQ2mAF0aLd
         MI52ydSus40GDtfZ6Qr9yKNv/zDya6OAsq/5S3FV+ywzXsc59cl3TYduJUeoQ5dKvSSZ
         Zymg==
X-Gm-Message-State: AOAM532ROv60kKsPuRj99jxG71ZJ+IevB0qYEbfyfXzLS2HcM7ReAuwb
        5K5W6Ta3Phu4VnzUHiaqLDa/4iylYsE=
X-Google-Smtp-Source: ABdhPJyl4V13qzhmQZtV5OJvWujE+dIFBnHY2md+88El5z3/UgFPJQPC4RW++H5QAZbVRg1EryHQnw==
X-Received: by 2002:a05:600c:2195:: with SMTP id e21mr2342037wme.187.1635808923053;
        Mon, 01 Nov 2021 16:22:03 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l124sm763513wml.8.2021.11.01.16.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 16:22:02 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 3/5] media: ipu3-cio2: Add link freq for INT33BE entry
Date:   Mon,  1 Nov 2021 23:21:42 +0000
Message-Id: <20211101232144.134590-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101232144.134590-1-djrscally@gmail.com>
References: <20211101232144.134590-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a link frequency to the cio2-bridge table of supported sensors.
This means that the driver can parse supported link frequencies from
firmware in the usual way and validate that it can accommodate them.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5:

	- None 

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 67c467d3c81f..95a4cb1a5ad0 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -21,7 +21,7 @@
  */
 static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	/* Omnivision OV5693 */
-	CIO2_SENSOR_CONFIG("INT33BE", 0),
+	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

