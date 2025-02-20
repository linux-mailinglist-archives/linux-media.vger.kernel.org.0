Return-Path: <linux-media+bounces-26437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FABAA3D482
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 10:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A833B80C8
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 09:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC97E1F03CB;
	Thu, 20 Feb 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEVA18bG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2DD1EEA5E;
	Thu, 20 Feb 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043251; cv=none; b=g8cRMJWw692G2b1cJCTZQpsRRi7TfnZfSGOzPhWBqaH4yHVmahtELmFJJXVBRHAiueTn0W6UXEAf66ZWcjJiYCO65O5PURgR4EmOZ/sRin3IML4ZSLgi/b204KVLVXXtWVrRF5msn1T7eu3g6Lp6zNSitNaITn8T+y5g/XRjD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043251; c=relaxed/simple;
	bh=Di0pc8+mVoIIZUxrN5rf1K7d3PKUOyY+l/aCtguTkgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5x0ANBjpmmlMFgxsi1LCTKP5uu8cGUY/sFLVyYaGWqCEn+gxvUbg9Bgep4AE//w02rvyjhGW5MxT7C1BjoxwDa8+DNMAihl25VDLBi6LO9Mxz3j8+knV45hfR2wwRvrkAh2Ak2bBr/8usR2o6/nYJt8vNIPud/c5PY+/8XHMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEVA18bG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f22fe889aso528464f8f.3;
        Thu, 20 Feb 2025 01:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043248; x=1740648048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=;
        b=mEVA18bGjDRMbpOHE+q6ZF4sa5ziOE8Gj9rjV2FqQZ024L7OacLpsCTpIz1mqrXXCA
         PMQaLHa0E5LCOGaMbCu6PCE5A3rMzqfzeLLzacIzR0KL7eXiIm289mqE4k5KnXcxALQ3
         PaWna5rrMEyrBW6zUGrtc2p2FEpEiso4RT5lGOn6DCaO9Yh7ppSW0YIbt3TGp+WV0hof
         4bRMdT6OAKbIAH9BqpHHx8dKWMWyyxWbdSNnJbX9pLmyjmi3M4qlpgwgCIoDkABg5mCE
         n+ft/hm8GgyU06UbQuzJ7AjJoKy0d8K2p3YzUCX470f2q4OHr4bte8nwqIAOAZy0PKUI
         9xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043248; x=1740648048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=;
        b=wE9yMaNDsI56FsBJqZQn8hjZZO+rwYbZLvQI661cITZ0B9cZ+lVMDxLjgY1ftoVnPd
         g97G1UNbQ/seVYESp32OYs8HuIGDmXkgO16TVHEVEftth64owpxWTwdSopTa7Kca99a+
         TM/JgqOvbhmlPQrNfAG/fY3a/RaMYZDe+xhrQje4UD0hW1Zw0C9ryPwk9B/5TgxM9iyS
         xrOjr9yAbVrwvXdw8wi/e9KRxdDXBHwQZ6FdFOE3eg2N8ylNZkIokOQ6RFdzjW5AXIYU
         XNX4TkpWIhV3vAn37YnEr2fK/5qfLGhnUg41EASNVEAvTM0xAd8xBufY7MPeY3Evv8ab
         LyOA==
X-Forwarded-Encrypted: i=1; AJvYcCU0XICeCqeKOpPC8DCf77UUBaISxXWFaiPOOhFUm/TB0+y3AYf5bngLH8ieEvS1KlSz/y15Awt+ZGloq4s=@vger.kernel.org, AJvYcCWXv2RBPhxMbHceKm9B3bJs2vj5OEeYsrZG4fe8LTUUHYaEBSLPukz1FmxIjmuYU9HnkTb39ELS7cpSB5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF4bZd3tZZ3WFegOhKYZ5DIVRK5mQ5/xqy8xPVW/F6j85YykZX
	R5yeXTpfLLN8+UG0VdlEJZIp01y3TrP5j9FlA541k0FA8rrOF6wD
X-Gm-Gg: ASbGncuN2QOC+xzXHOGAN1TzX0Z1bzrDrBcsCVTjNJhI6vrxpOLXWyauDl1U/JSsmUD
	XFggQFxFQRzbgEWJkoHm57e+EhG5BaY4mTbMPatBK4TWyY2MdhLc8E0OJL02oQ0zGpu+SjmyLpG
	q/hcCAz3OBqq+0Tnl5PKgDN9xe4QGQPD6MC3BMC1wN+DNX52434jdVDsdYDqyzVcZF1oOacHrek
	k/71CGG3CwfkG9CvBMIIFqZxFO8Dbomm7POiyVqWFoOgUfIU+3xCobCJw23Z1wTASQvZnoABFCD
	Nw+Cjsic2Flm6fn6y5cCUXHAxMKC
X-Google-Smtp-Source: AGHT+IFUfAy/nA4NjDORyka7i757ce3BhJX0W1jdcc9Lq8KT042PAkdLHvg8+1RRG5/LjvlPDzql7Q==
X-Received: by 2002:adf:e709:0:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38f33f51157mr22341024f8f.35.1740043247411;
        Thu, 20 Feb 2025 01:20:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:47 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:35 +0200
Message-ID: <20250220092036.6757-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All usages of v4l2_subdev_state_xlate_streams() have been replaced with
v4l2_subdev_routing_xlate_streams(), remove it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  7 -------
 include/media/v4l2-subdev.h           | 14 --------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 91fa51259237e..985d30c22acae 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2069,13 +2069,6 @@ u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
-{
-	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
-}
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
-
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				 const struct v4l2_subdev_krouting *routing,
 				 enum v4l2_subdev_routing_restriction disallow)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e49dba3c59bd6..0fa732e6dd55d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1606,20 +1606,6 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
 				      u32 pad0, u32 pad1, u64 *streams);
 
-/**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
- *
- * @state: Subdevice state
- * @pad0: The first pad
- * @pad1: The second pad
- * @streams: Streams bitmask on the first pad
- *
- * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
- * state as parameter
- */
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams);
-
 /**
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
-- 
2.48.1


