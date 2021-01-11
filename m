Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFBB2F18D1
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731809AbhAKOz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbhAKOz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:55:29 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DBCC061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:48 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y23so137968wmi.1
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rm+TmbhSOTypnq+pdXbrNPtnKH0Bpei8eJl5VublyGk=;
        b=GILf5v43eU0xG50GFgWqf7ViufRZGPtCttM4viJg/lzVN2fLoZoNIrMdNMetiR7svs
         hu/FJxnTT49RjibfD+Gge+5tSuZiGsH//RyCf87BPK5KlhGUhqEStsDpHOFhlhxdYPI5
         xvfMQ9Bo09NSDBcpcO1wix8xh91UQ78KRj8eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rm+TmbhSOTypnq+pdXbrNPtnKH0Bpei8eJl5VublyGk=;
        b=LvvoHVNfiLKy2t/Fi//JE481pcEYRzOBMR29WaoxdfqlJJ6jJQzvjk9cEyLXcuM8aG
         ZgUKNABjFbEvqxeoH0fz/kLtbVJwNl9Vsdbd5+06wQS1UV1cPQTsrlEu1lXXhkHyj7Cm
         ldR1EAFZCOC5zGxY4LAWV5TMFZ6GHAEHmJArazNawTEgy0rNIJTaEqWnMQ1G3EhWkklg
         mpbgXjnTsPxTbrOyVaqqbslRjDHfwEM1zGbea6/cSF8843yNkZncNB1H/eIKfGaBntDO
         9tfcX0dn6j6e6l0q/L8CBTeT84RqHKEItY4d76ydaA3bRxV6hq5Fmtqw2ZKMJ6DIc464
         2iNw==
X-Gm-Message-State: AOAM530DSH8HA4Cgs+Zko8ZxXXMDfHGBdP8U1if5dmcusoqZGCRVdev3
        3w72EspWM6JZuInDaKgt18mbxv1a/PyQnZ0fpXE=
X-Google-Smtp-Source: ABdhPJyBoEs0OoPj3MayFeuV9EYSMTS9G7uR8/tOAAdYtcKt86F9EAWQZc4Br6prcQSSwoMKWjrWbg==
X-Received: by 2002:a05:600c:2158:: with SMTP id v24mr57683wml.129.1610376887442;
        Mon, 11 Jan 2021 06:54:47 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s133sm17780wmf.38.2021.01.11.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:54:46 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/9] media: ipu3-cio2: Do not zero reserved fields
Date:   Mon, 11 Jan 2021 15:54:36 +0100
Message-Id: <20210111145445.28854-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Core code already clears reserved fields of struct
v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
v4l2_plane_pix_format reserved fields").

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 36e354ecf71e..c5376de8cb8a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1094,12 +1094,9 @@ static int cio2_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	mpix->pixelformat = fmt->fourcc;
 	mpix->colorspace = V4L2_COLORSPACE_RAW;
 	mpix->field = V4L2_FIELD_NONE;
-	memset(mpix->reserved, 0, sizeof(mpix->reserved));
 	mpix->plane_fmt[0].bytesperline = cio2_bytesperline(mpix->width);
 	mpix->plane_fmt[0].sizeimage = mpix->plane_fmt[0].bytesperline *
 							mpix->height;
-	memset(mpix->plane_fmt[0].reserved, 0,
-	       sizeof(mpix->plane_fmt[0].reserved));
 
 	/* use default */
 	mpix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

