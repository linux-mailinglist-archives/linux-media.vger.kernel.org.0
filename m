Return-Path: <linux-media+bounces-34836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F1ADA48D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CB816D4DF
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 23:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C912820CD;
	Sun, 15 Jun 2025 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9nc1sFW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00428002B
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029110; cv=none; b=JXdokJOllEC8IaHP8nkt7S/RwQExjJPSlhE6LoPQoc1/qHWJ9/oBjhwgWndW01BCw6skBTFmMVis6vkiPfsyZLH2K9drZ3pUWBElnTBUlD6ihrP0kxLgabVWHqV2cnWPVWoTeUt83a+QBZnU11J5qjkJUEonmbWSZ/PD6Zx2YN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029110; c=relaxed/simple;
	bh=Kud0ZDKv36NQTtHqZ3XaKVGMQgCLh9H9LuMDKSluAH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gr2urKO6DhNzaII3W9lROs1R1hhOzxUBgl50PX4uQuvv5UzhK9iVYQ4AjC+oEPqOQJTzFM3ZKx3ogtnanxVcIZL2NzywfCo2hPylDWTfV898wrghUa8s3T3wjoVrty7Z279yeIfWEFhhrRdGcLvfZOCObxYuSB/tIta5mmIIWug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9nc1sFW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso6795766a12.1
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029106; x=1750633906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxWN1gA+Bf6LWP1jGHLt8GUhEzDBQFmcviL2/3QVjeI=;
        b=Q9nc1sFWPFK6P9SFaD/pVPBxvoJvudqmGAMUd4+3vBBuIQjaoH7w0gaUMLzQFfZYBb
         Lepb6WZCCN7JM80mjUZUCNZdJk1jpkA0nhPIVXHuqPnwUK/OXpL2Z5k+qaZiFyJhBqI5
         0QNpaJBO0mREhFaMsIm3jzJpirxuyu5kND2mSrbsucDtuRClCPSeAGZec5G1e9BzuWE0
         D2sHQfJEyztZiX0EdvZZfit+GdY8zJRIKywsYPEPA1V5EgvoDWNqJwQs4GFHQaj4u9C2
         2EJVO/sZLtYKmCMyqPU/F+quF4y0a8Lzv6bMxMyi5f692lPBzl5Swz8HLL9W8pNs5KGf
         x2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029106; x=1750633906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxWN1gA+Bf6LWP1jGHLt8GUhEzDBQFmcviL2/3QVjeI=;
        b=xGi1a+ozBRnwX55a/DbBScocCNo7o/lCgUlZ0w6Br19cdaIMN44ax6UXd4Rq9GUQ2K
         fx3G5EadrjI/YqxxCYz506TJLe2q1SvlFELNUFbZf6sz3fPFUcvGie4EDM5wRp1l6mjv
         YsBpw+0Szl+YbSsvp6gG5g2NYwOdOL6TOyoqEgoqSHZ7MPuI+j2xVWKCSfO0DuCfmnUb
         hPnFdhGDJ/iGogkdV1e9sbzPYGZkjlfJRnGLoTUTV2osIh1oAW5qZIYgOgKPqg1TenJf
         Oo9lQc6zo6GpD27FTB9IM8QLA0FkBn6HifvyC5xNJ64SujAQHQSXILNMEg16D18KWUAK
         QSXg==
X-Gm-Message-State: AOJu0Yw8qViHylfj0Ua7XhZl/D8QxVUFOGdvtGFVNT5QexKEc4De41kL
	OIWG2aqYSrSvTzlWxCmzUlaiNdszwi89lIbxDlZN967E1wi9GwqyTR4q
