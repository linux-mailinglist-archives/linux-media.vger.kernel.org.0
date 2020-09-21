Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D99F273545
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgIUVyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgIUVyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:54:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9B0C061755;
        Mon, 21 Sep 2020 14:54:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so1069046wmi.3;
        Mon, 21 Sep 2020 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z3OVW099mqaL6VHBm46aQM/bYxWoZUj5xOibh7mUBIs=;
        b=JcBjfG5v++B4xBESN/8LbH5HNalPKqeId89ycgMpRgUPqeGjlMG6Iu2io64EAT6Ktv
         fEvL/NhH7whVyqJWfPv74OGREYFkr+ZggR+Jshmj/rHybWhgm1xI9AS2eI7SY7/wTsKy
         dySKayRDgjyKD2TQ0vfEBlXXRNt4kxjo9xeVWv14bBG3b86mOpc+4i1uDsoLMK3NATXZ
         zzTx2VXmusTKRP00RtFl2Q398z78oQzfVkMHb1GJe8eJJS2y/R/RyPr5eWTngB9sSezE
         eQgl3b9AxnY8nVuMmYz46vFLUSctejk0xWndkaBpOO6lo4QDRYPDiocnv7FJ7zc8Bbv/
         xklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3OVW099mqaL6VHBm46aQM/bYxWoZUj5xOibh7mUBIs=;
        b=hjtgpMr4NjLNkBy0sLqoiMRQrc73ot3ieATmzwBPXZGW7yXr+ttqRpe4avRRDHdV1E
         VmkEFTLiBTY9+8G1h7yBW3VyhvdivXhTkY2aU9x94RPPiwVPV4CkfH/Mx3GrbQi4DY7d
         ZwhrhH+CcF8GoDiiLsn8EeOroRGtk6LpOgqqLsGukzjJG6VAvHZVQAseDcdAVbj4W8FS
         ng8BGJooSttCEjIP0DvPtjrSdRWdyGe1+69nHwtzFBZtZ8FBvoJ/fH0uVyW6Hb2FActP
         BJ+mDwdPrzIUYQb+oYhvRASPeqZui4Vhyx1vlylTsOj4df33Cz+QwKiWJE6aDk3KE4fK
         JWFg==
X-Gm-Message-State: AOAM530IovfeS84kUSAmegAKYA8ujQhxxuSJc7kbZ4AbviXdS0hTn7z1
        8jmJacjwH8PmKH5nmXYf0sU=
X-Google-Smtp-Source: ABdhPJxOnLPCBexCpj4xZ+md7j1W5MQ97wYWxB815btr+cdwiXrp8zS2kb+5jYiiPRgBxaWVjEL1uQ==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr1276800wmg.117.1600725292950;
        Mon, 21 Sep 2020 14:54:52 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id t124sm1282200wmg.31.2020.09.21.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:54:52 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/5] staging: media: atomisp: Remove unhelpful info message
Date:   Mon, 21 Sep 2020 22:53:53 +0100
Message-Id: <20200921215359.45003-3-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921215359.45003-1-alex.dewar90@gmail.com>
References: <20200921215359.45003-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't really need to know that the LED pin reset successfully.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index cca10a4c2db0..d78014847e67 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -771,7 +771,6 @@ static int lm3554_gpio_init(struct i2c_client *client)
 	ret = gpiod_direction_output(pdata->gpio_reset, 0);
 	if (ret < 0)
 		return ret;
-	dev_info(&client->dev, "flash led reset successfully\n");
 
 	if (!pdata->gpio_strobe)
 		return -EINVAL;
-- 
2.28.0

