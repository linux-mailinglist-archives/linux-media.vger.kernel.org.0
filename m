Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E2A28483A
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 10:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJFIRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 04:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJFIRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 04:17:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D367FC061755;
        Tue,  6 Oct 2020 01:17:24 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h6so7247420lfj.3;
        Tue, 06 Oct 2020 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition;
        bh=/5MZorYI2P0RKQFIhOL/pMZNAYxxGQrsvDlS9cE+MSg=;
        b=hHGVYNKFgsbXf6BSP2zJVrgvHO+lgO41/moTuU8ZGZh/hHlFaqd8AjQh1GFPoFlS5o
         tsDMWyuXpVsXWZLCZeOawdr1Er+8tBDRG48sbNTtN2qjPPEYsFfa/Xk7ngdZBjgcpcZz
         v238pEKj70l9C67p3DqzLqo89mHoofzkSU6j1lFUo5AHVPT+xm+5pSLBFrOTYOQhIvpm
         j+48xsSHCzTLc3EpI/ez8QjGYgefesW32yHLnHtvHXfIv2dGQtr1GX9LiQLOyX6Uk6NL
         ao8GdtIpMa74tLr4INqJLawE02uJ3ACJMCbkpFJfQttKmzCpUBtjcGDUnBwkjwCY/NLk
         86Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/5MZorYI2P0RKQFIhOL/pMZNAYxxGQrsvDlS9cE+MSg=;
        b=meJkZ8XmfsMuUAogqP2aXLEu4cKwWqCEnCJT9ketuolAHKuxW2O6LXVDQUjDtCtcPQ
         IPWkJghgykK8WSidAWFYMNKWrpe6AEaB3qvEWXeR+PASj2QynoXNpWWqPK08CSKgHx3n
         NyTFyDXQ2Bikpng7wDLoC0OSkRHP+D/dBmRf6T/69e/FHJ77ErIB/CV/7dBBpGL7kmOV
         lOlOUnNNL3GFyf+4FQBjqSY5xy1TDOYh+3EIMSGN04Nd3CQe2qjcP4NTnjjhX7FN8/ae
         QP/qMwQGJzDkRnxw5VK5JXQsDNWvJ1Db7iq8OZeHBZmIvBbcpepGSWdDotfkKWe4oKJb
         s2wg==
X-Gm-Message-State: AOAM530GaquJoQXiv5aG9DGArkOCSHiW8AQeBpql5P1OC3rZ1xkwQy4U
        /mR8FNDAsY7OmXRmOxq79FFF73GknC0jId9e
X-Google-Smtp-Source: ABdhPJxQimuHzq3/8Xf77sWdNqHg8ZOT15eczQ4oIcyib3hE2EWEjmwdE3UKs4a4EtVsyr1UeSOvCA==
X-Received: by 2002:ac2:5506:: with SMTP id j6mr96173lfk.290.1601972243056;
        Tue, 06 Oct 2020 01:17:23 -0700 (PDT)
Received: from linux ([185.17.130.172])
        by smtp.gmail.com with ESMTPSA id z23sm497984lfe.238.2020.10.06.01.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 01:17:22 -0700 (PDT)
Date:   Tue, 6 Oct 2020 10:17:21 +0200
From:   Leonid Kushnir <leonf008@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, leonf008@gmail.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: staging: atomisp: Removed else branch in function
Message-ID: <20201006081721.GA35979@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the checkpatch.pl warning :

WARNING: else is not generally useful after a break or return

Expressions under 'else' branch in function 'gc0310_s_power' are
executed whenever the exppression in 'if' is False. Otherwise, return
from function occurs. Therefore, there is no need in 'else', and it has
been removed.

Signed-off-by: Leonid Kushnir <leonf008@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6be3ee1d93a5..8201c15b5769 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -874,11 +874,10 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 
 	if (on == 0)
 		return power_down(sd);
-	else {
-		ret = power_up(sd);
-		if (!ret)
-			return gc0310_init(sd);
-	}
+	ret = power_up(sd);
+	if (!ret)
+		return gc0310_init(sd);
+
 	return ret;
 }
 
-- 
2.25.1

