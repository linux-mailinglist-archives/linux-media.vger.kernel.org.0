Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963FB73545F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 12:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbjFSKzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 06:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjFSKyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 06:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19344100
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687171949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ii0g44MHqb3/hcjWWH34sglXiDVkosGVv1NC25z3QnE=;
        b=Zc5eSQC3OvNUttXlvYVTp/R/swjg25xCDN0qUWUwusV/d36DmC5NEJBGA6CSWxj1xyJ7cz
        pmkU5eXIwNJUhgUwkObgR4nzvngD8/lU8pWh/vtfFpgiv1sRckunPh7yWI5PoEbm6X7lx+
        d5S+0iACHMUQzzhVABtktjYuZ3XnMbY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-ek3U7LH8OXuq8CIMAIBJXw-1; Mon, 19 Jun 2023 06:52:24 -0400
X-MC-Unique: ek3U7LH8OXuq8CIMAIBJXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 297CC801189;
        Mon, 19 Jun 2023 10:52:23 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 95BB1112132C;
        Mon, 19 Jun 2023 10:52:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 5/7] media: atomisp: Add some higher resolutions to atomisp_enum_framesizes()
Date:   Mon, 19 Jun 2023 12:52:10 +0200
Message-Id: <20230619105212.303653-5-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add some higher resolutions to the fixed list of resolutions which
atomisp_enum_framesizes() uses on sensors which can do cropping and can
thus make any resolution that will fit.

This is useful for higher resolution sensors like the 2560x1920 ov5693
sensor.

Note the highest resolutions added here are 1920x<height> because
the atomisp firmware does not support widths > 1920 with the default
asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW setting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 047b9fb075d0..8fd981f49659 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -708,6 +708,9 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      int *valid_sizes)
 {
 	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+		{ 1920, 1440 },
+		{ 1920, 1200 },
+		{ 1920, 1080 },
 		{ 1600, 1200 },
 		{ 1600, 1080 },
 		{ 1600,  900 },
-- 
2.40.1

