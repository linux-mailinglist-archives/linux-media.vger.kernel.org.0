Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932921E3A00
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbgE0HMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729098AbgE0HMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1450BC03E97A;
        Wed, 27 May 2020 00:12:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id q8so11447902pfu.5;
        Wed, 27 May 2020 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TS7T0GnvahIo34Ueh1mEB91ydpyvQ6Kv78CuMyjghNI=;
        b=TF+ZnVGlHYlycvaTVaXADyYL0RJeFIrCgBOXxgVjtkEbW1aFo47roQVqe4rimM5XaO
         0jyPywtYKRd5OylJ6q2ztpi5amDIDSk4F/HP1rcZS61pV+2bP3Et1MOVRJECN4eq3V8K
         FhE0s9dL0s1W8dAdY7kR8nRl9Cae8qgIRE7TTpJvULSdbuSW46zLeHNOj6acvZ2i0BfU
         pyr8DtUCyPOWPD0v9PLq5XCcVmfBlD0cEbSbuEt9ikkbHzhXwLtO6p2lZgfzYwu/t6dL
         vDoVwfTgGtDeyjnENBL9+L74uybPBlYZvUrtsfs5J6Wrz90fcfapibK46F9n+2Hs1C3F
         Tw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TS7T0GnvahIo34Ueh1mEB91ydpyvQ6Kv78CuMyjghNI=;
        b=rxFiqbjxXCVynAGPeCGXwlgT0Wr9dRpJkbxGmHBsn1hpBJip75sFjp9fPmAzce8eEu
         n6EzjVsQy5ts4Wv5Om45lnuzt1INXhsOJVq9BRE8E4QbwvknGXyS26U8eRu7F4t3QSHZ
         5GJiQs+kLHONbRmdnolUN2uFbzFoUVErAR3NHQ0Ehg+g5HbSQSOoWQqOXbdfBDJoExMl
         DLG9pMbrUmk1R4qYT7ITcJK7yy4PEf9BezyGISiFAnHA7Y12qvabQyh6YKEJTvfjnZF0
         IAXqhKCuTuLNg7/fIRdeQALUEbycfsxGEKu3G8oTe72IOZOIAvT6azPN06jyib9cIw/q
         Yoeg==
X-Gm-Message-State: AOAM531ZC9ijKxYdQDEWrHIvob9MEKZQ4Wc+0E35RjXhQ4Vdx+qmgCnB
        uZwj6cYtiVtO8c0Mrd5FVPQ=
X-Google-Smtp-Source: ABdhPJwQC4jQeNUEVSfWcbDH8TBVkeO48J33ab8uL53x2ElsZaurgFDeuYMlkbqz8HFBeHrwQ0mRWQ==
X-Received: by 2002:a62:a50a:: with SMTP id v10mr2720546pfm.134.1590563535044;
        Wed, 27 May 2020 00:12:15 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:14 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 3/7] media: atomisp: Add stub for atomisp_mrfld_power
Date:   Wed, 27 May 2020 00:11:46 -0700
Message-Id: <20200527071150.3381228-4-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527071150.3381228-1-natechancellor@gmail.com>
References: <20200527071150.3381228-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clang warns:

../drivers/staging/media/atomisp/pci/atomisp_v4l2.c:764:12: warning:
unused function 'atomisp_mrfld_power' [-Wunused-function]
static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
           ^

Use an '#if 0' preprocessor define to hide the broken code, leaving the
FIXME comment intact, and creating an atomisp_mrfld_power stub function
that just returns 0.

Fixes: 95d1f398c4dc ("media: atomisp: keep the ISP powered on when setting it")
Link: https://github.com/ClangBuiltLinux/linux/issues/1036
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c42999a55303..41aa6018d254 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -736,6 +736,8 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 * WA for DDR DVFS enable/disable
 * By default, ISP will force DDR DVFS 1600MHz before disable DVFS
 */
+/* FIXME: at least with ISP2401, the code below causes the driver to break */
+#if 0
 static void punit_ddr_dvfs_enable(bool enable)
 {
 	int door_bell = 1 << 8;
@@ -820,20 +822,23 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
 	return -EBUSY;
 }
+#else
+static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
+{
+	return 0;
+}
+#endif
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
 int atomisp_mrfld_power_down(struct atomisp_device *isp)
 {
-	return 0;
-// FIXME: at least with ISP2401, the code below causes the driver to break
-//	return atomisp_mrfld_power(isp, false);
+	return atomisp_mrfld_power(isp, false);
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
 int atomisp_mrfld_power_up(struct atomisp_device *isp)
 {
 	return 0;
-// FIXME: at least with ISP2401, the code below causes the driver to break
 //	return atomisp_mrfld_power(isp, true);
 }
 
-- 
2.27.0.rc0

