Return-Path: <linux-media+bounces-10358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C05BA8B5D70
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D441282489
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6678627A;
	Mon, 29 Apr 2024 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bBz5yI39"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24648249E
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714404021; cv=none; b=WimT7W1jpkTyNO7ybAXP0IHOiF+KXeZ0ur+RYn+pED9yU0eIMPq5D59PGhcVdcHLw8ht464G7hJztNsds8GIGL8Ni7WwGStGpg9eO5br6JX+UffVS3xP+3zrfuNupnqhf3vp2eCCTsS0vROnie3gbLxinV5OC2rTJ5MMj3gzAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714404021; c=relaxed/simple;
	bh=w5oGRP4JPpb4te+A558b3tkZ+H0uAyOnUSQkFgcHJek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eYPy2L+2cYkzcub6huZxoUYeOPHtMa8j2Wv5Z7JNQpOcLXnIwEu4g2sI8He2i1Z0QuYJ5kLWzFjy1JrmszcShbBo6b0jpZp10AuVqxu5fVSZty90rwodt9RW8LEqy4Eb9LhVZ5Q1rq84znRLUBQZAjTNdoHcrHIuH4nGOIpben4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bBz5yI39; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-69b4454e2f1so19089116d6.0
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714404019; x=1715008819; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Whc+kehZFOrnNVxoQ+aJ0hCobdq4Ed5IJwv8Dg8dkaE=;
        b=bBz5yI39HX4qu5MrsmmWmYqeYLbM56I2IgDAkPYyh9Mc/FdlQ5ua3RI9EostKLOzKH
         DeOQqvPyX3HoUAwLUbaA/nkll/dOjxE+bvyt5LvBGsntsZIBk37eICBzb+23SEQDsSVm
         hh8suDjARnvQBVtX1vYbj6HKjzgTAVMT+fTiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714404019; x=1715008819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Whc+kehZFOrnNVxoQ+aJ0hCobdq4Ed5IJwv8Dg8dkaE=;
        b=rm2ApgHToJ7tyXD7qgV8wx2A/8FDdseC4lSZc7HKYuplPC0DJm2/Za4SSF6duH+h/F
         lsVVUYgF8OM5wCy3zM5v0urSiw+qDTpdzp/OWalwa9yUl6PAge/HaZPythbpvNAlEfO1
         uctZdS0lTvk6cDGnE6ovNZgNADYrWnWowY1HWXOMD4Q5Ay4rFB/FnNQY6S/aHXkjAMKX
         RPqZgxagO8V/OQdfzTnmbvm4nNwcKFfsG0pS37zLIhqpZhXevpjt9GSqdUXsQC5KkQN5
         zWrIxcuACodhA2ICdT4rL6+/wzy8CEuV4sX9IIeqFqyNwls6xZNq2XjDokcprILVWEFV
         Tzbw==
X-Forwarded-Encrypted: i=1; AJvYcCVzLNgy0/i+vJwas1Zw+fpV3p9gUjsa8M3Gqhe0TyRRXDry2UXc//xDHgr1v4qsvK0MAWUefn4zpfSMwO34OMtD9Pbw8RngD++ixc4=
X-Gm-Message-State: AOJu0YxnUNc+MfLT/Zk37qL9eydu8jgppApHoy7gf14ClDOZ6FuO6Z9Z
	mZikkJeMlwa98SJ5XIbgbavyjVyjx+HjaaHlLRwET6iZl2i2X4xGSPjvUPel8Q==
X-Google-Smtp-Source: AGHT+IGWePekp5A7s1qkOnq7jbAIN0fjYPvsoPXi4euuiHJbROBgSQZcRgE0mfjqCDMBTLUA73If/w==
X-Received: by 2002:a05:6214:2a8f:b0:6a0:b905:97b1 with SMTP id jr15-20020a0562142a8f00b006a0b90597b1mr7524418qvb.51.1714404018764;
        Mon, 29 Apr 2024 08:20:18 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id r3-20020a0cf603000000b006a0affc7c6esm3020797qvm.63.2024.04.29.08.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:20:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:20:18 +0000
Subject: [PATCH] media: dw2102: Fix size check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-dw2102-v1-1-a5d81dfc1453@chromium.org>
X-B4-Tracking: v=1; b=H4sIALG6L2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyNL3ZRyI0MDI93UFOMUQyOLRENTCyMloOKCotS0zAqwQdGxtbUAmJ8
 APVgAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The data is going to be copied at state->data[4], not at state->data[1],
fix the check to avoid stack overruns.

Found with smatch:
drivers/media/usb/dvb-usb/dw2102.c:802 su3000_i2c_transfer() error: __builtin_memcpy() '&state->data[4]' too small (64 vs 67)
drivers/media/usb/dvb-usb/dw2102.c:802 su3000_i2c_transfer() error: __builtin_memcpy() '&state->data[4]' too small (64 vs 67)

Cc:  <stable@vger.kernel.org>
Fixes: 0e148a522b84 ("media: dw2102: Don't translate i2c read into write")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
This time it could be relevant though.
---
 drivers/media/usb/dvb-usb/dw2102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 03b411ad64bb..79e2ccf974c9 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -789,7 +789,7 @@ static int su3000_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 
 			if (msg[j].flags & I2C_M_RD) {
 				/* single read */
-				if (1 + msg[j].len > sizeof(state->data)) {
+				if (4 + msg[j].len > sizeof(state->data)) {
 					warn("i2c rd: len=%d is too big!\n", msg[j].len);
 					num = -EOPNOTSUPP;
 					break;

---
base-commit: cefc10d0d9164eb2f62e789b69dc658dc851eb58
change-id: 20240429-dw2102-ed3d128a1582

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


