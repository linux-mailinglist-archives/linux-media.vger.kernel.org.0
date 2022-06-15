Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F393C54D31C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348179AbiFOUvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348041AbiFOUvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0587854FB9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HPeVzT/Gv7AGx9Ccw8T+Z3bujxfoXiYzYQWYqUg4ScU=;
        b=dE5GSI/kV7OCtj7DwzKK974BMbW6q8HP8slA7UTiA5yLhTPn8nOI3s8m1sxza+XwaUPKYJ
        Dl1BjArDxWlIhClpOoR+iDYjruJwZsRggQZo6iNWCn8VB5X4d6BYgXqmFf0rtDUXF62mug
        DZz77bD87NLmgQjh93xad7qQOH2JB7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-FVFUdp-rPd6rVfy85QiKIg-1; Wed, 15 Jun 2022 16:51:41 -0400
X-MC-Unique: FVFUdp-rPd6rVfy85QiKIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BC861C1C1AE;
        Wed, 15 Jun 2022 20:51:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E02A11131D;
        Wed, 15 Jun 2022 20:51:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 33/40] media: atomisp: fix __get_frame_info() error handling
Date:   Wed, 15 Jun 2022 22:50:30 +0200
Message-Id: <20220615205037.16549-34-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On ia_css_pipe_get_info() errors, destroy both the streams as well
as the pipes which were created.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 6e91654ce5da..d03b29add5c3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2653,7 +2653,7 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 				   &p_info);
 	if (ret) {
 		dev_err(isp->dev, "can't get info from pipe\n");
-		goto stream_err;
+		goto get_info_err;
 	}
 
 	switch (type) {
@@ -2684,6 +2684,8 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 
 	return 0;
 
+get_info_err:
+	__destroy_streams(asd, true);
 stream_err:
 	__destroy_pipes(asd, true);
 	return -EINVAL;
-- 
2.36.0

