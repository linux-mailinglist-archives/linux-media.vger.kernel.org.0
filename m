Return-Path: <linux-media+bounces-61302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKe6NRpWA2qQ4wEAu9opvQ
	(envelope-from <linux-media+bounces-61302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:32:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD204524BE7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8FD3302CA68
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636A33D1AB9;
	Tue, 12 May 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nimblex.net header.i=@nimblex.net header.b="bbsTl/0I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3825A3D0BE5
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603480; cv=none; b=bp1VthK6DVb33NL52I+tVAKqpWXk3Yr8XSmCKMtutoXFd+xGimbnG8jXT6DxPUf+jvuOrZGrBT4mhkHGWCuhWOQQR3tAxBYXvKx7uQhJgPe7XpClrxM5qHE1lXvOBwSkvohT/rxQzo1ibVoSvLBGbXy5m0qPTGxd+S6/ZgzvKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603480; c=relaxed/simple;
	bh=1J6EFe9turiLVjiZ1yIAw0MF+G7F+RRsz0gWd3gm1E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=My73+X+idrW1TNjaBb7xL+XtgrQFLIy8jPfaT+KS+KkscHu1WKO/hK8eFIW2SYQ1nwqYJG1ufltJsXsPrmWT5vx3pvG4HZN1xN5RU+FxpVPhzRRWwHNx1RVhNJv7aEOSHcSjiWDn8x0CZF2x8RpJOQEaBPC7ZE96NqargJFgq2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nimblex.net; spf=pass smtp.mailfrom=nimblex.org; dkim=pass (1024-bit key) header.d=nimblex.net header.i=@nimblex.net header.b=bbsTl/0I; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nimblex.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nimblex.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a5174670eso3233618f8f.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nimblex.net; s=google; t=1778603477; x=1779208277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDpsU1Uf1Jvu40Vzfn0+jmnHCHZtJ2XXTAc7BhkcuAQ=;
        b=bbsTl/0Iane3p0XHocFbCIjE0l7Bkv0fit8JpF9cE0fSnMwq3pkDo19GSzrMh3hBmm
         c3m1uWzNg7C+GsgWqDa0AzaVjKuKjSec7LS6H7Ug18YOpmwm/NZ1OEUD9S8pVwXFmlvk
         BLCxO/WQX1z7m7Z1CC0jl7gFbxrsnFPzmAHbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603477; x=1779208277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDpsU1Uf1Jvu40Vzfn0+jmnHCHZtJ2XXTAc7BhkcuAQ=;
        b=AwWETlqNg99K/R9siHyWoDWkisB5nMBdviLY/lyBNLTPp1B3j65Yhxeo4zRrkGo/7W
         JfAcRuFoF4t3oy9HAhiSrOjxHS87E7miOs22OClyTDvGHs5nMcGoLAqJxoclWmYsyHAV
         gsvvz28QOd0jRpsjYyXOtCDpMNYOVQZUytGfJooiRGCZOAefl9wi14RQl/7MnSfdlv9F
         YFUOWsyN/qp/FW1GVe0Wp6cmeQpaSVDC4ccPJI5bNRQWAkMkSvk718Nih0RTaT13yyZd
         dex2fx9b891zgw71C9NS0aw1xLWdvAJqjXrLEMX1Sm3lGnFtggIDI5lDnMGP/WIkjEvC
         B0vA==
X-Gm-Message-State: AOJu0Ywm0GBYO0kmugE8VAokeofK4SzbZeZzfp7slq+7w580Ne2DySfe
	yTdVGZrrUp9gJroceWKmNQuV3q5kp0wKuLx/omDF48OlVafuEHK2UD2B1a3LwSP8FbsiGDjwTF2
	laJGCrV0=
X-Gm-Gg: Acq92OHibIK/Ir9UeTUF5zHh1lMBo6Heid8nbsSIJ1mC9rtODjUoK9tVKHvGIhwWEXe
	Fnn6MU/YiOwbYQp7vIfXfwNnd3ahYMAZGe9RfdrfnapZpIzuCz7w/2dcOaiMbOdKWTbSqhrGl9X
	cOiC/7/CiCBCf+IW5hgkhrVLLKUpL61F6iKmzukjeaeUibdupvQZ9X5pZBTFNE1oywJSANHZGes
	AuwE7aPJSfETukD5onGjptKQyLcYOJwvNWuo3Cb3tsItbDdhoeR3m/HdS4oLOWBCNh+IF/ahpAi
	OUMqoOn+zAH2FjySpHrJxYyHRJUxoistiPxaNSWfcfbCWQLV2Y+WZW29FIXtpVr6Er1ch+DTGhj
	pJlx/DG0jlJEXjtxEjEP4MFeoDFIbXNqoZN4z/8pyk5QGgoB7dpBTdo10DLebeVl1yGaFXtmzFc
	9JDRfVhtWWTbATr8/HSqQ=
X-Received: by 2002:a5d:5f53:0:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-4515d9a0839mr48268663f8f.38.1778603477309;
        Tue, 12 May 2026 09:31:17 -0700 (PDT)
Received: from nimblex ([2a02:2f0c:590f:dd00:8c23:d8de:dbaa:cf0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm40437592f8f.37.2026.05.12.09.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:31:16 -0700 (PDT)
From: Bogdan Radulescu <bogdan@nimblex.net>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bogdan Radulescu <bogdan@nimblex.net>
Subject: [PATCH] media: i2c: ov08x40: implement .get_selection
Date: Tue, 12 May 2026 19:30:10 +0300
Message-ID: <20260512163010.2893978-1-bogdan@nimblex.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD204524BE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nimblex.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nimblex.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nimblex.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61302-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdan@nimblex.net,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nimblex.net:email,nimblex.net:mid,nimblex.net:dkim]
X-Rspamd-Action: no action

libcamera and other V4L2 subdev clients use VIDIOC_SUBDEV_G_SELECTION
to query the sensor's native size and crop bounds, as required by
Documentation/driver-api/media/camera-sensor.rst.  ov08x40 doesn't
implement the pad op, so libcamera falls back to a defaulted geometry
and complains at every probe:

  ov08x40 N-0010: Failed to retrieve the sensor crop rectangle
  ov08x40 N-0010: The sensor kernel driver needs to be fixed

The sensor has no optical-black margin and no analogue/digital crop
in any of its supported modes; native size, crop bounds and crop
default all coincide with the full 3856x2416 pixel array.  Report
that explicitly.

While at it, add OV08X40_NATIVE_WIDTH / OV08X40_NATIVE_HEIGHT for
the dimensions and drop the now-misleading 'No crop or compose'
comment from ov08x40_open().

Tested on a Lenovo ThinkPad X1 Carbon Gen 13 (Lunar Lake, IPU7):
the warnings above are gone and libcamera's simple pipeline reads
back the correct rectangles.

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 drivers/media/i2c/ov08x40.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 5eaf454f4763..31062eedbd71 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -38,6 +38,10 @@
 #define OV08X40_REG_CHIP_ID		0x300a
 #define OV08X40_CHIP_ID			0x560858
 
+/* Pixel array */
+#define OV08X40_NATIVE_WIDTH		3856U
+#define OV08X40_NATIVE_HEIGHT		2416U
+
 /* V_TIMING internal */
 #define OV08X40_REG_VTS			0x380e
 #define OV08X40_VTS_30FPS		0x09c4	/* the VTS need to be half in normal mode */
@@ -1556,12 +1560,33 @@ static int ov08x40_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
 
-	/* No crop or compose */
 	mutex_unlock(&ov08x->mutex);
 
 	return 0;
 }
 
+static int ov08x40_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_selection *sel)
+{
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV08X40_NATIVE_WIDTH;
+		sel->r.height = OV08X40_NATIVE_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov08x40_update_digital_gain(struct ov08x40 *ov08x, u32 d_gain)
 {
 	int ret;
@@ -2059,6 +2084,7 @@ static const struct v4l2_subdev_pad_ops ov08x40_pad_ops = {
 	.enum_mbus_code = ov08x40_enum_mbus_code,
 	.get_fmt = ov08x40_get_pad_format,
 	.set_fmt = ov08x40_set_pad_format,
+	.get_selection = ov08x40_get_selection,
 	.enum_frame_size = ov08x40_enum_frame_size,
 };
 
-- 
2.54.0


