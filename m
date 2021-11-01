Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07B0441195
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhKAAOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhKAAOA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC47C061746
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:27 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 133so3050535wme.0
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PGdbJPgEvrFRTG4FV5SGOie0HxOPXnmoerqu6Z+UpHA=;
        b=GGMtZGD7m5vPaAJDLDKmgaqTxQkaVhu0Ld6OBL1XyPqCsgoOxhg/LAVfVL917Bcz2p
         X61Zb0UjzCFKF2uX+e8VAxTbY8ebUjrX3/A3Lc4SaEVZTdlwX8SvmFlCCjKyMbgbgAiR
         fwF/5QNqLHNEokAbUeR0Znqb2GmbAhg61f7Nh6rczG9ASLkAVRJEK+o7839VqIt96QQZ
         wqXwYLxNemmbVqeNTCBoU9Vhe0G2tYV8dxs97TbItlZ3rVfudB3j1aFUBVbh84oWD8kn
         hSXSVflOgteERiVYtJT98iNPx9y8aNLQ1kOd/Ry242MuVNiEn6aBXKTOLANx6RT69UXI
         gBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PGdbJPgEvrFRTG4FV5SGOie0HxOPXnmoerqu6Z+UpHA=;
        b=f4Xx7onxT9h/68Z44zhfGcuOvlw00FpKj2Q7sXX/66zV1gxu19uJMZWagJzoNzVI35
         aWvhPzyTMR1n0+HTt3SImLIySQIplhh0f+8cJRIuIwe8jLu0qjJTWHsyckwOsC7KdG3k
         rTYRZurx7E5T7Tp+rcRR+evSXpUabP657HyfFLr5Rq6LfZwy4gd+2N3xNUPFBkGMMjoi
         xoDugPQzFToQHo/W9i0ztXbbtgRswQFQj1ifFMr6+Sn0KV4JdTRS52IO6fgv46ndbu1a
         OfziuID+63W/a8ZLylkqlgR0iBdVA0uzGamgz1QBjp3GYsoHMHdmnM66EECeQLNCMx1J
         Krwg==
X-Gm-Message-State: AOAM531ws0RHJG9RV0mY+hMgTvwqPbA0S0ROUVIQM4unZPQ86Xw89LGj
        lxUmu8v0r6kqzF4Bil+o8yU=
X-Google-Smtp-Source: ABdhPJwrvS4FMmu1RPYtVHjRPceJGeVlT/zFX9ShW0zIXz142l6fz9TKLI52qiv5QNRCNVfvDVqn/g==
X-Received: by 2002:a05:600c:211a:: with SMTP id u26mr163971wml.8.1635725486501;
        Sun, 31 Oct 2021 17:11:26 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:26 -0700 (PDT)
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
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 02/16] media: i2c: Fix incorrect value in comment
Date:   Mon,  1 Nov 2021 00:11:05 +0000
Message-Id: <20211101001119.46056-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL configuration defined here sets 72MHz (which is correct), not
80MHz. Correct the comment.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 7626c8608f8f..8e3f8a554452 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_config_native = {
 /*
  * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
- * SCLK = 80 MHz
+ * SCLK = 72 MHz
  */
 
 static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
-- 
2.25.1

