Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0715DF59
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 10:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfGCINb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 04:13:31 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42848 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfGCINb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 04:13:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay6so789030plb.9
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BvJNwkPS9MfNl5cMsC1QP7QkMzi/DuELy2LvBnmsMXs=;
        b=lVKLv9ep+x4cUvfF60e2j506ilKkHO6GJ9kMGHlE16ajbL+aUPEEM5VQAC6ea0Bldg
         JELTiHoLc+YIjPM+QPlPf3s6whkUv9WCjVkrb9BjMPoiXgeiwiQ1nTMFlgaks4IDjskG
         0fgyOsK2vtV9xEHR7ZT0fOL/B2opBXSj2h5l+UdEpM1YuBjWJa0wPoV7ob8l3qqIAOTr
         vFuyiv9yqqiITs5cpwC3l380edGBtpIjt3jVRO9ocbLYjW4xtkfe8V8K4+hlo8UCt1pt
         7cv0tjmysRqss+du9MGt7dKW2lha1blcf4PAFNaJg4ObAmXj5Ld+TPmEAFnwdAc7oBYs
         jc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BvJNwkPS9MfNl5cMsC1QP7QkMzi/DuELy2LvBnmsMXs=;
        b=UCU4zbJk+RFZxBgLaYfGcO2UUp8ST6qDBUZAyqhSeGafAJ0HJLlc6GU0r/RCSby49U
         ON/TNSmhe+Hofrtdhjny4ffgND0fYhUUmZ6ONX3Ulw8uEMxOCxmsadUeULccJz2dAqAO
         DdPB5YStN+5q2YhspIgo19qGtG/4OQHTAZJJG7iXe0mfB1xbzDsBlnOy1PNb8UhF+YmN
         RXzzRqcyWHIEiGcqb3GIw3MMeI/bQba+45iCT0FYvhqV74SSjzMB66picZMRkRePu57G
         dTnvij30ioqJ+CpIGMQ9WH3LkzwJiKBuesCDN95fjEi+OuE3ZRliA03MfO3d6eL34XOD
         k5KA==
X-Gm-Message-State: APjAAAV/h89oq2AvtCqyZx851EIn7Tu5GINrT6IEvkkade+B0ByCw1/k
        0Rlga1Qp7ronaOInE6Jvddg=
X-Google-Smtp-Source: APXvYqyU1k/W96dJNhLR99ByjoiAJ5wVF3nwNApkKn61Qi1jDrfWmGEXDoi1IdFinLjkKK+4fQ8R1Q==
X-Received: by 2002:a17:902:b284:: with SMTP id u4mr42218344plr.36.1562141610635;
        Wed, 03 Jul 2019 01:13:30 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id m6sm1176450pjl.18.2019.07.03.01.13.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 01:13:30 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     maxime.ripard@bootlin.com, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH 1/2] staging: media: sunxi: Change return type of cedrus_find_format()
Date:   Wed,  3 Jul 2019 13:43:16 +0530
Message-Id: <20190703081317.22795-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change return type of cedrus_find_format to bool as it is only called
once, by a function whose return value is bool, and the return value of
cedrus_find_format is returned as-is at the call-site.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 9673874ece10..0ec31b9e0aea 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
 	return container_of(file->private_data, struct cedrus_ctx, fh);
 }
 
-static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
-						unsigned int capabilities)
+static bool cedrus_find_format(u32 pixelformat, u32 directions,
+			       unsigned int capabilities)
 {
 	struct cedrus_format *fmt;
 	unsigned int i;
@@ -70,13 +70,10 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
 
 		if (fmt->pixelformat == pixelformat &&
 		    (fmt->directions & directions) != 0)
-			break;
+			return true;
 	}
 
-	if (i == CEDRUS_FORMATS_COUNT)
-		return NULL;
-
-	return &cedrus_formats[i];
+	return false;
 }
 
 static bool cedrus_check_format(u32 pixelformat, u32 directions,
-- 
2.19.1

