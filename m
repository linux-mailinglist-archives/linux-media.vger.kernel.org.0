Return-Path: <linux-media+bounces-45121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66534BF5CFC
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 143B4425D58
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDAD32D431;
	Tue, 21 Oct 2025 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ewrOJUn6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9622D8DA8
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042983; cv=none; b=mzBrTTKd8r+k66FpFqpP/IR5KOHFaRs7/mzxOSEFikfJfEI0V6M02el4ydwFz2Et5xjE6k3k25jvzSyVAoJz+Mmyfjaw3KusOcMccC8sCZKde070KVeItQfIjP6cLlTCjmtEagpLhtRwRkNV0lWZ3y5BluZg0DFWyQAjuNdTpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042983; c=relaxed/simple;
	bh=mu/cr0ccCQhZG4HUcvVpPbQl30IkLO8o/gI0SvZrpZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qr/R/TeSWd+v+lDXSXFcurrzPtE3AaqsetMCGvWWwuR1AcK6Z5Dh/u0iwEmxZF8woNFYOGFLGzf8JiJ/E2bKHx72ubnJsGRVIE40/0i7StEPE1C/X+xFC/HHCMqa6Q4EYZJvKTDtDVZZd1aGzsmg7OCwmkLeKO0Xjblwhg3qpeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ewrOJUn6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57a960fe78fso7049689e87.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761042979; x=1761647779; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TafpqYvz7n63SFC71twwiYhEsv21pktmNXXlISP5Ho=;
        b=ewrOJUn6MwR5+0lFAAMHA8o9z9Liz6JolyrjOxVFtAf9V8SKaldjSf16KsNjDHYM0Z
         rIkxT9nW5lFYjylWHgyObBOQUGonvviQa+Ft2Hmkjd7/nrY+p3lpZF9SI0x4BYySS+FY
         pTY+wnD5muAqx+MTYMKqtKMg+cWenyiMw61j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761042979; x=1761647779;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TafpqYvz7n63SFC71twwiYhEsv21pktmNXXlISP5Ho=;
        b=f6A3m6G8QzHJXTz2EIgcbYzdyJjb5t7qJLBjri6C2Ys9LJfjFqcHOYrJC5Yl5n+LGT
         vaS+dtMGa6ByPu4NkRyoGKmFOTiNdt0P+uwlGc4Wlmg8GMUgGrVEsF0Dr9ysV/yWcy5M
         Tam6K/utP97khoD1zPdHbSA+AHhTTbrPShN4LrqB0qXiCLDTlPeR7yHwc0+KHiy8dcW7
         5aEAiiLJe+7IjpWWbXXcgB/37G/ZKHztGfK9ITiJK18VovwQ0Y4OMu43znp+sijZKrzT
         zDRSj+LtJYsIE4GkBzRzp3BwbMv1A3Q4ii7e0eDLE+JE24ko1YLT17MUFKFZVAr6ZrWb
         8g4A==
X-Gm-Message-State: AOJu0YyR1Ee+UIb3jSmpYx2AW82Q/c1LbIOl3npJzWcn82MUQTj+a9sK
	c9cn29KC30i7FwyP13r1dbJJTu3b91RZw5ibAYDcyMblLb4cQlT2BGnnb/rzcDNTIA==
X-Gm-Gg: ASbGncszrqYzaws0rPFETJYt1Ouo7waosomXSErO811frZuOYPyDU8LyWavGUDKxRN2
	H0O3Xs9s0J2VvX3kZ9z11bYwR8f3nyxKWrc8H/729i8wSMTL85NcLjMIr2V+9DwDh7vFDRnKXbJ
	UcQyCB+RErJVzGxvynVsdJLjTdIjNdz+RPH0nPDQm5Xp0iXgBaqAFZgNDhJ0Uf8iJ2X+GeyTGpY
	AMh4eB76Bu+n2Q+DveA4hHUpkXxgU25wdrXSK2udaEe02gYnXhPjXs0g9b9tjVFvSP/zOvxbk3h
	exrGPH02Dy+MNYzlHlYtUtVPe4QBa64HX1B9IdGfGxcIO4zvRnFcxWcQvCZ1QYONT8nCTrRTif0
	sJEkI0gQAgQfhchljkl6f1dWoJ9Z7qMz9P+4/SqFN2lmRUKO20/XkLAjqk9kPx7ph2m8d5tMWqw
	q1W7VUlWJ8lY89DGuwj+4ThTEwk2S/Dv/1mnQfi6sGA6Fq+LWV6glkFTYVnLuDkEKnhg==
