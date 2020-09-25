Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C0F2790C2
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbgIYSfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgIYSfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69357C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x22so3994001pfo.12
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E8mcvDoFTnrMID+Fg59QVFWhzXBawhWWjxD4oYrXL74=;
        b=0hNEIyH5dmP1qakbjwXSklloUzFSwF+rC8pVJg0etfvQj3TpibAoXghjD7h8r4opgl
         QZW9uazz2VbmkmNtOVY0ovmbLSqfk7w6uz437D/PwNC/9AN6eSyKcHjhrDRDnMTWDDBg
         hGObD6ZUaFbv7fZ7A63oDtRPz732rB1mmxeyDL7FK5YyryNymFhkm4VAVtuqRxhSiXVf
         5nB8haGUYzaerHL6jjHOZZRGvxuNb8SwxE48hzhVeh7Z0yZa4S2DI8KaOSbHM7cClmB5
         sSoF8ZATsHnKjjMe7GyV6nWLLWJGE49MBTB7w1zqlFWTzX9nwAu+YeJeo62/9b25D4Hm
         XHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E8mcvDoFTnrMID+Fg59QVFWhzXBawhWWjxD4oYrXL74=;
        b=mzps4AjKk6VQe5geS7BYjwAQ8jfVS/1ZHAz61IKpiVyJPEzVHfWny3962ZVtH0fyWy
         rod93zyKFt+Iafu1TxQgbsHrqQyQe0H+yOcwrAbJR+QqIUP9pOW0zT39qTybht9E2Xuh
         tJRCTyKdXZuoKHu4lUw2JVaotuDLwXxIFutGkDd2kvAEJC5mmHfnaZK1hcj6PNi5b48B
         rdJA71BnADe1iSfqkHpMiuZ1oeQor1gVl8L51MYSYR8ClRu97jsTzayLj+muE8drw53Z
         9UOxBPmza0o4+C9M5kh97QLu2px1w1PqeTwcXHRzkkTqUW9Rfk2ajp+4DtmafbUpiL+p
         ZWoA==
X-Gm-Message-State: AOAM533rQYqFGf+mH9AjMzw217uTA4uQDE8Ajbt8Rj6lJE9bG8hYGrdN
        t7jQDMFWtzWigxR6kW2ww59H8KGo+59XYg==
X-Google-Smtp-Source: ABdhPJxkzGi9CvfwcloQIjaxYHzTc/wVwB9aCNk6ULy9jfhgQ2ldNr3DIN9/z+l2AoYxonOI/zWxlA==
X-Received: by 2002:a17:902:b682:b029:d2:4ca:281e with SMTP id c2-20020a170902b682b02900d204ca281emr719884pls.13.1601058936939;
        Fri, 25 Sep 2020 11:35:36 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:36 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 44/47] staging: media: zoran: fix some compliance test
Date:   Fri, 25 Sep 2020 18:30:54 +0000
Message-Id: <1601058657-14042-45-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add TODO for "TRY_FMT cannot handle an invalid pixelformat"

We need to set pixelformat in some case.
We should also handle some minimum requirement.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 021073ba08e6..ab9eec50abad 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1217,9 +1217,12 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 		if (zoran_formats[i].fourcc == fmt->fmt.pix.pixelformat)
 			break;
 
-	if (i == NUM_FORMATS)
+	if (i == NUM_FORMATS) {
+		/* TODO do not return here to fix the TRY_FMT cannot handle an invalid pixelformat*/
 		return -EINVAL;
+	}
 
+	fmt->fmt.pix.pixelformat = zoran_formats[i].fourcc;
 	fmt->fmt.pix.colorspace = zoran_formats[i].colorspace;
 	if (BUZ_MAX_HEIGHT < (fmt->fmt.pix.height * 2))
 		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
@@ -1332,6 +1335,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 	if (i == NUM_FORMATS) {
 		pci_err(zr->pci_dev, "VIDIOC_S_FMT - unknown/unsupported format 0x%x\n",
 			fmt->fmt.pix.pixelformat);
+		/* TODO do not return here to fix the TRY_FMT cannot handle an invalid pixelformat*/
 		return -EINVAL;
 	}
 
@@ -1341,10 +1345,16 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 		res = -EBUSY;
 		return res;
 	}
+
+	fmt->fmt.pix.pixelformat = zoran_formats[i].fourcc;
 	if (fmt->fmt.pix.height > BUZ_MAX_HEIGHT)
 		fmt->fmt.pix.height = BUZ_MAX_HEIGHT;
 	if (fmt->fmt.pix.width > BUZ_MAX_WIDTH)
 		fmt->fmt.pix.width = BUZ_MAX_WIDTH;
+	if (fmt->fmt.pix.height < BUZ_MIN_HEIGHT)
+		fmt->fmt.pix.height = BUZ_MIN_HEIGHT;
+	if (fmt->fmt.pix.width < BUZ_MIN_WIDTH)
+		fmt->fmt.pix.width = BUZ_MIN_WIDTH;
 
 	map_mode_raw(fh);
 
-- 
2.26.2

