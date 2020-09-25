Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2B2279082
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgIYScr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729737AbgIYScr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:32:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24336C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so2159258pji.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C4GJC10a2+hCn4g9r7dLW6g/oIvJ1zlU86Tsyu3Timw=;
        b=heRs13jvgdjnNGEFiq21ofiZ01LsSMrdh4OrqEnJu1A/1QmdcY6aAjerDOqnk9rD38
         7SZiXiuecuKyxA1rrcUwZu5ylgH3aKfWm479w5mK4AP7MPkohpv9vYX3SSDwCMgPLNfb
         YRQwnwPMFK9w7mGRjb6eZpkmSj4rw6IazoJSuAYsns+RommF3Vgud08sv+/5N18jWatU
         SMq54p3OGf9vxF1xI+frGsqF5D0BFAMecv/8+/CKwYCm2I4Xz//nhmnl4uKX4L//KiPP
         mAE5Ptyx9r0OpVPt8i4Rh0s7L4FSKrGStcqH/Nr9D/hxosSRgm8WJZMwSUNu8DRDu/+j
         5u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C4GJC10a2+hCn4g9r7dLW6g/oIvJ1zlU86Tsyu3Timw=;
        b=Zh0AxKeejlxjSDHHjeW1z2SzTaKSZxOWD97E0Nh+iK54C4y6nTmH3YwJgOO3Y3e1xz
         7MrlOYCqDhgF+T22JdeaWO7uQiaGU5gfyfYlCDBeO6s6fRSx6PKZodiEV6UgtZXGTnU/
         hQUHWTxvyhFRHfNdIlJx/U7/x2qQuOHF+8XOgbuL49fsdLYRIIAiM154JmJBZOIC+zrp
         lv+1wokmq7/x5HgvFiIYS40cdaa4JWhT7MaxlyZHBj7pYI6lWLkBhcfXz8PWPLrR8J31
         JRBF/WJaUnLIW9IuENoY0NdfkfutuBrdn1FhE9GOziJPZPqoShxPkTWo+jWeTlH/vNpD
         6qmA==
X-Gm-Message-State: AOAM5334uVU+acG1LT2S6CeJoXw7Co8C6zl2+FjgHumY28shWfE/AyFZ
        vhi3ngGujGzVXOLbe4Q9HH3BaA==
X-Google-Smtp-Source: ABdhPJyoaLEuGkpN/mI8qVTRNC+bVoc5tZaZEV+CaoSkYkudh7F9+08YbRROhLhLw6NvYs2koFkDig==
X-Received: by 2002:a17:90a:f992:: with SMTP id cq18mr814447pjb.172.1601058766740;
        Fri, 25 Sep 2020 11:32:46 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.32.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:32:46 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 15/47] staging: media: zoran: do not print random guest 0
Date:   Fri, 25 Sep 2020 18:30:25 +0000
Message-Id: <1601058657-14042-16-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The slot 0 of guest is never initialized and so we print later random
data.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 04ba22a915f0..dfc2551f2d71 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -158,6 +158,9 @@ static void dump_guests(struct zoran *zr)
 	if (zr36067_debug > 2) {
 		int i, guest[8];
 
+		/* do not print random data */
+		guest[0] = 0;
+
 		for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
 			guest[i] = post_office_read(zr, i, 0);
 
@@ -170,6 +173,10 @@ void detect_guest_activity(struct zoran *zr)
 	int timeout, i, j, res, guest[8], guest0[8], change[8][3];
 	ktime_t t0, t1;
 
+	/* do not print random data */
+	guest[0] = 0;
+	guest0[0] = 0;
+
 	dump_guests(zr);
 	pci_info(zr->pci_dev, "Detecting guests activity, please wait...\n");
 	for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
-- 
2.26.2

