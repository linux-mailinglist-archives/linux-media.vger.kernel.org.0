Return-Path: <linux-media+bounces-29429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A2A7C7F7
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 09:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B5313AD51E
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05761C84DA;
	Sat,  5 Apr 2025 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3njx6D7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B90335BA;
	Sat,  5 Apr 2025 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743838352; cv=none; b=V1hQHwL+1Vb+klyTK/LX7GUdypuOZ2OTvnsFIrPhZtlG8rm11REG5B5teAYSsAEg3rIg2gehS+eqqkN2V91oPUEPyyhmP0sfCoSkNpcihQUvE8bja5ci78gf7d7QnSntoD0dsqZhWrs1mCOUMePFlVbazKTDNlHCD1aSFWzMeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743838352; c=relaxed/simple;
	bh=r2rZzCXm8yoJzmjoZJmKvHtZzk0bDrhACQdYpABXyrM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=jFHYexD9QFMt0+/EZkzNsnxVq9UAunC8xGAX5Y1g2QFiKlTO3geWd5Rr6AixHvMl+Byv4khv0C1L3imB1PRFZ1bZTuvQZuLMow2n1xW/qoLPsxg/DO11ltAD+75vyO7Nl0rsGxBVmHyIAFBsADB9iWsfjWSSWvjNqaKkHaGdpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3njx6D7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73972a54919so2595232b3a.3;
        Sat, 05 Apr 2025 00:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743838350; x=1744443150; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx8f3AHgyGqnhZdoodbs2e+2zLcVzYAtnkoxcx7HJx8=;
        b=H3njx6D7PpvIYGDY2eYflTi6ClwKdXLAzbAvdNV5xgbdWO+bJxKBmHzR83uqf9qhK5
         e9JA57h4EnEu+m/HLYkrUqZEUNfvPgKnqCNTT5GNyGXoNKLiot4bSBNJLks0w2J7wrGH
         iT6ZHxW7AJvC6VB4YXD45EF260gm6NxIFhBg/UOeYDc97yvRdnmjXgB3x7x1PgNPrfQ0
         X9sVIKlXGQGjDd9QfPvrtrgwd+r3jtOaXC7mjwyb3yJnoxjiVxH4dVZlcig2x6+6TllG
         8uZV3/kjJxS1L3WQhI3GPBTu7kAnRatt8e/e+GK1mGB37yCYZXpiBuQMYeKNi2e0rTjh
         Vr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743838350; x=1744443150;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sx8f3AHgyGqnhZdoodbs2e+2zLcVzYAtnkoxcx7HJx8=;
        b=nTPj7magQvx2E8aLtWoWJgqds4nQItc3asi0NmuwHeZ/JdYXZaXfR7g0LdJh8jNP25
         cfBZQy7qBoFOcrWYACWp26dHRS8VhGeZIVi+xUw5+sayBj9kzGbrQEXtNcOR6Vdh+cZu
         moLreSNuDawH+nDyvWEa9bLWbVnQjEa757UlrWexzbPSXrakPPnF1GBYp4fWI5jdF6A+
         YFy3QMSAZ2vDCOX8+ntspQh0fi0o273sKsvVyQxfx87mPMN5XP5KfbVMRqZ6sHJ6wsnS
         bHLzv0tY4Kt1lGJC9wYTRuiqFocwbubcy3NWvhTpvmMrOCV4oE7+qvW2RRNt6++Nydaz
         RsPw==
X-Forwarded-Encrypted: i=1; AJvYcCXIjwYusdLyP2zMKfjIMyfFbQmaNSepPJh5JXmiYjH0019cVMEhTmIR9FReRRlxDWccCUxuN6X4QO2hBUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiT0du4BAkyClevPnwswvHfW5qomMDoGduZtrfz3PHayieM/yP
	mTC77EEl4dRVnlB7sugvAXr3yJDIUSjcF3LETbY81fhwB/alDU/dnf9fOPJ96R4=
X-Gm-Gg: ASbGncuDWK3s5FefVfuGhYwrnAkdEUZz0hi5Uos+WoN/rfV3ibfFADNbUuuM1ZdVwrP
	RrP8Gbk5gXuTRsUWnulU2yyTfGbqtjzwG56KxhwRc0M/cjUg9v+LfnuuEK6kiC5C4tfqZmi/TVG
	tQfie7+BDeifJ4xv3khk91ERsaZ1PopNowijFEfJscS0c8ARiOPsWgKupDWw90xcoqsqS0BOdMv
	UsgnLSvIHF+p3Poz/OG9n2xE186y6D3yy374iJ8Iv41OHrc5WBtkEowoIctDw/KEMeavWfhaW7n
	O8/+TGcZvBin/7VOhHWo7PBWmY9uwrfp0JgfGoZ8HyMzyO0o9ul9FXZ1GkoCrCI+cwZqF4OfIg=
	=
X-Google-Smtp-Source: AGHT+IHg8GP1IxbFWkGEIiL5VYzfqXb7H2e6qlFRDRw9Z8WJ3E3SMZHg1YAUcKj5iIj6xeC457Vcdw==
X-Received: by 2002:a05:6a00:1942:b0:732:2923:b70f with SMTP id d2e1a72fcca58-739e7050374mr5902984b3a.11.1743838350038;
        Sat, 05 Apr 2025 00:32:30 -0700 (PDT)
Received: from localhost.localdomain ([221.214.202.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc31be94sm3295395a12.23.2025.04.05.00.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 00:32:29 -0700 (PDT)
From: Penglei Jiang <superman.xpt@gmail.com>
To: mkrufky@linuxtv.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Penglei Jiang <superman.xpt@gmail.com>
Subject: [PATCH v2] media: cxusb: fix uninitialized var in cxusb_gpio_tuner()
Date: Sat,  5 Apr 2025 00:31:59 -0700
Message-Id: <20250405073159.87021-1-superman.xpt@gmail.com>
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
V1 -> V2: Updated the Subject

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


