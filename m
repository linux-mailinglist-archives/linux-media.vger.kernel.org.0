Return-Path: <linux-media+bounces-25731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32AA2B29D
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 20:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4D416B0F2
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D3A1D7E30;
	Thu,  6 Feb 2025 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SvwUzSVi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1541CD1E4
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871230; cv=none; b=ocrqYQzn4la6WPEZZbzxrv/tvhKD41lu7huMwSdfwwXokTeovgZwS2I6r1Bnrsgg+igHahSoSipD/MpWMtqfyttWj9DgeTVhKsEgD7dlTkInbo640By0UYC6VM0L6y9w8TbN/ooZe/PrOBJ0wQiZIY/f34bzunoblmpLZJ0UOXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871230; c=relaxed/simple;
	bh=b6os191LBubYA+XTSlaDJR6i3p2+873ZDu4lZh/isJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZp56hbaGrNgT664Lc+IDs+tcL7ACZJPb/8xMgWl6QE+izC9hSkTHVPqRPg3asuBUpcn3Nov19FU8ll4KK1rF8pbOnG0Jdg8GCC5bZp8uzwW45kyIcn69yKwM6YLRbLUs3sg/Y1KB2JlU2/RX05Ahse+5I6hjtaa5F91orRaWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SvwUzSVi; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so10402166d6.1
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 11:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871227; x=1739476027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IX4faMlfOGXjEO5q+yF1g5VR45MAApZ98krsq1hjZdk=;
        b=SvwUzSVi9OOrFD8ASezwtJxWcRkkTjeSfQeqJNJdLUjGTuNpVAN6qGB2jbV8Dna0Ce
         hpS0ZYnFmVzVbObgPfIikr/T5Ljk/YcW3gZG/j8IHGMIW0gmrYgh7Rm6pyP+Tzp5HEvv
         LOVypmADi/oqYuF8AOzPewxHbgKeuEDEw+21k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871227; x=1739476027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX4faMlfOGXjEO5q+yF1g5VR45MAApZ98krsq1hjZdk=;
        b=LSdoZCUIUc/1PgZKGxBDWOnuIcBFJwIwXG5HVlqnsy2W8rlM8vU57rYpfuVfFh52WP
         Cu83Cv6cfB1Lea9FAS3keIzw3/EP0c3nuuGJg0L1q30PMm2Y1nqAz94oso5cQDABXgub
         KAyFRNACtofcTyMu5MUFIxSstqWWu2TdSVltZPSQPjQyAMM9X09+Wet4KB48eAIfvaJG
         IvYIEhnQLOb7TMQYRFZ+gKrrVXq+W07MA2kWby18tx/SWNKKD1IaV7nrIUdvSNWeNsi1
         fe9txn4POqcGJqiVN/J2KtyHQwLT/H0guok/dPUGuna3pSt1yQKRLAcztRxDdj/BeeQp
         bURQ==
X-Gm-Message-State: AOJu0YwaVPcZJB9HsqLcCNTNQ6rEY7Yo1p1+Jpy826fUV14OYL6N6jVL
	MP0jkGEdJZ2qHmWMtyCXyzS8gGHW3pQzZ1iKCptuG/tB5wQs5wjOjyCGgMKHVw==
X-Gm-Gg: ASbGncs2SU51VreS6quhRdJ3KygMxeMsjjFqbJNzZu1joSqkg/XiiYzftaSI/hGv7Bg
	dfr7v4OLLKwffPfutcWaYVBxQcaYi3q3ng+DJowMtST6Xl/SojN5kr7rZLNHYbcaYsWDQ3fE3Xo
	BhMcB40Cezw4P6cDtQwVoQUYW17GV9sguPoHAZfuRE90ZMnqzQPoibNZPCqySP74esu53n5qALo
	9J+1P184AlfzqKIBvcdF5COuDzABv7R5l0gDCvWla4djsUI6dgzGUBbgLo8Gu6onqD49YIJpPTF
	CXsw+ygISSDWu1VBSRlSn43mtvDpp0LO/JyGqUw5TyF4uRCAuMEhX9hvSH86S8hcAQ==
X-Google-Smtp-Source: AGHT+IGy2/g0qdhkiz8O8OjgTmImN4zombJKSC4UxkJ6rl2bvNoupS5Zcrv6gbGUmsK4Jw1vqNhKhg==
X-Received: by 2002:a05:6214:2423:b0:6e2:481b:7cd9 with SMTP id 6a1803df08f44-6e44569bdb9mr4703916d6.25.1738871226492;
        Thu, 06 Feb 2025 11:47:06 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:04 +0000
Subject: [PATCH v3 5/6] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-5-32d0d7b0c5d8@chromium.org>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
In-Reply-To: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
It will not work unless the camera is streaming. We consider that this
the most common (if not the only) usecase and therefore we do not consider
it a regression.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 63d1d06d3ff6..7fddea100ace 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -631,7 +631,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -641,12 +640,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_status_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -680,7 +673,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_status_put(stream->dev);
 	return 0;
 }
 

-- 
2.48.1.502.g6dc24dfdaf-goog


