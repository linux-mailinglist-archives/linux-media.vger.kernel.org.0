Return-Path: <linux-media+bounces-30611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23DA9513C
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D841B1707D8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 12:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204AC265618;
	Mon, 21 Apr 2025 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce87fbLB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347EE13C918;
	Mon, 21 Apr 2025 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240005; cv=none; b=BUkgFNWws6/VxNfKiG56m/fHoT2cg4TNOlXhjUeoZTjebGTtrPcEe9YHJKlA2RmqY+yxOKhq5pN5nsSQONbPVVm6FBcXcLSRq6kswBcbnuyFk1PMXDYj6PJt0lUDFcznP9/0XyEN0PFoFk3Drt2JyZuMOHfYubwEZcgH7kq5Kos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240005; c=relaxed/simple;
	bh=EMk0vf5ncHir6gspRE/S9VWNaA6+A2Zx+Wr7pmtoO0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cywA8hiKGIst0OXabZhOREmt8XJogH4HQMzDwYhaXvTtppLxPivvbdztG58P4JcY7ZBfV3p8Rj7HN1dyJW4OF2uR0YI5rPYc4aLHNYmTks6LHca0xogYrev7bBsgDOuazozHI9Hzuyn1w9d4O7mxdmfAkPGZOicgNXRcZOkGTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce87fbLB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227914acd20so38624345ad.1;
        Mon, 21 Apr 2025 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745240003; x=1745844803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0Z341bhbJdfIluoARghNHb8N7p7HbS4gyrfYZdno5M=;
        b=ce87fbLBAiyWmH1qhCbH1y8HytmRqDi146zaS8tEmbmi7l7lx/yJH5wTjCv3qJzZTL
         U4YTreWWQvUAdUqlHwpN4ULhw8MLOMPpzDM9TmdN2fvxhNFZOAh+j/EEUJ2aMSUixhG4
         MPJQAo5r3boecGeQRCiO5kL8jY+Rr0F+c6fvWhehGYgT0U6EWZeAzQ98py7PjPYaS6gE
         KzMt3XPF5oXCU0vCFq+HE+a5ZVjzUcelYbBV6X2eDBf8MZzlHHOCvbhYGoUmAxu1ViRr
         TCb6cW0A9Mt0+/ni6ttGAs0nLcC+moNDkUQNPe5uVESy43YeN3gNApKzugwpcEx8xzGF
         mkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745240003; x=1745844803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0Z341bhbJdfIluoARghNHb8N7p7HbS4gyrfYZdno5M=;
        b=LeIzegFkS5QD+s48R2tvNMYSLAGSKGgypSgqChH+KmlgKxMHOQBrNQH7qF4eJusSax
         X1GPhOfSsscoigQ24YL8kqolZMCEUUjZkuXHIfqJ17ID87FB3WTXavKMZvAPIgcEbCzU
         luXhZfSLv7Dvpoi8/BWDIfxv7ndbMHR5c7lxpmTC3bI8rAaj8JkiiU/rB9C8UC78/N3D
         Mdsky/ubA15YRh9cPFSObSDwZUQH9hipf+FJx7vsbuxDiLeqdgIqoGPW3qWZ95AMaPna
         HjyuiGNcXwrz6X5mHePfl1MjHuq1XXAcw2Am00+Yafk/k9AsujACWc3E+nstXOtRfQqa
         JMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCULM/okMZgNhlAgbyhGHZ3kZ6SaCKaIvU4JvbK2yLMuZh48/mrcLoGV7cLvTItmlHb3p0tIA54E4N1HWrk=@vger.kernel.org, AJvYcCX6yW8o7zlBN6GuDx+ATIacmzt9fEEdYZntZl9690fzz6dDd9ce2c0RqFGXKiJ90Z4C0AcMCUB1TD+Zk3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOjafM2+GVvkrsSIk1ABhfjL5tenz5VO2v1jP5AUuAQu+Jjla
	c49CU0sSEUKO/FTwCaxe4GDWSmtJDlvuAmPdX0f8lRK67QeX/cWi
X-Gm-Gg: ASbGncuho9nMNXgrdnis67lc6MWKRvScHucpqxPoWiBd+75y35SvonR7xiwFTCs3eVm
	Qm3o96ml1P3IgTIlwkViqD6e4CuTvs21LYnA/dna+dlUlyF67UlmD1b+AJFevMOx6ulrfFn2dUw
	MKE8pnbmvIWG7BaCTQkm6HNzxxTOZAePs4V7Wph+xcSHVI48UZvZ9FBkeSZFuDYZWlVg32I7z+2
	4JGO0JWZQyEL5CeI96DL39X06jwJ97UU8uGSLX5seASvzTH4Qp2jaEExu8a+M28pfsWmGKJJtH+
	ao64ZAPJPderGFPrQuxewxdZB7346+CupBTzqmuBhUeUqaePL0uW5h35ADt57OiXAYE06w==
X-Google-Smtp-Source: AGHT+IFJMcxqkY6NksDb7towAd7IXmFRoakqMANRynQDyHmuj+ex6qS8cVjsyH7ucX3WmvzxKS1Zdg==
X-Received: by 2002:a17:903:1ca:b0:215:a303:24e9 with SMTP id d9443c01a7336-22c53e1a14amr157747885ad.3.1745240003317;
        Mon, 21 Apr 2025 05:53:23 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb44sm64403675ad.188.2025.04.21.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 05:53:22 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org
Cc: christophe.jaillet@wanadoo.fr,
	hverkuil@xs4all.nl,
	royale@zerezo.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
Date: Mon, 21 Apr 2025 21:52:44 +0900
Message-ID: <20250421125244.85640-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rlen value is a user-controlled value, but dtv5100_i2c_msg() does not
check the size of the rlen value. Therefore, if it is set to a value
larger than sizeof(st->data), an out-of-bounds vuln occurs for st->data.

Therefore, we need to add proper range checking to prevent this vuln.

Fixes: 60688d5e6e6e ("V4L/DVB (8735): dtv5100: replace dummy frontend by zl10353")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/media/usb/dvb-usb/dtv5100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
index 3d85c6f7f6ec..c448e2ebda1a 100644
--- a/drivers/media/usb/dvb-usb/dtv5100.c
+++ b/drivers/media/usb/dvb-usb/dtv5100.c
@@ -55,6 +55,11 @@ static int dtv5100_i2c_msg(struct dvb_usb_device *d, u8 addr,
 	}
 	index = (addr << 8) + wbuf[0];
 
+	if (rlen > sizeof(st->data)) {
+		warn("rlen = %x is too big!\n", rlen);
+		return -EINVAL;
+	}
+
 	memcpy(st->data, rbuf, rlen);
 	msleep(1); /* avoid I2C errors */
 	return usb_control_msg(d->udev, pipe, request,
--

