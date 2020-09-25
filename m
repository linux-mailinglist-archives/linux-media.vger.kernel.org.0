Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486022790B0
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbgIYSeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730115AbgIYSeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23705C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:44 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z18so4029890pfg.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z2ehdJwTg//k76wOiQFxYa7TSjOY+fUe32PPFRAEB40=;
        b=Jc79CWO0HvaDRvbAGxsmInH8ME89szgSHjcyfeBoTv49SJDw/WX4YPUB70X4tKg1TW
         Rr3bijRVGrW2p4s1lQi7HlsFufo7gkxMRQ9tSHJKoz/CWgJSOSvWsAmX+ih1HtRjBqNI
         tFXOpCnzLANcCq+DPQMdxReXYEXPZRAb/yBMEpx7B9QfOXSUMyH5iy9GkZIKKY4HqTMl
         z+qRHUXG0ipdSXjR/CAZALIlvhKrQO+lDCSs2ebDlMvI/zIH+e2tZ1CQ5E9avzLIG3ME
         tuMx9Z3c1zc/xTyopDRkRLcN7t5UTXJMrCcDyHLRyuVCa99kcKYhX7pfTHYP2aoPFp+z
         gP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z2ehdJwTg//k76wOiQFxYa7TSjOY+fUe32PPFRAEB40=;
        b=fh9c6sOVgKe0apzz9Wts+YR3x2KAJ/kfBCyWTj8wTAmbKfWtBN+vdUjQhyanXB7qdi
         74DQE/H15bbEiyJU0cTDkbcuohI0iaAFUn31LCQ13S48eytstXtdtZbdlDXW9PQNBQum
         BjirX4kbpkSvH6y3eF0SSFsixzqQh05u32a7fDZobQUYzcoEfGLvoyrA8+xQPuC6zEhN
         NsvdD4DLR+j2sQV+EIN4SGylGC690DhyfQI9y0RIftdCklpzQoi8Rnc17zv4zK77eTm5
         R20yMt7EJEn8/aBqhf778dk94Tj+EY6cU+pueLwEGqu+vfk6I7Rw4kRPfxi0saSsBWky
         Yk/g==
X-Gm-Message-State: AOAM533foPwQJv30fOA3eUG/EoN5uCu7bVZ2nZhqsAMw1/IFIZhMJk8r
        vyyhsHi/ARxUxRSTuvZfWO171A==
X-Google-Smtp-Source: ABdhPJzK4DtJhq4rllF1jMZgn6R2vGmQSbmXkAuBOZxqQ/CRxfj+erIK5UhpPfxHIFEWfKcPVuBMUQ==
X-Received: by 2002:a63:c34b:: with SMTP id e11mr240955pgd.25.1601058883674;
        Fri, 25 Sep 2020 11:34:43 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:43 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 35/47] staging: media: zoran: Add more check for compliance
Date:   Fri, 25 Sep 2020 18:30:45 +0000
Message-Id: <1601058657-14042-36-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The zoran driver miss some sanity checks, and this made v4l compliance
happy.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 60bbc8235cff..5ac832eca501 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1092,6 +1092,11 @@ static int zoran_enum_fmt(struct zoran *zr, struct v4l2_fmtdesc *fmt, int flag)
 {
 	unsigned int num, i;
 
+	if (fmt->index >= ARRAY_SIZE(zoran_formats))
+		return -EINVAL;
+	if (fmt->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
 	for (num = i = 0; i < NUM_FORMATS; i++) {
 		if (zoran_formats[i].flags & flag && num++ == fmt->index) {
 			strscpy(fmt->description, zoran_formats[i].name,
@@ -1255,6 +1260,12 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 	if (i == NUM_FORMATS)
 		return -EINVAL;
 
+	fmt->fmt.pix.colorspace = zoran_formats[i].colorspace;
+	if (BUZ_MAX_HEIGHT < (fmt->fmt.pix.height * 2))
+		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
+	else
+		fmt->fmt.pix.field = V4L2_FIELD_TOP;
+
 	bpp = DIV_ROUND_UP(zoran_formats[i].depth, 8);
 	v4l_bound_align_image(&fmt->fmt.pix.width, BUZ_MIN_WIDTH, BUZ_MAX_WIDTH, bpp == 2 ? 1 : 2,
 		&fmt->fmt.pix.height, BUZ_MIN_HEIGHT, BUZ_MAX_HEIGHT, 0, 0);
@@ -1283,6 +1294,9 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 		return res;
 	}
 
+	if (!fmt->fmt.pix.height || !fmt->fmt.pix.width)
+		return -EINVAL;
+
 	settings = zr->jpg_settings;
 
 	/* we actually need to set 'real' parameters now */
@@ -1872,6 +1886,9 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
+	if (!sel->r.width || !sel->r.height)
+		return -EINVAL;
+
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-- 
2.26.2

