Return-Path: <linux-media+bounces-39283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB78B1F797
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B553B10DB
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C56F1459FA;
	Sun, 10 Aug 2025 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TiewksLS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840E18E750;
	Sun, 10 Aug 2025 01:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789500; cv=none; b=XAUjfGrXEg65kVLjODlSf7g6/BDjrI1FSX14UYBknSaVSrMBCLlD57OUO+VmeQvpBaXZ6M2/aFV1qu608xwzELqbftmj9sMU8VuRjMdlBcGafjsq00tD1teTCmK8y53/K1HqwzyG7dYf+VmEZA518HXCkGDD6HvdpfaHu3/uEfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789500; c=relaxed/simple;
	bh=ftZ+yqOf3qBWNFHgDk6YaMbGUTicr3FoMJCNd/dV5rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrjYm/v618WA1T1jWKizBovnevZcnzLyLRK3xnK8Bzx0HBesStoGX9+JIpunLwMy9wMDbxAHQREGopbxTxYXnvSauxcqIMOfkgIFi/CYfUF0zaz5fYiCdP9gMkOW8WRDtFGQFI+aDMFgQ5BsNqCtZLDXG5m7OHi/x9KDxlaP4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TiewksLS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 97208104D;
	Sun, 10 Aug 2025 03:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789444;
	bh=ftZ+yqOf3qBWNFHgDk6YaMbGUTicr3FoMJCNd/dV5rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiewksLS6f2e1uW9Cyf5szCrAXCDVTiZ6FWG6LC/JX0P+s2NlA+LI8yyJt8jXPeWH
	 EEY6h3XtAoi7AYkVtu1N8a7m8+ztCL+LuMVXT1IM/mVzFe5B69Rdzaq7QTbLFmgAHj
	 4iBsAqGhDq+cjVRXGh2QADIi5ujOa6GY5JHCaVBc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 10/76] media: nvidia: tegra-vde: Replace file->private_data access
Date: Sun, 10 Aug 2025 04:29:52 +0300
Message-ID: <20250810013100.29776-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


