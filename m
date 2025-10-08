Return-Path: <linux-media+bounces-43985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1722BC62FF
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E330E188B70F
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC702C0276;
	Wed,  8 Oct 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QqBxVvEt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61082C0323
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945871; cv=none; b=CA9kBtuz5d3jixuQKpFRfxpv3Ig7yu2B1+NvX01i0Th4Tmwu6HT3eS9Sx4HWrr+n+QeEVnzWhX+7xRh1rx0uDIowlYnhLRe0b+OyZtXxOjeUILPujhcNOKMMtV5deJ/1193jvTboBbwIFuV6sN3v9g4cmmGLOYZ7LRrcUUugq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945871; c=relaxed/simple;
	bh=/0B7zLuLLBn/F+1Mj4XJN7q3Z7xwjBzwUIhtm1FUook=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oc2oHdql5bGnXyjqmIJAXl8VHORsJbouwfA2h8BtxC/finlbGsmT14LqKcPhWc37+DTSrnpGP0kXuO9K7JajQKZRtoY6iXuHwGHhSIHwkTfaam2rZTvYotOav8m2V46q6XmrerL0tmv9YBtHx2VXTockuma481k1jcpJi+RMeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QqBxVvEt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AF9151E45;
	Wed,  8 Oct 2025 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945772;
	bh=/0B7zLuLLBn/F+1Mj4XJN7q3Z7xwjBzwUIhtm1FUook=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqBxVvEtKCPifPv93V8jHnIGmmU4U9cf5f0fHdwZD2im9TWe3Oy4imv97eacaxS0l
	 mtK8Y0WWugd+jFTzgC7RB/u1fEbu/fJsYW+u/7YT3BqScXeaDUG4hZJkNUuEpLyxsd
	 fwl2CDUHHBkGhjKtz47SiMK39WIvwEcyW8xSZcOo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>
Subject: [PATCH 04/25] media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:31 +0300
Message-ID: <20251008175052.19925-5-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/amphion/vdec.c | 2 --
 drivers/media/platform/amphion/venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 32eef2fd1f2a..79790fbadc95 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -532,8 +532,6 @@ static int vdec_s_fmt_common(struct vpu_inst *inst, struct v4l2_format *f)
 		return -EINVAL;
 
 	q = v4l2_m2m_get_vq(inst->fh.m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 	if (vb2_is_busy(q))
 		return -EBUSY;
 
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index c5c1f1fbaa80..319fbae70571 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -223,8 +223,6 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 
 	q = v4l2_m2m_get_vq(inst->fh.m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 	if (vb2_is_busy(q))
 		return -EBUSY;
 
-- 
Regards,

Laurent Pinchart


