Return-Path: <linux-media+bounces-35507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8BAE23F9
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 23:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A0D3B887F
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 21:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495CD237172;
	Fri, 20 Jun 2025 21:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJh/pcBE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B3137E;
	Fri, 20 Jun 2025 21:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454776; cv=none; b=o8kPMqJvSAYvaneLZf2SBd2gwrWooniKrIgC9QV5PNZUmNOmcJgyqSo22bDnWTrpUtPG55xsy5O5UrfuPP8hisarTQHHbCrHf6OlBBUzR1CaJtr8IJq00vQ7XmAoOiLfsLyfPtVULNYvQmIRjMh0hPn93ubQOecX/ZdznEbTJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454776; c=relaxed/simple;
	bh=y1kWc66n/acw5CLFQnhOd4l2C3dq+axEoA6CjFiogTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LjcDOzzpGFNSAzMT5pRuccQz9HRuQ3XuV/LUYuCUnepvlQVKo2O/wdQaQIsbBk+b2IwlawxK/TqxVjpOiIQqN1PBhS6xqBr3sndMoIqhxybxyRdCZ7NVyNuC+qr8D8u1VMBJ9OMo533zbhpIR83CKUYCJLU4bsXtIIFfPTlifBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJh/pcBE; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-711d4689084so24974647b3.0;
        Fri, 20 Jun 2025 14:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750454774; x=1751059574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMnAMEjpYBbD1fXqa7lqbHKNPJmENbHUnreLVU24EBI=;
        b=FJh/pcBEuc7P3tAvCfx4xBOU0vtRt4x5Rbab8FMqGvZqBiIs1dVZbD7KJ1Ja27uiz2
         vLqzLTfTgquPZpul6uWIMwuqwNAeBUUDFPt4OhC7RxvTL6AloXnPfrxwXBmlZYefzAVr
         LCjifvhrENz4tsdyfaYM60WIr3GDXO85Kibc4WtcGJFc41Fd7wCgocPQCTBCzlDpaA73
         NZypYlCxeSYF3aYiYWYN9M1s7F7rws/Vvlfzsrfcf+KCuLGTrCHeo8diQiacL0u1q3ig
         0HN4rPP3oE5quZASUIlH7C/VvrRCgXB4mEBxLQ3gwN8MyylJtwLKy7hbQ4iHoofwStYy
         Ibqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454774; x=1751059574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMnAMEjpYBbD1fXqa7lqbHKNPJmENbHUnreLVU24EBI=;
        b=sTN1A18ieIviwKnAmg88oH/Gf2BWa1Yo2m9TWK2IKZEFrwjn/At3Ijg82pGqu8uiI6
         C6W3I9RiEGPAIZSmjh2JCnxpJsNb14IARJTG3WLiNiGHl2E+wvrpdxfXl79qZHkwMaR+
         evm1EW8tghVqCqMX56qrMH6ZkuB+FQkezGrkymB1WSxbZM5hdFlDII5H+b8FMHC73gJk
         iEosiyIGa4RiLJ4lbE7dcTtzCcamFYBBKqrngSVv6eolHN8qbhNHJbVHvhpadV7aRGPq
         7ll17Y7CwhbpyGtrHExnXLg8xIYODoGddC5OSvZ67qe2RLWDzkYfLsAxrRcHWmmkuisH
         TmPg==
X-Forwarded-Encrypted: i=1; AJvYcCUNz1jGlRuhdY7HN95CPdS+6Tn6m/i4/m+Je269H/vYH35jpEdDD7riWOu9vHzWlprYOoS1wo2dOYH6yKQ=@vger.kernel.org, AJvYcCVP57Tj5JLvJU9Oy5Oph7iku03VHkFp2kNC+ejQF1Bf3Bv1ROgyQoTbER6JIuN4g3xhEXVK/jYy/57REXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoduzKwRgJJMeYKSJ1yykkDwjVox26rYvjneNMlqvs+6+Nv/Vs
	x6yCr1AVdeeigd2hAH0L4cLTQ2tFtkRRl8auCO7p1BdUqTilxBhYhBjb
X-Gm-Gg: ASbGncswub7uYBqvB8p/D8H/+E6zOaiZqX1sVzUaZkfklAjNf7rENc9aorOc5I4WHQy
	jt1WwUBg7y1EBudvkLH94s03zQTP4U7R5WyTaL/Qms9Sgz/V/7TSkqEGdNUEtl9lLapQYi+Z6U5
	ttGlaeA7eeKwGAry68WUCYqRLhVe7KnLmmUyaBR2KzpvvKG4M7zcTMS25NlzsubTq8yKQd2cjZO
	YBA7nnpdtQEh9buImOhq+1wS60QIdSfYVjijc+URe8U9nzNDahMFbtLh4NJUSH+fTT/IwId3NLH
	qVKgk5RFT84uL6MSEkLADgMVafruz3aqSr3evJVXd00v/VCUlqNUbmElqmlO334weK7VekGUwQn
	D
X-Google-Smtp-Source: AGHT+IGhIGCKynlURH41S79mDAn/8USLtqeUYJHKGkiXxmzGTVg7ChX6bcF/AEXDADdXNf/Hh0XwkA==
X-Received: by 2002:a05:690c:f:b0:70f:87c5:5270 with SMTP id 00721157ae682-712c65149femr70877567b3.19.1750454774131;
        Fri, 20 Jun 2025 14:26:14 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b96754sm5864757b3.67.2025.06.20.14.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:26:13 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: dw2102: fix null-ptr-deref in su3000_i2c_transfer
Date: Fri, 20 Jun 2025 17:26:11 -0400
Message-Id: <20250620212611.3211946-1-alexguo1023@gmail.com>
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
 drivers/media/usb/dvb-usb/dw2102.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 8f694d8d52bc..54493bc490ae 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -746,6 +746,10 @@ static int su3000_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	while (j < num) {
 		switch (msg[j].addr) {
 		case SU3000_STREAM_CTRL:
+			if (msg[j].len < 1) {
+				num = -EOPNOTSUPP;
+				break;
+			}
 			state->data[0] = msg[j].buf[0] + 0x36;
 			state->data[1] = 3;
 			state->data[2] = 0;
@@ -754,6 +758,10 @@ static int su3000_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				err("i2c transfer failed.");
 			break;
 		case DW2102_RC_QUERY:
+			if (msg[j].len < 2) {
+				num = -EOPNOTSUPP;
+				break;
+			}
 			state->data[0] = 0x10;
 			if (dvb_usb_generic_rw(d, state->data, 1,
 					       state->data, 2, 0) < 0)
-- 
2.34.1


