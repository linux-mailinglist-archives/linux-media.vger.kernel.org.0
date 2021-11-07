Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E78A447468
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbhKGRTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:19:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52534 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235939AbhKGRTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7+Hqx1r7abyFwhHyL4T7QRDlfh0b0QeNO6qd+NH8FsI=;
        b=cMrMM708s1GqhFa74NM9U8ManUb5NXj1IhtbQZ6a8XL4b1tZIWMQyjROTfLoeIZhr6KL7j
        cXp1cgmehyOzq6ML1otYCpzEBzKvdpaxy29zTBwSxm9hXI7Hl6XSg+6dDvf3+fgKTZVD+8
        Xp3cfbcz/qvMQ4e7Wybw8DR+36XlBWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-8l3GUbqXOjame68Uy9tWcQ-1; Sun, 07 Nov 2021 12:16:22 -0500
X-MC-Unique: 8l3GUbqXOjame68Uy9tWcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6E11006AA0;
        Sun,  7 Nov 2021 17:16:20 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 56BBD67843;
        Sun,  7 Nov 2021 17:16:11 +0000 (UTC)
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
Subject: [PATCH 09/11] media: atomisp-ov2680: Fix ov2680_write_reg() always writing 0 to 16 bit registers
Date:   Sun,  7 Nov 2021 18:15:47 +0100
Message-Id: <20211107171549.267583-10-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The shift << 16 of the value in the code path for 16 bit values is
bogus, put_unaligned_be16() takes the lower 16 bits which will not
always be 0.

This was causing __ov2680_set_exposure() to always set the
OV2680_AGC and OV2680_TIMING_VTS registers to 0.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index d6a5f75fdd66..1092d1c2993f 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -86,7 +86,7 @@ static int ov2680_write_reg(struct i2c_client *client, unsigned int len,
 	int ret;
 
 	if (len == 2)
-		put_unaligned_be16(val << (8 * (4 - len)), buf + 2);
+		put_unaligned_be16(val, buf + 2);
 	else if (len == 1)
 		buf[2] = val;
 	else
-- 
2.31.1

