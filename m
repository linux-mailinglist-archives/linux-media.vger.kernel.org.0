Return-Path: <linux-media+bounces-34834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A5ADA48B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764E61886FAA
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 23:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A857527F18B;
	Sun, 15 Jun 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8Qmbi37"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2C27F747
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029109; cv=none; b=iFrjOMjlu2apmLXKXeNWcjtonJJqSeVmuIurZq0v272mTV9IijN6aVcOSDRShpnkGlImgKVOsgVOsBnFWvzuVz9lUm1/zJs5AVgD3lirAsWkJbgmPoyMoO6m9g1OoKek/2C0TfOsGj2svNSb4IcI8Ukb/2xVJ/3OJOd2evAWR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029109; c=relaxed/simple;
	bh=LYBDuXGYSa+VQ0bxsoN/3xpxcgAzHB3e43Ofpm5DSzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XVhAVY+tuqLk29u5wv3S4TMuusK/v9WJJeONCCARDkV2++Icx/JOmK/hiI26oBfRQ6ohniOdctSc5MpyXg73XEK4hGc7zlmKUq/CNlz91OjAP/cF+r10PWkPOnt+4kS5c9FCYyC1pDf+YESe9+fphYiYHvwSF9nKcn23Sp+4JxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8Qmbi37; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso7044705a12.3
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 16:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029106; x=1750633906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISZu+sAha8VYmQFhk8BBVM0M8O1KkyUnkHBc0tGOjKo=;
        b=M8Qmbi37LQxooYbXfBg66nu2xHhQcAzjz/ePHa3Jpa55KvDa0BDAR+yNyQX/5cpBrC
         asoF/BoY4ZC8MlFYvMHUYo+IdJIFQjOsxopvlutGgZe1eEZads11Y188R1ndCff5pOM1
         rer1W63a1XlKjsUjL2JXt/O2H1zaneUcUF5VQKxUg7Qdmxyb00mhnA3odyhTlpyGNc/G
         HQdmZj58Hs6AAB6BrqQ0j+JnhSF0iEedm9MBjHa2zq58GsGI4Cdx2wM7QLF+c2VnKZty
         +gXmrDtzw6C45sSDzBxx5OTeww+mdyN6LYoVkc04//EdIAo/0o2Zq2X743CDQDjjNn7K
         i+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029106; x=1750633906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISZu+sAha8VYmQFhk8BBVM0M8O1KkyUnkHBc0tGOjKo=;
        b=McSt/myyrvDkKHzYocOBXaWTzzER0/EDCy88Hs4VEN7s4ZCwWMFavd3gDm0B+LWjou
         u6pb4FGZ/P28ijDLibASAv/wXAYaDLJq4dHJMGz3Kc1aRLbU3oMT1LOAx2XaOPKD6wgn
         9mXt65nd6zCtb+RgsRd+mY/to6Au1eKdpcx1GRnXEWif+KlwgDRIpfr7SA0N5C+5JIAc
         z3wSuQYHMeuvSYk5RHIbtQLAQuiBOY8G8BnkfAXONUH0yaGEkLy15xvLG3b4cefu8SoX
         uTEYjH47wIa/TN23OxweTq7SoAbu+gXChFrwjNGwEtveWQ6Zd7okIXwHUuED0g64fb6p
         DrJg==
X-Gm-Message-State: AOJu0YwqcAGYGcz25XHGlhnXqwj/df7fxl14vssRPlkC8srLvrcVlblz
	YduCwKYEjxOHYrIrdKZRqgK4kf83IxJK0pc5crQjZblJX1ZIE0rYkSHD
X-Gm-Gg: ASbGncu/hShC6U+M7iVueh0WmXeVhWF4+kU87qL0SVxvmv+2Gx3/gN8oBYiHQ5ijb/x
	/C1EoiyqeYRVwSnwlFgm8MIAPq4tY7Z6Wxo561AnhBrDhSWZJQE1wEMtNSTvBUUyM33Z7shc2k5
	M5zBK4dXX8IRzuu2jW0Yxqv6rgDIU+JgS9fGP8hL0GIALwbF42bD/vZNaO8iHSzkicnVo1Rx0gr
	hW9mk6VEzRLpyhkEHOKzvu/Iv9u6oP36qq4al2r5tkK6THsF1QPwYBxnWvDHfAJ2t1AzyUyBr8J
	g4uzOS448SfuZIGHvWOn+ZFajHRoh3BfDLMWcvKRvtJyqLQzbx3HtkuB+7CbVn0b+irr1b2P9nc
	sUiuU/+w1X5QHs3LGo9Qd66NpWLda58AkbGVIlUjCV8FPc61qlpNZLQLTsfW+nzJtZTh0EPxU8t
	CK88YbzBdpgx00qDxpdpRW4JE=
X-Google-Smtp-Source: AGHT+IG0Kz6Q1Ob6gvgrM7NRnGKrRc8RVD8msF5hGZhFBlofu3I6Yap+x6X4qw0u6niyEWHqt7g0MA==
X-Received: by 2002:a17:906:c145:b0:ad9:6350:c1e2 with SMTP id a640c23a62f3a-adfad46a356mr638917766b.49.1750029105825;
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/5] Staging: media: atomisp: i2c: struct definition style
Date: Mon, 16 Jun 2025 01:11:42 +0200
Message-Id: <20250615231143.1558392-4-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From `static struct gc2235_reg const` to `static const struct gc2235_reg`

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/gc2235.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 6c743a17f198..7dd9a676fb98 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -179,21 +179,21 @@ struct gc2235_write_ctrl {
 	struct gc2235_write_buffer buffer;
 };
 
-static struct gc2235_reg const gc2235_stream_on[] = {
+static const struct gc2235_reg gc2235_stream_on[] = {
 	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
 	{ GC2235_8BIT, 0x10, 0x91}, /* start mipi */
 	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_stream_off[] = {
+static const struct gc2235_reg gc2235_stream_off[] = {
 	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
 	{ GC2235_8BIT, 0x10, 0x01}, /* stop mipi */
 	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_init_settings[] = {
+static const struct gc2235_reg gc2235_init_settings[] = {
 	/* System */
 	{ GC2235_8BIT, 0xfe, 0x80 },
 	{ GC2235_8BIT, 0xfe, 0x80 },
@@ -268,7 +268,7 @@ static struct gc2235_reg const gc2235_init_settings[] = {
  * Register settings for various resolution
  */
 #if ENABLE_NON_PREVIEW
-static struct gc2235_reg const gc2235_1296_736_30fps[] = {
+static const struct gc2235_reg gc2235_1296_736_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -321,7 +321,7 @@ static struct gc2235_reg const gc2235_1296_736_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_960_640_30fps[] = {
+static const struct gc2235_reg gc2235_960_640_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -373,7 +373,7 @@ static struct gc2235_reg const gc2235_960_640_30fps[] = {
 };
 #endif
 
-static struct gc2235_reg const gc2235_1600_900_30fps[] = {
+static const struct gc2235_reg gc2235_1600_900_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -418,7 +418,7 @@ static struct gc2235_reg const gc2235_1600_900_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
+static const struct gc2235_reg gc2235_1616_1082_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -463,7 +463,7 @@ static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_1616_1216_30fps[] = {
+static const struct gc2235_reg gc2235_1616_1216_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
-- 
2.34.1


