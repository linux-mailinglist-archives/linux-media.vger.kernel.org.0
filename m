Return-Path: <linux-media+bounces-19273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A789952C8
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 17:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B1B41F22A42
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D293D1E102D;
	Tue,  8 Oct 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h30EQ2ah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A61E0DF9
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399613; cv=none; b=YHsy/aTl7DynuvPeCugXdQkSbWyinnWpngSZ7R8+i8KSvYp6ypWKBUEQchyJRorZNULZx3xzwy47luX8RKDy/2cxRjHzAQ/SiwNuLKvBQ2TkEsIq4Bbcgri6XKZ7rBQzzS/OOMIpEZ5U/WDpQAR+4OWemkX0oLF5BQf9YlqeBDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399613; c=relaxed/simple;
	bh=SPz+2k6qAmFkLhvmwfbYfGq2M1+gsUFHn/p094yCMR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/s+60VYW6ejAZjI0Du8jPxsy8YIYiHGIAt5NnMxH2H9CU8DU3Yl+7uedBtTziLBU24mgc+H2vJaqypNmtHt0QOjGNlxuzYvBOAVZDwJvQ/eQJORrgwVmotgDzruDsiZLjID9dBrqHKLzZtDiexOL3DisvaihPsm0SNyWNmqTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h30EQ2ah; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-287148a44f3so2753295fac.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728399610; x=1729004410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAa0sba5ecosbF6x+jnpQXFs+AOj18qlbA6Xv2h7TnU=;
        b=h30EQ2ahLw+54EH38sF9TlXatAqH4bCNN+T+5yTCFkUTJfQerA1rWtzg3zX4YeULsD
         5qiz1EABP4KjtnYX1t1Q9tCD1ARSQEG7lYZR2fzRZTVc1tORJ/syX2j6zg0ewXe3Rx3U
         nHXvrt4UK1vkz49EBYNz6qWwvMPHdOF37rHOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399610; x=1729004410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAa0sba5ecosbF6x+jnpQXFs+AOj18qlbA6Xv2h7TnU=;
        b=Ur/1SheGf0Ep4nZK9F6QSrNjCkzumB5jkC9n03wBcIfiNwg1M8KDZKwhixjkqpY0P1
         Q9gWVTDApAqB7MRbxvmgAb1Yky982dZmekiS/SJ0Z57HPZ2AI4pFuPlyzCQUybPLH5hO
         +ATBKto9MXxh7+HjN5n5WMHEMVArb81IvbBVt+A8qthSyXvZ34pok2TRwML82T77Lj0h
         05AZLIYTsbgcljru5yzjrUiRemro8cB66XxoKatT2EWfPXOTjsHOAGaZNwdalwQSwuJ1
         UhjFdkZBSaCAPnrICOYCf90ip32eZBXy1zjASOwhWojJi+4q1kGEfX2bw7W/oyFV/XFz
         L4Lg==
X-Gm-Message-State: AOJu0YyO7OCAB12sECvEPBVhhfeYgBoTfaOx3JxMiRNKd0oUvNCEbGOs
	IwpDyuETEomqKaQ3T4YJvvCe2epm6qJdG2j7zNVaV+3HHJkbMSezkhYW56KvaA==
X-Google-Smtp-Source: AGHT+IHmKW/4ultjLfqxbrApmxornUzzwKpZiSN5cJiIHI/1zpG807eLBH18zRwyjwVVZQWDr2bxiA==
X-Received: by 2002:a05:6871:520b:b0:277:e6f6:b383 with SMTP id 586e51a60fabf-287c1e16773mr9823991fac.24.1728399610142;
        Tue, 08 Oct 2024 08:00:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75762a36sm360886085a.124.2024.10.08.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 08:00:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 08 Oct 2024 15:00:07 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Support partial control reads
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-uvc-readless-v2-1-04d9d51aee56@chromium.org>
References: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
In-Reply-To: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Some cameras, like the ELMO MX-P3, do not return all the bytes
requested from a control if it can fit in less bytes.
Eg: Returning 0xab instead of 0x00ab.
usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).

Extend the returned value from the camera and return it.

Cc: stable@vger.kernel.org
Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index cd9c29532fb0..f125b3ba50f2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -76,14 +76,29 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 
 	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
 				UVC_CTRL_CONTROL_TIMEOUT);
-	if (likely(ret == size))
+	if (ret > 0) {
+		if (size == ret)
+			return 0;
+
+		/*
+		 * In UVC the data is represented in little-endian by default.
+		 * Some devices return shorter control packages that expected
+		 * for GET_DEF/MAX/MIN if the return value can fit in less
+		 * bytes.
+		 * Zero all the bytes that the device have not written.
+		 */
+		memset(data + ret, 0, size - ret);
+		dev_warn(&dev->udev->dev,
+			 "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
+			 uvc_query_name(query), cs, unit, ret, size);
 		return 0;
+	}
 
 	if (ret != -EPIPE) {
 		dev_err(&dev->udev->dev,
 			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
 			uvc_query_name(query), cs, unit, ret, size);
-		return ret < 0 ? ret : -EPIPE;
+		return ret ? ret : -EPIPE;
 	}
 
 	/* Reuse data[0] to request the error code. */

-- 
2.47.0.rc0.187.ge670bccf7e-goog


