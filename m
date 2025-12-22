Return-Path: <linux-media+bounces-49276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11513CD499A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 04:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9CD430010C7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE853324B1F;
	Mon, 22 Dec 2025 03:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWzY5sbS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA9D33993
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 03:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766373000; cv=none; b=tVUA7l7ERDu3vr7aiQgbZyjFEJZx59Hac1GXrsmikbboMinhaKfGwIu1QQ8jgagbaLeXHNanaLCyDeVng4/liCud2J7JCHjQU1D8v1rEWZ4EtmvSfykmer3sH3NKk363eOW3C+oYo4ChlwqKhtbAXNg3yuydGZKxMHauHf61p/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766373000; c=relaxed/simple;
	bh=/iUy9c4KC0iYemU115OvpRSIN/hhzQMBaWVJ/vaQjvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7P4Q9l8wADJVY4ORgHpOrVbnXh4HW6nS9B6X9VVh7PdQQFi6jv4hVcMRrIyGqJFJvpwodIFW1ddgqR14dfmW+jLoL7FfLtQl2//OpDrRZL3PZvvQsD7fh6eRFI/rrC/hyubPaWIweE1tn2kEqLlMFBS9E5Gh6/B/IDB9zj77pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xWzY5sbS; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-37e8892d4e0so7648731fa.1
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 19:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766372996; x=1766977796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6pjFR7BbwgPBq3UsU9PCIENFKARXPgeOaclIx5OLL0=;
        b=xWzY5sbSdxmXrtGBbUQfkgN4puoE5/MoX1CaweaSSxMXO0zCtmF3yjYx1JQF5Yvn62
         wqztrt2fc5JEABtSTMlJB2pEe+RTV1RYS3Qe22hefVxdej78+YnJVzhSVuz8xs3a2Ht4
         u5zUt9Dhcdl0grvdR5P1hu6sspBqLPu0WtAmZ9fDJLxRO+GyBCzLQTZYuyUT6LE1/X5f
         Jv1v6DFZJzWRFExzz+VYsEXMu4VmlA5r+VFgIaOqYv6LcerZJNWv/1rmzJExxzWRGYg7
         iNH7rBemeAmaczmwX5VOOgnC43oDXhggJ2NA2AfrLH0d5oi+GtE0ghIWQ2aLvayPz6So
         CkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766372996; x=1766977796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6pjFR7BbwgPBq3UsU9PCIENFKARXPgeOaclIx5OLL0=;
        b=dIe4GDS7MFbHn4tROxXbY6KLRfMg5xyZrJiNmMh8quoWzZ7twUAKUyFCOPQF1ddUb4
         htnkIwUHEZ/rXyvdjUFeJJyRIbSeCHYSmU8MxQijNavHCCwZfmRPQfXula/eOkj+6Ypi
         TwZ7wYYhfx0d0q3CehjcL+JvDpOXhrfZUzXNbgeNvx2MX5a88VB/YaR5zJPYhjbNF3NM
         xarCoWks2PHUjlKNX9mMeYZKOEiuJK6MM6pW7AAoRf8Est8VTG7SdoCvNFnLdog+lH7b
         c6Phn8jnBmCq+0500dtKuL8GfHAhaQNjaw4DVxYHflvLObHlgD+x3QMcy2UkZRuv6zhJ
         1yvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl0QXOzf+Y0s6bbSy7N8l51PWq5/uFbxT2fKuU4Vn3VrPAS2AGjYihf1/Ms9kTbD2HnkMfuoUF5fx3XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoT0HrRRwBoJNNY0zGWAqyZ7zgtv+Kxr4ms4vm+4hY4yQOrzmd
	GlRgPeplmoZAPoG7oUy+ajttqBOF9R234YZmejdkbWLc9dxbEEsiPlF8p0xKqvHMkNM=
X-Gm-Gg: AY/fxX7Nb9p/Zpt0cj//CYo1E09LBXoqAJ4eJBnT9QoliJKKWdHLpU7f/wqb8Uo7FRh
	GXKKNy2wNUbFEIqttxxp9/yHjVl+4k/6eDB4/bZn+aVCRRWTkccJlJs+MCaLKhl2STC6/4+Q47S
	63t9EfUttYaKWsvAbs5w13CNfit1jizgPXRqtUDTOKxGtB0kTkUziXm0WLwBljtUQPnWVpEXg1/
	uSs9R9H+tsv01/qXCa3La+vqqIBWlWxGs/unOYkAl0ugDiWuJEKlvOhqMGvw5K129cyvJvb3Kvo
	2MRC4Ea26em396U/zidDwrLQT/NLs/8mczCZ5ve9aZUnbpmS+SDaUmRb+g4xYwQ5d8mjWif0Ms4
	EvZWa/WysabDrt/zNabjmRewLHQWnroEdM4u4vW2ix9Q2Uqoj/jF9WF2DuSweJdKfa8JCJA+6MR
	lee2j9rvqRQ+TSdAoqrVTOT2mMZhLqZykVTOdiaqxn6pjuNhD65lbzOw==
X-Google-Smtp-Source: AGHT+IGC23/8v/9RZyX88EVVBJ43z0mtM+kczxoQ863K7hO2UUttG+WVDX6tj348Ve7JV5pWTPmgKA==
X-Received: by 2002:a2e:bc0f:0:b0:380:a1c:7037 with SMTP id 38308e7fff4ca-3812152aa0fmr18042271fa.2.1766372996401;
        Sun, 21 Dec 2025 19:09:56 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b360sm24176901fa.28.2025.12.21.19.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:09:54 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: ov6211/og0ve1b: make configurable vblank controls
Date: Mon, 22 Dec 2025 05:09:45 +0200
Message-ID: <20251222030947.3327665-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configurable vertical blanking size control allows a user to set a wanted
image frame rate, initially V4L2_CID_VBLANK control for Omnivision OV6211
and Omnivision OG0VE1B sensor drivers was implemented as a read-only one.

Changes from v1 to v2:
* added a check for return value of __v4l2_ctrl_modify_range() (Tarang),
* added gained Reviewed-by tags (Tarang).

Link to v1 of the changeset:
- https://lore.kernel.org/linux-media/20251218014155.3265999-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (2):
  media: i2c: ov6211: make configurable vblank control of the sensor
  media: i2c: og0ve1b: make configurable vblank control of the sensor

 drivers/media/i2c/og0ve1b.c | 55 +++++++++++++++++++++++++++----------
 drivers/media/i2c/ov6211.c  | 55 +++++++++++++++++++++++++++----------
 2 files changed, 80 insertions(+), 30 deletions(-)

-- 
2.49.0


