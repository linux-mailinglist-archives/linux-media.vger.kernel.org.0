Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11FB859C22B
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbiHVPJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbiHVPJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10B53C16F
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NBCHdjbnejNVPjhkCfLY/AVn9WBy+Yx1pvKm4t6w3Xw=;
        b=KdUNTOOFIs0TyW4KYEJQOimxu9Lhx4JdIxVs2ikjTkygToJuidG/BCX+UE8VOfzQnalMIO
        dXk4CNkwl45b2PNwj/2lTVvrVQRgoAOEObbV+vWqUfpMsHbTeAzF7xHXthOBbFCn33kHur
        FCLZRyStB+sI1ZbmxzgyZwZpaFZcUME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-SEv0_x6xMAOE139mXbJCFg-1; Mon, 22 Aug 2022 11:06:29 -0400
X-MC-Unique: SEv0_x6xMAOE139mXbJCFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50351C1A945;
        Mon, 22 Aug 2022 15:06:28 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3098740CF8E8;
        Mon, 22 Aug 2022 15:06:27 +0000 (UTC)
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
Subject: [PATCH v2 07/13] media: atomisp: Make atomisp_try_fmt_cap() take padding into account
Date:   Mon, 22 Aug 2022 17:06:04 +0200
Message-Id: <20220822150610.45186-7-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_try_fmt() gives results with padding included. So when userspace
asks for e.g. 1600x1200 then we should pass 1616x1216 to atomisp_try_fmt()
this will then get adjusted back to 1600x1200 before returning it to
userspace by the atomisp_adjust_fmt() call at the end of atomisp_try_fmt().

This fixes the resolution list in camorama showing resolutions like e.g.
1584x1184 instead of 1600x1200.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 459645c2e2a7..7ecee39ef5a4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -960,6 +960,13 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret;
 
+	/*
+	 * atomisp_try_fmt() gived results with padding included, note
+	 * (this gets removed again by the atomisp_adjust_fmt() call below.
+	 */
+	f->fmt.pix.width += pad_w;
+	f->fmt.pix.height += pad_h;
+
 	rt_mutex_lock(&isp->mutex);
 	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
 	rt_mutex_unlock(&isp->mutex);
-- 
2.36.1

