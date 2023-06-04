Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357E272187F
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 18:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjFDQPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 12:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjFDQPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 12:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C39DE
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685895268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mEN+0TniimPe0eT5Q4F9MXhk6psY/lXJ+SgLAGSDQ9E=;
        b=aQA3HdbvQ8jX9/HY6E9c0LhOCkHhlog3xwQkPBRVuKvNMe30yWaODge9a5EkIywdbd49hy
        aHZGgOUDWzXSKY0kj1oxZXkju09O4qCXAy60DXZd5inlJreEbtOku8yZvXyMOfaFXF8Phl
        7ygKg/P/Ytd9KJ/jlpK9fFVcnHWyopc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-GHbHWw-yOnyw4vpif4rexg-1; Sun, 04 Jun 2023 12:14:25 -0400
X-MC-Unique: GHbHWw-yOnyw4vpif4rexg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 228F3800159;
        Sun,  4 Jun 2023 16:14:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 914F0492B00;
        Sun,  4 Jun 2023 16:14:23 +0000 (UTC)
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
Subject: [PATCH 5/5] media: atomisp: Add testing instructions to TODO file
Date:   Sun,  4 Jun 2023 18:14:06 +0200
Message-Id: <20230604161406.69369-6-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-1-hdegoede@redhat.com>
References: <20230604161406.69369-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Testing the atomisp can be a bit tricky. The BYT/CHT CPUs are not
very powerful so some apps like camorama cannot run at full FPS.

Add instructions for how to test with gstreamer which does
runs at full FPS without issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/TODO | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index b7a09eb20d0d..ecf8ba67b7af 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -78,3 +78,36 @@ TODO
   the firmware files
 
 * The atomisp code still has a lot of cruft which needs cleaning up
+
+
+Testing
+=======
+
+Since libcamera support is not available yet, the easiest way to test for
+now is using v4l2-ctl to select the input and gstreamer for streaming.
+
+To select the input run:
+
+v4l2-ctl -i <input>
+
+Where <input> is 0 (front cam) or 1 (back cam).
+
+The simplest gstreamer pipeline for testing running the sensor
+at its max resolution is:
+
+gst-launch-1.0 v4l2src ! videoconvert ! xvimagesink sync=false
+
+To select e.g 640x480 as resolution use:
+
+gst-launch-1.0 v4l2src ! video/x-raw,format=YV12,width=640,height=480 ! \
+               videoconvert ! xvimagesink sync=false
+
+And to show fps use:
+
+gst-launch-1.0 v4l2src ! video/x-raw,format=YV12,width=640,height=480 ! \
+               videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
+
+Often the image will be over / under exposed. This can be fixed by using
+v4l2-ctl on the sensor subdev to tweak the exposure ctrl; or by using a GUI
+app for v4l2-controls which also supports subdev such as the Fedora patched
+gtk-v4l tool.
-- 
2.40.1

