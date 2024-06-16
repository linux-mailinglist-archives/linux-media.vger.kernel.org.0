Return-Path: <linux-media+bounces-13326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7217909FA5
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 22:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5169A2829AB
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 20:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E23954660;
	Sun, 16 Jun 2024 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1LT5TGH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64037171B0;
	Sun, 16 Jun 2024 20:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718569492; cv=none; b=ON9uRgjm5jrzTrlB56wYdGzqkYcqJu42TJNIa+urGGubMFBpS1uq571OoK0fVvVDFFNyWerc4Ps4VT+iZVHDA+YAZnu6hVfA/wqNjvnxMv/Y3FlLMYYubdcvigivC8x6/SDdkUeWwECR+bFvZs9Gd7Vd/l6fuLR8FKIp5/ZVnZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718569492; c=relaxed/simple;
	bh=oNuaO1jo3KinBiiB0xSizdpx2brD0fHVwhlbtoXMEp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqA4SoFtc7rUh3yzqx/VuUugXsjpKyctUfnwVrCc5gv62ko5QUdK2J6vnOmXUoJ9veaaQ3Ze7tq7ZKqnDFjB3YKQ+lCRrlcUm17QyxISI+RS0jM1WAqIqeqM5tgzkDx+iylZ1kRX1hcrCSdaV/7RcVt6RRsHUCzbyUTEi2Llqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1LT5TGH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c85a7f834so4874742e87.0;
        Sun, 16 Jun 2024 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569489; x=1719174289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHVMomGHcSIp/epje/wT1wza3Ec47qxEB33XDVvopA0=;
        b=k1LT5TGHodb3ozO8Tyiy7YfCZetzcYYpbDN+Ged+S7kb1A76X3rou9UzQpouVquV/U
         aLqp+stTcH99FaCDwXjRoTUeryyU7MxJcW4/U1i/zWozNeDmL1qY8hOkqTBxY5vjpKw9
         Jtk8H7kC54LTBRYpW+6drhYZOgLy3FRHtWS06HOJvqq6oyRKfHeOIw2BI/xPoarnQ6bK
         DCzA5fOuk3vuzulzf47Ak2E68nSLqSXE4BYmUkZ+79vV/aBYcq2oJ8UspJzLykLDy0k7
         469vn2xjGKgkCuB+Npr0elXU6N2fCLfi3LnoC26nm0NVZIJuKLbsX0/heUjK07b4kZOT
         DKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569489; x=1719174289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHVMomGHcSIp/epje/wT1wza3Ec47qxEB33XDVvopA0=;
        b=fdu6wlP1ced487jmIg7pFVDgLME3OkOAsZQSH9i8Pt2Dy1W7SALqr88+6gHA3AKW3/
         T2T78KFoIU5mTVfTPFBVVY7lXVEGo41szw9dgz/4Ibho/FNdQJa0IwLPDuFeqmy4afAQ
         5XK4p0y+WN4ikg5H0jx7//3c/mElIYFA/PETM1Rr+fm2n8VyDGi/fNlCwJVoRhaVBJJz
         iRab/xXsefcLkLFM/zxMIZ3hdfVklVaIz5tNxJzskizOJQtROU/DLG/YhKCFF/KQ2YwW
         Y8OnjX6C36Hmv6o3NsxKRgwV/6q34j21JjVjQK0U/ayTZA5n0mdeB6vYzbqJmo8mxx/j
         tSgg==
X-Forwarded-Encrypted: i=1; AJvYcCWE2sO0zqCQyCgJFXDGt8Sxopa7S0/vGYs/2JJQx8aWmcJeg8Go7nznrwOeE/2PLLPSLYBe2+7J5ciYQhxrwsltODbnXEIB1cZVAA2E
X-Gm-Message-State: AOJu0Yz0WeY5n4hYreayuhGHbnw2VAZL8yXRXIETtDSS1DLHGU54+2hw
	jZwKaTTmjDVJMrQI5n53Yhyca2OWjNDF0bvFkUCWnkrtFlIW2kLm9HaHcvLb
X-Google-Smtp-Source: AGHT+IEqpLSg09ZjCQsKqhFp0zYgRb/L5DnUeDl0q6jbFoQUfKQ1iUS8cLtF4HS/+ELyURKuxSYWLQ==
X-Received: by 2002:a05:6512:3298:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52ca6e90a9dmr5718182e87.43.1718569487433;
        Sun, 16 Jun 2024 13:24:47 -0700 (PDT)
Received: from localhost (95-24-152-217.broadband.corbina.ru. [95.24.152.217])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888595sm1081618e87.284.2024.06.16.13.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 13:24:47 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 0/4] Omnivision OV4689 cropping and binning
Date: Sun, 16 Jun 2024 23:24:29 +0300
Message-ID: <20240616202433.227895-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series consists of patches 17-20 from [1], which were
requested to merged separately later. No significant changes have been
made since and the R-b's are kept.

Patch 1 implements configurable analogue crop rectangle via
.set_selection callback. Patches 2 and 3 are refactorings and are not
supposed to introduce any functional change. Patch 4 enables 2x2
binning option.

[1] https://lore.kernel.org/all/20240402164552.19171-1-mike.rudenko@gmail.com/

Mikhail Rudenko (4):
  media: i2c: ov4689: Configurable analogue crop
  media: i2c: ov4689: Eliminate struct ov4689_mode
  media: i2c: ov4689: Refactor ov4689_s_stream
  media: i2c: ov4689: Implement 2x2 binning

 drivers/media/i2c/ov4689.c | 483 +++++++++++++++++++++++++------------
 1 file changed, 328 insertions(+), 155 deletions(-)

--
2.45.2

