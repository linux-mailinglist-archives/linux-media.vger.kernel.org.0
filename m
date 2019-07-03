Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FC25DF5A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 10:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfGCINf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 04:13:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46885 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfGCINe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 04:13:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so836622pfy.13
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jpedf64g2nGaIs7kgKn6od/wbXCzG2Hoh0kidvPp7dk=;
        b=tOprpnLAEEu6fBkdjXEIJ34BuvWtKBDm5oEf54+Da+m50nWfaYSHHYYdb5/6Vg0El4
         GJXh6N9s/2RFeP58PZSTqgYb2ZdhyQS2yTWrNvpC6u1D9qtX1/Qlc4cRYCxvCgbG0De5
         jguuTe0m9jiGaF+yO+h2AMOilbpq1WM7maY29R5L9CrC/EYcCkNr9OWivOSCFOjuq69D
         EczBnsIA5UnKpZuB9Ia+uJvA+97afMhGs5Rm1HCuUAZfMqJdl+6ll0oGKFfn9b2dITd7
         BNZ2sm9qhOeUAIBRDu9q74BmWc5/WvUNz0KwH+MVw2Lb26Xh5Rqc3UaLLh7sTs8/xFit
         RP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jpedf64g2nGaIs7kgKn6od/wbXCzG2Hoh0kidvPp7dk=;
        b=hrVEW/u4S9Ge2WdI6BsdmDvh8Q5f0tniE0VNgztjHMe7cQi3h40fNYwFMKti513tUy
         Z8jFnwp/hLc8FREf/M1C5+rhkinGMJFzvgIoDlD+KxqB+Cmr2Oc7egI0C6GnFqBcE3lr
         k4/+V9t38ulsth/cVYhl5v65yz4gDbVhmW7MxJVMC6kdLB8dUv3wq4orlXCrp8AWqjxw
         RGF69anxcHRlpjJVSDFiDprY2mjlEkAJHSgS6hOpsR97+N66cs7CIJ1960biYQ1mRDTZ
         BkibnMxjClApLsKtSSjizyx4TJ2V4KF8eDM+p6lgWDQJDrOECA513dVBVPgivoOqa2Bq
         84cw==
X-Gm-Message-State: APjAAAUeb1OHAXOAqbdQolXeEteLATIO6wjaWuBVWgOkSRJPveWADLvC
        eSHUi2SB7U77Am2tXGxKw8k=
X-Google-Smtp-Source: APXvYqzNOnUDpfrEJM1ib6cYQUAiqJDL28YiIUT8L7BJ5nYJWLkdmVuLfk19mXffx4aXSbV1sHUrBQ==
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr11066464pjp.47.1562141614267;
        Wed, 03 Jul 2019 01:13:34 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id m6sm1176450pjl.18.2019.07.03.01.13.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 01:13:33 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     maxime.ripard@bootlin.com, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH 2/2] staging: media: sunxi: Replace function cedrus_check_format()
Date:   Wed,  3 Jul 2019 13:43:17 +0530
Message-Id: <20190703081317.22795-2-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190703081317.22795-1-nishkadg.linux@gmail.com>
References: <20190703081317.22795-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove function cedrus_check_format as all it does is call
cedrus_find_format.
Rename cedrus_find_format to cedrus_check_format to maintain
compatibility with call sites.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 0ec31b9e0aea..d5cc9ed04fd2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
 	return container_of(file->private_data, struct cedrus_ctx, fh);
 }
 
-static bool cedrus_find_format(u32 pixelformat, u32 directions,
-			       unsigned int capabilities)
+static bool cedrus_check_format(u32 pixelformat, u32 directions,
+				unsigned int capabilities)
 {
 	struct cedrus_format *fmt;
 	unsigned int i;
@@ -76,12 +76,6 @@ static bool cedrus_find_format(u32 pixelformat, u32 directions,
 	return false;
 }
 
-static bool cedrus_check_format(u32 pixelformat, u32 directions,
-				unsigned int capabilities)
-{
-	return cedrus_find_format(pixelformat, directions, capabilities);
-}
-
 static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 {
 	unsigned int width = pix_fmt->width;
-- 
2.19.1

