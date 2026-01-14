Return-Path: <linux-media+bounces-50680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B10D1E14E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11A3B3015455
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23E238E10D;
	Wed, 14 Jan 2026 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LQP2o/ay"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08038BDAF
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386746; cv=none; b=M1YDYCM/BGRQgmMqscAUWIGWcWOvJ4MCscprxVz6cnmpF7OaiWQ3pjWnCJl3xmWjWTHKFbihAKHByGZGcZSic7SWu7bT7EzyGMA+7+4Ciq9QkRhdbYzOnGYSjoirDUkNnm/knJ9vlRLs4pGb/mwLnVPjkWLd4es/tjyiUNjs+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386746; c=relaxed/simple;
	bh=SHynUnvM3NYGdVKJkmlJNrHMRItgetV0ce7T9jNI6UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+j3AmLAWHQWX5c0cxh9LFMriy8t4KNzCUhV1cJtbVMSRYqLcVlf0trdDdekAaL5YotAaZTRhvYOlYG06ToMZXJp3IKmKEZW0QliDIO8Gvv68LOQ7NlRHo/bmuMR+PHmJ+P5a8ZW9l3+0GcVtFvXWM9e8E9uId6xNgzOh5cim38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LQP2o/ay; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b76c092acso5721399e87.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768386740; x=1768991540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPZ/6SpG9mbhlb5la0esyshmoTDD8GRw30UpCzvHfqY=;
        b=LQP2o/ayzVvdTZnrF1PLLcEsgJ5YkGEKTl5QtlOZEnEnZIyaDn0hoHfzluOb3/NO/K
         pfMaDttTuggNk2TISfwrc2efKsEUVJi7tnRRKmrNp2oxKSoBHag2zKiCG5C7QukVwyna
         oLFH/v8BNWowM9syif0PFSnpiaKCd+n1u/pug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386740; x=1768991540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPZ/6SpG9mbhlb5la0esyshmoTDD8GRw30UpCzvHfqY=;
        b=ChBuJlNBoVJXQT37/AwNSza5oqrLRW/trklEZP0z/omtG6p7ih9ZvfFM6Q19INkNjs
         4LYLtWEryDz5njJBJCqz6x6qhY8VHblVVqxyUybvFtLO0kEzRDfVZME2RHuZ4jetPEWi
         9v5mEiZE4OMSYiGh6PepqBYszqqtTPvF/tSFxsBJVGNf5wu8Oe1efwyhEe/x/qdQpGMc
         6g5VoFUMmHDwEnPiPVrcDo5ci4yHD3UbvN0aOdFyzohPJ1ou6EVfhMbgZj6L15dGS4E0
         WVI1hkZnsIRtaBFJYN6J+w9NpoDvvfRAmBycu6lXQ2JXJR7AimwT/0hPgTX22BIeC/uJ
         4yAA==
X-Forwarded-Encrypted: i=1; AJvYcCXm0io9FCL2MrqVwa1qTVkMBR5sv+4kAwP9wVVR4kQF8virM7TZbYXd6Rwb9TZZ7w2i0qhpBHCN3OTzgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyRGgdgIp4/Lf4TAj6koe+0Qyms/XhFGanWuK0UKkDe3ELZ8MT
	2jnRmbEPlgSAyP0ov2GQb2dw6pySxqTMua1mu7KQCUWBMAhZLC893ASRTO7ZUV4+gg==
X-Gm-Gg: AY/fxX6MpIqpUSiyJkYkdFhk9HWRwVDSkcL+qHXNdYFv5f55qzwT7UKcF7sB8PSITJW
	sQzu/8s3l4QghvWn0KN89XL/pGkjOeAQ1wjIYCdUF4lPhWX1U2dXF7HuGNZTdMNdtsT0ox36ti6
	yIQeEcij6LxwiES4fmvqPORnclenhUn3vUYx/eVmQBEG/05MwaouUTMGUiqpZO+PNT3CQmmL3+l
	OwxkvwjGRF36KVw4XuLi2OO3tmaoxt3xaT3hrylJQkbGjY+QZcWD+tIOaIlVv145q4ymAk6twkz
	HqxvFMV5OWnYKwNoTcTFWxc4FAIF5xiYiCN+wR9Lat07exrCBxFEfAnUl6NB2xfSgaVII39nB+B
	BAEUj5qkD1VkmJfNugjqJekYlzUWMVlr16kHnLCqkl2zdL4dW2CoiAJfXJb4EAf9rqaEBwv7mYW
	5NFalspwG7eMj0hi1uXGwRFQQd5EuxXspuqq+DigZl4gHa1MzzDPxPpT9VptSZ7/H2oJ/akQ==
X-Received: by 2002:a05:6512:1286:b0:59b:7291:9cc2 with SMTP id 2adb3069b0e04-59ba174d8a6mr555446e87.37.1768386740374;
        Wed, 14 Jan 2026 02:32:20 -0800 (PST)
Received: from ribalda.c.googlers.com (181.105.228.35.bc.googleusercontent.com. [35.228.105.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba10411e5sm573981e87.61.2026.01.14.02.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:32:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Jan 2026 10:32:13 +0000
Subject: [PATCH 1/3] media: uvcvideo: Fix allocation for small frame sizes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-uvc-alloc-urb-v1-1-cedf3fb66711@chromium.org>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
In-Reply-To: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: Laurent Pinchart <laurent.pinchart@skynet.be>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Itay Chamiel <itay.chamiel@q.ai>
X-Mailer: b4 0.14.2

If a frame has size of less or equal than one packet size
uvc_alloc_urb_buffers() is unable to allocate memory for it due to a
off-by-one error.

Fix the off-by-one-error and now that we are at it, make sure that
stream->urb_size has always a valid value when we return from the
function, even when an error happens.

Fixes: efdc8a9585ce ("V4L/DVB (10295): uvcvideo: Retry URB buffers allocation when the system is low on memory.")
Reported-by: Itay Chamiel <itay.chamiel@q.ai>
Closes: https://lore.kernel.org/linux-media/CANiDSCsSoZf2LsCCoWAUbCg6tJT-ypXR1B85aa6rAdMVYr2iBQ@mail.gmail.com/T/#t
Co-developed-by: Itay Chamiel <itay.chamiel@q.ai>
Signed-off-by: Itay Chamiel <itay.chamiel@q.ai>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2094e059d7d39ac5a196cbbd58f9bc997f1c1557..ec76595f3c4be0f49b798ec663d6855d78ab21c4 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1812,7 +1812,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 		npackets = UVC_MAX_PACKETS;
 
 	/* Retry allocations until one succeed. */
-	for (; npackets > 1; npackets /= 2) {
+	for (; npackets > 0; npackets /= 2) {
 		stream->urb_size = psize * npackets;
 
 		for (i = 0; i < UVC_URBS; ++i) {
@@ -1837,6 +1837,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 	uvc_dbg(stream->dev, VIDEO,
 		"Failed to allocate URB buffers (%u bytes per packet)\n",
 		psize);
+	stream->urb_size = 0;
 	return 0;
 }
 

-- 
2.52.0.457.g6b5491de43-goog


