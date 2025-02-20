Return-Path: <linux-media+bounces-26474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CCBA3DC95
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51551860A9B
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6AF20E032;
	Thu, 20 Feb 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy91NTFF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C8204878;
	Thu, 20 Feb 2025 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061078; cv=none; b=IhifaU2RaFwH4cKYdNWQEZzCyyCuPZX5grIJbGX5c9Y0s3qjGkvB8L3eVgBknMVwGLNbXr+Xfzl3DhBZTLRc/F8mHtcilH6T+HYP0FtC+Q35CxfaK/cWPawfwU+Z2Qiaj5zUu4JOnpdFKUi++4Vk3QY/ZgitjESqqCWJsQKMv/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061078; c=relaxed/simple;
	bh=zAx5h3CW9uhScVCOaEZGPbZKRppELpmuFuRjU0AzcDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FraIscZ27YSi/7+AE/oyz5cqqvn8sfVmiQJwQN5oV+n156tp0JoBYBrkfUbfUsw5Or5V7OJKfnvDiCyBeI+YnOYOfYc+ohfWHGXQw0WHDW1Y/Rb09SE5NPQQWFXh2Odnz+Hid/VYewXy/DI7jVOJGyTq7SVFvwid9rXc1F58cEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy91NTFF; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded368fcd9so1464288a12.1;
        Thu, 20 Feb 2025 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061075; x=1740665875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=Sy91NTFFduRuSa+T7eUTLMrHuF6EuLc/G+woHoj/PJ1oRFxskxbQHQBofcfTWAfoc0
         6iNscuq2f7Wjztbfy6Gg1z6VE211LMGvWvdpS19C47HjLYMMqGmT9ZUppJEEPr/ht7be
         Vxpea8wJGtbr6r5Dt7zh/WH8sHJ6MhVYAslV8ciJkp1mFxXAZ6XmScHEjrf6exUrHEco
         Dh8EupjLA9aGuSUnXHu9YJlrHcJA03q1bNj/qdiO7Ek9lP8OUYuRrj6EGz1L2zsYmcBh
         CNl29yWOQGKMNrE1oGQrEwyy5+RllMMtOfZ0YJorL5HWEKEBAvZcxB9yRIEm6P4YPKvL
         uvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061075; x=1740665875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=pOx6cPOg9NNGau+nK7TQdPfK1B+JSLkYWKJJeF/K9aWQwzhZ76JB/O+UsdHk6ID+CF
         TiMgwssQWZXNQ7em8BYiDYf0IwLHjm4ea7g6IIzWfkndLcUrBbCJoxJttUaKBYMOZ80f
         rBeouGSh1dibxJGCE5w7JSrB0xGj6+LxXRc0SZw3uNoQLWoevZyniKzZ1fk0h5HTZs1p
         9wI209H2pDFt8fNJYuVBrH0mK7wIR0RME02mcsGyPEQqZzY1sMuAg6n0aZL4jPWfM4hP
         nUL9hte4ALGBUk3Q29B1t+tOvbc6GaOZ1F6yxmNYWHFVDPrkUA27Ho8PKwlCim9GbprB
         ZR+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+rlQWfZkhc6J1St9OPCd9PyDUnB1mp6fatNv5acDPpoNj82NuHXI1qF6wMdXxfJ5rwmSjxTi/ur1w@vger.kernel.org, AJvYcCWF7Vc4bkT+mJMd/npw40cn/ujVl8a0MmGZDXqF+FC98SI0mXkJD6ios/hIywXx9dFUxMug7C1f0xvlUz81@vger.kernel.org, AJvYcCXKBBdn0Or8bRU1i0WUkBHpXG1Eei0Ciu5TSnG/Nzu2lzzz+boYwTHdRl1lLj9PcPY5Ihy3u7WKsxaGk6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwB/nFUNoZWvazhq6lAXm3nZ/0iB0uwpNDd2j0xKIH+O91nzj
	Vf+41QgDdk9VO31GHVVedOjR1KDjNnAf/YmlJkAglK6rc39gtEXN
X-Gm-Gg: ASbGnct2QZtE0k9JD11egNCflHxccqXWA6wAyyIz9qVL5QTLoCQavT4fpBPkZpWzNrY
	5rqxXkqXE+5y6XDEI9KhuxarXsJQDelZS+G14m43iapNHY9p/qA/ZAMYyEiV03elriyo6PC/QOt
	1I82yEl36sckTaVLxilnfGn+qTW4GUbvHhKqq+W/JdYSVWZejL/jJt5AnQGvpJCVIqrUgYE9wpd
	ClQWOodfk2Hk9LuDmsbuLyozbqWhWXKVXAR+nmmJ48z9CclPAMoNxqirm64siaFO7rQcVcISVhP
	0t65U9xgdePEcV222bG4wjCZBiHv
X-Google-Smtp-Source: AGHT+IFFJvKPRHucc1r4QGSkduMvmNCXiQ/0XGioq753EqOOggpo2+xqmAhfLNknWvVEGi+w56gFTw==
X-Received: by 2002:a05:6402:a00e:b0:5dc:ebb8:fe64 with SMTP id 4fb4d7f45d1cf-5e089523080mr6461869a12.14.1740061074548;
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 4/6] media: i2c: imx219: pass format's code to imx219_get_format_bpp()
Date: Thu, 20 Feb 2025 16:17:26 +0200
Message-ID: <20250220141739.228714-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx219_get_format_bpp() only uses the code of the format, pass it
instead of the whole format to allow usage when the whole format is not
available.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index fcd98ee54768e..ad1965a91ae3c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -387,9 +387,9 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
-static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
+static u32 imx219_get_format_bpp(u32 code)
 {
-	switch (format->code) {
+	switch (code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -680,7 +680,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	bpp = imx219_get_format_bpp(format);
+	bpp = imx219_get_format_bpp(format->code);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
 		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
-- 
2.48.1


