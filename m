Return-Path: <linux-media+bounces-13452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3B90B448
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0721F26945
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAC37602D;
	Mon, 17 Jun 2024 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOaPlwR/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D57B7345B;
	Mon, 17 Jun 2024 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636405; cv=none; b=RXNYG5MzY1XEhFxw86CUNNyz/zyaXJxtCovjb4GvfVMQvYIG4CZgNtmeBWn5GvHOf7x68Unun5MqZWQuzoiA9LFsw2WrXrCoexPmHVaMaXNpTd2fpov63wEcKhd8rY4CtM8vbN7MCrgllyN0Q8X+2yJPfFB9LndSBnFrszTdNLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636405; c=relaxed/simple;
	bh=/yLuFTxhW/cRM1Hxajkpa1Bk6e4/bi8oJL6dfSpenCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SV3+CpoT0+AAS97INVN+xw+iLJWeTcXxrNpY8GWpM5rdDOyB35m+eo8XgMbS1g5s1PhOxH4XKOGGtGNxm3Xq7FBDxWk1FHXEdmVBaaUU8gDh2XsbdgFUGQ89dtbPQ/dDDHkDp/TpEDeS3E1aK6yKgoFYsidEdztubffQrPIFaXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOaPlwR/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4218008c613so34009745e9.2;
        Mon, 17 Jun 2024 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718636402; x=1719241202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ahafJHQR7ziDyvBPhcu00JWF0Z//nznUu1fxy4ebBGY=;
        b=GOaPlwR/CwGQoMiXADU/ep+Kkifi7qSuQOg6igJgYYVw6fxqeuzsLn4PVmVa4YUNe8
         mSoriiLgxHjdr7i+t0B6krD+Rg+qM6T80AhRFdvWryO0BC3kuaWjJDvudmg417QZ5CEa
         gPzHfOrNftXzb7adlG3kZj2Bkr4oroz7oXiwBItfedOsKXWFPtbIozVm1/nSCRFZBkcs
         DY8oiSVreKP5+rxka3Koid3Yf0KA8Xu2KWM/cuYQU5yaqa+y4HwrJx27Zc4dr/2mA96B
         LQp9hhqedk9rizCKVQAa32usDY31PTICUGKbavMOsB9Iv8CvE2pdkPImy/5/UJwGppBp
         lsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636402; x=1719241202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahafJHQR7ziDyvBPhcu00JWF0Z//nznUu1fxy4ebBGY=;
        b=YPh4cAcBy5UW9/jhdat4yboeYjlp/L0/hZUy7lvHWsdxOjUha55MZQhMiqQYXnaoip
         5cPHYE7MSQqvcFw+4oNTnH/iFgUDtDNN9dVKI156r9WSSuclGgJqwbS05wEH0n1dvhDt
         ylUQ47DfDxPGi5Qn13EmIbWe4zdbO/b3xhdMJX1JJK4I3My8KiAr6a3zogM67J/Wfcdv
         Y2UDGADoFA926A68gI9O1pUOstHcpKfvczOYN75AslUwBN4uvb/IEx3tc4BGfYgZog8b
         o1lqMu2S5pH4iqxrSiuogiTbssAxVhjX3dw1yKFZQgreXAM57j5JzFYNCUOgeQi2Ouay
         6Jsw==
X-Forwarded-Encrypted: i=1; AJvYcCWubJs/4Hd/zT/UeoxgVNRQLe5niCPKJNeUYP3hD08xCVftHRqWWtA1EX9uRTPIEM9WFCd+ATWq10dxJiNT3LUuiLhJiU11/YC/K+RiCpZbIfr70scQM2j8wwi//euRFzqD3H4h/pzHOwc=
X-Gm-Message-State: AOJu0YwKQoiF4ZiVrR9fySCJvrDLdRi+WnChLOXka83kR3naRsUr38gT
	RTL9on4MIHZ2iYOZP4FulZHJaWYFI73iLPi2tOYB19+28tbJagTS
X-Google-Smtp-Source: AGHT+IHBPPI8WJnKq5LiioKv0fanknFkaTF+XMJ81uwf9dUY9q0X++P6tBxESFg3ukEygMHaf80SRQ==
X-Received: by 2002:a05:600c:19ce:b0:422:760c:e8b3 with SMTP id 5b1f17b1804b1-4230484f07bmr96140215e9.26.1718636401482;
        Mon, 17 Jun 2024 08:00:01 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-57-134.cust.vodafonedsl.it. [188.217.57.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42285574e33sm87060615e9.1.2024.06.17.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:00:01 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] media: i2c: max96717: add test pattern ctrl
Date: Mon, 17 Jun 2024 16:59:57 +0200
Message-Id: <20240617145958.1819069-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
Taking as reference the work done by Julien Massot on the MAX96716 driver
the test pattern generator on the serializer side MAX96717 has been implemented.
This work was done also to test and validate the GMSL2 version of the Alvium
camera on i.MX8MP ISI path.

HW setup:
 - alvium -> max96717 -> max96716 -> i.MX8MP (ISI path)

During the test it's mandatory to put also the de-serializer into pixel
mode disabling tunnel mode.
This can be done writing bit 0 of MIPI_TX52 (0x474) TUN_EN reg.

Test pattern output:
 - https://pasteboard.co/d9yFAR6nTrn9.png

Max96717 datasheet:
 - https://www.analog.com/media/en/technical-documentation/data-sheets/max96717.pdf

Thanks & Regards,
Tommaso

Tommaso Merciai (1):
  media: i2c: max96717: add test pattern ctrl

 drivers/media/i2c/max96717.c | 210 ++++++++++++++++++++++++++++++++---
 1 file changed, 194 insertions(+), 16 deletions(-)

-- 
2.34.1


