Return-Path: <linux-media+bounces-9126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EABED8A20CB
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 23:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652B61F23454
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 21:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC4F46558;
	Thu, 11 Apr 2024 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bCxvtOHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEFC4597E
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870286; cv=none; b=AObvppc3NarOOECf10hFqBdoPLw0CL11uD+cWwy2fiwcFUvzRxy4Sx+L+/F0YUtw99NsJ2ihH+/9Cz4+VTfvBZQETcBdZasvJ/h/sgkCUc92QTM5s+CzhiZtq2GLu+25vHu3CWqjvSRlQ5UxGFYbqawWD1Wq/7k/CWLu8fliHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870286; c=relaxed/simple;
	bh=jWvovnNbCjwB2C+VXHGftHmA5T8gil6/DHr34mWgtoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsLovdG32WPzdqjNRy7U+KLFYk/sMMvTU6aF5kHFJt0L39XIsPaXNLXqV7GxkRbqCc3pL8vGkP6ZM5IJKNtz5zOqvEwaVsmzQICddm8QGDTveoNUDOmtFuPYw/wC9gQvL+F/i1hJfilcUN302gSBAeEENWep883nTImi/Hdx3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bCxvtOHZ; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c6f1c95913so51100b6e.1
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712870283; x=1713475083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOIqD2cEf2Ajo/2bzueQZnF061I92Ltj+ENaeP2eHJQ=;
        b=bCxvtOHZLkuithzlYNA0ADaPlt5s5uEzOGaLTqUGhjnH1nblKRIXwclN4Op6w0MTmm
         qI1AXJrRWIM9jOMCWxAAUaLwUBlp7XJO0RAvONF4UzdBg9G1qjAsjvCHLGUJKd8VFhJ7
         COLjgMLLu8TywhN5x8AomQ7Zrn6UkNvhlZ0uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712870283; x=1713475083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOIqD2cEf2Ajo/2bzueQZnF061I92Ltj+ENaeP2eHJQ=;
        b=qoVSJVYQ+xlTn0e/f1QAsIAiHtNYYPAQu1Wq4sjspEpmy+xrQUxXjoo7uD/LXr2Lsr
         jKPquS0kCwuxQ792RVRlMlLvoK1BxmLxHCTRpfLMduUqjYUJkHiK0L9q8Hv5IDqVBA+5
         B++hWioRl0n/4/4btE3oqFTMjm2cblALEWJ8HShkU7IdXuaLplmOBiO6ze3wdrMdBrAu
         tA1j0cAzi+fRpMg1KSMt/ipsXyw2xmRjRx8t96hFBEYqBjPOLyPeXgAbkXdkN1Ov+TVJ
         LPPNznuEd2TRxhedJA8q0D0RRuBG09Dcnd3FtvE0TWf9eS+qajpRKfRiCONVdCt/pmhg
         ja0A==
X-Forwarded-Encrypted: i=1; AJvYcCVP1s+fPQPCWoyu9FaJGUn8l05yv+bT/vfcNFYthUa6yBZiGOFjjh6Ao85KJgJ0EoeU6JM73PNEatMUXdKClMMTZj52G1ndGg0mtJ8=
X-Gm-Message-State: AOJu0Ywzn4coOdyzlssWntNnMyyJVGeuYMxoxJ8Bbhi4d6aZ8sUV8SMu
	ZLZmEkAiLCLI6V5uvTzx5B4DIyD7tTaPkXgdXHeJO7vl1FN4dd8PTqDXLScRqg==
X-Google-Smtp-Source: AGHT+IFC+MhkQWiHdHFKMOyxd+8dV1gTziJ5gXLj4MpOfJR3ww+hXqqwT2lBycXPTw1zfx8RyZUR8w==
X-Received: by 2002:a05:6808:198e:b0:3c6:beb:20b2 with SMTP id bj14-20020a056808198e00b003c60beb20b2mr665356oib.51.1712870281598;
        Thu, 11 Apr 2024 14:18:01 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84794000000b00434d7c4f9fasm1373362qtq.8.2024.04.11.14.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:18:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 21:17:56 +0000
Subject: [PATCH 7/7] media: dvb-usb: dib0700_devices: Add missing
 release_firmware()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fix-smatch-v1-7-045f92467937@chromium.org>
References: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
In-Reply-To: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Anton Sviridenko <anton@corp.bluecherry.net>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Add missing release_firmware on the error paths.

drivers/media/usb/dvb-usb/dib0700_devices.c:2415 stk9090m_frontend_attach() warn: 'state->frontend_firmware' from request_firmware() not released on lines: 2415.
drivers/media/usb/dvb-usb/dib0700_devices.c:2497 nim9090md_frontend_attach() warn: 'state->frontend_firmware' from request_firmware() not released on lines: 2489,2497.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/dib0700_devices.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 3af594134a6de..6ddc205133939 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -2412,7 +2412,12 @@ static int stk9090m_frontend_attach(struct dvb_usb_adapter *adap)
 
 	adap->fe_adap[0].fe = dvb_attach(dib9000_attach, &adap->dev->i2c_adap, 0x80, &stk9090m_config);
 
-	return adap->fe_adap[0].fe == NULL ?  -ENODEV : 0;
+	if (!adap->fe_adap[0].fe) {
+		release_firmware(state->frontend_firmware);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static int dib9090_tuner_attach(struct dvb_usb_adapter *adap)
@@ -2485,8 +2490,10 @@ static int nim9090md_frontend_attach(struct dvb_usb_adapter *adap)
 	dib9000_i2c_enumeration(&adap->dev->i2c_adap, 1, 0x20, 0x80);
 	adap->fe_adap[0].fe = dvb_attach(dib9000_attach, &adap->dev->i2c_adap, 0x80, &nim9090md_config[0]);
 
-	if (adap->fe_adap[0].fe == NULL)
+	if (!adap->fe_adap[0].fe) {
+		release_firmware(state->frontend_firmware);
 		return -ENODEV;
+	}
 
 	i2c = dib9000_get_i2c_master(adap->fe_adap[0].fe, DIBX000_I2C_INTERFACE_GPIO_3_4, 0);
 	dib9000_i2c_enumeration(i2c, 1, 0x12, 0x82);
@@ -2494,7 +2501,12 @@ static int nim9090md_frontend_attach(struct dvb_usb_adapter *adap)
 	fe_slave = dvb_attach(dib9000_attach, i2c, 0x82, &nim9090md_config[1]);
 	dib9000_set_slave_frontend(adap->fe_adap[0].fe, fe_slave);
 
-	return fe_slave == NULL ?  -ENODEV : 0;
+	if (!fe_slave) {
+		release_firmware(state->frontend_firmware);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static int nim9090md_tuner_attach(struct dvb_usb_adapter *adap)

-- 
2.44.0.683.g7961c838ac-goog