X-Gm-Gg: ASbGnctVILMe3zoDwfBtuqwBiKPROUEukbF3nSTCULkcmDCy72wyZVafTPsbwswBRQx
	nqc4jzCMrYMQnMCDc0um+UFipOLQOEFeHTo58O0t3IvF7kN1nr6J6OyLnO6+KjT6P/xYl8BqvgL
	jXFtrN49AYGUkQqtMZDKaScKOqlQbyH0lA0jaUszQHmrlWT1UCFGUZfVfmMbPZNPOhXrhEHwUk7
	s5zSJH2e0+pNZdVQ9Bos4H2PUOXkG53U0HYLPb5SriAYblk/mZSfjwf4sg6Lw6iZ/VlyVB6A4y1
	OZulA1mqo1Gv3cDZUraX98hsYg9b6AQKDecvCcvQ9ACWXq+fQ/Nv/KVsSytnKRi6AIgMNGD9D3Q
	ImxZQAbpc/sP7PUdmf2YPoc0MiR2mqhEAc0yTswpx4Nsg99RcHguxFBzrxjWL/AudeIN4KPwHe3
	kN/CfPxKWITsHyLrKnmJK/vZs=
X-Google-Smtp-Source: AGHT+IGPV/AVh1BjHCMPYbXWbFxMjSjPBLnbi5VireXDHKGZ+zJX1aGiITRbtCZ2Nr31wAZKL4TnLg==
X-Received: by 2002:a17:907:97d4:b0:ad2:3fa9:7511 with SMTP id a640c23a62f3a-adfad4513e4mr717603466b.41.1750029106300;
        Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/5] Staging: media: atomisp: i2c: struct definition style
Date: Mon, 16 Jun 2025 01:11:43 +0200
Message-Id: <20250615231143.1558392-5-thomas.andreatta2000@gmail.com>
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

From `static struct ov2722_reg const` to `static const struct ov2722_reg`

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/ov2722.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index bc36133f3722..00317d105305 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -236,7 +236,7 @@ struct ov2722_write_ctrl {
  * Register settings for various resolution
  */
 #if 0
-static struct ov2722_reg const ov2722_QVGA_30fps[] = {
+static const struct ov2722_reg ov2722_QVGA_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x0c},
 	{OV2722_8BIT, 0x373a, 0x1c},
@@ -346,7 +346,7 @@ static struct ov2722_reg const ov2722_QVGA_30fps[] = {
 
 };
 
-static struct ov2722_reg const ov2722_480P_30fps[] = {
+static const struct ov2722_reg ov2722_480P_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x18},
 	{OV2722_8BIT, 0x373a, 0x3c},
@@ -455,7 +455,7 @@ static struct ov2722_reg const ov2722_480P_30fps[] = {
 	{OV2722_TOK_TERM, 0, 0},
 };
 
-static struct ov2722_reg const ov2722_VGA_30fps[] = {
+static const struct ov2722_reg ov2722_VGA_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x18},
 	{OV2722_8BIT, 0x373a, 0x3c},
@@ -565,7 +565,7 @@ static struct ov2722_reg const ov2722_VGA_30fps[] = {
 };
 #endif
 
-static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
+static const struct ov2722_reg ov2722_1632_1092_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
 				a whole frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -667,7 +667,7 @@ static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
 	{OV2722_TOK_TERM, 0, 0}
 };
 
-static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
+static const struct ov2722_reg ov2722_1452_1092_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
 				a whole frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -769,7 +769,7 @@ static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
 };
 
 #if 0
-static struct ov2722_reg const ov2722_1M3_30fps[] = {
+static const struct ov2722_reg ov2722_1M3_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x24},
 	{OV2722_8BIT, 0x373a, 0x60},
@@ -877,7 +877,7 @@ static struct ov2722_reg const ov2722_1M3_30fps[] = {
 };
 #endif
 
-static struct ov2722_reg const ov2722_1080p_30fps[] = {
+static const struct ov2722_reg ov2722_1080p_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for a whole
 					frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -983,7 +983,7 @@ static struct ov2722_reg const ov2722_1080p_30fps[] = {
 };
 
 #if 0 /* Currently unused */
-static struct ov2722_reg const ov2722_720p_30fps[] = {
+static const struct ov2722_reg ov2722_720p_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03},
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x24},
-- 
2.34.1


