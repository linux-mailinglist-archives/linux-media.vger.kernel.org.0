Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8CA447461
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235931AbhKGRSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:18:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53889 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235925AbhKGRSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TN3M1d5XJcSeQr02Uxkvd7ceeDIpLiFFnrD5J9Lli10=;
        b=FK6CHOFTjcO8yc3PDlnFJnWfF/pGjfMe3o011xrhBaI3aUnvIolpKW8Vu+t0/62UZ+nyUQ
        uS8zU0ERIkBeBBNWkiBp2n0rFM9/9XaRYdjvWVUYz5XJY/lZYi1+C3tMMnD8CQRFAIFQM3
        JC05SpccjC9JUop+Ybma4yuwBtkY4Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-0XbMcXJAPYqkjy0SMzLjRw-1; Sun, 07 Nov 2021 12:16:05 -0500
X-MC-Unique: 0XbMcXJAPYqkjy0SMzLjRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B32115720;
        Sun,  7 Nov 2021 17:16:04 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CE3B57CD3;
        Sun,  7 Nov 2021 17:16:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 05/11] media: atomisp-ov2680: Move ov2680_init_registers() call to power_up()
Date:   Sun,  7 Nov 2021 18:15:43 +0100
Message-Id: <20211107171549.267583-6-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move ov2680_init_registers() call to power_up(), so that we also
init the registers on code-paths which do not call ov2680_s_power()
like running camorama.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note we should really look into makeing sure that s_power() is always
called when it should and remove the power_up() call from
ov2680_set_fmt() when that is done.

Even then we still need the power_on bool though since power_down()
gets called on every runtime-suspend, even if power_up() was never
called.
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index b6927f9be022..83608ba4e70a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -744,9 +744,15 @@ static int power_up(struct v4l2_subdev *sd)
 	/* according to DS, 20ms is needed between PWDN and i2c access */
 	msleep(20);
 
+	ret = ov2680_init_registers(sd);
+	if (ret)
+		goto fail_init_registers;
+
 	dev->power_on = true;
 	return 0;
 
+fail_init_registers:
+	dev->platform_data->flisclk_ctrl(sd, 0);
 fail_clk:
 	gpio_ctrl(sd, 0);
 fail_power:
@@ -807,8 +813,6 @@ static int ov2680_s_power(struct v4l2_subdev *sd, int on)
 		ret = power_down(sd);
 	} else {
 		ret = power_up(sd);
-		if (!ret)
-			ret = ov2680_init_registers(sd);
 	}
 
 	mutex_unlock(&dev->input_lock);
-- 
2.31.1

