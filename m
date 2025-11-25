Return-Path: <linux-media+bounces-47717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB083C87051
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 21:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 58B5F352EF7
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 20:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C692433B97F;
	Tue, 25 Nov 2025 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOCQOhyC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFE31ED65
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102237; cv=none; b=EsUYlbBPTxP9Fxc8oW5hUnv8zccrjXGSM38kmWULgcgrzykre8zdPjhm7vp7IDlN09xJrUBBu7azpQN1jqt9DUulsP0iC8I3aCjGqbCA89aDuLuhXHCBAv0656HIdZKnLZOTz/6PR1cBWCc2kt9uzTuVJVJHr2SfFS/k8bVm+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102237; c=relaxed/simple;
	bh=WFDRo48TY+OGkYnJf8r9lMrykJuNpm83q+h1I+y4LH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0tom8pqTsk4advB2Gf7fwiUv8Wii25ZlDkbjUVYSwLDZu9/g+X7hApXg2aCXidHyLSOuBxxyGDtKlk3lXDTv991tdLG/+/pvEFb8f5aAO086FIuzz1LAz5i7vCJWgYffUtxwM8mqVrtGPfS6+dtfkPkYRwj7+t4edv6TSKg+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOCQOhyC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297dfb8a52dso5275915ad.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764102235; x=1764707035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=GOCQOhyCfzRXDYn+bxZ6HESO43hswJi9vgSIfjgL3CA4nsTbBiR+8Zn1KV6PaZbWJ1
         g8fF+ET+v8eRIDtARehpQyOvBBGSy/fFW8EPGf/b84y3GdhBjfCO3I3+B0Cb1CpLRwuy
         3j8hgyfspWRPfANpyuM76xI19zTyEN9Dsf2uhRJJenIGRKu0kfbDjiRijLi/VpRfh7pI
         8uCMoVHr8u7dCPHedWMeosQgOvsqJxKoMuDOFvyI4PYJB419HhkWyxfHHLX0v/5t0/vO
         hw5vwvSKeq4wnvnTHkjld0lsml3dhd1NUgdlJQM+Jh1rhPuJhbNlNI/yM1XRI33X0sEc
         qV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764102235; x=1764707035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=wTTzwZ+B+qrEwf77/s5N/UkFdLMpN/LNjbrYlyMZ+SLY/KW+hMwUnLlup8cnsmEEkV
         s4YyPBiQJjQat0aOtMAO0eFfoO7kbx8jdsjNoWA/Fs9oXaXjAPVs6R8OEFy60JBRtV66
         YQ9EDeQKo2XIABrzf7GhFDcIfR9h4lTX+ptkcgOZkhx9dFtITuuk3zpRUuA9DFW3Ipnr
         YgD5EfHRAHCY++b3QZYgnxWNP3B74FgMx0BxNompvejpVckgaPHly9fWD6D1fP/MN5Fs
         3vkRvxgJKKFW97kqmQooVaK4O/B3K5mZWVyF90ZUaGvgr25qq3fPBGp3MYilBIwNcayV
         sZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd32pYwIya7CUd8Y1sXB85O7/sqh/zccTXeuC6Ewye+7UXjloY2XxJYEoMagXaj4y34nz2tPCx7J2Wfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybWVsVCN51mVZ/M5Vr+7Jm8HUDaICbyZg+mwfxZr96d5T6lhWh
	YapSY2tl3Yby9pz7JvUPaUdseZ3NHE4Y1gFcMaVhsrhb9oUpuPw/A3dj
X-Gm-Gg: ASbGnctYr4G0W/aXg5pKsnD7JB97PN6s79Ujvk195jEBNUAd7foge3ueb2QuQsEkFcu
	WQBfIvdwlC6+kF7ckT2BYiJZSGtC0gLKHX8Ue3gGmTHqPg7eYokRaH+QwJiDJ/WTJqS3nzZGcQL
	z1B2KC/qhZTcmBsAXgCnKi9tMVlE9nijFfQrKuqrqa0YDiSgZxPEIFJrfRgKt3aXxfv/iZ9fKMW
	ZoeL806tiTwrWaZMx9i9k/ECo0UHJIlQlg1ofFilz1CfDTZC6HdSho0Kyb+ShaFNVsDVj2Ndtbv
	gT65OQWfbk1yoF4cHY4aJbcpgM1zjnYj0awJcuwpXAPeLMzBhiSb2KOi0IF3h/7iCegyyCGV/CZ
	1SKmzJNq/cWGowPlpTPjXHbmEJQmZDO7NJsbXyBW2VrOGPlvrUrHGrzTdLyf24ltkeylH9pddjq
	An8tJpHIU9gRjYp0w=
X-Google-Smtp-Source: AGHT+IG3RTcRxFUsAo8usCNv69f81QaKk/JOFHEXI37wwk5ElPTb6WtM/qi0Gq+AIsPZSO6XeDWvSQ==
X-Received: by 2002:a17:903:1103:b0:299:bc94:7ded with SMTP id d9443c01a7336-29b6ff75aefmr104832265ad.2.1764102234966;
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
Received: from Kai.localdomain ([106.222.232.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e638sm176386135ad.58.2025.11.25.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
From: Ayush Kumar <ayushkr0s@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-newbies@vger.kernel.org,
	Ayush Kumar <ayushkr0s@gmail.com>
Subject: [PATCH] staging: media: Remove unnecessary braces from if statement
Date: Tue, 25 Nov 2025 20:23:31 +0000
Message-ID: <20251125202331.36505-1-ayushkr0s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


