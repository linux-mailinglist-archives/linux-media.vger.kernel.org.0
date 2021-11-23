Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A75F4598BF
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhKWADh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbhKWADe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:34 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3A3C061756
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:26 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i12so17061391wmq.4
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zno9bQ5DKPDGFXaWJYzQ6mt0dgCKnqyGQEt5L3RiCzo=;
        b=nHi1sbC5JPCkeQaESyCyv4h+oKnrEGSUuA5H06/J5W2xWau5jBnBNuY+qjMd9CFgHN
         HlOpVO+Iy++tPRDOWJeUjZM96C914w7PdBlaybx4jTxtoNMiEEyKe0TCWtOaOEIJka8v
         H3Qb2MuxuS/rbQ1pl/cDzCf1r3957cxIxorYzrhDf75NVG0NuNcqYRm4XmBxuBieUtfQ
         jXMckT1TUi3kR8TRv/dtDCbFfD4v2oIxYVF6QLpSaTbS3KdFLY2GFngGan32ybEP9NC5
         hKeHnthDkaL7nbciM2YN3GK9H0cl/t9rbjjpYIH+Mh0eoi1dv6LF0lqE8mhVPuHNC5rW
         ywpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zno9bQ5DKPDGFXaWJYzQ6mt0dgCKnqyGQEt5L3RiCzo=;
        b=W7/gImCQwePqeBarubyHvzzjA7140uj7IDFv9FyxfsGBSAAl9ey36lct32T3bemEc4
         lNZjcMa0lKczI4eK1f52y//UbnqtxGRy/4Cgh9zaTYLco8jIFWxxrkd3WVyd7Vsw8syc
         GqIqpCSBH8ENLvK2FqFUPU2JZu+S1CAnB8YJDz5RIaPbvQuU6NNEObGm0ShpyTjG6Xft
         GZsMwzMIqmzPH4bkW8yMnlCiF2aNxCyGdCGbJZuH08xDcLcka/V7GwS+FB87ZqT1PYGb
         vkf+w233LzgGoMM2t2kr9JvfJFXUW7ql2mCiyyizpFLW2G6uLi0BcwwaiwR3D2kBNIXK
         LwHw==
X-Gm-Message-State: AOAM530kDlNRGkO3QjNcgod9S6XC2XWv5p2v5bQJg5p3VM6Lf/2ogg1X
        /Ye1UCe2ivZVu17JFmzxErVxk0V4dlQ=
X-Google-Smtp-Source: ABdhPJw1kSuaovbzhW8ICvBwEJsB1HAQKnfXO4caV4czvi3Y3WHIYgyeRNwQjjdNhwhnKUfgX9D87g==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr1450757wmb.174.1637625625484;
        Mon, 22 Nov 2021 16:00:25 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:25 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 01/17] media: i2c: Re-order runtime pm initialisation
Date:   Tue, 23 Nov 2021 00:00:01 +0000
Message-Id: <20211123000017.43187-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kerneldoc for pm_runtime_set_suspended() says:

"It is not valid to call this function for devices with runtime PM
enabled"

To satisfy that requirement, re-order the calls so that
pm_runtime_enable() is the last one.

Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ce50f3ea87b8..490832cdb831 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2897,8 +2897,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* Runtime PM */
 
-	pm_runtime_enable(sensor->dev);
 	pm_runtime_set_suspended(sensor->dev);
+	pm_runtime_enable(sensor->dev);
 
 	/* V4L2 subdev register */
 
-- 
2.25.1

