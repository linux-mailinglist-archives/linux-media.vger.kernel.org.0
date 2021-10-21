Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB84436CF2
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhJUVq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbhJUVq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:26 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692B4C061243
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:08 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k7so1572126wrd.13
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qstZiRiLUFrlQU1DowMt14WiuOpUvjb5Tv4Ka3RUSR0=;
        b=UeQXXz5lrF3f3C0uBTi9jvimjXWehy7Mz/klAybFBdWC/Po3V8LobKahtL5taFqDkX
         jB11F8oCJIR/kmcM1nFSZR97BVjbSY+3O74Jo+7lx6d0BMO1TNPZhcvzIJernUTiUVkE
         3lZMN6K8YMjut/IuSYwM5v+17IcgndyaW678yJaZQCRcvT0QKF/YArEd3KQ3a4wR+GSO
         kgvpmH1I1Mdit6Y6rQKc04rmBrQcRhwmyM1c5gkSze85Cl8tsc2d5COMNhuTZLmTWdu/
         MNNWzReTYEdBL78gwF6ChTC3yoeUM5dPJslVe3VMR2v/fKVH86IjofwkeOZMtqmLRcE6
         0oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qstZiRiLUFrlQU1DowMt14WiuOpUvjb5Tv4Ka3RUSR0=;
        b=E5+B4glfbcZqSJ2NkHBZS0IIEUA4Sx0tBtjLQaQjOP6gnA8Q3CcJVheHkP/1dbVTGY
         Mnj+4NXTj1aCr6+EhuV+v6BBADYTJZh26r+PQSlap2u5E6LbMP06SzzSdNB4xAq+wEvw
         XBFiZ0wngV4jKxqr48SHAslMl8LPg742Em+dvJLMN7fvFTLURHWOnLEBMWThJzI79HlH
         sBeLSAANpucSICRBLJ9N4dB+penxEVdnSCwjv4Q7dAgKsWN40lJu6K0aYl+CwiF+d5gU
         R880/B/+Kc5Qbvw4GD2VnBB5z2kN+B9C48DOgQ15i6N5nUA/cIKAKkmCgGP0p1ZVgPJJ
         znLw==
X-Gm-Message-State: AOAM532rRkL+sk1U7/8136858UhZTZDXTonAZRi2vCYWmyCELrESMeqz
        d1Rlmol4k8tB5Xb/eLxIs7vazjMnevs=
X-Google-Smtp-Source: ABdhPJzbMwblFyWbfKKgBW2DezxustAG2ItKFIYkILc7P4leeS7Z0lHna91T53eNa0kyRie2E2QEuA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr10366405wrr.76.1634852647205;
        Thu, 21 Oct 2021 14:44:07 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:06 -0700 (PDT)
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
Subject: [PATCH v3 13/16] media: i2c: Re-order runtime pm initialisation
Date:   Thu, 21 Oct 2021 22:43:28 +0100
Message-Id: <20211021214331.1188787-14-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
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

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- Patch introduced

 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 0bf3f72892f7..572b9818e950 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3085,8 +3085,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* Runtime PM */
 
-	pm_runtime_enable(sensor->dev);
 	pm_runtime_set_suspended(sensor->dev);
+	pm_runtime_enable(sensor->dev);
 
 	/* V4L2 subdev register */
 
-- 
2.25.1

