Return-Path: <linux-media+bounces-10778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68F8BBFA5
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 10:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605FC1C20AE1
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 08:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB9E6FD3;
	Sun,  5 May 2024 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iNpdVFsw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D6567F;
	Sun,  5 May 2024 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714896235; cv=none; b=bxl1FKos+yCURVsPNuiQVMc3t2vNXXtjB7HnotBhYDN8MBNrDV15kFBDjxhqFDv+Qt8jRxmU3oETz5qL9oa8R7fbYv9wzXWWrlHFeQmUhIEZXJQ3rUeOoB8/AXtD84owqxYSD7rC8b2kqEiTS2zpuryVoNXln9BFzfD6/MiU3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714896235; c=relaxed/simple;
	bh=T6LDVzb/diboB9LRbBP9jNiWoC9/XYn/9Gx1EBNBblM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MHuBIl1Y/hO1sbW6eA9o2alhl31Xu1NpCtXEw0CiNDsNR26kzigKq2SD+SYVoxAw/68URmfNcywfBGi98Kj6k57LD7yZZOOzc7VxAQXf7JRQo2ZZd0MjPl+jNRcus70dwjGyVJV0bzGPyZ0eBUXiZ0LJIg1yPx2ohYye2F23IwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=iNpdVFsw; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 3WIVsb8aHXTYk3WIVs8vUC; Sun, 05 May 2024 09:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714894116;
	bh=U6uzIaGNhSkC6hhU9kNa8/HHn2RJQgt+l+pkeP/wD8Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=iNpdVFswVqlDulu+RQMWOIbr+HeROeAOT/RP2IxlzEiw1lVtaTudFeU8iGGDnmXj4
	 AD4UnyEmfj1oYthh5vkeeEfCclcP4waTm2MgKEFaj9wY2zi8oYEXMqbNPpSiiSH245
	 3cLzWq9TuB5HHfD0aUb23YhLsQhYtC3HfWrguImKpBUpNZPpvxMNs7np9Vbl4ptS+/
	 10K+RceG6d5XMGEyP8DnQf20B9iD3/7XN7WmTh2NAO2NC+FqcryE884QAYtF/liIbQ
	 J+FDbEb/mtDe+S7w1DovW0jJsFhwpFYfb2+Dp4kAZ0YA7zJ9TD7pBparMe75YGzE1w
	 M2D1b6ugesVdA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 May 2024 09:28:36 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: allegro-dvt: Constify struct regmap_config
Date: Sun,  5 May 2024 09:28:25 +0200
Message-ID: <01b9b16b2f86f4d16d9871a29dcda9245512a1f7.1714894086.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'allegro_regmap_config' and 'allegro_sram_config' are not modified in this
diver and are only used as a const struct regmap_config.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
  79587	   3706	    116	  83409	  145d1	drivers/media/platform/allegro-dvt/allegro-core.o

After:
   text	   data	    bss	    dec	    hex	filename
  80219	   3066	    116	  83401	  145c9	drivers/media/platform/allegro-dvt/allegro-core.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
2.45.0


