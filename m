Return-Path: <linux-media+bounces-39203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED203B1F65D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B907189BA1D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E144327A927;
	Sat,  9 Aug 2025 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rShSJf4p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F451F8725;
	Sat,  9 Aug 2025 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774256; cv=none; b=OTLf6JMu7OT6Py/wAkpjqFePEmMOktaaIQ47l1wuqKlxoOCzbLxwzrgywqF7cGaqWteEGdIq66X/DUDT/MKNRoqPDloTk+2ber4b8x5CDD5qiGZbcy7Hk64Qhdk0UNW5pTsVB4tQGGxr5A45sM3SdLdWUJcbxMuWLn6UhlXCJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774256; c=relaxed/simple;
	bh=GuKvxLbbZmDn5epxFFgiMMqqcOG3Z1zqU23Ktjg366s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4M/fpLLa58UOZd0px+kHClGJZAxiGBQeumBkn9aLmxYm9lweMpz54T7gBsoPh2Fh8Za81bWpp5l6W55ZNzN7UYzIVSmHiqOAhCDXw6Qs/gEwv/fz6upt4hpWbO+cebJcdeCgikIKbpbI9VJHjovXQNRx2JT1n3JLhaF9PPnfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rShSJf4p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 439C2EFE;
	Sat,  9 Aug 2025 23:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774195;
	bh=GuKvxLbbZmDn5epxFFgiMMqqcOG3Z1zqU23Ktjg366s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rShSJf4pSBYPXHD4lbHaTiQhrMTgfUuYxJG/NIOOdriwQYvZLraP+qB3Y2RoG9kJQ
	 CrXSptic7/E6wVbhvmFhC48f385CibddCTjsm0N9WECCiM4c+J0ojuOxXRpisyTF6W
	 xZjCYsNz3tCaPWKjITVOQe2SPvQGDmaB40ONgN28=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 10/76] media: nvidia: tegra-vde: Replace file->private_data access
Date: Sun, 10 Aug 2025 00:15:47 +0300
Message-ID: <20250809211654.28887-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Accessing file->private_data manually to retrieve the v4l2_fh pointer is
error-prone, as the field is a void * and will happily cast implicitly
to any pointer type.

The tegra-vde driver accesses file->private_data in the tegra_open()
function, right after setting the field to &ctx->fh. Replace the
accesses with usage of &ctx->fh.

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 531a85e3fe49..393dc3f07d5c 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -836,10 +836,10 @@ static int tegra_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 
 	tegra_reset_coded_fmt(ctx);
-	tegra_try_coded_fmt(file, file->private_data, &ctx->coded_fmt);
+	tegra_try_coded_fmt(file, &ctx->fh, &ctx->coded_fmt);
 
 	tegra_reset_decoded_fmt(ctx);
-	tegra_try_decoded_fmt(file, file->private_data, &ctx->decoded_fmt);
+	tegra_try_decoded_fmt(file, &ctx->fh, &ctx->decoded_fmt);
 
 	return 0;
 
-- 
Regards,

Laurent Pinchart


