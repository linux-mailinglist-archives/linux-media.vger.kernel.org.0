Return-Path: <linux-media+bounces-43994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0048FBC6314
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02624188ED11
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A3B2C08D9;
	Wed,  8 Oct 2025 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dJHG4+tv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492DD2C0F93
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945886; cv=none; b=SRGCt3LywZiwwAlAPbQ8ExIkgMLoUiK1EBmXZbKHIBjKhbGZnFYKt1MLMQKP9aKVwRXtJAsJK5uNHh9+LSAhHMVRi3uU8utd10z3+PDd/roLRjtm+/TrioU+DX3etDUHaiKtGEbcl//7eFyE/LXu6cJK1FQ6I4mMJFQvfo5Ot5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945886; c=relaxed/simple;
	bh=Ei1TQpJJM/k/5T/OWbAHNDniKCCdLMm92oIiguShVJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p/2HoXQ6g9w/0FPlPuDR+INU09mib8VwwtaoIDrwUsbq+KpySWEL/s2rHJ+gwQP2KvXlsei4iYrfHq5Hmn/kcanMr3Ha/Gdxzw7LxQ/sqe6XzKVdhfHYRDe6/Pq4noZYS1wBqHbNtoEBkzMDg8Q25FTbIqcgU3rsGXtvlpuykbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dJHG4+tv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ADB5AEFE;
	Wed,  8 Oct 2025 19:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945787;
	bh=Ei1TQpJJM/k/5T/OWbAHNDniKCCdLMm92oIiguShVJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJHG4+tvNQJvBhrjQmPVPUsWIq4TeUBmgqOlalawALPQKYC+8nt5H3ril0Ou9t0Ft
	 Q5X0vzjjnssAATqFk8LxRr5A8G4y+4W8K4M9DhtmeFELXSBoMAz2JUYSCkfqDWUWRN
	 oIjAealv12ovyd38X0KTlzh/DkwLBklhRPeYCkGY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 13/25] media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:40 +0300
Message-ID: <20251008175052.19925-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 6822c2f7fc69..675f1d2b65d9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -554,8 +554,6 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart


