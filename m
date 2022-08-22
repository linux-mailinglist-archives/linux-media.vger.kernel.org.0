Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45959C226
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235853AbiHVPJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236064AbiHVPI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE4D3D5B9
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4jkL3AG5p1xchw2SzpTnx63ZLD5wc0KsNOUMT+cctLA=;
        b=Jierc+ATcj1fQabsdJqV6YWLRz4BbYSsOF97lE320yLZLMyOAkq6xX2b9/MVvKm8WROT0P
        O3NBsq1giLRfg2Emy6G32IVZjk8tNr8FFGx5xbGElxmT+ZVCw9gnXXI9cHqOO/NHOR4xEr
        +A/MIVyqo0nLpufa3uD8Fp48dT7BZro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-uYApj0T2N7CyIoXeXjfaLw-1; Mon, 22 Aug 2022 11:06:18 -0400
X-MC-Unique: uYApj0T2N7CyIoXeXjfaLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE9C885A587;
        Mon, 22 Aug 2022 15:06:17 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4208440CFD0B;
        Mon, 22 Aug 2022 15:06:15 +0000 (UTC)
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
Subject: [PATCH v2 02/13] media: atomisp-ov2680: Fix ov2680_set_fmt()
Date:   Mon, 22 Aug 2022 17:05:59 +0200
Message-Id: <20220822150610.45186-2-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On sets actually store the set (closest) format inside ov2680_device.dev,
so that it also properly gets returned by get_fmt.

This fixes the following problem:

1. App does an VIDIOC_SET_FMT 640x480, calling ov2680_set_fmt()
2. Internal buffers (atomisp_create_pipes_stream()) get allocated
   at 640x480 size by atomisp_set_fmt()
3. ov2680_get_fmt() gets called later on and returns 1600x1200
   since ov2680_device.dev was not updated. So things get configured
   to stream at 1600x1200, but the internal buffers created during
   atomisp_create_pipes_stream() do not get updated in size
4. streaming starts, internal buffers overflow and the entire
   machine freezes eventually due to memory being corrupted

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 4ba99c660681..ab52e35266bb 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -894,11 +894,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	if (v_flag)
 		ov2680_v_flip(sd, v_flag);
 
-	/*
-	 * ret = startup(sd);
-	 * if (ret)
-	 * dev_err(&client->dev, "ov2680 startup err\n");
-	 */
+	dev->res = res;
 err:
 	mutex_unlock(&dev->input_lock);
 	return ret;
-- 
2.36.1

