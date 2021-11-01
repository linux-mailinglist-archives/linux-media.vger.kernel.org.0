Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C701D4411A2
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhKAAOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKAAON (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:13 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B90C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:41 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 71so9960780wma.4
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b3XbTTgU2h7a9joE3RqUnaluJG8j12IWj/XD0gr/nRQ=;
        b=HJEQ5lFyx/tPApnhXD7gMJK9L0hEnw0j3aVcakPPusiln2d8PvDxBqajtzAIPlm3iz
         gs0uY4Ms6wUQUehNeEwsb+BdrCDlvnWv9Tmt3E2ZZHIRouo68tc7WnxUtBIppA0eGS+J
         P62ynjv00t7CUXrol/788deKnN894c8NBjw1hHGA8urq+YpvRofC9TEgqjXPR/0I5ZNm
         QjYvWMDiY5Jb+SA0qd4CAKNH6x2QG/2XCtbgTi/3A4kt6w4u9SHkhxmhp1I+QWpttrhG
         QL9p26sLu0azO3H/DBcuP2Bym1SXa0V1JDNAoa1jkppUE8F9PCSf5SeoQAkCSKXMq4Gw
         4skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b3XbTTgU2h7a9joE3RqUnaluJG8j12IWj/XD0gr/nRQ=;
        b=gAaLM7aH6lah5UH+BPQQhuh/Wp+8Y2yEbAY1+FCc6yRkotFL0e+mXmONPDQPjhffe4
         EVfvowgRMueLRx0VJZuy1vfkOx4CPiaTVYgSWqRcvg1fpsb79NlPAmRq5heAJopMKf1x
         fjZFEbw+oywGLRm8C+G9nw2rMgTeElEQ611KkvXqgliOmV1RXMlrwF8S9VDiCz1TD+Qv
         287LqD5sIKc9Qwu/dw72YqlBSNNu1t4Fz3/ig6cu1vVANvGgLV11ZMaM3uRD8j27iJ4N
         ATvXSJt176aNOxKmZs+bznSKXBUbTujPhRQ7C/3b1NTmCOCvQ1DWi9nS9aMvX55vUzoc
         7TWQ==
X-Gm-Message-State: AOAM531CMBR616WLVvb4rDBq9lWo/pcXPvVnn59m8ZztYM/GIZhBwOPW
        XDBeAqkwgmexbDRAQVOFvVINHr7NvTY=
X-Google-Smtp-Source: ABdhPJzhrdeCDCr2XNNNwukzBtiK8NOW8lZ5iPp5TpP5CpA9rkrESiASwuoBgfqFXI6Q2NZpEt19vA==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr35195106wmb.105.1635725499656;
        Sun, 31 Oct 2021 17:11:39 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:39 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 15/16] media: ipu3-cio2: Add INT347A to cio2-bridge
Date:   Mon,  1 Nov 2021 00:11:18 +0000
Message-Id: <20211101001119.46056-16-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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

