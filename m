Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572BB27207D
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgIUKWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgIUKVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:08 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CC6C0613D2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w2so11566128wmi.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jZ72PUAOAY/v7UQdoKSs5wvFASOODli3K4iY5mQPSSc=;
        b=JzNiLwHcQymY9+D/8+E4uv3VRe59dhgHJ1I8p9xqMKjrsJVLWChfAftBdMYaX/YAz1
         fkM9a1DXMC7+keldbhrkRFeGSLWb/FiMr2vpJvweYAJJuH5EZbY4nFU1KtcmCP/S7CDW
         hVzfBX9rGmO43vL6nDTmBwTZTQHkQ3DhdgWQQ6KadYIZT/ohDGARClZ2tTmWJdeei9Gf
         tfXsZ1XmRQC6gMZPu2dDt6vUBPc6DwLSSr2G9PHReMknSJmiXBPScSsmdaJWUhUcREjv
         yNEHAFFLVSuYW6OJDbwxxEfcqIlmtwRZEiFE1+jX19/NpTzXCsrFi+7X8k4QCKa6ZC8K
         aiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jZ72PUAOAY/v7UQdoKSs5wvFASOODli3K4iY5mQPSSc=;
        b=Q3PkjzdgzYpj9AFMnioGZpARf+7L5UQmm29NFqzZR1m2RZLC6PlBNAWtu8EtHP4n9n
         iDWp0ur9g/Ep3JV4Ki+Lj1FV7ucBJvXGVcCcYxrPcHzinN5ptPs0rfcobFE6g9mm1CU8
         DH9pOW5GcKFTba71g+pGQsDMhGI6+Ki16oOdEZoSkVaJtK9e9N5xHOOl7zvbf6recOHp
         3FjwZ1gJUa5/S0oUYQ4QGuF252EMBCRtrOlDX8kN5w6JeBZoEncByeKdABZhSzKEHzCQ
         0c+Rf6JoNtJ+aWiLscsxFne5PfiftzLbTXuJWZXbeaNTcac2oXgCAIBIQbG9qQSqoYS9
         rCmQ==
X-Gm-Message-State: AOAM532H8vkNvNpONr48tszOBETOQur/5IhRu1YfJ9iHTFywxlK8hOE1
        +8b7GUtCfa1H792WcytzvqsvmQ==
X-Google-Smtp-Source: ABdhPJz/WEM6jR4u7NBZYYpTXL198YeibOBpadp1+XxIqsxq7O0M1Pi8POlysByw9qPiVubnv0OaMw==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr29496041wmc.100.1600683666523;
        Mon, 21 Sep 2020 03:21:06 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:05 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 36/49] staging: media: zoran: Add more check for compliance
Date:   Mon, 21 Sep 2020 10:20:11 +0000
Message-Id: <1600683624-5863-37-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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
index 6e95fbf5c7ea..a326c0a16e0c 100644
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
 			strscpy(fmt->description, zoran_formats[i].name, sizeof(fmt->description));
@@ -1244,6 +1249,12 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
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
@@ -1271,6 +1282,9 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 		return res;
 	}
 
+	if (!fmt->fmt.pix.height || !fmt->fmt.pix.width)
+		return -EINVAL;
+
 	settings = zr->jpg_settings;
 
 	/* we actually need to set 'real' parameters now */
@@ -1856,6 +1870,9 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
+	if (!sel->r.width || !sel->r.height)
+		return -EINVAL;
+
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-- 
2.26.2

