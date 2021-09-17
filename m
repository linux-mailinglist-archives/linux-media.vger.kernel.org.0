Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA0140FD88
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 18:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbhIQQIb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 12:08:31 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:34012
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229890AbhIQQIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 12:08:30 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E68203F051;
        Fri, 17 Sep 2021 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631894823;
        bh=iUtHqxPq9B+ifZrfPidy+MCJ7BqhWrjpXrwNQk04dbg=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=rlHwHaZnxjUVJV0vu3eiRz7Y198XqXL1lELqg26Ycenrhwat4DWDEo8muAlFKz4Br
         VkGteijAnyTdz9Kd4W52/OvVK+gfeP5qmEVcvkeQJ5e0vwYyC5L51rCXlgtcgmLO37
         4rl034JsFAOWDOoucB+l87xe4THtQcKPc+vjK2z5t/aVFfsaWQvPnlGi+pm8DDc1DL
         D8A8+fb/zd93nZT1ZlCMt6X6MiXGLlVJYW3sQ3osRIF0ITbmxzz6Q+QfPnTqC390Pj
         VYFM92nwzOt2WbSwO9ZOqNyj4H7XrNFve8KUZjRwcqnInLtNMBWuCSWh4kLKSje3oz
         XiO8CYD9cFvmQ==
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ira Krufky <mkrufky@linuxtv.org>,
        Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: em28xx: Don't use ops->suspend if it is NULL
Date:   Fri, 17 Sep 2021 17:07:02 +0100
Message-Id: <20210917160702.76961-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to ops->suspend for the dev->dev_next case can currently
trigger a call on a null function pointer if ops->suspend is null.
Skip over the use of function ops->suspend if it is null.

Addresses-Coverity: ("Dereference after null check")
Fixes: be7fd3c3a8c5 ("media: em28xx: Hauppauge DualHD second tuner functionality")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/em28xx/em28xx-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 584fa400cd7d..92a39fcee206 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1154,8 +1154,9 @@ int em28xx_suspend_extension(struct em28xx *dev)
 	dev_info(&dev->intf->dev, "Suspending extensions\n");
 	mutex_lock(&em28xx_devlist_mutex);
 	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
-		if (ops->suspend)
-			ops->suspend(dev);
+		if (!ops->suspend)
+			continue;
+		ops->suspend(dev);
 		if (dev->dev_next)
 			ops->suspend(dev->dev_next);
 	}
-- 
2.32.0

