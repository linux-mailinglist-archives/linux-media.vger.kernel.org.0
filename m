Return-Path: <linux-media+bounces-45115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A6BF5742
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE8A46540A
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CA832ABC0;
	Tue, 21 Oct 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJyrbGB5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26EA1A8F6D
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038086; cv=none; b=fQiDcuQzGoDx7HZ7OZZ9D0lF5xt07HHTk8R3xxoeaKcQMkJpI8IjPYUS4GeTVA4M6IB/Mucoz6mIaRCKf+GZDeDuwgRzaO6TuYjcXGxVSpKfEAhkaJza/8z0FON+Vu6bHIe8x8zg/UyB1J+qV0GFmXsWfA82Hng/F3FL9QcL2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038086; c=relaxed/simple;
	bh=RJz1gmSDlGr4YU/FQOkFmnqOy83pufixi4dMVGttuxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ERFEG6lzJaf7cSNDzk/GbwBuEA8aUH2+8Yw4hM92ZUpH5f9LmNAOxpU6+1WeLicm+ii77hOPtypKcVoHaG9WPNXhelwao2VU29nReQk9IAUC6OXQnNvUC1LqbQsOC+p4EczZ/sL+woiYUzpFSWCuz7EgKBQetSC5elZnDHHGxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJyrbGB5; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-363f137bbf8so47663231fa.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761038083; x=1761642883; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8NKSLNa12tSl0xnMWLTKKteeShNaLZEYQs2solQ/gE=;
        b=QJyrbGB5TbkyDCgBX03C+IXe8AK6UFTH2FGixdSu8edV0Kkt/CG3esdjgpPHLb5rsm
         iRgsmzGxuVza/czLdJ37N6ec09K2BFLzTxuWShEK8nRf4xhW0KWBG8fhFYQNbe/jrXTr
         vtvbvFmPhLWuNVSjFDiSVBb3/bPqEmVin5VYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038083; x=1761642883;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8NKSLNa12tSl0xnMWLTKKteeShNaLZEYQs2solQ/gE=;
        b=KmOcmyfXEIPkXzLVCmDozujI5yFAOYBwzDBj3wD18yMdPL7KOlUly8GRdf+2tsc8KW
         BPtG20QRlOJb2LsphU6NZrA98Rrc7dA1RgjA+3ntHRMlHfSpGNtawBop3dqsUbbTnZ1e
         HGKaZ6s91/TwmGGp1T7VEt/qNGYUQKMdO3jK5Q2wRH/TFp8isqNZ5lX6tYd/YDk6QlVD
         lhEAAGZIHJb6AUIR+WjxS6UcoYsZiVkJCXM7tjk+828LnKTyuz/6fXSQpdFVfoBLrS+M
         EChVazmtxhqk57nBsXven+S0oBO1+zyZ1onY/xryUfa14zaMKe3QosAropN+FAefrkFk
         vBgQ==
X-Gm-Message-State: AOJu0YydCBrNtg6MZ588x65Wi0VvDi1cRIBnvcBZKc7n4CYvlrOlLyo0
	QONFFqenxgpXSYPIWZMTCku/YxxoPtRosMEQTiVLv5MEqGvS2jnYO0FwTIrRu+gGpzOrVEy9tJm
	2zY4=
X-Gm-Gg: ASbGncvTfoEos25ilZaYn3xzErCY11HFucdo72JA7Nr/dDyUbzSPz+9NKbiZ6C4JFyl
	datU2keVwtPe0c9KLIKQC6OpjPpo7JxdbA3fXuj+LPECjJNFQ0KHOiF1C3OFzEmB8auUP6Y+QC7
	DviL0kIehkCNa5XBrrBw5XTk3D3kQnT0xEJrvtKbCUc/q44/367Ej4bq0MF/TUHtRbyYf6KIX2X
	ltPrvo8PBDD6rL0mDTN/xk75qKIjfURJZ5mjA5yCzmvhVx3HwOy+/jSkyqIPnmcPlMw2tUK3qfy
	FBXRuJpiGFMs9HhNZlZds9K7SQfzkU8i0VnIz4ElwcaerusJG6mGaY6jn6pbseKvikB5y19yRQ+
	HLwuppdReJv+TYUyxfqHnerZE4d8bvKfrNcDOwgj/iktsHUguT9kmf1ZjHQjy8Ssx3GSx+WdoV/
	vyWNTjcfC1Its1vT6NHdnzWmEQJSY0ZtUCvviUQlOkUPMQkgTcytnki6E=
X-Google-Smtp-Source: AGHT+IEPGiWt+dwmwhFaFuPI/HjRccA8O9WNKU+McJli7NGKFUa8kvu9epeIJvHuqYsATf6E9wBGhQ==
X-Received: by 2002:a05:651c:1a1e:b0:365:e848:b7a2 with SMTP id 38308e7fff4ca-37797a6bfdemr47827171fa.33.1761038082750;
        Tue, 21 Oct 2025 02:14:42 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b73d8sm27728341fa.2.2025.10.21.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:14:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Oct 2025 09:14:40 +0000
Subject: [PATCH] media: uvcvideo: Use heuristic to find stream entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-uvc-grandstream-v1-1-801e3d08b271@chromium.org>
X-B4-Tracking: v=1; b=H4sIAP9O92gC/x3MQQqAIBBA0avIrBN0oJCuEi3ERptFFmNFIN09a
 fkW/1coJEwFRlVB6ObCe26wnYKw+pxI89IMaLC3Bq2+7qCT+LyUU8hv2vQUokHn4oDQqkMo8vM
 fp/l9P2vf8P1hAAAA
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
 drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..4a8712d2d663ab0c31a1586ed7da6fd42f3ad3cc 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -168,12 +168,24 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
 static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
 {
 	struct uvc_streaming *stream;
+	unsigned int count = 0;
 
 	list_for_each_entry(stream, &dev->streams, list) {
+		count += 1;
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
+		return stream;
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


