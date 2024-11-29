Return-Path: <linux-media+bounces-22364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C69DEC61
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 20:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF2CFB216AB
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B0E1A9B41;
	Fri, 29 Nov 2024 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jMOK2cgK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93B1A4E77
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908316; cv=none; b=E/qo03+NrKqKPs74U/0WeopwEHeLONISUeXtEZpPsPg+A5iHPbEbKrQHtHx2RfszIwnFGPqTbO7ftzbSdNQlr7AbevrV3Om2/uOWRjNxheeeO+kO7zlDKSu+xlsai1ygbeI1Wp6256EDiJzYJM6TAzyGfUR/rTqgeg+7Yqc2E+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908316; c=relaxed/simple;
	bh=XUx4menmu/stFBE7lkIhaln7CdzGv+6pSaMM952p6qE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7PcU6uhH5+PrOui7iG8TfpK7liIx0GjEoGSw07y7aVzvm0TkTykb9GgpbE0n7E1IedfFkJ80AiUY6cN5EvlXNQKxpSxLRqlJ3gG4bFcM8xqVE6xIq3TiXHpAK/ETSmUexYVf4+BQgEHtRD0CPE6unnBo9DPPnX+8xMzyH/Z02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jMOK2cgK; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d889a1f7a6so3923416d6.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732908314; x=1733513114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nl7Ezol8cCw5t0X68ApdPTyYZfINMaJDWIUvhxei38=;
        b=jMOK2cgK1OgEAg333gdphos+z+XIFir0okfHis0x8hV6M/xeXxy/ThdYgq2XESgGjz
         gFNjEkjNV2jvyLMCGixePiIQQ1eLdZsYsYHh9gzjJ8ETm0r36khHnAgKTtLETs9qthJ7
         fN2gk6rbGkjy3BNTg/3GeKsflsCUbhq7D6/iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732908314; x=1733513114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nl7Ezol8cCw5t0X68ApdPTyYZfINMaJDWIUvhxei38=;
        b=vKvvJlmYcmS1/OP7bqkV0thRsSLbZPLaRynqpC6SwkNTLSTSkjU+vEJkN/fPQq+Oda
         qT758C+eyJfn8ylCudrShOijVS+e1sFQq8I/UWD6Yn4xnwRpJPh1ppLHJo5ijjavWbd0
         vYKFk4c9NaMRC5CX2HDexGIKb+bifQccxi6KNQBCu6XC+fqJFCpicqcqZbhzmdp7vsjj
         k34tdNCZDRP66IViA6VfaGavudpdeTfaI8R8bU1+VO2E9vaqzqgMXAaZu+17E7nNfvwT
         eTdGdJxITousBRl/hKklf1TnJVyC2R11uTjMvPGKdfmTYAS0QfE+8Ei/9fKc5paKUF9h
         Z0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXMDAHKC9M3u9Nh29MGs+sU4DTlgP0R3nSt/fDQXKtzE6SmRuuGg5+o/FVhKY4euDGHMygRHbZoJxBd6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/61bqdAyAgE8dh/dwtYdchbtco/rJICuSw4+0QsPB3XY9ml6
	4I6d4qOrJKgwTHOjkrd7Q0t91MPE48xGcMI5vuLGh4a9MQhAoQKQa/P/93BGpw==
X-Gm-Gg: ASbGncvkfEcYQdcbKSCMJr9KWPo6GO1M6R6kVkayM3gY0S7L75ZwuSzDKG0X3iPTa/v
	tHx3HFlGEZf8xlhzh8B9dvL1oLcVqIj4CDTVljhR3BRpVNCTro8F7FbFTR99wx2dRmBE5gf97xS
	4gJxOAbCiGkVlaCA2Sv+apwOefDBADzPM7FTFcSPKLsZFMpdj47Sq3lUF1jRnh7iiQplJ8EXYzW
	t8Gcaya0ja0ROh8w8gOn/RUyVvDiV4SxYHzf8eFPprRSkMEhnRT5KCCTrqQdC65X78xtFygjDJe
	ijzRYh7DPs5DKr9j4ezOtguE
X-Google-Smtp-Source: AGHT+IHjqJRktZLhz6NaZh+WfbURnZUbAXxMRHeD7FdgtGCNkYRC+4y7nJMCRQlFRwuCpsM1e0G4OQ==
X-Received: by 2002:a0c:b542:0:b0:6d8:81cd:a0ce with SMTP id 6a1803df08f44-6d881cda2damr54003696d6.43.1732908313864;
        Fri, 29 Nov 2024 11:25:13 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d87d899ec2sm14462146d6.50.2024.11.29.11.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 11:25:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:25:05 +0000
Subject: [PATCH v3 4/4] media: uvcvideo: Remove redundant NULL assignment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v3-4-ab675ce66db7@chromium.org>
References: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

ctrl->handle will only be different than NULL for controls that have
mappings. This is because that assignment is only done inside
uvc_ctrl_set() for mapped controls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 1b58e558604b..2d984060654c 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1657,10 +1657,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
 	struct uvc_device *dev = chain->dev;
 	struct uvc_ctrl_work *w = &dev->async_ctrl;
 
-	if (list_empty(&ctrl->info.mappings)) {
-		ctrl->handle = NULL;
+	if (list_empty(&ctrl->info.mappings))
 		return false;
-	}
 
 	w->data = data;
 	w->urb = urb;

-- 
2.47.0.338.g60cca15819-goog


