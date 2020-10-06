Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850C9285318
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 22:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgJFU3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 16:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgJFU3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 16:29:08 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A97C061755;
        Tue,  6 Oct 2020 13:29:08 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y11so16520586lfl.5;
        Tue, 06 Oct 2020 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition;
        bh=/mtugB3eJpyIDsDQWTsWaRCuOKG5/5/BmB1XvAxGCm0=;
        b=qwzZOCKYimmfUnBsUrCcujD3ub16wyhUJUO3q+wsp3fNxdDZ/SuDHCnczA8zaUdmRK
         YVevZqbZ7iIhQcfIhITdqrIAVR7BKpO7NnEIRQ5bsmhZ+U0w5gZNn598YVbIjw8Po6xr
         pDZBsVsWYi7xmx/6ol0TAMUQVOf4F9f+VPY/uOnIlRQgG3kAJN2a3u725fx+DTiZ/+gs
         JbQ0MbyVCBgKxB1+RB7oYRG1Hy8VMBktMllPU0RSTOaDQBWsrmg4bxN4A1zJyuShZVvL
         c1XCDKf0LxFkrP5cRiY2Lj38YziSosvu8jVJiAK7PnC+00XQJB9zyHcmf6P4iBFiCckW
         ANOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/mtugB3eJpyIDsDQWTsWaRCuOKG5/5/BmB1XvAxGCm0=;
        b=BQfvqtL3wJbXlwe+0JYLmX6tjA7K28dUgIPWJsXXJs/sDLiGfcSCAJhc7c+gTw1vBe
         /aSqZ4jbf2dfMKZGc0xNe5NwgAoe4+2z8QPHMvpGch+i8UCXrMq49XzECECx33ye17Dv
         5emk6zPU4CxkFvW65HBBKYwUQO+X6HPObAdvrF2rz9iQeEORLWHgbv5QR4ajT6IHJYJo
         jMde5jQFkszHbBflc1y/USSsE0NjGiz1CS6tjK+99sg3YZWHL0TR6Cr0nDJEOqTADVOy
         myTVOE4sewc5fbfgs5Au2cduD1Aqc/818ok210ExmQyjQSOBe6PeKsdTLtDZD6M+7+jq
         3ycQ==
X-Gm-Message-State: AOAM533PmUT/5TaTV0XXwkn7xSBJiRpHmyT3e3Yb2foBsmppYZ21d1Vv
        j2oUEH65SEEGOarVtKMHvhKKWMgWbD4T/KE3UxM=
X-Google-Smtp-Source: ABdhPJwEWZf0/uTKQvZhiTzZbFP7mYa2rbczBGdn9OD85tMXtLTfU+4xR+LGTugu57qmNkoQqFj/nQ==
X-Received: by 2002:ac2:4154:: with SMTP id c20mr999157lfi.236.1602016146126;
        Tue, 06 Oct 2020 13:29:06 -0700 (PDT)
Received: from linux ([185.17.130.128])
        by smtp.gmail.com with ESMTPSA id m204sm4331lfd.307.2020.10.06.13.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 13:29:05 -0700 (PDT)
Date:   Tue, 6 Oct 2020 22:29:03 +0200
From:   Leonid Kushnir <leonf008@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, leonf008@gmail.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: staging: atomisp: Corrected error handling in
 function
Message-ID: <20201006202903.GA8346@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes check of a result of 'power_up()' function call in
function 'gc0310_s_power()' to do "error handling" instead of "success
handling" as Dan Carpenter noted in his comment on the previous patch.
Lines 'return gc0310_init(sd)' and 'return ret' are swapped, and direct
value of 'ret' is checked in IF statement now.

Signed-off-by: Leonid Kushnir <leonf008@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 8201c15b5769..d170d0adfea4 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -874,11 +874,12 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 
 	if (on == 0)
 		return power_down(sd);
+
 	ret = power_up(sd);
-	if (!ret)
-		return gc0310_init(sd);
+	if (ret)
+		return ret;
 
-	return ret;
+	return gc0310_init(sd);
 }
 
 /*
-- 
2.25.1

