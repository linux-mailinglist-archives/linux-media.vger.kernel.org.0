Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BDC59C271
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbiHVPOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236418AbiHVPNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5D53DBC1
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fGz219Nb72Rp/NAx6dJ8BVWwdrlZSPMBaaDB7hXVqks=;
        b=No1ktFeG5YakXdq1K/8C4dZLQHLLTGTJT2ilzPuhSDvQplq3DyjmxFJALFL34y1AptLlsi
        jKggwqbcL3UuzQbjjeiueRR3baqvud4svWiUlXdaU0bb7VCF9yTohgc4Z2Np55yn5GDFfT
        LUnNxYTYrotGcBCuC5YPl6bfqA6uU1s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-U4E0XBK5PaSvVIRVUtfrew-1; Mon, 22 Aug 2022 11:06:48 -0400
X-MC-Unique: U4E0XBK5PaSvVIRVUtfrew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF8723C1014B;
        Mon, 22 Aug 2022 15:06:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1AEDE40CF8E8;
        Mon, 22 Aug 2022 15:06:24 +0000 (UTC)
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
Subject: [PATCH v2 06/13] media: atomisp: Fix VIDIOC_TRY_FMT
Date:   Mon, 22 Aug 2022 17:06:03 +0200
Message-Id: <20220822150610.45186-6-hdegoede@redhat.com>
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

atomisp_try_fmt() calls the sensor's try_fmt handler but it does
not copy the result back to the passed in v4l2_pix_format under
some circumstances.

Potentially returning an unsupported resolution to userspace,
which VIDIOC_TRY_FMT is not supposed to do.

atomisp_set_fmt() also uses atomisp_try_fmt() and relies
on this wrong behavior. The VIDIOC_TRY_FMT call passes NULL for
the res_overflow argument where as the atomisp_set_fmt() call
passes non NULL.

Use the res_overflow argument to differentiate between the 2 callers
and always propagate the sensors result in the VIDIOC_TRY_FMT case.

This fixes the resolution list in camorama showing resolutions like e.g.
1584x1184 instead of 1600x1200.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c932f340068f..db6465756e49 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4886,8 +4886,8 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		return 0;
 	}
 
-	if (snr_mbus_fmt->width < f->width
-	    && snr_mbus_fmt->height < f->height) {
+	if (!res_overflow || (snr_mbus_fmt->width < f->width &&
+			      snr_mbus_fmt->height < f->height)) {
 		f->width = snr_mbus_fmt->width;
 		f->height = snr_mbus_fmt->height;
 		/* Set the flag when resolution requested is
-- 
2.36.1

