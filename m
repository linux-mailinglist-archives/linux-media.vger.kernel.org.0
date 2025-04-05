Return-Path: <linux-media+bounces-29428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352BA7C786
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 05:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93705189D463
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 03:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7825B1B0411;
	Sat,  5 Apr 2025 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwIYbhEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC98224D7;
	Sat,  5 Apr 2025 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743823374; cv=none; b=tHCsrfYS3NyFyWxyiDhFh88tWfCDJzV26LjBKYLB5fMWJDagMSWI5qjgqqkickIed68XHgIG68wER/SITYmqIfcuozYMpTKj+X2KXeD2MwjXKRMJNnDHoraNx/QXl02j9lvagnMo58VYFRW8IBkd7xWYg6kx+4vQ4THvnDN4lN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743823374; c=relaxed/simple;
	bh=zfQS1I0/t8iogZE8epP0+gzjhlZo+95crijG7v9ksOo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=pFiVRQ0kl7pwS+SPTS0dCOpyfyDSbZfp+2pRJZ7U+XG+Sq9HuBXhmvzQQpB67Jcm7YNDOs1XQGw8URTpw9E0FQUm8y0QsmEFS4UoSXSc25nwu3OT6U5cDV5KycxXICXsf/RtqpXNBK0GkUaVMYK8dnNQbrkfFrOh5CYqgP0bPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwIYbhEy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2279915e06eso26663245ad.1;
        Fri, 04 Apr 2025 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743823373; x=1744428173; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWRKBHVVWSm0lUJY6W3wVCTy+8cpaJF59WRnWiheJY0=;
        b=gwIYbhEyo0MUyATYwLW1QdRVD1zzjlhPfXS/WoiSk3/PNtHUz2TcFmC6Qs1SWmfh9m
         fEGZtToHy1O564rklvonJKJoh05UAcOvjRmF87zajuUgX9K5oZ/wkhaUxoizGeGjLRma
         +YIkW6rwMsWiVe/0z+EXq3XEWA4QkUbM+XAEcDj208txOVBIGi8lLcPhiYK4JP8Z3kr6
         fUvBXfX+HE2xQoi7tqtQKcGJdWUp25musUzs9scPHsjqO0/Ox7E8aJ5PMboXN8MeHWOy
         s9WkCs4RDXLPXJXttmQ1KvRzTT7oI7Kkh8+ugV13uMC1irbE3EwPf0Q8Dqawog/tfumG
         txJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743823373; x=1744428173;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWRKBHVVWSm0lUJY6W3wVCTy+8cpaJF59WRnWiheJY0=;
        b=tu0VytJM+h6mmnu9uoumrVI8GliuWWGrm+XZ1c8tBiffK+yiq58yYAf2gb9KhLsZ8w
         BiN/gT+uIV9l6ZhCBc3svFaNgzjhAbK3L0WJ4yRZGCJLSM/E+zH0bDWoSCydT4cbkzCY
         NQ1M1AICwU0esnk7O0fsolnt2qPnoW6Pg7yd808paNsXjx8qOhMjanx2kNhogDfmeHnm
         cAWBg7BQZGTvgYaF9QjmW2bj8G7Dl5q7TtguOxxm24FxJdAjkMGc0QSGyrWUcpfrL1TC
         eHEIzfHHOHih4oAzRquvJjwFLp3pIXPNR25sBHP8Pf4RQ1tKmnaTTJtHbm9fw+TIKwN7
         1A2g==
X-Forwarded-Encrypted: i=1; AJvYcCVI5WWjo5EQA0x+m0/zA7+KffzIOV9lP5FV1Gk2ucouzvv5c2B9n8Aj1heci0cpjPvLfhpnYdeBRdryj+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxIx3VDuawx1i1e/8I3VDzNf5H0f9sICSm0e1n2vQj3Bssg2MT
	e6ckoREC3au0ox21GhTk4LE2VvFEg7KLLp6hR0OW67R6MpdotAp4
X-Gm-Gg: ASbGncslnfsF5pPKi7LfxmrZCgVHYXSbIioWKTMedaqN9tqqDr7sXH18WsQgSnd6gPR
	jUc16t6FZqnZEc3CFCUyIWY4OpwNP3hElHatJ3twjyJlyk/BqCBPSvN6r6hckXwaZsUOzvuaiMJ
	nB8OylA9yaJT2H27rkLQWGFonG0ums+KVUeE3YhqU4yNTQUH1UGtrnCKK4Ih2w9bNkUmx6GQKsx
	joaNAxmGc15FeEfL1VMxYAjcITkHejFnyuKsGTGM4yykKhYsXnbcjuO1NdiNhaJuLITHGCl0kQr
	tCQCBvVG2Dft1WXH+Vn+W6n9jSjalELHWA4Y/TMq8Ovefpe3s85DzDSnMmixjSWNAtW70e7ydw=
	=
X-Google-Smtp-Source: AGHT+IF/zDKC2Hdq9bRQnZYs3Y9Diqdg85UuB/J08Jf4aozSYYtaOYfXLjAmn5vjI78AYJOJ2c+qvA==
X-Received: by 2002:a17:903:1205:b0:223:fdac:2e4 with SMTP id d9443c01a7336-22a8a04a753mr77416265ad.1.1743823372677;
        Fri, 04 Apr 2025 20:22:52 -0700 (PDT)
Received: from localhost.localdomain ([221.214.202.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2791sm40505815ad.80.2025.04.04.20.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:22:52 -0700 (PDT)
From: Penglei Jiang <superman.xpt@gmail.com>
To: mkrufky@linuxtv.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Penglei Jiang <superman.xpt@gmail.com>
Subject: [PATCH] dvb: usb: cxusb: fix uninitialized var in cxusb_gpio_tuner()
Date: Fri,  4 Apr 2025 20:21:50 -0700
Message-Id: <20250405032150.123786-1-superman.xpt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The function cxusb_ctrl_msg() may not set the value of the variable i,
but the code uses it later. Initialize the local variable i to 0 to
prevent potential issues.

Reported-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67f092b5.050a0220.0a13.0229.GAE@google.com
Signed-off-by: Penglei Jiang <superman.xpt@gmail.com>
---
 drivers/media/usb/dvb-usb/cxusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f44529b40989..7fe858bb665e 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -111,7 +111,7 @@ int cxusb_ctrl_msg(struct dvb_usb_device *d,
 static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 {
 	struct cxusb_state *st = d->priv;
-	u8 o[2], i;
+	u8 o[2], i = 0;
 
 	if (st->gpio_write_state[GPIO_TUNER] == onoff &&
 	    !st->gpio_write_refresh[GPIO_TUNER])
-- 
2.17.1


