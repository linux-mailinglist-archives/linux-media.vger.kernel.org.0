Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10E677BD1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbjAWMyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbjAWMyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC5F1E5F7
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kvzuLTo89gm7coYzgT/MBfaPZIzp2kNmsAsngck3ISY=;
        b=Pd0ay5gbb6wNp3aXxFZ3L9XuUC6KHSKETJ7onfeliBmUuOfcRzibZm1gya5R+dUBADDHPu
        xumj3JoTGQZQ7lR/wI7uGAUsq7P6nNc9Wc5fzZkLmiVx5NJymnbEzvmdroRs48V0Yiq9Yo
        MQprsjiNjMfWR/Ua46D9N13sdQvm0Vg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-GTffyq7oNFCc1tLVKHkDcg-1; Mon, 23 Jan 2023 07:53:20 -0500
X-MC-Unique: GTffyq7oNFCc1tLVKHkDcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BCA72805585;
        Mon, 23 Jan 2023 12:53:19 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 805E7C15BA0;
        Mon, 23 Jan 2023 12:53:17 +0000 (UTC)
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
Subject: [PATCH 25/57] media: atomisp: Stop overriding padding w/h to 12 on BYT
Date:   Mon, 23 Jan 2023 13:51:33 +0100
Message-Id: <20230123125205.622152-26-hdegoede@redhat.com>
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

atomisp_set_fmt() first does:

	v4l2_fill_mbus_format(&vformat.format, ...);
        vformat.format.height += padding_h;
        vformat.format.width += padding_w;

        ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
                               set_fmt, NULL, &vformat);
        if (ret)
                return ret;

	f->fmt.pix.width = vformat.format.width - padding_w;
	f->fmt.pix.height = vformat.format.height - padding_h;

this happens with the original padding w/h = 16 values and then later
on it calls:

                ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
                                             f->fmt.pix.pixelformat, padding_w,
                                             padding_h, dvs_env_w, dvs_env_h);

Which repeats the above structure. If at that point padding w/h are
changed to 12 then it will now request a different output-size of
the sensor driver.

The sensor drivers so far have actually been ignoring this since they use
v4l2_find_nearest_size() on a fixed resolution list and the nearest
resolution will be the one from the earlier calls where padding w/h
was 16.

But there really is no reason for sensor drivers to use a fixed
resolution list. They make lower resolutions using cropping so they
can make any resolution as long as width/height are even numbers.

Dropping the fixed-resolution list limit from sensors on BYT results
in trying to start streaming failing because the resolution set to
the sensor now no longer matches with the resolution used during
the initial part of the configuration done by atomisp_set_fmt().

Drop the BYT specific overriding of the padding_w/h to 12, so that
the padding in the first and second s_fmt calls made to the sensor
matches, to fix stream start failing when the fixed resolution list
is dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index eb05288d8fb1..47f18ac5e40e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5163,9 +5163,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	if (!atomisp_subdev_format_conversion(asd, source_pad)) {
 		padding_w = 0;
 		padding_h = 0;
-	} else if (IS_BYT) {
-		padding_w = 12;
-		padding_h = 12;
 	}
 
 	/* construct resolution supported by isp */
-- 
2.39.0

