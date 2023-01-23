Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F09677BD0
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbjAWMyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbjAWMyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8BE2411E
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JT8NH2Im1kon+qeErcbRlt4i5g6d5KTT3sU6E5Chc2E=;
        b=gr/0ienjRMmZlazkqmpFsQNpLnGiCEvEKH7+TgJjrAK6BiF8zY67KanVsgCE5mkdp7shP5
        +CuJNY4Q8pOpGT56JMOHNTUJ45OoPt3qX1ED5+PnJC5Pkj8+RlQe2mSPxdLRgnzkP0rGSU
        HoC6vpfAkKjZE6BsGziR5M4qLBOTpfs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-8U8_u61PM5S6Rnl2XOASlQ-1; Mon, 23 Jan 2023 07:53:17 -0500
X-MC-Unique: 8U8_u61PM5S6Rnl2XOASlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3140B1802A39;
        Mon, 23 Jan 2023 12:53:17 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09CDCC15BAD;
        Mon, 23 Jan 2023 12:53:14 +0000 (UTC)
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
Subject: [PATCH 24/57] media: atomisp: Drop ffmt local var from atomisp_set_fmt()
Date:   Mon, 23 Jan 2023 13:51:32 +0100
Message-Id: <20230123125205.622152-25-hdegoede@redhat.com>
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

ffmt is a local variable pointing to a substruct of another local
variable which really just makes the code harder to read / follow,
so drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b9e7ad57040e..eb05288d8fb1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4992,7 +4992,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct v4l2_subdev_format vformat = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	struct v4l2_mbus_framefmt *ffmt = &vformat.format;
 	struct v4l2_rect isp_sink_crop;
 	u16 source_pad = atomisp_subdev_source_pad(vdev);
 	struct v4l2_subdev_fh fh;
@@ -5031,17 +5030,17 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	/* Ensure that the resolution is equal or below the maximum supported */
 
 	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	v4l2_fill_mbus_format(ffmt, &f->fmt.pix, format_bridge->mbus_code);
-	ffmt->height += padding_h;
-	ffmt->width += padding_w;
+	v4l2_fill_mbus_format(&vformat.format, &f->fmt.pix, format_bridge->mbus_code);
+	vformat.format.height += padding_h;
+	vformat.format.width += padding_w;
 
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
 			       set_fmt, NULL, &vformat);
 	if (ret)
 		return ret;
 
-	f->fmt.pix.width = ffmt->width - padding_w;
-	f->fmt.pix.height = ffmt->height - padding_h;
+	f->fmt.pix.width = vformat.format.width - padding_w;
+	f->fmt.pix.height = vformat.format.height - padding_h;
 
 	snr_fmt = f->fmt.pix;
 	backup_fmt = snr_fmt;
-- 
2.39.0

