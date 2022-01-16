Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9DC748FF4B
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbiAPVw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbiAPVw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hkoQd7gjxr71vUNWnR7XIGrbM4DTr+/zCdydsU3Qc/8=;
        b=Bpw0fpzN4hVDOqsT7g0rUIz8FiwGU9aTpZ4mZ85zcxZT5Nm4bsiZNVBJAKApKUQrk5fpSz
        IsucenxjxOIkzUrpLvzkjhhO1jrKFc9DbW3HZLmXhxLR8Cz2CvtxQbLCZvt0MtUa0HR2Zc
        uJRcrAuwZgznAom7zRAz5vA3deIPNdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-lxTBumPvP82OVLxsuF1raw-1; Sun, 16 Jan 2022 16:52:21 -0500
X-MC-Unique: lxTBumPvP82OVLxsuF1raw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737CB2F24;
        Sun, 16 Jan 2022 21:52:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF83361F20;
        Sun, 16 Jan 2022 21:52:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 4/9] media: atomisp_gmin_platform: Fix axp_regulator_set() writing to the wrong register
Date:   Sun, 16 Jan 2022 22:51:59 +0100
Message-Id: <20220116215204.307649-5-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The second write done in axp_regulator_set() must go to the ctrl_reg which
turns the various regulators on/off. This replaces the second write
writing the sel_reg, which sets the voltage for the regulator, for a
second time with a wrong value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1cc581074ba7..a29e5086ffe1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -741,7 +741,7 @@ static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
 
 	val = on ? 1 << shift : 0;
 
-	ret = gmin_i2c_write(dev, gs->pwm_i2c_addr, sel_reg, val, 1 << shift);
+	ret = gmin_i2c_write(dev, gs->pwm_i2c_addr, ctrl_reg, val, 1 << shift);
 	if (ret)
 		return ret;
 
-- 
2.33.1

