Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5091C735458
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 12:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjFSKzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 06:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbjFSKyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 06:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD671FE1
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687171946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xnqmnuzscMduS86UdE+Ktdua/ucXBwFGdE/PJUq9UGU=;
        b=K9feasc77BpJa2gyT3ynI4+g2CixQPsjnNvxwzW4XS21x7upk8ool5Ys4t8pqsFL7nx6Jo
        vlyzfNibbXPQbOGCIGeWRI4xR070VbY9l5hBHVwvYcEeQLYPIyPq5HcvrIzzMMVNJGlagJ
        Bnx/oPvKg3idF4fUcITCGM4cMrt81Kg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-WgqnNi0rNEe1mO2PcnVP1A-1; Mon, 19 Jun 2023 06:52:22 -0400
X-MC-Unique: WgqnNi0rNEe1mO2PcnVP1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F084380671B;
        Mon, 19 Jun 2023 10:52:21 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 88F71112132C;
        Mon, 19 Jun 2023 10:52:19 +0000 (UTC)
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
Subject: [PATCH 4/7] media: atomisp: Change atomisp_enum_framesizes() too small cut off from 2/3th to 5/8th
Date:   Mon, 19 Jun 2023 12:52:09 +0200
Message-Id: <20230619105212.303653-4-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change atomisp_enum_framesizes() cut off for too small resolutions
from 2/3th to 5/8th this results in more resolutions being available
with some sensors.

E.g. this allows using 800x600 with a 1280x960 sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d2174156573a..047b9fb075d0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -729,11 +729,11 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 			continue;
 
 		/*
-		 * Skip sizes where width and height are less then 2/3th of the
+		 * Skip sizes where width and height are less then 5/8th of the
 		 * sensor size to avoid sizes with a too small field of view.
 		 */
-		if (frame_sizes[i].width < (active->width * 2 / 3) &&
-		    frame_sizes[i].height < (active->height * 2 / 3))
+		if (frame_sizes[i].width < (active->width * 5 / 8) &&
+		    frame_sizes[i].height < (active->height * 5 / 8))
 			continue;
 
 		if (*valid_sizes == fsize->index) {
-- 
2.40.1

