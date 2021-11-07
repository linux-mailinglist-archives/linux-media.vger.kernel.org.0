Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9525447465
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhKGRTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23927 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235943AbhKGRTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kFRnRVo7m67vnXPldImfmaggNaRRIwxaAtsgE2VRJtU=;
        b=cZd5NsM26CK3VwUGTTmKaf7+wUMKamXMRVUl9ibAeo4KTQYVczfP6dl/OPE6YtmdOk430r
        dPmJbPlhw3KjVLCDdjmFIQ8G0nNvAw7KunFFQNhnBy1rOkwutgTb1csGklQFWkOQktrQ+h
        pu2jv7z/g8obqLoHdA7pv1LGYpUUXSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-_-ssiAWgOJ2ZSXzrhCChPQ-1; Sun, 07 Nov 2021 12:16:12 -0500
X-MC-Unique: _-ssiAWgOJ2ZSXzrhCChPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F8AB8042DB;
        Sun,  7 Nov 2021 17:16:11 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFD267843;
        Sun,  7 Nov 2021 17:16:08 +0000 (UTC)
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
Subject: [PATCH 08/11] media: atomisp-ov2680: Fix and simplify ov2680_q_exposure()
Date:   Sun,  7 Nov 2021 18:15:46 +0100
Message-Id: <20211107171549.267583-9-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to ov2680_read_reg() to read all 24 bits in one go;
and the exposure value sits in bits 4-19 of the 24 bit exposure
register, so we need to shift the read value by 4 to report the
correct value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 27 +++++--------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 7e49f4eb0410..d6a5f75fdd66 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -410,32 +410,17 @@ static long ov2680_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u32 reg_v, reg_v2;
+	u32 reg_val;
 	int ret;
 
 	/* get exposure */
-	ret = ov2680_read_reg(client, 1,
-			      OV2680_EXPOSURE_L,
-			      &reg_v);
-	if (ret)
-		goto err;
-
-	ret = ov2680_read_reg(client, 1,
-			      OV2680_EXPOSURE_M,
-			      &reg_v2);
+	ret = ov2680_read_reg(client, 3, OV2680_EXPOSURE_H, &reg_val);
 	if (ret)
-		goto err;
-
-	reg_v += reg_v2 << 8;
-	ret = ov2680_read_reg(client, 1,
-			      OV2680_EXPOSURE_H,
-			      &reg_v2);
-	if (ret)
-		goto err;
+		return ret;
 
-	*value = reg_v + (reg_v2 << 16);
-err:
-	return ret;
+	/* Lower four bits are not part of the exposure val (always 0) */
+	*value = reg_val >> 4;
+	return 0;
 }
 
 static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
-- 
2.31.1

