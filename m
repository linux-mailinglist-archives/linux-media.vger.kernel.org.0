Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2832871357D
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 17:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjE0Pw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 11:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjE0Pw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 11:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE6AA2
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685202700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=xQslZPXbId/IMBbp6pyCgCsRouYYo0ES8QlqCcYRh78=;
        b=c8D4VKFTJwRN8rGpCJEhbeq+1Da8Bnnj2/nDYh64R7YdXlzl0hf5wGeovwsUqA6iO3MHmD
        Nzmy2DEuTB+bEJI25bGsvhASUe2D9BTZIkzr+PjdCd0BfuRh30JbIA7CAdhnVty+XVpCsO
        8IHc4jiYCGim/Js7mAbDfYgOkJpuDtY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-gRUnWNJKPk2tIEQUwxt-PQ-1; Sat, 27 May 2023 11:51:39 -0400
X-MC-Unique: gRUnWNJKPk2tIEQUwxt-PQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A865680013A;
        Sat, 27 May 2023 15:51:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B4E3D40CFD45;
        Sat, 27 May 2023 15:51:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] media: atomisp: Fix buffer overrun in gmin_get_var_int()
Date:   Sat, 27 May 2023 17:51:36 +0200
Message-Id: <20230527155136.61957-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not all functions used in gmin_get_var_int() update len to the actual
length of the returned string. So len may still have its initial value
of the length of val[] when "val[len] = 0;" is run to ensure 0 termination.

If this happens we end up writing one beyond the bounds of val[], fix this.

Note this is a quick fix for this since the entirety of
atomisp_gmin_platform.c will be removed once all atomisp sensor
drivers have been moved over to runtime-pm + v4l2-async device
registration.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef3f1a4dd51d@kili.mountain/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 93bfb3fadcf7..139ad7ad1dcf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1429,8 +1429,8 @@ static int gmin_get_config_var(struct device *maindev,
 
 int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)
 {
-	char val[CFG_VAR_NAME_MAX];
-	size_t len = sizeof(val);
+	char val[CFG_VAR_NAME_MAX + 1];
+	size_t len = CFG_VAR_NAME_MAX;
 	long result;
 	int ret;
 
-- 
2.40.1

