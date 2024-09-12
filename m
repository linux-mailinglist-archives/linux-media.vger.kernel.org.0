Return-Path: <linux-media+bounces-18216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F5976B8E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 16:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 553CD1C20D5A
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047A61B29D8;
	Thu, 12 Sep 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adn5+y+J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10691A705F;
	Thu, 12 Sep 2024 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150019; cv=none; b=aOytRab7irPL2G6YwyQZjQ/76QCJI3HU/IsvRa5s9dtl+W5BD0LKNynW6BMQhqo23Q80tZ0ksX2AuOjkSR/pwceDXShnStXqG9It/90noheTyGM7cW+FPllbib342WpCLAMt4rzoLaWAA1kx7WiiU57Xamo0TFKXgybn/HFEa8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150019; c=relaxed/simple;
	bh=C8e77MLz867SP8pSMy+fKBRnjI01G7jc863Dwtb6bac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YHtnN0+gWTKYNzmO/2H4S9jMEGlOFyyYQ21uuZwqUBdHv5zeWX0fybkw/Ko1w0ycF7qqbzkbgtxn7ixLnddkPAyzNlem02f8Fpjj1zvdbdxh05nesaUXSF9DZPi5R+3lc33VKyDwHNgp7lLes9hFaMsSjBKyVDiPfzldm3sgmGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adn5+y+J; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so354300766b.0;
        Thu, 12 Sep 2024 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726150016; x=1726754816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSQ5XR+qTc7YRtzH5U03c594mhCf4HJBiup0RuVRg2g=;
        b=adn5+y+Jl0xbMbKfzIq79z1Gqa467O9NLpdUbHduqkKZfqJLsQMIxoANeKN8CXR+qr
         vPj75MHaoFssE7cI8/g8XObgtyAFh4pNRe87yYuxQXNXn/xbZksDvd/+1y6JoCiNG+UT
         uVcWDfdVPaAEKKZGOyOyhQLvgGzDPurUwM4OJE4TxGrNUJewxjrxaPAcjUdwwqbHSWyN
         ovRrdqnp+vkr9ib/wm/4lRWlCijGzOdLLZkgM8a5t4CJ7CpT0VWMQ8IMWUglBFuvrDaw
         DiaHnUrLN4iHbjyhitS0nHME5nmR/FJyUE1pO/d4GkZLQ1irn83ZH/oUNvaS5gZbFlTn
         ueVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150016; x=1726754816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSQ5XR+qTc7YRtzH5U03c594mhCf4HJBiup0RuVRg2g=;
        b=Hxms6MgKFJTPC13bJ9l/xVcf/ljT4ITAy/atT0FAlBYm2Prpev50O4MC9TwscqbOBd
         RzctZouxeNEH0Zb7kEJ2qwg1UiwCka7s/SHK5k/aGswgp5MaFLkdjuDtj6IUEHkF4btY
         qpnYNPySnYQWChaREWcQrBbcR97cPU8ykixBi6578JXZlKZ4Jv2Gese2GOLCe1fRw+2A
         zCyLGEiWWQLcf6Ovwv2ci6saFYCH0zHHnFNzMxihOOcHPgy7/o8gqmwfZXFkaU3Iqy6/
         Tj/18lYZsyXJUzTyhBPaXceCQqi78kfVEVuPBfHdpusMF6uviC994G1Y1Oj2ZrwO+P8U
         GGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv0xI5UrCBkDB7t1rPAgnbWf/KV7nuhny1/6jqfngaV9tCWmjUrug9UcKFJUdVoUYdFRE+hEzKylP1ahM=@vger.kernel.org, AJvYcCWYnCwTVaCb6C0QiAVbXpyblbHLEMTuFlfdDRoqwZnrGBUVfRSvlo04qYqVNGewEl5u3NVrTzL9i0L7Izg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSuJ+SYkhIuOtWRVmXuFRVhcJGflQpORV9gmI3gKNA9mtJzBC
	/VoGD3+ceNCmY4yn13spz9iuGCyZHddU+w7cBXxUP+ncGvRQhz2k
X-Google-Smtp-Source: AGHT+IEATNnNln4LZyqHu1AtuJ3EuXa6yhSaInMQDv92EgNlvVkSbRYU/i4Jtd7NLdHb2UZJhj65hg==
X-Received: by 2002:a17:907:3da0:b0:a8d:498f:640 with SMTP id a640c23a62f3a-a8ffae03f50mr812827466b.21.1726150015428;
        Thu, 12 Sep 2024 07:06:55 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a258a3sm748268466b.89.2024.09.12.07.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:06:54 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: max96714: add HAS_EVENTS support
Date: Thu, 12 Sep 2024 16:06:48 +0200
Message-Id: <20240912140649.1243602-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912140649.1243602-1-tomm.merciai@gmail.com>
References: <20240912140649.1243602-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value.
Add missing HAS_EVENTS support: flag and .(un)subscribe_event().

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes Since v1:
 - Add missing .(un)subscribe_event() as suggested by LPinchart
 - Fix commit body and commit msg

 drivers/media/i2c/max96714.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777..2257b6b807ea 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -17,6 +17,7 @@
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -488,6 +489,8 @@ static int max96714_log_status(struct v4l2_subdev *sd)
 
 static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
 	.log_status = max96714_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops max96714_video_ops = {
@@ -602,7 +605,8 @@ static int max96714_create_subdev(struct max96714_priv *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96714_entity_ops;
 
-- 
2.34.1


