Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB1776CA27
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234250AbjHBJ6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbjHBJ6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13C0B2
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GOFd9JGAsybq3+W0dWLwdnReh5Kwy01yAHdTXKRQaPk=;
        b=bx2CUSVDHoQSA+ThvqP77Kbp3qWKlNaid67/tAw5CohpVOq2eILxczUnKi2T6S8Jd8gpxR
        3A89ivSoIcTM2p8wgDemushCd4g87XR1h79l3ebaIS50WLWzI1xDmtFyU5WE6MdlNxUHM2
        VxJaL6Vd+B+INCaTbqg5mQrsIT69y/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-b7IDWI0YNF6fknKoi6LuXA-1; Wed, 02 Aug 2023 05:57:48 -0400
X-MC-Unique: b7IDWI0YNF6fknKoi6LuXA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B09DA856F66;
        Wed,  2 Aug 2023 09:57:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F1B1C401DA9;
        Wed,  2 Aug 2023 09:57:44 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 12/12] media: atomisp: atomisp_v4l2: Removed unnecessary code
Date:   Wed,  2 Aug 2023 17:56:06 +0800
Message-ID: <20230802095606.1298152-13-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here is the last step of #ifdef ISP2401 removal work. Since the driver
became generic, this part of the code was no longer needed and can
be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c43b916a006e..ca95944388df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1206,25 +1206,6 @@ static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id
 		return false;
 	}
 
-	/*
-	 * FIXME:
-	 * remove the if once the driver become generic
-	 */
-
-#ifndef ISP2401
-	if (IS_ISP2401) {
-		dev_err(&pdev->dev, "Support for %s (ISP2401) was disabled at compile time\n",
-			name);
-		return false;
-	}
-#else
-	if (!IS_ISP2401) {
-		dev_err(&pdev->dev, "Support for %s (ISP2400) was disabled at compile time\n",
-			name);
-		return false;
-	}
-#endif
-
 	dev_info(&pdev->dev, "Detected %s version %d (ISP240%c) on %s\n",
 		 name, pdev->revision, IS_ISP2401 ? '1' : '0', product);
 
-- 
2.41.0

