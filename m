Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9554D7022
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 18:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbiCLRcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 12:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiCLRcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 12:32:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A53B06D1AF
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 09:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647106296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=OQDHbRK5h5hzHKCQDiG2Xi9MV3Kh7CjgfW1/1yG8i58=;
        b=Tv+uLLhEep3UjQopCNW3XhbvsxzfrUptD6b50UsSdksIZE+2tYryCto3S9s3QWk2rHIna+
        04hXDv9DWHmbd1pJ8H2kEQj92v4IaSN5Ey5nhH/Hpc4VBTO++nL4eXDjURDgwYlJ0IgqaL
        2MNxQgCP4ymGga/rmLo3aoWE2i1WNWA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-mmFW5QH4NGyKsLV7Xau9gw-1; Sat, 12 Mar 2022 12:31:35 -0500
X-MC-Unique: mmFW5QH4NGyKsLV7Xau9gw-1
Received: by mail-qt1-f199.google.com with SMTP id k1-20020ac85fc1000000b002e1c5930386so2811000qta.3
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 09:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OQDHbRK5h5hzHKCQDiG2Xi9MV3Kh7CjgfW1/1yG8i58=;
        b=VORDrBB+hbyfd0PJn8MEE7emKpaQfVRb+QuYORQeQZvkup/VfeECrN08b4Rs7fiFtw
         uBU18/8vS1Yxpg3qxGd1+rdnbZh4jHkA8lqjeNCPhIuyXuHGUqzvmUw6G1IjnzUqiakr
         WbpCOn0tEwIlUGSMSKly0++JYmi1NjOdXxHyi9FwN8c+E1prpVX/122UdJh5P2rI+jm5
         V7QI1AoKkTnpe6mPlaz0ChgAqERt91FS/L8vRscLYk09hbWKpDT9dWtOoV3UH+CLbD9S
         0nCjr1g7V9DezSbnRjUi8+xOpaEnw2FllcxiZ/Z4C+zbJJP0Z5cBZkxged7WHWvSbq3k
         SIlw==
X-Gm-Message-State: AOAM532aftYkQyUOiZquesALK5tzA56sF4ibHeSkJGUKRkMbxlPAqcWZ
        e3ozzV7bZrM0j6gfG7zetTgv9NtymQ4AL6umHpZrGNaW8LBUeyFODfEdybEDvAVNSidyRUj0K+2
        uwpWxgxCht8WDqXRgklgZP98=
X-Received: by 2002:a05:620a:4442:b0:67d:b94a:8c6a with SMTP id w2-20020a05620a444200b0067db94a8c6amr46201qkp.569.1647106294990;
        Sat, 12 Mar 2022 09:31:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtnu94rjTmOi+1VORDdqL74UhgzCuwVSAqQfaBh5XrYQnCoZ1rChJn2tfiQdAuzAwWyfgQ1Q==
X-Received: by 2002:a05:620a:4442:b0:67d:b94a:8c6a with SMTP id w2-20020a05620a444200b0067db94a8c6amr46188qkp.569.1647106294786;
        Sat, 12 Mar 2022 09:31:34 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id v3-20020a05622a188300b002e1cbca8ea4sm1161476qtc.59.2022.03.12.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 09:31:34 -0800 (PST)
From:   trix@redhat.com
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        cai.huoqing@linux.dev, paskripkin@gmail.com, xose.vazquez@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: stkwebcam: move stk_camera_read_reg() scratch buffer to struct stk_camera
Date:   Sat, 12 Mar 2022 09:30:49 -0800
Message-Id: <20220312173049.1410977-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

In stk_camera_read_reg() a single byte buffer is alloc-ed and
freed on every function call.  Since the size is known,
move the buffer to the struct stk_camera where it will be alloc-ed
and freed once.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/usb/stkwebcam/stk-webcam.c | 11 ++---------
 drivers/media/usb/stkwebcam/stk-webcam.h |  2 ++
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index 5b822214ccc5c..787edb3d47c23 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -150,25 +150,18 @@ int stk_camera_write_reg(struct stk_camera *dev, u16 index, u8 value)
 int stk_camera_read_reg(struct stk_camera *dev, u16 index, u8 *value)
 {
 	struct usb_device *udev = dev->udev;
-	unsigned char *buf;
 	int ret;
 
-	buf = kmalloc(sizeof(u8), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 			0x00,
 			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			0x00,
 			index,
-			buf,
+			&dev->read_reg_scratch,
 			sizeof(u8),
 			500);
 	if (ret >= 0)
-		*value = *buf;
-
-	kfree(buf);
+		*value = dev->read_reg_scratch;
 
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.h b/drivers/media/usb/stkwebcam/stk-webcam.h
index 14519e5308b18..136decffe9ced 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.h
+++ b/drivers/media/usb/stkwebcam/stk-webcam.h
@@ -105,6 +105,8 @@ struct stk_camera {
 	struct list_head sio_avail;
 	struct list_head sio_full;
 	unsigned sequence;
+
+	u8 read_reg_scratch;
 };
 
 #define vdev_to_camera(d) container_of(d, struct stk_camera, vdev)
-- 
2.26.3

