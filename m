Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DEA71A1C4
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 17:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbjFAPCi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 11:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbjFAPBF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 11:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A3E10C6
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685631552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CLbmVOgz/qGytzeTRFuwNtPS8niumFXtgT7WpGJlhwQ=;
        b=EuRQMRbKjGUfCHWj/9C/gE9/j9FH17PpDFbH6d2zynyfTgam7N5bnBWuQzj6nKC8iVcSFq
        8gcd/whAWQc5bIsSbIU8LIMue94uHA54AjwA4yQ+ZRMqOHfuAUrpyjvJk83+VCOBgt37Ll
        qH0N2s0hxkB8PAYh0oAjroJDCLnq3wc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-K3VMHtKkMYix5xvpHvKczg-1; Thu, 01 Jun 2023 10:59:06 -0400
X-MC-Unique: K3VMHtKkMYix5xvpHvKczg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23D03811E8D;
        Thu,  1 Jun 2023 14:59:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 98FAD2029F6E;
        Thu,  1 Jun 2023 14:59:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 3/3] media: atomisp: Fix binning check in atomisp_set_crop()
Date:   Thu,  1 Jun 2023 16:58:58 +0200
Message-Id: <20230601145858.59652-4-hdegoede@redhat.com>
In-Reply-To: <20230601145858.59652-1-hdegoede@redhat.com>
References: <20230601145858.59652-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fmt / size passed to atomisp_set_crop() includes padding,
so the binning check should be against 1/2 of the native rect.
of the sensor, rather then 1/2 of the active rect.

This fixes binning not being used when using e.g. 800x600 on
a 1600x1200 sensor leading to a very small field of view.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 68550cd49a83..e27f9dc8e7aa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3769,8 +3769,8 @@ static int atomisp_set_crop(struct atomisp_device *isp,
 		return 0;
 
 	/* Cropping is done before binning, when binning double the crop rect */
-	if (input->binning_support && sel.r.width <= (input->active_rect.width / 2) &&
-				      sel.r.height <= (input->active_rect.height / 2)) {
+	if (input->binning_support && sel.r.width <= (input->native_rect.width / 2) &&
+				      sel.r.height <= (input->native_rect.height / 2)) {
 		sel.r.width *= 2;
 		sel.r.height *= 2;
 	}
-- 
2.40.1

