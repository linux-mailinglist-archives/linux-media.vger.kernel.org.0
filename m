Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03BBB04CF
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 22:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbfIKUUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 16:20:30 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35456 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfIKUU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 16:20:29 -0400
Received: by mail-io1-f65.google.com with SMTP id f4so48266422ion.2;
        Wed, 11 Sep 2019 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iZ9ZspCWMcol1pKYB+J9B5Kr5gfoF9n9RCCNo2Mg9j4=;
        b=OiZMhTYKjK+8rNX8ASHmW4fIP0MIrS7byHUvJDxmUzNmr6QpCDszI7ByTghyl5KXyv
         GFGd1N9zzoRxRig0DpfCMWal2jDq+2nIwxWzY0RYJBLCxY36IM6rMTVHaOOoO2RBxrQ7
         yPjQPOvd9ub0/qgC9ZR1hZgqoaOe3NGPAU0IaO4N5RuBdgeBAU6XM2XY/jyZkZ2/dyYH
         6+As9UMIqdlxYc8IIrbAXqecaxNXCUYpE+MKvfLYtSTaN5Fo4h29Hvv27B5g8gWlIsWM
         uePGOMb+t2F2WYJ6ymHPumKeTgJ2kTW1lv7KY+exUKSJYm6/l/RYmRMe4vBz+gWV2DgL
         RZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iZ9ZspCWMcol1pKYB+J9B5Kr5gfoF9n9RCCNo2Mg9j4=;
        b=KZy6Xsm4z573rwLNRVi350BvXqDrqXW4wRUzD+ZGJZf4CwUgiMFXfOu8w5i7WmYCZh
         GgFwTa7+crU0M7Gmn5BIGNL2gblj2BYrEehz4Vx1bMuIx9NyiDA7mCun/+cUPXXwEZtF
         dpmdFGXGOhiYyMs4ebk1FxFDmk/IvsUh/Li2UlBVHqEPaL4+y8gPJ0IXgNkLSAhXr9Dp
         X1zD40eI8CDZVw+FyGYuGLQqmBx7szbdQFdgbh7G/qxYHkurqUPpjti06obNBKqY4H3Y
         YhLDgfVzKgVOSQbQEzSgvv3B0eeFEB9Bg99Dr30Ev2tHoldBmWuBFRlQ7tXfxPrzSPBO
         +abQ==
X-Gm-Message-State: APjAAAVWr7vCKMlY/3sw6IKEb68hg3004Oqeyaf6XAAd2Z+5e3osGYzO
        4D00xeMzTsut4uKfKjq9YOS+Z0dcrNs=
X-Google-Smtp-Source: APXvYqz6kwA0HlBNs2udFzVW64nEXBbfaVgfCTnikbcqjJNuYOEolRHMh7yWphBvc/umsqxIuqPt1w==
X-Received: by 2002:a02:2a87:: with SMTP id w129mr26432127jaw.41.1568233228997;
        Wed, 11 Sep 2019 13:20:28 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id w22sm5366713ior.79.2019.09.11.13.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 13:20:28 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Jilayne Lovejoy <opensource@jilayne.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steve Winslow <swinslow@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: null check create_singlethread_workqueue
Date:   Wed, 11 Sep 2019 15:20:12 -0500
Message-Id: <20190911202015.12431-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In sd_start the return value of create_singlethread_workqueue needs
null check.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/media/usb/gspca/sq905c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/gspca/sq905c.c b/drivers/media/usb/gspca/sq905c.c
index 3d7f6dcdd7a8..6ca947aef298 100644
--- a/drivers/media/usb/gspca/sq905c.c
+++ b/drivers/media/usb/gspca/sq905c.c
@@ -276,6 +276,9 @@ static int sd_start(struct gspca_dev *gspca_dev)
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

