Return-Path: <linux-media+bounces-35508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38850AE2407
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 23:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC26316CF1C
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 21:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4168C238C34;
	Fri, 20 Jun 2025 21:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZccepPKs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8F23717C;
	Fri, 20 Jun 2025 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455073; cv=none; b=gAfGunNXn2iAG/1yAUqsNDmRBJvE1NVPzRdOBe47pd3HoRXq7TAJg2FT255hjX9fM4AtiOacIoKnGhhsMpKmX4XVWAbBjkRBibjOcLcmExyZz+yGrTO/8WTnAHcbnJqIpNbn+ctfP+69OyqIBNrsMm59Ycdho5FrL62JoYR3558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455073; c=relaxed/simple;
	bh=AVYyDFoAJmNJ3AtqP5ezTNSvC7His3vdyCpflgo1ue0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hz7/pp+Tjtg9g/U2S8PtUQFj5VGAfCByGgbYQa1wHfDTeFsSwX3M88O9GJtPgREhYAnH0gdg70NXELDfK0LFWQXKt4Pout9zh5FHislwoy34IAIJI5pEPmgrNGkzs4tncJybXPb+mWoUt7ZKiT/hqWyXa3ghgbv/JEhXk25OHMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZccepPKs; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e82323de932so2170284276.1;
        Fri, 20 Jun 2025 14:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455069; x=1751059869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lfFHuJk3jYL2lnNi8XKHb3whsorgsSFFPJjd+5vHRB4=;
        b=ZccepPKs+TQtv7GxIxhvU7jefC2EzjkV+LJFOhpABFhOsXj99nstpulAYqsNcPsp0L
         vvxvEn81okLc+mzxGBWPHa3loDNdgOJQ9gyk33aWvv2N4+qcIFMhtrKWeFraBT8OjnIS
         GKXPHwhu9QXSyHWsUiPc5GjNjFX/k2R6MOleEzge/BFXM3qHsAOZFq15jUXF14iyo/HR
         GmAWeXDNi+rlzLz3ufcc9I2iNYl2zcuVDyzXaLVqHbXLLbpJUH/TL9pjg6CZZ6z3iLoX
         UZh38LOZjKns/0pnc2AZhXE50ICD0ksLDPnNQabOh4sYnNeI1SyrmRBwQvq6ckvveMfT
         epAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455069; x=1751059869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfFHuJk3jYL2lnNi8XKHb3whsorgsSFFPJjd+5vHRB4=;
        b=N9p6W4QFhyNHT3hw0Vdr0G2HtNiRV+RlFxa3eXgjDJcE/ZhuvUVzD90hxIqwERgkjo
         jQc/xozfsiJ6iNNjBHC5AmX2p36nc+Oow/zI13F2czROrQZTWotXZdpc3qyujq46wuPs
         XeR9th7IdCcf7YnL6PjBcm9ZCxss6slDn1eI+/UrSMBpcuhRIDEVNGiJrNfOKZCy/RG4
         kEJpLZ2ZG6ZCXBBcvzdF1snF5t2JdHLLTqwNeUJLLsLVL2gTevZgJLkTFVskt6NJ7SYB
         vEwmMpJyXk/kjyygRlQ44uzDo90AOgH/OuNyJtwlAibh3q63561W/mpPe5ChH5BIjPht
         J6hA==
X-Forwarded-Encrypted: i=1; AJvYcCW+IQlj/LSqIkM5vl3xZXn7QfFVZUlnhgcGUZeLpppmrC/WihfN690JLnIC8u/NYzIWow1uw6RLW9ZQPac=@vger.kernel.org, AJvYcCXkNtpjV1VKNOXdd/X/jnnWoSZXtbr6nk+fMd0PD/gPR01c+BbxJzPMI2Fgw0oTQ2v/bUowAnbr4Kv4cFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0iudkYRMHJtlHT1cklguJ2tCfeaF5+OJt47opVhsi7o7Q8o2
	qdsM8zpZRdqlxrLMFQgB/ibrSUTZBPUx74Qi837P2K7GVetlVfa0+JkPaYq7qy5t
X-Gm-Gg: ASbGncsDntR06NdpsVmq19sJ4H8jeLBtGNQ/R4HVASWHD4P99rSqXuUJ6Ni4Lwldo1p
	obC+JsR7gLepeqXp4WgYlHoDrqL7wP6cqRyjc5inAyjrc1gLMxHVOgrwJ1K/ZsZ2iAzuHj2vw+k
	x/OHXLlNx+RCEaeJOoxTMyrwt70F5vYvKO4/jUVNx4v+fF/kVDmmLvpRUOHnxI0xu95/dhHtrRf
	rQ0gAxsBgRjpphy17Eb2DfBzqqgL1UfyDA8c1DYVDR+Kh+a7oYa0VzOvjrITJSL+bAKScuGUdWH
	ANV5X3ifYAhZDbmYCtAU3Xrp0Z8gB1X2tcXIgz+W4t1FMQ3BQEfDdOdbBQ5M+yLniwpnaKVwp3V
	A
X-Google-Smtp-Source: AGHT+IE4m3NbtlabE4K2TxEflmmzjVVtlLpOSTzMjrm2rYjOrwU4502DiNV4SnFOWX1I+BdrgaCdDQ==
X-Received: by 2002:a05:6902:4888:b0:e72:ee23:ed75 with SMTP id 3f1490d57ef6-e842bd078d5mr6332400276.40.1750455068956;
        Fri, 20 Jun 2025 14:31:08 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ab0a905sm858609276.23.2025.06.20.14.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:31:08 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: dw2102: fix null-ptr-deref in s6x0_i2c_transfer
Date: Fri, 20 Jun 2025 17:31:06 -0400
Message-Id: <20250620213106.3215886-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. We add check on
msg.len to prevent crash.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb/dw2102.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 54493bc490ae..bc30dc6072e6 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -606,6 +606,10 @@ static int s6x0_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		case (DW2102_RC_QUERY): {
 			u8 ibuf[5];
 
+			if (msg[j].len < 2) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 				     ibuf, 5, DW210X_READ_MSG);
 			memcpy(msg[j].buf, ibuf + 3, 2);
@@ -613,7 +617,11 @@ static int s6x0_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		}
 		case (DW2102_VOLTAGE_CTRL): {
 			u8 obuf[2];
-
+			
+			if (msg[j].len < 2) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			obuf[0] = 1;
 			obuf[1] = msg[j].buf[1];/* off-on */
 			dw210x_op_rw(d->udev, 0x8a, 0, 0,
@@ -627,6 +635,10 @@ static int s6x0_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		case (DW2102_LED_CTRL): {
 			u8 obuf[2];
 
+			if (msg[j].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			obuf[0] = 5;
 			obuf[1] = msg[j].buf[0];
 			dw210x_op_rw(d->udev, 0x8a, 0, 0,
@@ -640,6 +652,10 @@ static int s6x0_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		 * case 0xa0: eeprom
 		 */
 		default: {
+			if (msg[j].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			if (msg[j].flags == I2C_M_RD) {
 				/* read registers */
 				u8 ibuf[MAX_XFER_SIZE];
-- 
2.34.1


