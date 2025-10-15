Return-Path: <linux-media+bounces-44522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E6BDD38D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AFD23B6200
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4CB314B83;
	Wed, 15 Oct 2025 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R62ry3Iw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CE314B79
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514851; cv=none; b=jcVK5MT3Vv8Qzo316pABMlfmp9gclLVY68Z94HIvNSIUXy6YbWAWVogBou+BVTs6wh8tcldQKWtRtOqWK6iZZr2lWuZS03kn6cB80K2s27FTzU7YxtMPGz+6NF22BCY5Jlvcg/KimpNryo50zDpY06hJndbwOWFQKHDwOlKJldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514851; c=relaxed/simple;
	bh=26V4RnRu2GdLrEpl50yDKtyZDlJpBbm9RepMndHN1cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaCBc0g3fkdwfI0PGsFZ74wP/cbG28dNFWH8ESoX8HamVqWjJ6QjHxtMKD4FsGgLxVh2aAlr85rXFFbMlDTmeJNYQlevC+tv/MJGJi8A9GakCmPllHA9FrBvC6JGadIORGgmVRAMtbBJS2U+adB5XB8UQFJmGs0Lo01qm725R5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R62ry3Iw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 895F2162B;
	Wed, 15 Oct 2025 09:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514746;
	bh=26V4RnRu2GdLrEpl50yDKtyZDlJpBbm9RepMndHN1cA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R62ry3Iw72FcC5CZNMbXeChgHHZF3cNqKTRx7tYwOmmHqjNuH6FArXZz+KdWOwKCJ
	 cqtWjCLgOE9mpqP54zdyPwolVIlmoS1VvJE2pSTJ451ha/3h0+MRu2YRYvQhs2UEmj
	 uL8us0rs1kDtuVli+KFgA4mtlH083Pb2olOfs3y0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 02/25] media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:25 +0300
Message-ID: <20251015075353.22625-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/allegro-dvt/allegro-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 510c3c9661d9..875e5cbbeb07 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3333,8 +3333,6 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 		return err;
 
 	vq = v4l2_m2m_get_vq(channel->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-- 
Regards,

Laurent Pinchart


