Return-Path: <linux-media+bounces-50679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA39D1E1A1
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 732353028598
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEA938B988;
	Wed, 14 Jan 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RinrFQgW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D3038B7C3
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386743; cv=none; b=N/E4hFpDE1NQQjR5ihLoQA7w4IZuof1V4A4GbSvg0Y9sc13VAMy8BaqQlQi2yvAjoTu01MRDFp0s+Vdv9bYe0cKXMYrTqrvmGqYCkg/dSwWfevj9osTVrASddi/oKrJk92CLbiMc1TAWg0ogXHi/dIe7e0+XaSSSMaD/2xpO1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386743; c=relaxed/simple;
	bh=W+H7LaUItn+O8h7nltWmZw4U51/nO+X1Uik2s44Bl/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M/nsaUezk1VV8kvWnDARW8/+MXNxfzT6N1yLBjPmKiD6YMniCfixdugY8KTVUwUsDK5WGdLn/WOhZg5enNuwNOTVREsAaN0iKIk8OBrB4/G3haUxNmvTb1DsCr66f/9lizJD9MT/sKG7QU4v0BXYmvr9T1dsMVfDTbFQenNk8IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RinrFQgW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso689004e87.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768386736; x=1768991536; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0V3SJPMaPQlOjzTXbwuEiynKNowzifQW9CArs1owkpI=;
        b=RinrFQgWizioj56gxwbEKmq8fmq75MyZcWuORyJZaY3uH5l820pD0TZSv5Ss1wyH3K
         4h7XmjoQY5j8fIfvO5g91bgynSIMpUJKplQ2YLwdf90EkLKP25Jsw/4HGBSdmS4+qj72
         SOgUXtbcAK8XQKsg5mVNBtD1VwEGu42BPMj0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386736; x=1768991536;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V3SJPMaPQlOjzTXbwuEiynKNowzifQW9CArs1owkpI=;
        b=dJ/c1/lPu33DmaZ4DQ1KrGPYYAobHoJvM+XcbHpZ5090GH4O0B0O+ZBXSDKs8klhI1
         p9cp1ljLQbFBeGh38JMToUix1gov4ZMfEtijsjWf3KNTiz0zaDk22mix42MN5ZY25u4Z
         BKKerDO7v3v76wRgeAZraUNWQSHKCBRTdLbeDb3wiZFwjIbtQ6JbW72zQAdzVMJRh0sH
         pliS4+qzsxixBaEFimIiweWcYm6311L4kl89SrqSVuqmGFMVYwtsxyrx4+YU+n1C/OQ0
         wKskuje2xF2klaRwtXSM+o89mWeW5YoF0dRC7AYTw2b1JOQmbMVkFGYEOCB6m/N/n7M9
         rx2w==
X-Forwarded-Encrypted: i=1; AJvYcCWzOAY/mZNz0uF1bFJFQr5kVjpj1diVJzVSAdy/OQdDI/7CPpJQFSjq+yj0ksWK6eEImb2SNs3hlY6rQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0fyhV7tmSwE6oJwNd4mabVJuksi7eSVUsx8Rbfc0CehdC6zC
	5/NVnClUf0k9Viww+8HgtybeyrW/kiqmyjKgW6ccni4+hIe8fcvzKxlGbLmyz0nDYQ==
X-Gm-Gg: AY/fxX76BM/akC7ozTmb6yObemv8iJT4YTmSDkHXKBjQwhraDEoTpiBxaSxacCCHqEY
	+4KGxG4P2JBowq+kXltwY4c3PYTMz3TIxscggf+8v48le7UgezovE0wgsEe2im8YgFwx+LY3A9u
	Yw7ybxRm0xOLNZLz9/hH/iR16YRhF1lA69zwJtNuOwDTIhtwYvvzrhTJe78vIMwbBFbbMoCXoTk
	HNdmvFJ4HybLGQa/ZiSjgx0SikuHTvldSB6vO60iRY2hSEYaDCGSYGPIY/tKQdfDPtd8gWES1xo
	cgma6InRoETtQERdWNcHFhqJFu+6E+rLkPYGob9T8Oz72IatjrasFnRWluK708l3QE+VZ3GmG7V
	m1hcjRyHG6MNTzHsV2PmgFBAaSDYNzg/XA5RD6x4D6vQqVlSCn4xn//Ebu92lZ0hVZTm+VpxeTm
	z/5ot7Irtn0tgyP4WiF9pxJaB3cSmz4PSUqt+NsyrP/AnPWwY+ujQIk5RBpZfiHDWYwVrA4Q==
X-Received: by 2002:a05:6512:402a:b0:59b:834d:fddf with SMTP id 2adb3069b0e04-59ba0e949b4mr739713e87.11.1768386735583;
        Wed, 14 Jan 2026 02:32:15 -0800 (PST)
Received: from ribalda.c.googlers.com (181.105.228.35.bc.googleusercontent.com. [35.228.105.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba10411e5sm573981e87.61.2026.01.14.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:32:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Fix allocation for small frame sizes
Date: Wed, 14 Jan 2026 10:32:12 +0000
Message-Id: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKxwZ2kC/x3MQQqAIBBA0avIrBtwJAy6SrQwnWpAKhQliO6et
 HyL/x/InIQzjOqBxFWynEcDdQr87o6NUUIzGG2sJuqxVI8uxtNjSQsGctpbGkhbB625Eq9y/79
 pft8Pt1GqpF8AAAA=
X-Change-ID: 20260114-uvc-alloc-urb-d1a0c617106a
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: Laurent Pinchart <laurent.pinchart@skynet.be>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Itay Chamiel <itay.chamiel@q.ai>
X-Mailer: b4 0.14.2

This set fixes a bug in uvc_alloc_urb_buffers() and two more style
patches.

The first patch was Reported by Itay, who asked if I could prepare and
send the patch on his behalf.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Fix allocation for small frame sizes
      media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer
      media: uvcvideo: use min() for npacket calculation

 drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
---
base-commit: 17526c7e69d07395e9d39794aacba42dcb02ff49
change-id: 20260114-uvc-alloc-urb-d1a0c617106a

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


