Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B2725C36C
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgICOvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:51:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40549 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729131AbgICOu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 10:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599144652;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=1FPRhJoWjqG8+gQHE9bU9UzjjoLvgSrA9NVzRzJ0CRg=;
        b=bwZHjocMavLi9635e/4H2ZjfWApHbYtQf11fLMJFXBO3Y9pNHihcq1wPxdRp5lQfUjsjXs
        VjH+RQMSjGkL6sx7IcJFh2rA3bWl4LfIbiV+3ah67WBDGldlv5ssxgcnoliYkK2aT2rcSB
        sxD733l5Vbym583cJJ/V6LLOOnruFPE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-tbXuqrVFMWiFsiMe__mW7g-1; Thu, 03 Sep 2020 10:50:48 -0400
X-MC-Unique: tbXuqrVFMWiFsiMe__mW7g-1
Received: by mail-il1-f197.google.com with SMTP id p16so2504550ilp.2
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2020 07:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1FPRhJoWjqG8+gQHE9bU9UzjjoLvgSrA9NVzRzJ0CRg=;
        b=guwKtc/f93aV/Fv5avrvgS5sWb7WOQ+ASrxqfdZ3xTKB1vz/YQ6HkjJOVYvbc4WWgh
         eDzRAYoBiP35IL4h8BaC3qIlUA7w5vNMS1Pa7XEj1sQPY/vLiG5wzbWnrqUqy1EWl/ar
         gqgqxWq1WIpORlEHzPJWIrrYR6m+qVZhuyC9N7wgRi/f1Vq2g54PqeQJ5naL3REm3e3T
         EbA6/OMw0BalQ3nmH3hl4YTUUrDguyRHZ5YH3jZoENZj2uVB9oPPRu7BaIDDlE4pczXg
         S9n8iam02PH0cGSUt1eExaLBFzSPip42sg+iB3ebDEETlDAHtlSKFc8RTV4yyC8B1Ojj
         6M3A==
X-Gm-Message-State: AOAM5323A/YCoRCvQAUEKtH0nA4STZfFmSv119qzSaPp7DUZs62ZGphn
        OoERb/z2N0k1wtvSPoLgcL1d9SCJFbn7IxL/OohIwrf5+3EKFDEe+1Iz4Rz6a+a8omPfMJGX20L
        /FutsVYQCrbPcF6u6X1uQGDI=
X-Received: by 2002:a5d:8042:: with SMTP id b2mr3475468ior.60.1599144648122;
        Thu, 03 Sep 2020 07:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+uZWD7pr5mF1kBXgGw1mBpqel5ly9hQlNTFP+qQtdH6x+qIPuwZN8Jg8WqaLHCyom8VtKoQ==
X-Received: by 2002:a5d:8042:: with SMTP id b2mr3475460ior.60.1599144647939;
        Thu, 03 Sep 2020 07:50:47 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c7sm1515541ilk.49.2020.09.03.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 07:50:47 -0700 (PDT)
From:   trix@redhat.com
To:     mchehab@kernel.org, natechancellor@gmail.com,
        ndesaulniers@google.com, brad@nextdimension.cc, mkrufky@linuxtv.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>
Subject: [PATCH] media: em28xx: fix function pointer check
Date:   Thu,  3 Sep 2020 07:50:38 -0700
Message-Id: <20200903145038.20076-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analyzer reports this problem

em28xx-core.c:1162:4: warning: Called function pointer
  is null (null dereference)
        ops->suspend(dev->dev_next);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the problem block

	if (ops->suspend)
		ops->suspend(dev);
	if (dev->dev_next)
		ops->suspend(dev->dev_next);

The check for ops->suspend only covers one statement.
So fix the check consistent with other similar in
the file.

Change a similar check in em28xx_resume_extension()
to use consistent logic as its siblings.

Fixes: be7fd3c3a8c5 ("media: em28xx: Hauppauge DualHD second tuner functionality")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/usb/em28xx/em28xx-core.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index e6088b5d1b80..d60f4c2a661d 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1156,10 +1156,11 @@ int em28xx_suspend_extension(struct em28xx *dev)
 	dev_info(&dev->intf->dev, "Suspending extensions\n");
 	mutex_lock(&em28xx_devlist_mutex);
 	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
-		if (ops->suspend)
+		if (ops->suspend) {
 			ops->suspend(dev);
-		if (dev->dev_next)
-			ops->suspend(dev->dev_next);
+			if (dev->dev_next)
+				ops->suspend(dev->dev_next);
+		}
 	}
 	mutex_unlock(&em28xx_devlist_mutex);
 	return 0;
@@ -1172,11 +1173,11 @@ int em28xx_resume_extension(struct em28xx *dev)
 	dev_info(&dev->intf->dev, "Resuming extensions\n");
 	mutex_lock(&em28xx_devlist_mutex);
 	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
-		if (!ops->resume)
-			continue;
-		ops->resume(dev);
-		if (dev->dev_next)
-			ops->resume(dev->dev_next);
+		if (ops->resume) {
+			ops->resume(dev);
+			if (dev->dev_next)
+				ops->resume(dev->dev_next);
+		}
 	}
 	mutex_unlock(&em28xx_devlist_mutex);
 	return 0;
-- 
2.18.1

