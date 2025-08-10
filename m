Return-Path: <linux-media+bounces-39290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BEB1F7A0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D3557ABC74
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A7D1A76BC;
	Sun, 10 Aug 2025 01:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DraKWstp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4146154BE2;
	Sun, 10 Aug 2025 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789512; cv=none; b=qGD6KZgFZAJK8UPmELxAF4O3J9VcSAd1v2tLFllqiCMGd4OhpAcRTDg5L4ATAAFruYbW+ZjxIeNt6TIMHswBSR996lHuwvjpyIvHhPThpaVrghWLA3MrWIL321m59t6+AEXB4Qb5hrPFmUxpUeZA9g5yLhv8jULKhaCFinkXU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789512; c=relaxed/simple;
	bh=PgPHT8z34yQmLeUiceC0G6OPlpnnHWdahnPxUKVMiJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uy93urPZs6g1Mg/7urkkZnST0yHqC4PfA2zJhUv5glAi9mekaxkXQGhLxf+FK75vUj0mYz9bUeyG6+GFjpksuPIP1qYNHfn6FjhTDaceYTkfiWk/BnGescnV6xUna8ZeQYh3qGNcx3lfnfjDSAW8ATYos6r5Npjn+v969Zo2dUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DraKWstp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E7F5F18B9;
	Sun, 10 Aug 2025 03:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789458;
	bh=PgPHT8z34yQmLeUiceC0G6OPlpnnHWdahnPxUKVMiJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DraKWstpy9tkugbJ5fNWJme6S4mDc7XOBD03jCJ4rrAgb7a6Ujnzo5fqIWmVUkgYa
	 oRaFmygQeyHMDJc3nwlzThHqgQf6bOgs0RRLoWN8bss3j3gwfbuluARCh4ilpEUxY4
	 xUhoJhlbEM7PP0g0YtfZ+6Vzug9cmf7YwNj1GUgI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 17/76] media: rcar-vin: Do not set file->private_data
Date: Sun, 10 Aug 2025 04:29:59 +0300
Message-ID: <20250810013100.29776-18-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The R-Car VIN driver sets file->private_data to the driver-specific
structure, but the following call to v4l2_fh_open() overwrites it
with a pointer to the just allocated v4l2_fh.

Remove the mis-leading assignment in the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 62eddf3a35fc..079dbaf016c2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -588,8 +588,6 @@ static int rvin_open(struct file *file)
 	if (ret)
 		goto err_pm;
 
-	file->private_data = vin;
-
 	ret = v4l2_fh_open(file);
 	if (ret)
 		goto err_unlock;
-- 
Regards,

Laurent Pinchart


