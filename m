Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1EC7016B3
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238862AbjEMMea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238375AbjEMMe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7C63AAC
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4HkEplNlc2fK+7LvqaNXv7APsTheUIvNpX+DSOhAxqI=;
        b=QmxMUywxZ7Z+vOPXdwdtsTH6V7awELHWumsaBfU3iA3vY03ezR2DXPW8VqDVH0CteYBc0y
        foZEJ8ZBMaW995HNchHpAbjMoJjdTBAH+xw2lelF9g5fkgC/qBf0t//cKt47UrlkkQ4s4o
        Wb8W7efZ0fE4Adrgn7P6BRDf709RBY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-UD96skoxMKeUyfKlIH-pEg-1; Sat, 13 May 2023 08:32:37 -0400
X-MC-Unique: UD96skoxMKeUyfKlIH-pEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD9A6857E60;
        Sat, 13 May 2023 12:32:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5698040C2076;
        Sat, 13 May 2023 12:32:34 +0000 (UTC)
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
Subject: [PATCH 19/30] media: atomisp: Simplify atomisp_pipe_check()
Date:   Sat, 13 May 2023 14:31:48 +0200
Message-Id: <20230513123159.33234-20-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All switch (pipe->asd->streaming) cases in atomisp_pipe_check()
are either no-ops or never happen:

1. ATOMISP_DEVICE_STREAMING_DISABLED already is a no-op

2. The videobuf2 core guarantees that when we are streaming
vb2_is_busy() returns true. So the ATOMISP_DEVICE_STREAMING_ENABLED case
is already handled by the if above the switch (pipe->asd->streaming).

3. After recent changes pipe->asd->streaming is only ever set to
ATOMISP_DEVICE_STREAMING_STOPPING in atomisp_assert_recovery_work() and
that function holds isp->mutex and always transitions the streaming state
to ATOMISP_DEVICE_STREAMING_DISABLED or ATOMISP_DEVICE_STREAMING_ENABLED
before releasing the mutex. So atomisp_pipe_check() never sees
ATOMISP_DEVICE_STREAMING_STOPPING.

Remove the entire switch-case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 087ec5120bce..08a3d98794df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -528,22 +528,6 @@ int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
 		return -EBUSY;
 	}
 
-	switch (pipe->asd->streaming) {
-	case ATOMISP_DEVICE_STREAMING_DISABLED:
-		break;
-	case ATOMISP_DEVICE_STREAMING_ENABLED:
-		if (settings_change) {
-			dev_err(pipe->isp->dev, "Set fmt/input IOCTL while streaming\n");
-			return -EBUSY;
-		}
-		break;
-	case ATOMISP_DEVICE_STREAMING_STOPPING:
-		dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
-		return -EBUSY;
-	default:
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.40.1

