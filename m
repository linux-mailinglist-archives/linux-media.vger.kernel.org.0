Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA10777D8
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 11:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387457AbfG0JP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 05:15:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33109 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387432AbfG0JP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 05:15:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so25632820pfq.0;
        Sat, 27 Jul 2019 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Atx8xpuE0sl6vRA/wIvsHhfFZ2IVdmWCb/LsfxFrY/c=;
        b=bZNxBjvyxvmG+0QaoLyJh1nCiE8XkjlejTpxJjKNJyk/oxDCnHM+GtMGKsZjKMZIay
         kUv4THn/eVeeut224iqfTSoHcVIZSGdKBUwdINBQp6iutYD7UMoYADo7h7e3sTqRUxOw
         48CGoakfAomxPG3M9yGinvKU+tJkoblwrLVC9FH8ooTWRPctTkCBBksWoOnIapU7UnW4
         R7hv16sHQ026+CcuZSABz4KsX8N/dhIbZxn81BDvkkBgZYtSj4sXnm8hPn9jymtfdEzF
         TZHS/aGfI9lDuGN5Sz+1RfQ9kWJlVRiuqpi7TVprf6bJRilwsrjyZVzST1cBkAsgaSiQ
         s4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Atx8xpuE0sl6vRA/wIvsHhfFZ2IVdmWCb/LsfxFrY/c=;
        b=SOrnLqyfI8Jy10X0UWpuvmLDtBOjSI6+QsfpZDTr1TPGJqIENON0+XRfUhZgSHzoZN
         sMuFC2zFxi5hdeAVPzGwhl/U0QtsnzmmDlnpMCuZOrIQz44biPliZMdyYmhR5dQFCvYt
         5vJO16p4gp8lutxxZsAT5H7sOjXb6Aano3u6/gIk67ctohModGQi7WKUVWAPdessBkiQ
         EXt9bpoPAHbAeb6Ww0Cj+lghz2Apbk7DZg4Knj+dhAOx/A6bS33/Gvs2Q0O+6Lyu9rEO
         kE0IVM38sb4q/ERNxzX+1ja5qOrBVTxlvlrl6B19USyiXcDIYZ+p2W3381iWHBDotubG
         qTDw==
X-Gm-Message-State: APjAAAXS7fOpL9ReChszJ2AGXD5BHTtUqNZ5MR6haZrL1REXXsaHGGY4
        sqGrjNZPBtFHdFIAQ4kie6E=
X-Google-Smtp-Source: APXvYqxNLfJu4DrS4MHx5N/BZp2jBKE3m8mnG8F2gCqux/5fqVhIVgEwh6WJr9TN504eW7z8WPsEkA==
X-Received: by 2002:a62:5214:: with SMTP id g20mr26674415pfb.187.1564218955306;
        Sat, 27 Jul 2019 02:15:55 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
        by smtp.gmail.com with ESMTPSA id y12sm64088978pfn.187.2019.07.27.02.15.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jul 2019 02:15:54 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     stanimir.varbanov@linaro.org, agross@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: qcom: venus: Fix a possible null-pointer dereference in vdec_g_fmt()
Date:   Sat, 27 Jul 2019 17:15:47 +0800
Message-Id: <20190727091547.11674-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In vdec_g_fmt(), fmt is firstly assigned NULL, and it could be never
assigned before being used on line 223:
    pixmp->pixelformat = fmt->pixfmt;

Thus, a possible null-pointer dereference may occur.

To fix this bug, fmt is checked before being used here.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e1f998656c07..12c31551f191 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -211,7 +211,8 @@ static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 		inst->height = format.fmt.pix_mp.height;
 	}
 
-	pixmp->pixelformat = fmt->pixfmt;
+	if (fmt)
+		pixmp->pixelformat = fmt->pixfmt;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		pixmp->width = inst->width;
-- 
2.17.0

