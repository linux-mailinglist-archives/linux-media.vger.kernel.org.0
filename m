Return-Path: <linux-media+bounces-14679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CB92872C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 12:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66DBBB26159
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 10:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDED14A089;
	Fri,  5 Jul 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw1/5p2I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96814149C4C;
	Fri,  5 Jul 2024 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176838; cv=none; b=itIBRGAR8gm6Q2tAplriVX4fQJiCZZn9mklDmLmVb4Bm7rgOGo9M+YnVcfvckWoHmv4MzScnQW+/MGbLwxRQzorIEQ+kpbUYcZOp/mG8OLhs0P/k8sMxKWloK69jjetMb7KYiTJTNPDNl9A6nSRZh7STWnCGx+gkPxHLjPwecI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176838; c=relaxed/simple;
	bh=h8amntPUINJ7ndWXMfQwJ7tYIS4cbpNBwFmbAlOVLNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1/5KOr6wn7aDokr1M0YwUBXStKCnrigjYHq1D6MBb4WeZUIFf5Uegb/BBP599SgYxvA8wK3lrQBzvaGTXbr2h6ZGHifSCIcr0RHc25yDGLHoD6CLSVxUrh4/cY8Ri2jAH4m1l9Wzficc5CsqH1VGiIofZE0+f/aW1G7EQqCyOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw1/5p2I; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77c1658c68so143254766b.0;
        Fri, 05 Jul 2024 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720176835; x=1720781635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2edS2LEKf5d0A6h9VUUP+SZtkoTxowHJvKZBJd1SGM8=;
        b=iw1/5p2Ilwxuf+inv/oshXDFcPJN/QAoFtZ4SFAlf1CecMzw9wws7LzATKRWubKYQc
         ZtxovVohOp+PfPlFoE4Bk2M8D8W4o+6mHCOndJz72VJU3h6pxtVJ6QLlv3wBnVdUWk39
         JExR5Ph8cS4RxPi0pO572l4pE2t4fGy7Pe/ybJ/ZjvWSw/3Mei8EX6BWq93J65EPYqc7
         SOfqgxBtKM0GfrrsiN8Cy7GMxqGavOXMxMV0gPRwkao2MBl76WtUqmStIpVKPdwSPeLy
         MuJocYg/tmZXK05avwbERhWL1szA1vGpMNl+Wdxl9PAft8LL1SNrSbsMdURlOTdwJrQf
         xSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720176835; x=1720781635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2edS2LEKf5d0A6h9VUUP+SZtkoTxowHJvKZBJd1SGM8=;
        b=K5j6VjLKxdxkN/vhVZN3X4fi/GgPaRso58qmiyODUMi5sF5rFj3QBhVNRwIyyC8jeP
         JvTOMXAwLaeiib92lUbwRJBLWubs+AkT8ko+rCUJcH9FtL8OgvXKNG1bVsrkKzgEWpI7
         /rhzucMCDfwuJqLz7WytUesIlPBS1sczBKT6PcQv6Woy/UXzG/fg3RVkWOmbJWcD15eR
         k73W4nQYlCy2TmxyUNXR1LVqqnmBXHoXhm+y90Wxe1e7K3PTr8bc9y4eP1GTI5rD8djh
         KZq4XzH4s+JgQG0eQfujEH2xhvUclLQOnKVTUmNUK+ar8YurK4hemOrJmlMcWQqBZUPc
         mFrg==
X-Forwarded-Encrypted: i=1; AJvYcCViLdTbn5sTRlkGPGJeRLRGhffm2IMKcZ4v7ag7HFuV0nugdvXvcURES8Sfh6xuPn/nrVm+5riC969g1fAUMwf8JsmEgQ0cB/iC06fD
X-Gm-Message-State: AOJu0YwFytLj/1Z2oIfYAdrAy8N+5r3+cFIyrKO/LqwULq1ySHAzDWwt
	d9ieIIxeuxQ1m1QfCBGks4Pk20gUErfYntoKHUWQqyLSAb0w9mZL
X-Google-Smtp-Source: AGHT+IFNadRWExPXJOjTZFQdg1XUcFavNP1PZv9lisUfWi5s8BwuWjtUkGEoRVk6N/cXxuEcu5nsqg==
X-Received: by 2002:a17:907:7212:b0:a77:cf9d:f497 with SMTP id a640c23a62f3a-a77cf9df678mr94136966b.40.1720176834510;
        Fri, 05 Jul 2024 03:53:54 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1bbcbsm670756266b.36.2024.07.05.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:53:53 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 12:53:51 +0200
Subject: [PATCH 2/2] media: platform: allegro-dvt: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-media-const-regmap_config-v1-2-56881442bb30@gmail.com>
References: <20240705-media-const-regmap_config-v1-0-56881442bb30@gmail.com>
In-Reply-To: <20240705-media-const-regmap_config-v1-0-56881442bb30@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720176831; l=1155;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=h8amntPUINJ7ndWXMfQwJ7tYIS4cbpNBwFmbAlOVLNo=;
 b=QmbtnTbOj36TmBEN7pxDdt2/WouV1j5ixxup9G5vfW7yb9rzWGrxI7XvvFciYYFozMqoZY4gs
 S5ShXkCt6xpD+ndtyTVgLaRBk4KkNQL1l7ZDgxvsqrP/9EZiqqxwleV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`allegro_regmap_config` and `allegro_sram_config` are not modified and
can be declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index da61f9beb6b4..1a19fef62e81 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -179,7 +179,7 @@ struct allegro_dev {
 	struct list_head channels;
 };
 
-static struct regmap_config allegro_regmap_config = {
+static const struct regmap_config allegro_regmap_config = {
 	.name = "regmap",
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -188,7 +188,7 @@ static struct regmap_config allegro_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static struct regmap_config allegro_sram_config = {
+static const struct regmap_config allegro_sram_config = {
 	.name = "sram",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1


