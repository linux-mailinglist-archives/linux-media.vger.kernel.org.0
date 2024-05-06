Return-Path: <linux-media+bounces-10923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FC8BD55D
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AEC11C21BF9
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 19:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F063A159206;
	Mon,  6 May 2024 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DDvXz6fr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0144C1591EF
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715023490; cv=none; b=YY9f3AQSRdrKvAnZyNBHhHUrVp4/lNhb22xdp4JVAvA4MCDsW8HinnkhcpBMA25Aj+i1z7eRgag6cxrLyIva9dOk/cWBqY0s04KaW/snZKW5befyzKoMdRcuXP5idQjLaopK2ktfqG2lHYRjnt7qWO1SPROI8E3dPWa6kzyzfzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715023490; c=relaxed/simple;
	bh=zYQt3qI8XJ6OrpFv0IMRqdOFJF4KoM/Pb6Vxm24ZDw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HJe9ObO5DFrOB6Wsi5TyTmp951wOb+45PE50O+VfKcG0nwAgUiIUf73FqUsdB+/o0mIqs2DWH76JvKNe2q0EGFbr/mUUQvfzv+BqUK2E4MC4M10JSbplCiVdPkjRYnNoDAvAcBbhKvqLKfMR9OG6WRrZOnHXrp3h5XGJMum4qBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DDvXz6fr; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de5b1e6beceso2727518276.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715023488; x=1715628288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62kWvReLX/MoSE8YfO5lP7Yd06Z/Ka4KHCr15yccf+k=;
        b=DDvXz6fr/orRvcpyTP3J7rcKlD+yrt/zWzjwldVNeZhxQ42kEep7NxIphzhJxU/anx
         fTA0VYUvMDRPaJ6v7pxan9IH4Rxi53Za04ZNvBx3PSCiHQIn+wqoAvFiplN4N75+5Il6
         Z4JNe6pfBmA6NvPQ8OWgYVZBFfo0oUU9SunSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715023488; x=1715628288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62kWvReLX/MoSE8YfO5lP7Yd06Z/Ka4KHCr15yccf+k=;
        b=iJNdDIv9tl6SfYMgS/ImIxeh7XvPsnD+WjOAqs5BsIYES/eXKPz6R3dGHjPLKboUJT
         SqsjIlaVXIitSwooQHavF6vM+vVy5l5BvW3Ayu+nc1X6yNdGTtuybHMN5/giEaSMDi2G
         L2y7A0mbat7QJLAVmKUYnNi6EisDPGLhP+nFLJ/Sw+Y209dqdne0ReBrHgthQXFLYhc7
         WIaTlGLjygQX8aCzoAX5Ag6L2Wi+2D3ScN3nw+UnRFZPQ3zN43dfnd5Ltle2THvZ4wqH
         lqKJN8L4kSWIbGU/W/8akgtt0023VkmjkWzbptsN64xlVk0oN4LuL7n3ivp4mleZ6ZPo
         VfFw==
X-Gm-Message-State: AOJu0YxkCRd0NQI4ahBuv3amhcDuJJkuccl12RNft79LfEQ2CF8DTpt9
	AYMCPP9h4thiOlV0uNRybwQeMyg+b/FKVoPG0tIWJjGM8Ra6zcxBFxRAgs1UMw==
X-Google-Smtp-Source: AGHT+IHcWb5E9ASAPUj9u23aIXpNd71I/CHj/yN0+WqkyFpwUUf+ilovhGe30lBMZ89taFLE6XUZVg==
X-Received: by 2002:a25:80cd:0:b0:dcf:411f:e78 with SMTP id c13-20020a2580cd000000b00dcf411f0e78mr10894973ybm.25.1715023487747;
        Mon, 06 May 2024 12:24:47 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id ch9-20020a05622a40c900b00436e193f408sm5439870qtb.28.2024.05.06.12.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:24:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: bcm2835-unicam: Improve error handling
 during probe
Date: Mon, 06 May 2024 19:24:45 +0000
Message-Id: <20240506-fix-broad-v2-0-e6a2a5c0d609@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0uOWYC/22Myw7CIBBFf6WZtRheptZV/8N0ARTKLFrMoETT8
 O9i1y7PvSdnh+wJfYZbtwP5ghnT1kCeOnDRbItnODcGyaXmWnEW8M0sJTMzPXBvhVFDf9HQ/Af
 5dh6t+9Q4Yn4m+hzpIn7rv0oRjDMXlL0KG4Y+hNFFSiu+1nOiBaZa6xcduODmpQAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.12.4

Improve the error handling of the irq errors. I am not sure why the
retcode was replaced always with -EINVAL, so I have returned the errcode
upwards.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks Laurent
- Squash 3/3 in 1/3
- Link to v1: https://lore.kernel.org/r/20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org

---
Ricardo Ribalda (2):
      media: bcm2835-unicam: Do not replace IRQ retcode during probe
      media: bcm2835-unicam: Do not print error when irq not found

 drivers/media/platform/broadcom/bcm2835-unicam.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
---
base-commit: 1c73d0b29d04bf4082e7beb6a508895e118ee30d
change-id: 20240430-fix-broad-490eb1a39754

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


