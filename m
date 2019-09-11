Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42977B04D9
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 22:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730523AbfIKU0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 16:26:14 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37942 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729001AbfIKU0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 16:26:14 -0400
Received: by mail-io1-f65.google.com with SMTP id k5so23746799iol.5;
        Wed, 11 Sep 2019 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ry5hLNX1d0tX2Sbto+75KAiWlIHP1VB3CEPnkog+XmA=;
        b=MkfYoycL5g0bbwtR2rEAFu67nBhW2JYmojWOMxdeePTFfu6VHDObm/4Fxwpe7sPect
         z0s1yIhIr68nM6r47cW5JBmLZTAnEQ1FOJTro873qPNx4vD123OxcsAXX0w4Zk20rphl
         SHd1FqqddDbbfhIAxGzfQAUK5plaQo8qh/qZbbYqZ0wDIW0GzpVZsnBQflLcCLT+S9HK
         +ksXwz8wH0mO6w+P9lDOAiDNeFF4qcWZsxvNvaMJBdljYDd83QR9KSQKT1wALDS0gPjX
         6BZ4M/C6S9CxbvkJvdKLToVYGO5EvhuHbHr973U+06arh0tWffUnLg4yoRGdt4UnYWRy
         tVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ry5hLNX1d0tX2Sbto+75KAiWlIHP1VB3CEPnkog+XmA=;
        b=uADRvGOf3umVD9wwYC90t8C8MBDn62dSZS/k/tadnzAg6zmlC+txbKeienwkqT0NTw
         aBnLewTHW+mx4IWXq3fMQkUDIsmIEEPLR0bEKi5ZCdwruyPcjdNBZ0mqlxoE85sIlOeE
         nUqGnvC/3+i18S8oc1EyXQEi+ftQbeC1/0k7Mb9XeShi8GubTcSxGT6cKYA98Hg9TKi+
         Cgjw/pVQXDCWzdbZtIhtVX8mImQG3n3Hy+sD9On7AMmTNCf+S6UwDiAzGF3CV2QEcBik
         3UbAj3zmQrLSFKYtaieu++EJScKCFmOhKo76orSCTNShtG55KBqMZtxZfap2cQBGWK1f
         tgMA==
X-Gm-Message-State: APjAAAWzYnm3YR9q2ZZGWkQVX02QV0MJg+Nkk+C1vFiTgz8s54XNSEFE
        3CvJK5ObrM62lpjQxa125GA=
X-Google-Smtp-Source: APXvYqwlo5pNy0gVHX7ssYwO+u4telVjGeapJYGI38KL7lLCP8a9EdfJPxFGjXTPPdh1c5G56lvoHQ==
X-Received: by 2002:a6b:b445:: with SMTP id d66mr12103059iof.269.1568233573261;
        Wed, 11 Sep 2019 13:26:13 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id q5sm14635474iob.65.2019.09.11.13.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 13:26:12 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: usb: null check create_singlethread_workqueue
Date:   Wed, 11 Sep 2019 15:26:00 -0500
Message-Id: <20190911202603.13689-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In sd_start return value of create_singlethread_workqueue needs null
check.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/media/usb/gspca/sq905.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index 863c485f4275..97799cfb832e 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -378,6 +378,9 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	}
 	/* Start the workqueue function to do the streaming */
 	dev->work_thread = create_singlethread_workqueue(MODULE_NAME);
+	if (!dev->work_thread)
+		return -ENOMEM;
+
 	queue_work(dev->work_thread, &dev->work_struct);
 
 	return 0;
-- 
2.17.1

