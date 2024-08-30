Return-Path: <linux-media+bounces-17208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BE9657E8
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4565928604E
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 07:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE8D1531F1;
	Fri, 30 Aug 2024 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRx5unVa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8413632B;
	Fri, 30 Aug 2024 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725001293; cv=none; b=IHUYOSf3fjElvd3XPtQ7QMCX/ZrPQatP0wH5OtZODZj/unOQvsuLerKRkAEEhvG6odU4IWfepjpAgW+1QWouN5tVEMTzhLFvztIQhAbZHzJw8R3XkEk3rBtGh4jkMKXPUhJ9YwXeRYxTiFrt2uIEV1iQyqRYRtYYso/kpqq8gyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725001293; c=relaxed/simple;
	bh=roUrAwD6Mfamk0VVuy51w0oIeK3LcXL9+iW1zKIlYQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NzCsW2fEvhpxiVl2GQCLb16/nxQWrzSAJm5Xqqwy5Z/8ZSsXTCP7GRrrqabUewaqLaJez3zd6Y5x2uEGkG+gKW37FVlwszUonK7pJHboiVyCzQrw5V6o+0C/iSF+EGvJJFDYT4O0Z1f3ja38nWaS0f9Cj475BTn7u7lubw0xNNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRx5unVa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5343eeb4973so2250194e87.2;
        Fri, 30 Aug 2024 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725001289; x=1725606089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJWZKHVVLlONzA4x5xRAz9qJwfWJ9BhWAQh5+mGuTHc=;
        b=BRx5unVavy9egIiLEx6pYbgRwa5WLBF2VsgH0t+B98d4i6cPsUa278XG9KwRgQkOHA
         6mG5Tlcd6HJqTFnTSlNGHEHQpMA63veUQxsemZlVEh2sVJ2SDJM7/tECXzPyZWeiijrx
         oWZaTa9SZ/JTTc70HDDpCn1FqjuqVn3Az3JMKGtraj2d0yDWQDYUyOj743W2fTkwE6vT
         4SmYdAmweL0JT5AZDZ6amDzsFnNvmWAfhh2NQ4TmiV6OCB2r7f5cyw3jOSMMLggovJoY
         QYphnaR1SlSssLH/mwOEOqWK0ESc/3NzVbeMdJKHEbyAkLmv42BCWlqSR/mAr+4T/epE
         e1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001289; x=1725606089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJWZKHVVLlONzA4x5xRAz9qJwfWJ9BhWAQh5+mGuTHc=;
        b=gQ/QkF7AAoOM5umsR+pYRWy/Gz+1kT7Fl5dSsQyf3rL3C/7w7Ico5dEOcdmFZWtayY
         Oc4YBUC4B7IO9uVzF+KtgehK8SrYSoUAOLw3O2dfLMGQrR29MR5+Cu+W/92KPDKqqE6D
         MGrgzMJLkhVzg0ao4Y0yVRmB4GfceUkDmxpVHuERuNejxdTH96dQW4WgK1IcaXstDV7H
         hCrKBEdInvJmn5jDYeOXdGqb9LLIQ8+/6SNVn3BIacTwvnd/aLP3QP6cL1Py0iP8+h0Q
         96uDZ4m5orVHVdEoe+6IUmRQ0TSFUvKc0twIXP+AcZZeSUv/RrHya7KPavCEWHd1SI0y
         LyGA==
X-Forwarded-Encrypted: i=1; AJvYcCXme29RzDS+PEOGO3iZvmq4scoWyvuwNKryc/d9dfrAEgHzkx1ErhaLlXBGq4/udKoc5e91iWigGvx3@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAxPwvokkohtmvJNzYi79MPhDEHGpDQ45jwSXQhE7XSXv5SlM
	/kfZL7cKIgMb7RcTKTL717V4d9chG9lLXHxpZnimmz/Uo7mJXvk+Hi1z75Qufo8=
X-Google-Smtp-Source: AGHT+IFt4guMcNJTUuabiNexzhE/moV9FJPY1jZ3jRs986HiwdduMovtdIQl95NL0/ahyIEGQXrlxQ==
X-Received: by 2002:a05:6512:3a89:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-53546b1e1d7mr822055e87.2.1725001288599;
        Fri, 30 Aug 2024 00:01:28 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079bc1bsm452676e87.16.2024.08.30.00.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:01:28 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 3/3] media: dt-bindings: i2c: ds90ub960: Add DS90UB954 chip to DS90UB960 bindings
Date: Fri, 30 Aug 2024 10:01:17 +0300
Message-Id: <20240830070117.9534-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ds90ub960 driver can now be used for the DS90UB954 chip as it has
a similar register set and configuration.
Let's add an additional compatibility line to the bindings.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0b71e6f911a8..86d43d949dd3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ti,ds90ub954-q1
       - ti,ds90ub960-q1
       - ti,ds90ub9702-q1
 
-- 
2.39.1


