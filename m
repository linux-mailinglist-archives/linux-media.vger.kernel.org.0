Return-Path: <linux-media+bounces-15894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64894A26C
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5F5D1F24F39
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C161C8242;
	Wed,  7 Aug 2024 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJGobawj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29EF1BD507;
	Wed,  7 Aug 2024 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723018252; cv=none; b=fcy4KSK0gujF2yzcfOV3yjzcYvngxWM2LPaTn0V+bk1S+in8GRVlSqzwjSntXgsLQ8JF2/X3MPLy5WpE8tBp1sRQ3EslpFRyXv3gX2tq37LM9GOWsJHD794x4bktJQI0Yp6wBR9BcxmuPnAzhgIi2GzDBwMHcLHDCDT2ODe80tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723018252; c=relaxed/simple;
	bh=LXD6bx0KHAy8nJe4vq+3BiOLk8raLOmavSTrjRgKDTo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lbYgVxmGPI0yG0oFmW2LARqNB8yIK1oFZn8+r4jJVfLB33Rar3gQm+GvhVZBijmtGdjzUbaBfdJnuGPTTxPoAGq0Y7cdYv1wlfU1NQBKJ778MfBNOAnE15GIbNqf2eS8efTjujFCDMUyQPLZhNxXc3u+FLNwlmpIeGI3281qO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJGobawj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so2134815a12.3;
        Wed, 07 Aug 2024 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723018249; x=1723623049; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+wX3M56CMItmx01++yQS8b+awC11CfKnL43oH7SAtmg=;
        b=UJGobawj7YKg+cgcisWQjNEJ4NzHeN+H2ikk3NXddlDw/wJyCP2gLZ79Dczn1MpLIB
         YPu424JUBjQo6pAV7bo6jZznGbI2iflGyRZwQAig7igT6pst56dkxR2UA1XVggw6Bf2q
         xS2P+NXwW6P74qgpGj3riBU+D3n+buToLRqydjeBNQX79FD1oeiSs3GSewIVdpUglgfW
         lo9iS9pi0zus79aL8kPj0aIbLMqQFEKXEOMENg35ALDflJ7ZTU7/Lco/6UV3WtH7o405
         4hjfTFMCFtE/8TsYB01mZ0rVVu7h3dLFFdLtZu0tYhIkxbfZMBUWt/dvl/Eid5utwr5g
         kFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723018249; x=1723623049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wX3M56CMItmx01++yQS8b+awC11CfKnL43oH7SAtmg=;
        b=hlRj9SxjNYNresBZHnYjfoFslM/+kZDqWSJsB2C0FJnLlOYM0ToI083ueFzpsD6G5/
         1ZWWVNTuPcurQLZPY0vKIi34Xz4umG/Zs4DmrEkZo8BbmT+GP09CrjdN9LcyuhrSJ8uE
         /I5sfzwkisZGHgsmbt2sVJUQk2btB/FcmLUzDg3jeTG/+vt+T12Bi59KuD4xGfJFXzQy
         8szVveKXDRqF3gR0AeZJV/AHtLCL2qZiGDSE3xvTM5EVtkZ3ahVoLTbfDGeNz9sy4ZrG
         WAJkx4HRN0VRzxndDn7ozHotMPFn3L2yP2F66APkFKnH9BnFSe/glaLSC0ITbZ0GfJ8g
         /ezQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE/wAQjGUCzAi48QuDq5kMy5EFiCLZ0wViu7Uip+qu7KhH25SFA3X+V+yvyWKnkk8NzKke3kOvrNPE/q2WNzcRLpVzkQl3ujZjRAkqtpbmi+MkMF472cm5ycFl0M57alkUH6T4xpvTy2A=
X-Gm-Message-State: AOJu0YyCZj8SaFKK5CqB0Y9mw4IJHhaiK96A71RumZ7LsPIGNfQKP+jZ
	mkdHWzQt3Yo0y0WRnWRyEny+7t3ie/sOm4bv9MJDMmC2zpRNhnQ8KM9SIQ==
X-Google-Smtp-Source: AGHT+IG8o8Vs0Vt5dCZzl+a8B+E/mF9F3PKKD4yplOWJx//BPHxUcHhzNzxNFqCwnltKbfi7eyiXPg==
X-Received: by 2002:a17:907:7f8d:b0:a72:5598:f03d with SMTP id a640c23a62f3a-a7dc5157d5bmr1300938666b.59.1723018248621;
        Wed, 07 Aug 2024 01:10:48 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c12be2sm614118666b.89.2024.08.07.01.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:10:48 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH 0/2] media: i2c: imx290: check for availability in probe()
Date: Wed, 07 Aug 2024 10:10:26 +0200
Message-Id: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIrs2YC/x3MQQqAIBBA0avIrBNMErWrRAvRqQbKQiEE8e5Jy
 7f4v0LGRJhhZhUSvpTpjh3jwMAfLu7IKXSDFHISRmhOV5FWcPc6OrlR2iovdbDGQE+ehBuVf7e
 srX0mx0uaXgAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

Hi!

First commit is optional and just adds the possibility to do a
cci_read() without caring about the read value. If not wanted, I can
remove it.

Second commit tries to communicate with the sensor (reading back the
STANDBY register) to find out if the sensor is available at probe time.
Currently, the first device communication is happening after the v4l2
subdev is initialized - and the communication errors are then basically
ignored.

thanks & regards
Benjamin

---
Benjamin Bara (2):
      media: v4l2-cci: Allow "empty read"
      media: i2c: imx290: Check for availability in probe()

 drivers/media/i2c/imx290.c         | 5 +++++
 drivers/media/v4l2-core/v4l2-cci.c | 5 ++++-
 include/media/v4l2-cci.h           | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
change-id: 20240807-imx290-avail-85795c27d988

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>


