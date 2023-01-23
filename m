Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF389677BCB
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjAWMxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjAWMxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561EE12066
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tZ59wv/ytS75S3O6QUU9fLNrInejRmpQ4A+KqYjkrNw=;
        b=bsqE79M8rBokrA+8ty+6HEzIgURzmSWvs/+tRfVOGNlUIn5oUnzkvzWOrgqtHmdyHCP3jk
        xZB78RJFQt7B0x31OUrSkWI3+cAFFx0MnDDIZWfOEaIdVXsIHyk36WJAc+13HZRq0ZrrUI
        Ti5Mg2AI+HQCTGYJhbgZZVJabvRy0J0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-_pMWkPhFNr6x5Su_-ncKsA-1; Mon, 23 Jan 2023 07:53:04 -0500
X-MC-Unique: _pMWkPhFNr6x5Su_-ncKsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB9A0877CA2;
        Mon, 23 Jan 2023 12:53:03 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4D837C15BAD;
        Mon, 23 Jan 2023 12:53:01 +0000 (UTC)
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
Subject: [PATCH 19/57] media: atomisp: Allow sensor drivers without a s_power callback
Date:   Mon, 23 Jan 2023 13:51:27 +0100
Message-Id: <20230123125205.622152-20-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The s_power callback for v4l2-subdevs has been deprecated, allow sensor
drivers without a s_power callback to work by ignoring the -ENOIOCTLCMD
return value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c  | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 833c7aac8f0a..ce01479bdd68 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -832,7 +832,7 @@ static int atomisp_release(struct file *file)
 	if (isp->inputs[asd->input_curr].asd == asd) {
 		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 				       core, s_power, 0);
-		if (ret)
+		if (ret && ret != -ENOIOCTLCMD)
 			dev_warn(isp->dev, "Failed to power-off sensor\n");
 
 		/* clear the asd field to show this camera is not used */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d0dd3dbd6f6a..77856cbc5ba7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -700,7 +700,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	    asd->input_curr != input) {
 		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 				       core, s_power, 0);
-		if (ret)
+		if (ret && ret != -ENOIOCTLCMD)
 			dev_warn(isp->dev,
 				 "Failed to power-off sensor\n");
 		/* clear the asd field to show this camera is not used */
@@ -709,7 +709,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 
 	/* powe on the new sensor */
 	ret = v4l2_subdev_call(isp->inputs[input].camera, core, s_power, 1);
-	if (ret) {
+	if (ret && ret != -ENOIOCTLCMD) {
 		dev_err(isp->dev, "Failed to power-on sensor\n");
 		return ret;
 	}
-- 
2.39.0