X-Google-Smtp-Source: AGHT+IFY8+5yWsF2/+yXKzUgKDznuSxR53YAociIJKjxctfTBbridZE9yYWajB+gH0DDhnuJ0uI+6g==
X-Received: by 2002:a05:651c:b2c:b0:36f:77e6:d25a with SMTP id 38308e7fff4ca-37797a8fa40mr51550211fa.43.1761042978949;
        Tue, 21 Oct 2025 03:36:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950635csm27946251fa.30.2025.10.21.03.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:36:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Oct 2025 10:36:17 +0000
Subject: [PATCH v2] media: uvcvideo: Use heuristic to find stream entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org>
X-B4-Tracking: v=1; b=H4sIACBi92gC/3WNQQ6CMBBFr0JmbU1nDNq48h6ERS0DzAJqptBoC
 He3snf5XvLf3yCxCie4VxsoZ0kS5wJ0qiCMfh7YSFcYyFKNltCsOZhB/dylRdlPxtYcekvO9Ve
 Csnop9/I+ik1beJS0RP0cBxl/9n8ro0HjLPKls+5JN3yEUeMk63SOOkC77/sXXAG6MrEAAAA=
X-Change-ID: 20251021-uvc-grandstream-05ecf0288f62
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
 Angel4005 <ooara1337@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Some devices, like the Grandstream GUV3100 webcam, have an invalid UVC
descriptor where multiple entities share the same ID, this is invalid
and makes it impossible to make a proper entity tree without heuristics.

We have recently introduced a change in the way that we handle invalid
entities that has caused a regression on broken devices.

Implement a new heuristic to handle these devices properly.

Reported-by: Angel4005 <ooara1337@gmail.com>
Closes: https://lore.kernel.org/linux-media/CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com/
Fixes: 0e2ee70291e6 ("media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
I have managed to get my hands into a Grandstream GUV3100 and
implemented a new heuristics. (Thanks Yunke and Hidenori!).

With this heuristics we can use this camera again (see the /dev/video0
in the topology).

I have tested this change in a 6.6 kernel. Because the notebook that I
used for testing has some issues running master. But for the purpose of
this change this test should work.

~ # media-ctl --print-topology
Media controller API version 6.6.99

Media device information
------------------------
driver          uvcvideo
model           GRANDSTREAM GUV3100: GRANDSTREA
serial
bus info        usb-0000:00:14.0-9
hw revision     0x409
driver version  6.6.99

Device topology
- entity 1: GRANDSTREAM GUV3100: GRANDSTREA (1 pad, 1 link)
            type Node subtype V4L flags 1
            device node name /dev/video0
        pad0: SINK
                <- "Extension 3":1 [ENABLED,IMMUTABLE]

- entity 4: GRANDSTREAM GUV3100: GRANDSTREA (0 pad, 0 link)
            type Node subtype V4L flags 0
            device node name /dev/video1

- entity 8: Extension 3 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
        pad0: SINK
                <- "Processing 2":1 [ENABLED,IMMUTABLE]
        pad1: SOURCE
                -> "GRANDSTREAM GUV3100: GRANDSTREA":0 [ENABLED,IMMUTABLE]

- entity 11: Processing 2 (2 pads, 3 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
        pad0: SINK
                <- "Camera 1":0 [ENABLED,IMMUTABLE]
        pad1: SOURCE
                -> "Extension 3":0 [ENABLED,IMMUTABLE]
                -> "Extension 4":0 [ENABLED,IMMUTABLE]

- entity 14: Extension 4 (2 pads, 1 link, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
        pad0: SINK
                <- "Processing 2":1 [ENABLED,IMMUTABLE]
        pad1: SOURCE

- entity 17: Camera 1 (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
        pad0: SOURCE
                -> "Processing 2":0 [ENABLED,IMMUTABLE]
---
Changes in v2:
- Fix : invalid reference to the index variable of the iterator.
- Link to v1: https://lore.kernel.org/r/20251021-uvc-grandstream-v1-1-801e3d08b271@chromium.org
---
 drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..ee4f54d6834962414979a046afc59c5036455124 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -167,13 +167,26 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
 
 static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
 {
-	struct uvc_streaming *stream;
+	struct uvc_streaming *stream, *last_stream;
+	unsigned int count = 0;
 
 	list_for_each_entry(stream, &dev->streams, list) {
+		count += 1;
+		last_stream = stream;
 		if (stream->header.bTerminalLink == id)
 			return stream;
 	}
 
+	/*
+	 * If the streaming entity is referenced by an invalid ID, notify the
+	 * user and use heuristics to guess the correct entity.
+	 */
+	if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
+		dev_warn(&dev->intf->dev,
+			 "UVC non compliance: Invalid USB header. The streaming entity has an invalid ID, guessing the correct one.");
+		return last_stream;
+	}
+
 	return NULL;
 }
 

---
base-commit: ea299a2164262ff787c9d33f46049acccd120672
change-id: 20251021-uvc-grandstream-05ecf0288f62

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


