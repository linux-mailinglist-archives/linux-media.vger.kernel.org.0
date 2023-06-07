Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C4D726664
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjFGQsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjFGQsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AE7188
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0STwqk4hET/djtbYMMM2d5hlrGGvutQPE3M8KYnk/bA=;
        b=ODWrUITadZLU8AmuLLMIsoiy9DKtQT235L1G4vBwFi5ad51waNnWUX7PMNmVnZqWZbZ7Yf
        8Uo09rx2rZT3gROBvmgD1MduNfOs42Rqd0njzUdJ+2oCitiRkFrXS9lPi+twczJsqxX78T
        vqCrCC2r+nThSEa6XWacrFuVNgRVE9k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-AEdVr4X1NCaNOldJuVYgfw-1; Wed, 07 Jun 2023 12:48:03 -0400
X-MC-Unique: AEdVr4X1NCaNOldJuVYgfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AD201C08DA8;
        Wed,  7 Jun 2023 16:48:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3C7C1C1603B;
        Wed,  7 Jun 2023 16:48:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 27/28] media: ov2680: Drop unnecessary pad checks
Date:   Wed,  7 Jun 2023 18:47:11 +0200
Message-Id: <20230607164712.63579-28-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop unnecessary pad checks in enum_mbus_code, get_fmt, set_fmt
this is already checked by check_pad() from
drivers/media/v4l2-core/v4l2-subdev.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 9e4f0bcbe979..8872898ff2c4 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -560,7 +560,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	if (code->pad != 0 || code->index != 0)
+	if (code->index != 0)
 		return -EINVAL;
 
 	code->code = sensor->mode.fmt.code;
@@ -575,9 +575,6 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (format->pad != 0)
-		return -EINVAL;
-
 	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
 
 	mutex_lock(&sensor->lock);
@@ -597,9 +594,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	unsigned int width, height;
 	int ret = 0;
 
-	if (format->pad != 0)
-		return -EINVAL;
-
 	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad, format->which);
 
 	/* Limit set_fmt max size to crop width / height */
-- 
2.40.1

