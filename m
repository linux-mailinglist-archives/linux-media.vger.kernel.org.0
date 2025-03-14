Return-Path: <linux-media+bounces-28210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D962A6117E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E52619C2E06
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 12:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16DA1FECAA;
	Fri, 14 Mar 2025 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SNlztqnb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7401A23A4
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955878; cv=none; b=LCZ1xDmYyGYe8wJdrOIubT6j7FQJ59hQldBQ9/Cq1WB8ZQuQsK0peECOsCuPytf4yxkLEbIC7gSgnhaXP7U9/ikR6HYp6UhAxB2T6GSgkhJ/16triInr8SMnF6DJwVnK++OE/II5KKGG6pgAt5AvEdiC7lyk11de4hBsJlDwkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955878; c=relaxed/simple;
	bh=CyjMAiEeFUtNgSv1RAtmuvW70JbzJKcBVTy0vnupSwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y+FDENBFh8bZK74LxYVsjE/w0gavnNfHUtwlck7AMjBQRHt5jLBAhouLZcotXDeGz6oLSgQi8dLlRiNjgHOPjNzbRuxLfUxeMKMnHlA35LsrOa+JbJKdAVpPAO2GEDsF9biE3w9txXNpMxNufFrqYWQerkVYMqkKrb6z3DjZH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SNlztqnb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e6c082eac0so19323556d6.0
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741955875; x=1742560675; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHKlpL2RKV0yw156H7btRv6hu/hx5zQsm+jaj7sz2is=;
        b=SNlztqnb4OrwXw8HP7z4xJbpDVbvZCfEfPpKoqtLFY9iHpQU4hV9Zcstyl05ALHUCm
         56MtxxAm4lKtAVAGB/HH83jjhmj89+TKih4ibicDoyNlH/Y51/py3zKTRuOisA6vz5Pv
         UvEdz6V9mnPYOX6ZG7q0AI1I63EuKmgfOIUd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955875; x=1742560675;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHKlpL2RKV0yw156H7btRv6hu/hx5zQsm+jaj7sz2is=;
        b=twdbH9uyIP2ttF7Tor/5rTYx4aQL9V57wFjXHMKmKz5x85FTZI1ZhDHXMPecXzlkIB
         srcS42UvTYRu7VeJMnjmQZcN1D6JkFcGe7ODtnrrCkdXmkNj9dmy8ASiN4s6C2GBL8RR
         01YNk9gzLizco5s/rcaRrjGRqZeJSGbFqHYlX2i+XIfqxbUgwWCzj6aIT8jpmTi8m9rv
         /RbVY5vydmn8LrYlGgSaIcjiNo0tkKLgSjwOTxDPTtWMdGmZIjaS3HWFD0Kr/tJN4eZ2
         g6XXlfR8xygVYA8oMAYrCFQQbzztc4Oo5UyRc4sqx6r+WMro5GdlubsjNBtQUdBtNi0v
         1uNg==
X-Forwarded-Encrypted: i=1; AJvYcCVftekoOSJq5ULHiIKy9zfGorn7V1DocgMNZmywitY+RWh47yVema/qxb2WadGH8lZO/8qaMfbtN0uzcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Yuuwu9puUhNJObUdJZU9JwozzDQ/XY+3e+fvwerpWoWyLzde
	QVHN/gUmTVwCtbkZSoKGyKjOmcqcfZzHeXGyYtg9LiX/ILg+/0tE0NlP2i0H5voEI4qvjy9Cx3V
	Sfw==
X-Gm-Gg: ASbGnctSy/HF3mC6WeG9pqgDio1rJoEPB/24JbMkkdI43ObkWYVQnSUICBw71EmXLbS
	yJ5hWl4HuwV325iJg1TDhCEKoh9751w/g0jrN0I0NLltYrHAthTjE+LKGuTQTFyUGF6hXOh7QuF
	xfSlPPfbUDeFN7Yd6t2wyv8gKulVjFoLt+1xZoXdEqymPpASvAVMr4mzUDrr1R54uxSiJmDk/Gl
	II5GAXzwzAO05B5tn1QCRtxjUVZdQDaR7zuIP+3bPL09Waoafrpiqcse2zn+wbfcez5C00dq4ea
	Z994PX2o6xUO+h3T4WpvjqjLiJZdAicTFfkkemtHVwrrTNg2uQR0PF5tbFAg3tBDMLh3fUfXO7S
	OyVdoTp+2zeqZEqupBEgT1xtj5/S5Sgtj
X-Google-Smtp-Source: AGHT+IF4N5/K+n3WOj5VRJXsw726X6NC4n3Wb6cTFeYjOX0yen0c0Fly4FJFAXiEldxekv1Gjk3/5A==
X-Received: by 2002:ad4:5cad:0:b0:6e6:6b99:cd1e with SMTP id 6a1803df08f44-6eaeaa62615mr23084946d6.26.1741955875133;
        Fri, 14 Mar 2025 05:37:55 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24dda0sm23168706d6.58.2025.03.14.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:37:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: vivid: Add more resolutions to the webcam
 emulator
Date: Fri, 14 Mar 2025 12:37:50 +0000
Message-Id: <20250314-vivid-fix-twice-v1-0-7463c2b0ba63@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4j1GcC/x2MQQqAIBAAvxJ7bkE3A+sr0SFsq71YaFgg/j3pO
 AwzGSIH4QhjkyFwkiinr6DbBtyx+J1R1spAinrVaYNJkqy4yYv3I45x4N6S1obIWKjVFbjK/zj
 NpXwaV45rYQAAAA==
X-Change-ID: 20250314-vivid-fix-twice-9e5821142248
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add 3 more resolutions, that are present in most of the webcams. Now
that we are at it, fix a comment.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: vivid: Fix requirement about webcam_intervals
      media: vivid: Add more webcam resolutions

 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 695caca9345a160ecd9645abab8e70cfe849e9ff
change-id: 20250314-vivid-fix-twice-9e5821142248

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


