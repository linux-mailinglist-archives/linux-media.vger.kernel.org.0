Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B179A59B67F
	for <lists+linux-media@lfdr.de>; Sun, 21 Aug 2022 23:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbiHUVup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 17:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiHUVuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 17:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9B317E27
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661118643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5VS9amO72hF1V9dJNX52MSr0HM+WL3/Syrhp9RikJrk=;
        b=gXNYLu5bNzSiiS9OLHtTu1rgcRRMWb5H/6pzJNpYaBR9nuaxuErxTJWOfrI674sNCPfT9j
        7pDPCXRiOxukcN1obSNbiy4tmqpSpNRQSxc6Jj7TS1lmSr9dhbOrCnDCGMrhnm3cjZrUT4
        9xNyuOVG34bF6nPcfVricmgBl9QdTvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-rZ6z3ocwNO-jWqrCl4VREw-1; Sun, 21 Aug 2022 17:50:35 -0400
X-MC-Unique: rZ6z3ocwNO-jWqrCl4VREw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF1DE804196;
        Sun, 21 Aug 2022 21:50:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3B1AF404C6F2;
        Sun, 21 Aug 2022 21:50:33 +0000 (UTC)
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
Subject: [PATCH 04/13] media: atomisp-ov2680: Improve ov2680_set_fmt() error handling
Date:   Sun, 21 Aug 2022 23:50:18 +0200
Message-Id: <20220821215027.461344-4-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
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

Exit with an error on any i2c-write errors, rather then only
exiting with an error when ov2680_get_intg_factor() fails.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 9ac469878eea..5ba4c52a06a2 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -864,9 +864,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	/* s_power has not been called yet for std v4l2 clients (camorama) */
 	power_up(sd);
 	ret = ov2680_write_reg_array(client, dev->res->regs);
-	if (ret)
+	if (ret) {
 		dev_err(&client->dev,
 			"ov2680 write resolution register err: %d\n", ret);
+		goto err;
+	}
 
 	vts = dev->res->lines_per_frame;
 
@@ -875,8 +877,10 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		vts = dev->exposure + OV2680_INTEGRATION_TIME_MARGIN;
 
 	ret = ov2680_write_reg(client, 2, OV2680_TIMING_VTS_H, vts);
-	if (ret)
+	if (ret) {
 		dev_err(&client->dev, "ov2680 write vts err: %d\n", ret);
+		goto err;
+	}
 
 	ret = ov2680_get_intg_factor(client, ov2680_info, res);
 	if (ret) {
-- 
2.37.2

