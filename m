Return-Path: <linux-media+bounces-22162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F69DA6A9
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70FFA281FF8
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4D61F1317;
	Wed, 27 Nov 2024 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Srf1O2gR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com [209.85.221.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA201EF0A8
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706124; cv=none; b=oi1N/c6hjbSkZoNe+XAmKERESmzoq0+iCVUOHkfc2xincAAeSGNxHcU1O1bWbBJmvMt+obAa+UFW8pWAmNBLyPbDeqgPy+tRKsWkfzFpLB96HAkYKnwlpzVjnpe8Ih1i4azhhui49KNeD8Hs885nCAt4hvwLrB17b74EshAII58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706124; c=relaxed/simple;
	bh=PK2PHh+2gJf3de2h3H9Noa2ztPJEtrgRbPaRX2eG3SQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HeWzPoOusZ0eRtc4aBdkDVPn3nMPHeWsnE7TxQDWcJWIpKhO3bY9P6Hohcgq5cxZZLYYMmPKI52W/ozk1FMY5yIYAVIlT/PWmnCLnqYJJ5ZqkvBAOZX/5mtFGf/o5jDkml+c0IX/9c7HvivazAaXzIsmTCyXxpJHMdaJtgXFAg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Srf1O2gR; arc=none smtp.client-ip=209.85.221.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f100.google.com with SMTP id ffacd0b85a97d-382442b7d9aso5048582f8f.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706121; x=1733310921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2z95vIVxpdoEpIHV1Hs2li8opRkM10lvZmaKrYhPuQ=;
        b=Srf1O2gRn+t2ltotUUHoW7a4uYg4cKjXRFB6ynUWmDdhQW3niqNk4CRiqn90Og8hK7
         GjAh/x59oPmuPJg0b36cdDyqVh/DyQkfcfrG3qCXd4QJcKMDH1LnD8bH/qtmBvdmbAP/
         yD5fFybx46GusOUmb5erxw1qvwfJdrJ9M506Sf0K2tLDtXtoaJndYs4wgU/7TJnXzcG9
         88Ar88GoRZD8NNubQWvazv4wLE+KxAlLja1xMkoqzvy08eyKasbQhGmpHhGiQ+Z/pLlQ
         76tobu3r0IDKOU6kQ71R+euauxq4g2HuNGDWl2tJgkqnRA8qTaMStDFjtoZVDkHDRf+G
         /wZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706121; x=1733310921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2z95vIVxpdoEpIHV1Hs2li8opRkM10lvZmaKrYhPuQ=;
        b=dISz90JB9Ev8TG9fsNhK0ThWKaEp2JNghO6mdsz7LOxRThE+c6wZl+3Kpt65dqlcqx
         Hw+YsAg7LdjDk2VzzKgytvfJPZlw+CFijJJXSoGpBxtLdqXF6RsfHoPDWZpPxb2BL4dS
         1izhdzsSWT0drXyiwiHsg6msM1U92ASHaRO/UDwKKxITkPB9l9R49CeqeR0zh8ORjb3u
         hxuZfsnYAz7kZclDO40LCxBRaXw0S6v9F/8S5ob4PdiyT9In6BVfK5UGhzrfik6xRk1N
         U9zeDCXpdpiNj34kVf4lJNoLo++CaTWs/p0DVRdqHLc3nL9uzFhtIOdlOpE/9OTep7pY
         diig==
X-Gm-Message-State: AOJu0Yxt39MXLJOwmeqWyA0UGp6t+2GoqbvOJ5/3MT9G1CoG8zaPDUsi
	crQnjYDCkYypVA4mBwREHU67hTaZeEZegICKd0rBvjITaV3aVX+dsmGtQN0gvPdHYAGepg5e9A4
	P3yalGCsLc5G1lxt/rUU6zV1ocknlfPWN
X-Gm-Gg: ASbGncuRJFVho2isqAgn7pX449j01c9Jc5I9a73lFYeuaQcAjAeupL2Y23xTgdW6Hh0
	wF1ITRy7VIyy3sTfOQkFr998rgbo1NFHdfkMOENXOgRzy8bom4MyT8d1ss/cI8fFeOHZaV7DB7e
	rFH/xdOLu91wzOzVp3+Ykz25ROCymzO9hbBUSPRaIxCdxSNFGQ4qZnX+jxeWHNasyZbrEVskSxr
	BRoVCAGHa9zfOpWgMpC0Jv0kEpVRWm3byHnQxMxG8UhgxD2riWB0zy7B67YbZasxA==
X-Google-Smtp-Source: AGHT+IFqYJhAmhFIs4MrJEK2DwK6ZnHRiHMIjhqtLKd1Q8gK+tAk+5Dr+yVE8hWUGs5AFt4Q0h739aNEfBbT
X-Received: by 2002:a05:6000:18a5:b0:382:2349:5a7b with SMTP id ffacd0b85a97d-385c6ebba1cmr1732527f8f.16.1732706120527;
        Wed, 27 Nov 2024 03:15:20 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-3825fd0041fsm441847f8f.95.2024.11.27.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:20 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v2 2/4] drivers: media: bcm2835-unicam: Allow setting of unpacked formats
Date: Wed, 27 Nov 2024 11:15:13 +0000
Message-Id: <20241127111515.565992-3-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When matching formats via try_fmt/set_fmt ioctls, test for the unpacked
formats as well as packed formats. This allows userland clients setup
unpacking to 16-bits from the 10/12/14-packed CSI2 formats.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 36fb186a0421..d573d4d89881 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -547,7 +547,8 @@ unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
 	}
 
 	for (i = 0; i < num_formats; ++i) {
-		if (formats[i].fourcc == fourcc)
+		if (formats[i].fourcc == fourcc ||
+		    formats[i].unpacked_fourcc == fourcc)
 			return &formats[i];
 	}
 
-- 
2.34.1


