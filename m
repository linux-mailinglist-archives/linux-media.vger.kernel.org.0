Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065CC54D2FF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348255AbiFOUv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348232AbiFOUvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B6DA755229
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g+eZNUxrzfaTD5sjF0+bRuh49oIiiI0yC6NJ4Tlg5kA=;
        b=daSPfjM8SE2i558KkowAyK8QFwOY4KE2XolXV18QmBIWh3FhGr73b5FKicK7h9Nl1Kjuvr
        WP+yDKx8UUojptTnvIz8GKoiJNFQKg9a4SWUT+kBR6uavzPh8MHbwuh44spAhhVxQ2o5Rb
        +rNUZsop2qscQ4dEMrT8zZrljXB0dg4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-u4g8N1tbMA2O870x1DQpVQ-1; Wed, 15 Jun 2022 16:51:45 -0400
X-MC-Unique: u4g8N1tbMA2O870x1DQpVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C3983395D;
        Wed, 15 Jun 2022 20:51:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 82DA618EA9;
        Wed, 15 Jun 2022 20:51:42 +0000 (UTC)
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
Subject: [PATCH v2 35/40] media: atomisp: add error logging to atomisp_destroy_pipes_stream_force()
Date:   Wed, 15 Jun 2022 22:50:32 +0200
Message-Id: <20220615205037.16549-36-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

__destroy_streams() and __destroy_pipes() may return an error.
Log a warning when either of them fails.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 6375cfb839d4..358ef29f27ba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -581,8 +581,11 @@ static int __destroy_pipes(struct atomisp_sub_device *asd, bool force)
 
 void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd)
 {
-	__destroy_streams(asd, true);
-	__destroy_pipes(asd, true);
+	if (__destroy_streams(asd, true))
+		dev_warn(asd->isp->dev, "destroy stream failed.\n");
+
+	if (__destroy_pipes(asd, true))
+		dev_warn(asd->isp->dev, "destroy pipe failed.\n");
 }
 
 static void __apply_additional_pipe_config(
-- 
2.36.0

