Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A29436CF5
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhJUVqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbhJUVq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:27 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659DAC061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:11 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id k7so1572264wrd.13
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eYXk6mu1t2LWygmapm0MdeihIPOCQMZuJBpibJeSFrg=;
        b=pipLd9DaH9X9ot+mnSW7A9glsVMiXNt8jyPO6ryvQPeufIgoWxUTYpO5pxiziBFTiw
         /wfs81v1wfp5uuD964VhdPODilAzmvCRV/hvVnKdcV+oyYSYbKDeN6VgYEsVeo6fV516
         zayL5cnKNaw3D/H1Vvtr7J1vallwZTvTuE7uBUTuERitc6IGcm5etPkAMVbp9UOK10hr
         bPKZP+BmkXhVI9ypnjyCSMGFlFDG8Lq+yB+FIcwdgRuuMihAWuwVHiBy/KpbRui/iSij
         tuTdZoOnGDFCddH8+2WpV7XXlq09e+BE9ACwihiJonKhGBkhuqVdxbNkimJQV5O4jY9k
         6AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYXk6mu1t2LWygmapm0MdeihIPOCQMZuJBpibJeSFrg=;
        b=3B8Gcrs7G+/fsig076X1flLuxWTDQZ89KAT5/KyTDSqwr49xZST4OGu/rpM0KuW4LD
         gwElWJSjT+kfmdnaXYfaey6SosMkWmM1kV73Cg0p5wdBrSB+qY5DfYQ0H2/h2Hrr8J2t
         UhMVMj1XgHtsgOGoRmu2Wkhx881eKFgHLRiUiuNaP8GlTIfnr12mHIHCj2GtDcXxXzBY
         RP/kZ1ZehlZA4EvRZdE/2IAxL+uPy85S/sg14sCF8fBYZs9A+QvB2QVZS5DE9z4NJQZU
         y7ohVLQRc4ZemAGqTwczgOAweMC7ty/m04fw5Gzlg/q1SPxLLOtTdhulOcJ7yLS5GBb4
         UB2g==
X-Gm-Message-State: AOAM5312X8v/X9t6+3wBxHI9EaGSQeTSE/m6BgrulAW74mzEcwLFprB8
        RVvjm28WrhpS+0PMINdLC7xWKSb/GAA=
X-Google-Smtp-Source: ABdhPJwgPGAP5hFSP4iGuCwPIy0Br+h5i0piF24KZGoZ418Y4BJRsZaQgpqSb/QkgoOMR0hSjqK5tw==
X-Received: by 2002:adf:b350:: with SMTP id k16mr10436592wrd.368.1634852650001;
        Thu, 21 Oct 2021 14:44:10 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:09 -0700 (PDT)
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
Subject: [PATCH v3 16/16] media: i2c: ov8865: Fix lockdep error
Date:   Thu, 21 Oct 2021 22:43:31 +0100
Message-Id: <20211021214331.1188787-17-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

ov8865_state_init() calls ov8865_state_mipi_configure() which uses
__v4l2_ctrl_s_ctrl[_int64](). This means that sensor->mutex (which
is also sensor->ctrls.handler.lock) must be locked before calling
ov8865_state_init().

Note ov8865_state_mipi_configure() is also used in other places where
the lock is already held so it cannot be changed itself.

This fixes the following lockdep kernel WARN:

[   13.233413] ------------[ cut here ]------------
[   13.233421] WARNING: CPU: 0 PID: 8 at drivers/media/v4l2-core/v4l2-ctrls-api.c:833 __v4l2_ctrl_s_ctrl+0x4d/0x60 [videodev]
...
[   13.234063] Call Trace:
[   13.234074]  ov8865_state_configure+0x98b/0xc00 [ov8865]
[   13.234095]  ov8865_probe+0x4b1/0x54c [ov8865]
[   13.234117]  i2c_device_probe+0x13c/0x2d0

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:

	- New patch fixing a problem Hans noticed - thank you!

 drivers/media/i2c/ov8865.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 685539744041..27179f1d5cb8 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3073,7 +3073,9 @@ static int ov8865_probe(struct i2c_client *client)
 	if (ret)
 		goto error_mutex;
 
+	mutex_lock(&sensor->mutex);
 	ret = ov8865_state_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (ret)
 		goto error_ctrls;
 
-- 
2.25.1

