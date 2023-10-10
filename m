Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D767BF88A
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 12:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjJJK0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 06:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjJJK0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 06:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDD799
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933517;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HMsUyJgOm+XD5boZywTqYAKn2qd2XjlTGjRfBFmJJ2M=;
        b=Q4/r0sAIuXrU+ai0UTTUEboLzFuNEKIN5WotVgTcddULGwHZAPvYxWUq1FrJDFBsiEOkh4
        tSdw7MSPnepA4/Wv9cmJsbhCAJfhwL9mR7ic6fZbER0MfX0mVfTdibBqJAMZX6xJUpln2x
        hZxCNo14MMIgbeRWDMZilNEJA6t/Yfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-KCnOvh7LOkyXifmzePb1Fg-1; Tue, 10 Oct 2023 06:25:11 -0400
X-MC-Unique: KCnOvh7LOkyXifmzePb1Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653F08002B2;
        Tue, 10 Oct 2023 10:25:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1C78421CAC6B;
        Tue, 10 Oct 2023 10:25:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>
Subject: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
Date:   Tue, 10 Oct 2023 12:24:58 +0200
Message-ID: <20231010102458.111227-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the stream API is still experimental it is currently locked away
behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.

Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
confuses userspace. E.g. it causes the following libcamera error:

ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
  /dev/v4l-subdev1: Inappropriate ioctl for device

Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
to avoid problems like this.

Reported-by: Dennis Bonke <admin@dennisbonke.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
-Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
 appealing as an alternative fix. But this causes various v4l2-core bits
 to enter different code paths which confuses drivers which set
 V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.
-No Closes: for the Reported-by since this was reported by private email
---
 drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b92348ad61f6..31752c06d1f0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -502,6 +502,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
+	/*
+	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
+	 * Remove this when the API is no longer experimental.
+	 */
+	if (!v4l2_subdev_enable_streams_api)
+		streams_subdev = false;
+
 	switch (cmd) {
 	case VIDIOC_SUBDEV_QUERYCAP: {
 		struct v4l2_subdev_capability *cap = arg;
-- 
2.41.0

