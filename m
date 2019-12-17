Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C22F123930
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 23:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLQWM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 17:12:59 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:34504 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfLQWM7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 17:12:59 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47cspL2YJFz9vYlJ
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 22:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id u2l9PjwCxM3s for <linux-media@vger.kernel.org>;
        Tue, 17 Dec 2019 16:12:58 -0600 (CST)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47cspL1LPTz9vYlG
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 16:12:58 -0600 (CST)
Received: by mail-yb1-f200.google.com with SMTP id g19so1456853ybf.20
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uFNmttIbgEixEQfkRt9NeBoHzK1PNMtttJQCP/z7Fk=;
        b=DNYpCwjR4shJbOjgE5YrLYW9gmNiz47YdUF4F7UbbW9oBFc09y8TVTxyj/xXSZQTbG
         tu5JjDveGOXqvFB61cbxl9ZzOq6e4VRFkS/pEtJahwRbdZ0YeEePl7U5W5sSYaI4IgUv
         GdwmxCk5eRzjDP6jCoTOxk36kGaPiy6tFTNFBXBmJMCYS16H6HVa/61UWdqCI/zt1wG2
         INPelGTZVqVpAcdbScirJLJJ2VJVjgO6pXfH33nGuJcyOxQlK9MUOytCZKXqV5qVF4oN
         syd0FmIBTHcc7IfmR5i2QuQn9im2LV0s7jPkS12KT5Ej3vohnDCXd7J+EZyyTdmCakRT
         PAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uFNmttIbgEixEQfkRt9NeBoHzK1PNMtttJQCP/z7Fk=;
        b=J/ffWP59c7vTUkW9GC/kK4a7iRE3hspBrr1u5JL74n4aamiGP86pRkNV5c9acxESqb
         vcM9iOQ2QBQQwAemqudyg61stW8qanLSEtlE37pG4Z+Pg5uuZULCjk+HHBEHY712kOu1
         ETeAJczDRQ5IiWKV3NDbZ/pp3BtJRVUcm9dqUVtkMp1s8gnaolM6qwqZYxKiy3TCzfih
         mMpF0d+A6sD70tvxuVGvkhFLWkoTkoEdfQ+oH7egm1uLF1l140IEr5wFdl93r5fgjdz6
         t3K6N4R+NJB9DvpklUA/AOlrnxKPavYXS58oF1fShQPg7GenqJLKOStNe1SqV52V6HGt
         GLVw==
X-Gm-Message-State: APjAAAUGygEfx8Re0rCMHHa2XaP9d7JEdqnJHuckEl44F0+K27yJ7ZTL
        razbPKrExwXMYsp1MKuE6Pl0c8uhgaIuASojE9hn8zcVD93W7xTygT3ABnqHU6L5JcTaW2DhvBJ
        +g09htigKGl0lZ0oFUjy3b3IneR8=
X-Received: by 2002:a25:6044:: with SMTP id u65mr282114ybb.520.1576620777653;
        Tue, 17 Dec 2019 14:12:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPAFKcOJX5u8YbRerKIyVLj2u2RXfboLCHwoqIDad4F/tedwfp2jbvHuUfyo1GEJGTU7X68A==
X-Received: by 2002:a25:6044:: with SMTP id u65mr282093ybb.520.1576620777428;
        Tue, 17 Dec 2019 14:12:57 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id l74sm80859ywc.45.2019.12.17.14.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 14:12:57 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: davinci/vpfe_capture.c: Avoid BUG_ON for register failure
Date:   Tue, 17 Dec 2019 16:12:54 -0600
Message-Id: <20191217221254.1078-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In vpfe_register_ccdc_device(), failure to allocate dev->hw_ops
fields calls BUG_ON(). This patch returns the error to callers
instead of crashing. The issue was identified by a static
analysis tool.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
v1: Fixed the type to a regular variable instead of a pointer,
also added fixes suggested by Ezequiel Garcia.
---
 drivers/media/platform/davinci/vpfe_capture.c | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 916ed743d716..a3838a2e173f 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -168,21 +168,22 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
 	int ret = 0;
 	printk(KERN_NOTICE "vpfe_register_ccdc_device: %s\n", dev->name);
 
-	BUG_ON(!dev->hw_ops.open);
-	BUG_ON(!dev->hw_ops.enable);
-	BUG_ON(!dev->hw_ops.set_hw_if_params);
-	BUG_ON(!dev->hw_ops.configure);
-	BUG_ON(!dev->hw_ops.set_buftype);
-	BUG_ON(!dev->hw_ops.get_buftype);
-	BUG_ON(!dev->hw_ops.enum_pix);
-	BUG_ON(!dev->hw_ops.set_frame_format);
-	BUG_ON(!dev->hw_ops.get_frame_format);
-	BUG_ON(!dev->hw_ops.get_pixel_format);
-	BUG_ON(!dev->hw_ops.set_pixel_format);
-	BUG_ON(!dev->hw_ops.set_image_window);
-	BUG_ON(!dev->hw_ops.get_image_window);
-	BUG_ON(!dev->hw_ops.get_line_length);
-	BUG_ON(!dev->hw_ops.getfid);
+	if (!dev->hw_ops.open ||
+			!dev->hw_ops.enable ||
+			!dev->hw_ops.set_hw_if_params ||
+			!dev->hw_ops.configure ||
+			!dev->hw_ops.set_buftype ||
+			!dev->hw_ops.get_buftype ||
+			!dev->hw_ops.enum_pix ||
+			!dev->hw_ops.set_frame_format ||
+			!dev->hw_ops.get_frame_format ||
+			!dev->hw_ops.get_pixel_format ||
+			!dev->hw_ops.set_pixel_format ||
+			!dev->hw_ops.set_image_window ||
+			!dev->hw_ops.get_image_window ||
+			!dev->hw_ops.get_line_length ||
+			!dev->hw_ops.getfid)
+		return -EINVAL;
 
 	mutex_lock(&ccdc_lock);
 	if (!ccdc_cfg) {
-- 
2.20.1

