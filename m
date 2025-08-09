Return-Path: <linux-media+bounces-39212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3EDB1F670
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DB717DD62
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50C22BE7CD;
	Sat,  9 Aug 2025 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GG7GUdd3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6F254AE7;
	Sat,  9 Aug 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774274; cv=none; b=VzRKvecZzJyyjyUqZA8BwRU2pn1M19kirfHl4HWyUdO7FlsXWX+uCWDXa9Cal+wDcewuK3NjK7/Kyv8qxQSuKgnYEH6GyMk4l9ELroWvEvZ15MzRmiAPG4EXObrhtfzHqBWOCrJhAM5SKx4yH84u5SppJrTjmYA74HuOsN3nO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774274; c=relaxed/simple;
	bh=PgPHT8z34yQmLeUiceC0G6OPlpnnHWdahnPxUKVMiJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+1NbV6KL67S+kbQBMt3udj3otftZcVHeSMhsHFpPsPr30/XWk5RXjnJGXjJxaQe73yt5E2tmgUVMDSeEX27CJgfE5FYTrNZYJjDJCKGE8UgyuY1gy/J20DMPKo5CbmPLlmhpghwsW3ru2FjgfYSnEdPFXw85Emd79VZcNh5Vww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GG7GUdd3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CDC7CEFE;
	Sat,  9 Aug 2025 23:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774207;
	bh=PgPHT8z34yQmLeUiceC0G6OPlpnnHWdahnPxUKVMiJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GG7GUdd3vM70peiEfj8CAZbJPrB48XnKl7dTxwpqTIMGxSrxZ4f70fD6LsY7DQ7Pk
	 4Fdn8w7JySjkxGoPldu/jKdwob/iLxCyEA0GjacP+BQHHRg3KeyYsVXXIKciwsQqF8
	 QxkIMPQ2iII5tw4EdkFUNFyxxwNIZOagmntgMzH4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 17/76] media: rcar-vin: Do not set file->private_data
Date: Sun, 10 Aug 2025 00:15:54 +0300
Message-ID: <20250809211654.28887-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
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


