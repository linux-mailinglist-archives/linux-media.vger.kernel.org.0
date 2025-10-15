Return-Path: <linux-media+bounces-44570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3889FBDE492
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E548F4230E9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BB43218A3;
	Wed, 15 Oct 2025 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2kd3iyc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0B320CDA
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528209; cv=none; b=maVae7pCwdD8VVU/TVUglfHng6fJnrezoYn7SFW7NCMauS+YxKemKd+0JVCo5/uhHfiEr0jAjKOn5W9ZP/J5qWTLy5RZUI45CZ1Z4p3jJZfiTSqGQIIkxBfsVLyqSsa4O16tJDiZuoVvCo9rUzTBfwql8tyu9uZ0z/HapHseyBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528209; c=relaxed/simple;
	bh=7PJk3qgEheGDAcZBLr842eZ4flaL7Aa2z8+o+HCwQvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j2dqJ/KeWKmy1x4LEKwlLIb/V3r3RjYmtLs7qcEasAX6MsKYQOEIsgVzxMeR/PbSDnc5nSei+KRYNpflBzze0prIIsgN6zxYQTm/nVuc0wlwB7PNdo98qCnFg1I6bt4PlHqQDs1xBrU9mEMKciKkeCd/3s5qHaNd9TZNFnRSYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2kd3iyc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso12713885a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760528206; x=1761133006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh700VwdwPN4K+gi98dGBUeQEE6YuZ3VBhMh8LN0aQ0=;
        b=U2kd3iyc2eDwKvlR+FaLOZZ3ZMyQW2qDa4fNK+wayC4mhSA8H4WBTIDGyO/lyjdNCO
         8XlMYtKXaA5VtDN+AI47RtP+bdveRTXRDsXqw2VP+nrl/0NqntXg4892CJYmjEdjI+u3
         NbNUNvjL/cVHjJEo2/Gz/PkS606+XKCu7fTfU3ViLVguWAYDl9kUQdlGdKZYS9LehAde
         XIlNFMcMz4V9iG7Zf7QtmMd3lMsgkOYZncSBZJBw7vwTHCjO+TnEbb2efQnTior9+JT9
         jxH79iS+OHCouSW4/m3S1suQ1chXGcNeIfHSw4MNfWS5LVGZor2ANzJ0LOE3I6Zgsxs4
         mpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760528206; x=1761133006;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh700VwdwPN4K+gi98dGBUeQEE6YuZ3VBhMh8LN0aQ0=;
        b=ZYPJu8NgeRdQlKwPE/EyxIKh4E/QxkyULxXuUQlsMf6GJxg6m7nyixJC0WJhQPLIvI
         8h0pcQVpg0FIeiTbtp7HTwqREEpSkvVHPnUq9pH1BHS/etDFMWnlo7QdUPlS5DK54zgY
         RrOkiNw/BqV2Jfb/t5gH5dMKa2FXzFiVlOtz2y5di8/VuJKDICQffo3PLGDeIB2klDgX
         Wzhs1MS4ar0m1s1WPZj4iq+fZ8hp+rIKwsRk+VmbA1n4h/lNCg+NUnADlZ9mZ/MY0GVa
         mIO4wT/zd7YFmffZdw4+JcWUIZdy4AQt7xkHdtaJHTQJppmHDtEKlhajX6cLEdRbCp5f
         gdpA==
X-Forwarded-Encrypted: i=1; AJvYcCXu4kwYBhyI53TtvG0BOtmIN3ps2VR/3z8ef4aGIdSpvdWDIGHrOvApnvNxS0rtCIHHdWqYCaR/Y2qFIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/d5fCL8y986VD7xtRL0hwluq5Ghzm1WIujePiCkW1nKDleLb
	xvhdOgqZ0xtGCUSOHhgmo8BKjUVBhuAjn6N9miU0l2IFHYcgAeL10uU+
X-Gm-Gg: ASbGnctL2ybsDSjpnYjUQCEcRjq+qDSwdwmHIYuMBy9x0hxi2cXosckfMdZuYn+l4VE
	w0xxe0KXAzStH08TTGCKjakyNFeAaHx3ZTWEq38oT0XVmiP+IDcyt/9pTZiJLOHGF4eRz7LWKi+
	sKP7a/SYrj/EUohHXDkr4b2NgiFAlKJDxiayaD2xoXeswGdM8ZYi6LE39lLkkFglp/y07C4D5Q8
	2HMb75gHbFWHCFN3XsrvzqbzhcgGWdBqW/VvRs1sDTMaHG9HZ6WDQCGgJied+cZXmS6UBD6qBLs
	pySyVFuYOAiE/hf+nQkiBIQSHXYJKEJHFkDPcPNnTJ4BkGOxAx8t5LQAiayK/BH/ANSdVdSTURy
	phd4c4iPWl27pJ3uS5F/4+swpAquFgfjY+8zysU8ralhnMhbNFXWk3Pg8ZSiFEhAsvvSD
X-Google-Smtp-Source: AGHT+IFHt8uRAhWI+Au2Y460jm83uLYaE/5mx0j78JmcnSSI8oN8k2YJhrw+OlLiYTtYhg8/Z8Y8SQ==
X-Received: by 2002:a17:907:1c97:b0:b3d:9c3c:9ab6 with SMTP id a640c23a62f3a-b50aae92af7mr3341572766b.29.1760528205738;
        Wed, 15 Oct 2025 04:36:45 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba171929sm205081766b.33.2025.10.15.04.36.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 15 Oct 2025 04:36:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 13:36:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda
 <ribalda@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Return queued buffers on start_streaming()
 failure
Message-ID: <20251015133642.3dede646.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Return buffers if streaming fails to start due to uvc_pm_get() error.

This bug may be responsible for a warning I got running

    while :; do yavta -c3 /dev/video0; done

on an xHCI controller which failed under this workload.
I had no luck reproducing this warning again to confirm.

xhci_hcd 0000:09:00.0: HC died; cleaning up
usb 13-2: USB disconnect, device number 2
WARNING: CPU: 2 PID: 29386 at drivers/media/common/videobuf2/videobuf2-core.c:1803 vb2_start_streaming+0xac/0x120

Fixes: 7dd56c47784a ("media: uvcvideo: Remove stream->is_streaming field")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 790184c9843d..f49c538618bc 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -177,7 +177,7 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 
 	ret = uvc_pm_get(stream->dev);
 	if (ret)
-		return ret;
+		goto return_buffers;
 
 	queue->buf_used = 0;
 
@@ -187,6 +187,7 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 
 	uvc_pm_put(stream->dev);
 
+return_buffers:
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
 
 	return ret;
-- 
2.48.1

