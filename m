Return-Path: <linux-media+bounces-23730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC9F9F6FA0
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750521881D29
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFC71FE462;
	Wed, 18 Dec 2024 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oS/MOZa5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2C1FDE2C
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557970; cv=none; b=WzmGaqS69QT0nWWSBK2XUIJM8Ujit7+b9XE+G/vhKZu88PDuoc18gzgDBS5sSSWoeCe2AZQbkVPEEzqVd/ss3guWw+Am1MdnGNagsxX1b8G6dnAjSfAbT7Pju4CMfCn+ANc9Vo1P7Sb7/IglhwLpeyurO25+5t7z07gppAKcZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557970; c=relaxed/simple;
	bh=qyRuVIeUYyOK0Q3PlRcwjQXuqSyYOCeaRPkUH3obUhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGIiMgER+tUVT9fUQDE+OWZ3lEG5e7nG6BOVK7MbjkGW5u4xBb3XgSgtszCDfWjWPPDdF7bOui1XaoFEsKlgxOpZUMGACUIXp4I16NPh8jZWuSSefKSe2djc9uQeezkCHWNarvIoF9sWeDzXCKcGc1ySMH9nMnMnxn4vopp1GHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oS/MOZa5; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46772a0f85bso395371cf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557967; x=1735162767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xf/EiHgc9x+QegkQdQE1ivkIRei7ICvkT+RDLhyzgnI=;
        b=oS/MOZa5afkdSu7++ElAHkZX5yAWwbJnFC7zQPogl97LjcmlMYLcdHsRR5Y39oJ3rr
         zzgRoFjaAYSlxEFx3zoYpe6AyCksEIC3pqtXqffoC943/cZGukA9K/3ifcQQyAgt09IV
         XLE5Ki+TF16YFp/YNXnC4sKTPCRdTfhnxzY4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557967; x=1735162767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf/EiHgc9x+QegkQdQE1ivkIRei7ICvkT+RDLhyzgnI=;
        b=FXwJBn4TsaYmKf1PBLM7UkDjiAC8h+594L+8QdWqa0vvy6bBr+m1hI2X0qPf7iYKdo
         qymBDyBpjCQkPYonKziNZbBUxv5ft+U8DeIKN+D11Z9oPsZ1RN2HlUYkVWIpgf4Ja1Vr
         hhHG1lc547AkjY21MW/YTDHxDUZQ4RmsRaqmuc06xq7Hl8QAl/c+S+5xEp+OnmpcqF/d
         597ETZ+q1KNjfSnKrZezWl8RrWyhfsTwTmLD47wGt+nFRhT0PG2Ch4mMmmOHaedB4lgC
         kU1es9VBJv7e+Ua/Qs7y9aRqm93iasEOP+0JDpL7ZubCwH2RH+18CMOKNDay0C/dAtUY
         BZFA==
X-Gm-Message-State: AOJu0YwgXvXdh6De44tjCVxjWFk/WbnhjzONw+P+ZTJ5QZObLmC23zJ7
	JYbqmKp0wXQCPLbQyeV9D/TDfdY7gyGih9TgHbnoR6LXlWLipRRJCGQ96wCJJjXRXMwx/wO6h3I
	=
X-Gm-Gg: ASbGncsnc34Oh//TUaoDA6EAgupz8YTcPmWe6jDT/cn2FWTxYqt4uKeTzOEt7A1Kwws
	Mg0s0T9nbiv7bY47udUflbHEKyz8qI90ibbY+PT44dMnsqiUJMzihbnPJtaspKGORPgBcxwhiI7
	aj1WJKbYKY0oYZb5/QQ2xr6hdv+A5ovDSOhp5pEmlJGvSKfR/7/KI6gmbYMVrMSuEkhjXS77AnQ
	6ZzRPxM5djGDdeDEo35MB/PysWrJauE+g5+dmivxHxUjFfAyhVZruD17rbJEb7ZdJ2iXU4sDY/a
	tz8LUiOxCroRVRNWJ0xbSpDVVlWv5xo=
X-Google-Smtp-Source: AGHT+IGkLS9CMqZYLYYP5mdA8pjf23N/QyaWNYPecd0D7EIeWJo2+DJRQufGdZrMAa+2pzD2K1+kHg==
X-Received: by 2002:ac8:5782:0:b0:467:5ea8:83df with SMTP id d75a77b69052e-46908e03aeamr61025111cf.30.1734557967098;
        Wed, 18 Dec 2024 13:39:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6e312sm55176651cf.8.2024.12.18.13.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:39:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 21:39:08 +0000
Subject: [PATCH v2 1/4] media: uvcvideo: Propagate buf->error to userspace
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-uvc-deprecate-v2-1-ab814139e983@chromium.org>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
In-Reply-To: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now we return VB2_BUF_STATE_DONE for valid and invalid frames. Propagate
the correct value, so the user can know if the frame is valid or not via
struct v4l2_buffer->flags.

Reported-by: Hans de Goede <hdegoede@redhat.com>
Closes: https://lore.kernel.org/linux-media/84b0f212-cd88-46bb-8e6f-b94ec3eccba6@redhat.com
Fixes: 6998b6fb4b1c ("[media] uvcvideo: Use videobuf2-vmalloc")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 26ee85657fc8..f8464f0aae1b 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -479,7 +479,8 @@ static void uvc_queue_buffer_complete(struct kref *ref)
 
 	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
 	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
-	vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
+	vb2_buffer_done(&buf->buf.vb2_buf, buf->error ? VB2_BUF_STATE_ERROR :
+							VB2_BUF_STATE_DONE);
 }
 
 /*

-- 
2.47.1.613.gc27f4b7a9f-goog


