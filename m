Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C31C677BE6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbjAWMzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbjAWMzP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D14F6E91
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9F84eUOqTteOn9ZaWHcd57l4YmKpYzxnYD9qd/O+FK0=;
        b=SWb2u3rBLgX4Os89E9pMjTbtT+B1evA1fNIchhfmhvtB7tvnMO+YLZcm42mh4W2RTENRDR
        ySLp0ARnTSK+thBFbNvp5HUcgsWd084EUeiONMIad5d3aoxWUuPi0U5k2CcIy/tkLt+eq7
        s5gSfxtkYz0F0a+dv4tZirYEDHjnwnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-xhFJ5YblM7KCf4HCY5TtHQ-1; Mon, 23 Jan 2023 07:54:14 -0500
X-MC-Unique: xhFJ5YblM7KCf4HCY5TtHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67FC818E0047;
        Mon, 23 Jan 2023 12:54:13 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 27EF8C15BA0;
        Mon, 23 Jan 2023 12:54:10 +0000 (UTC)
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
Subject: [PATCH 41/57] media: atomisp: ov2680: Fix frame_size list
Date:   Mon, 23 Jan 2023 13:51:49 +0100
Message-Id: <20230123125205.622152-42-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

3 fixes for the framesize list:

1. Drop modes < 640x480, these are made by significant cropping,
   leading to such a small remainig field-of-view that they are
   not really usable

2. 1616x1082 is presumably intended to be 1600x1080 + 16 pixels
   padding in both dimensions, but the height is wrong.
   Change this to 1616x1096.

3. The 800x600 mode is missing the 16 pixels padding and
   720x592 is missing 16 pixels padding in its width and
   the 720x576 base mode is a mode with non square pixels,
   while the sensor has square pixels.
   Replace both with 768x576 + 16 pixels padding -> 784x592

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 432539dd274c..81fd36b09090 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -700,17 +700,13 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 {
 	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
 		{ 1616, 1216 },
-		{ 1616, 1082 },
+		{ 1616, 1096 },
 		{ 1616,  916 },
 		{ 1456, 1096 },
 		{ 1296,  976 },
 		{ 1296,  736 },
-		{  800,  600 },
-		{  720,  592 },
+		{  784,  592 },
 		{  656,  496 },
-		{  336,  256 },
-		{  352,  288 },
-		{  176,  144 },
 	};
 	int index = fse->index;
 
-- 
2.39.0

