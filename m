Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19B220B1BB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgFZMuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgFZMuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:50:09 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86945C08C5DD
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 05:50:09 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 16so6527133qka.15
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=WKhKgNFFiDRIRCfQcIC/1NT6EzoOyImEXLP9eqrvZ6Y=;
        b=T5nLXbZF9pc9kYrae6kOeupEHWwwV4k46/cfEIRTnZertZSQU7oZEilca8JO2ip7ib
         IyLyUKhg59sGsTpzGbDMRjkzsQE+3xkLJD3gXhhCGiwQ8DVmJbc9EjS/1o713f/bhuCp
         SUMjWICzYMPvVznZ3uoEY5iBAOgu/DJuXZDZhd23H076GfBJqffuGgCGwiCS3mRrh7XE
         n6SYa8VyPKSVsC6b2NKWj82LZLlVdFQBHtT2kTUqz0wVnnNFZlreRYGMhC7nEUGk74Kr
         3r5Qrt/y8MlFK2NOsXlMamTJEZeZXQpKiPQK3ocOf4Tey+1x3083zenJe3nkKuelWNsj
         h0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=WKhKgNFFiDRIRCfQcIC/1NT6EzoOyImEXLP9eqrvZ6Y=;
        b=Hk5nGSdoxFUFfGkK6/aW7vy7F87EEJ4FJz+t6UAoRv5kTyvWPl6AmLpA/90kbVPelt
         ss4Rw5Ae60MpJF8euCbkfpyM1tN3xBgT2ftkhZ4CK6JezniJGCGWCLEwU5uF6u4aB89a
         1IbA8323vB53E9XgX7UJGpeYk9uLMDNqhFtqI1go2H/cxgYgFGbqoqsDTXqfl0j1iwkW
         qFL73FDTuu0FcFqFRvYxyy4Sv+SRuyC4JihoLkPGkRr4aMGKKsNjDg+0gdiuxDxHrfdN
         SwwcjweXo19iyu0GYN+iryQMSuYZxiDniy0xNhpjFhCopOytvDnW4SpM9rxWfB3OZqgJ
         Vw0A==
X-Gm-Message-State: AOAM5303h/egIUHF2uch6M/XgChCp+xeuKFsSnz7ehb11cet3GHptJRe
        DMIbUWbvi+6h4pVHZbhAllLJ6qLKm5JM5P8U24ElNxL6u1oRYf/PxcbzctkIoWuniCgMcUYXopo
        zDVMsySVp5zyJT+910wqMUwo/0YM04hspgGF+qRNOAsYGdHi6poWfMxHOOoq9ExEFHc6/
X-Google-Smtp-Source: ABdhPJwFJutKIRKx0fzvzBEtwYcWv7isBew8f7hpfWe5Rc/JQv0WBDklJAxvVzGqCO9NspoJpGuz//CUSfo=
X-Received: by 2002:a0c:d442:: with SMTP id r2mr2880640qvh.59.1593175808590;
 Fri, 26 Jun 2020 05:50:08 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:48:06 +0200
Message-Id: <20200626124808.1886430-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3] media: cros-ec-cec: do not bail on device_init_wakeup failure
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     gwendal@chromium.org, Dariusz Marcinkiewicz <darekm@google.com>,
        stable@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sebastian Reichel <sre@kernel.org>,
        Dariusz Marcinkiewicz <darekm@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not fail probing when device_init_wakeup fails. Also clear wakeup
on remove.

device_init_wakeup fails when the device is already enabled as wakeup
device. Hence, the driver fails to probe the device if:
- The device has already been enabled for wakeup (via /proc/acpi/wakeup)
- The driver has been unloaded and is being loaded again.

This goal of the patch is to fix the above cases.

Overwhelming majority of the drivers do not consider device_init_wakeup
failure as a fatal error and proceed regardless of whether it succeeds
or not.

Changes since v2:
 - disabled wakeup in remove
 - CC'ing stable
 - description fixed
Changes since v1:
 - added Fixes tag

Fixes: cd70de2d356ee ("media: platform: Add ChromeOS EC CEC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 0e7e2772f08f..3881ed7bc3d9 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -277,12 +277,6 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cros_ec_cec);
 	cros_ec_cec->cros_ec = cros_ec;
 
-	ret = device_init_wakeup(&pdev->dev, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to initialize wakeup\n");
-		return ret;
-	}
-
 	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
 						 DRV_NAME,
 						 CEC_CAP_DEFAULTS |
@@ -310,6 +304,8 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_probe_notify;
 
+	device_init_wakeup(&pdev->dev, 1);
+
 	return 0;
 
 out_probe_notify:
@@ -339,6 +335,8 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
 					 cros_ec_cec->adap);
 	cec_unregister_adapter(cros_ec_cec->adap);
 
+	device_init_wakeup(&pdev->dev, 0);
+
 	return 0;
 }
 
-- 
2.27.0.212.ge8ba1cc988-goog

