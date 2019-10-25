Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6B2E541C
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 21:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfJYTHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 15:07:47 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:39034 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJYTHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 15:07:46 -0400
Received: by mail-yw1-f67.google.com with SMTP id k127so1197012ywc.6;
        Fri, 25 Oct 2019 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7PioBQzt1SxKot1k2zyn69TdTTFkJtrCnw+zC1H1TUg=;
        b=BHy7E4JV0EVw+PQo4oBTqfqC6zfjWD/oIyOWP/Bi1jmvqtkSOVLGv4Ufbe2IXKT9kE
         RfBbjKKpVrmYfQooxBlAR6oQqO0RvGccy0zLsEmgUnIwfbvmrcL140ThP8429w8iVXRN
         h5yi7+dKnReb9z67k/L9nmzZcn05IV/1llbiGSdeJmsBKJzTsUkSQD9KDQJ4v8LOpivP
         CU0nZiNO4KSEPNn/81l6hhXMD1ze+hJjPoqL7juhZLN0FJqTVtSZ382kIXec3ZcPLCti
         W58Dgj8/V1zVqTBCQNyGVV2YzPbljVH8FnslkeMsYvW/f65X5yiteIRLfKjKGKDubaJ5
         Yz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7PioBQzt1SxKot1k2zyn69TdTTFkJtrCnw+zC1H1TUg=;
        b=XbFUx7KM4SyVhmegl0qZxMB8SGBK8FmpfhKKKqd5GUWSvP21mXgPbXHku4fPQ/7DV/
         9hBh7oSPF5FSVYQBi2miNJ4KdOxBlzWuqhzkcQ2txc4CDoF+HtdXsvLsq2ptWbS1DbPD
         NJszeZm2UzblwxXAyktBNuUfv4aEOpRVrY8iF39E5cUtx1PXYO8OI603Vcn+K4tj2b/p
         SLpo9A/BCYeyyEA0sPDM+8FoG/cPBZ7PTS+YD1qKhpFdZs4QJ+kYAlr5tqhV+YCvl+eg
         yTa0mZ76CXg0YWTgPlOqUdC4pk0PW0+Kpw8XMyWYUgw9InxZKWzu3VX1xJgcsaoj9saU
         ZMYA==
X-Gm-Message-State: APjAAAXSIjv9dU4qXnV7kAZObr81NL3ooOweV90JufUnSQEUR9sB53iD
        nMmd3uqB+banexVn0/icy9fWPN18
X-Google-Smtp-Source: APXvYqzNJrQhr2JXatlntkdOP58PQNejFDYnA7//rfqlYq9YhvlK3DQmJIaGvUqiyXBKaoinUUWgAg==
X-Received: by 2002:a81:494b:: with SMTP id w72mr3460774ywa.435.1572030465082;
        Fri, 25 Oct 2019 12:07:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id d205sm2408236ywh.75.2019.10.25.12.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:07:44 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     slongerbeam@gmail.com
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, Adam Ford <aford173@gmail.com>
Subject: [PATCH] media: ov5640: Put max framerate into table and simplify check
Date:   Fri, 25 Oct 2019 14:07:23 -0500
Message-Id: <20191025190723.21105-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the various modes are placed into a table, but when
ov5640_find_mode is called, it has to double check whether
or not the requested framerate is tolerated by the mode.
The determination is based on checking hact, vact, and frame rate.

Only 640x480 is allowed at 60fps and QSXGA is limited to 15fps, but
as the number of permitted frame rates change, this will begin to
add more and more complexity to the check.

This patch simplifies the check by adding the max framerate
allowed for each mode into the table of modes.  It then compares
the requested framerate to the max permitted in the mode's table.
This reduces the number of comparisions to one down from three
at run-time.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5e495c833d32..19e10c59860b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -189,6 +189,7 @@ struct ov5640_mode_info {
 	u32 vtot;
 	const struct reg_value *reg_data;
 	u32 reg_data_size;
+	u32 max_fps;
 };
 
 struct ov5640_ctrls {
@@ -544,6 +545,7 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 	0, SUBSAMPLING, 640, 1896, 480, 984,
 	ov5640_init_setting_30fps_VGA,
 	ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
+	OV5640_30_FPS,
 };
 
 static const struct ov5640_mode_info
@@ -551,39 +553,48 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
 	 176, 1896, 144, 984,
 	 ov5640_setting_QCIF_176_144,
-	 ARRAY_SIZE(ov5640_setting_QCIF_176_144)},
+	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
+	 OV5640_30_FPS},
 	{OV5640_MODE_QVGA_320_240, SUBSAMPLING,
 	 320, 1896, 240, 984,
 	 ov5640_setting_QVGA_320_240,
-	 ARRAY_SIZE(ov5640_setting_QVGA_320_240)},
+	 ARRAY_SIZE(ov5640_setting_QVGA_320_240),
+	 OV5640_30_FPS},
 	{OV5640_MODE_VGA_640_480, SUBSAMPLING,
 	 640, 1896, 480, 1080,
 	 ov5640_setting_VGA_640_480,
-	 ARRAY_SIZE(ov5640_setting_VGA_640_480)},
+	 ARRAY_SIZE(ov5640_setting_VGA_640_480),
+	 OV5640_60_FPS},
 	{OV5640_MODE_NTSC_720_480, SUBSAMPLING,
 	 720, 1896, 480, 984,
 	 ov5640_setting_NTSC_720_480,
-	 ARRAY_SIZE(ov5640_setting_NTSC_720_480)},
+	 ARRAY_SIZE(ov5640_setting_NTSC_720_480),
+	OV5640_30_FPS},
 	{OV5640_MODE_PAL_720_576, SUBSAMPLING,
 	 720, 1896, 576, 984,
 	 ov5640_setting_PAL_720_576,
-	 ARRAY_SIZE(ov5640_setting_PAL_720_576)},
+	 ARRAY_SIZE(ov5640_setting_PAL_720_576),
+	 OV5640_30_FPS},
 	{OV5640_MODE_XGA_1024_768, SUBSAMPLING,
 	 1024, 1896, 768, 1080,
 	 ov5640_setting_XGA_1024_768,
-	 ARRAY_SIZE(ov5640_setting_XGA_1024_768)},
+	 ARRAY_SIZE(ov5640_setting_XGA_1024_768),
+	 OV5640_30_FPS},
 	{OV5640_MODE_720P_1280_720, SUBSAMPLING,
 	 1280, 1892, 720, 740,
 	 ov5640_setting_720P_1280_720,
-	 ARRAY_SIZE(ov5640_setting_720P_1280_720)},
+	 ARRAY_SIZE(ov5640_setting_720P_1280_720),
+	 OV5640_30_FPS},
 	{OV5640_MODE_1080P_1920_1080, SCALING,
 	 1920, 2500, 1080, 1120,
 	 ov5640_setting_1080P_1920_1080,
-	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080)},
+	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
+	 OV5640_30_FPS},
 	{OV5640_MODE_QSXGA_2592_1944, SCALING,
 	 2592, 2844, 1944, 1968,
 	 ov5640_setting_QSXGA_2592_1944,
-	 ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944)},
+	 ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
+	 OV5640_15_FPS},
 };
 
 static int ov5640_init_slave_id(struct ov5640_dev *sensor)
@@ -1606,14 +1617,8 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	    (!nearest && (mode->hact != width || mode->vact != height)))
 		return NULL;
 
-	/* Only 640x480 can operate at 60fps (for now) */
-	if (fr == OV5640_60_FPS &&
-	    !(mode->hact == 640 && mode->vact == 480))
-		return NULL;
-
-	/* 2592x1944 only works at 15fps max */
-	if ((mode->hact == 2592 && mode->vact == 1944) &&
-	    fr > OV5640_15_FPS)
+	/* Check to see if the current mode exceeds the max frame rate */
+	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
 		return NULL;
 
 	return mode;
-- 
2.17.1

