Return-Path: <linux-media+bounces-44524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 585ABBDD393
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 05D653521B9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF33314A71;
	Wed, 15 Oct 2025 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AwG+gb1n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC03314D01
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514855; cv=none; b=fT5l0At+fuUn4V71Zd3WfZwgv0GSoa8Rk97cMJosUKPeqv2HVZvZmQHM5r6gtaxld+Vx5o9gjY6Njb3G7IZPGnfScN93JdsBHU/F83wVx/2+poxvtzh2jqvEwJIGyGnqnu0gcTeVeZgayLqenSyiYIuC4PRoCX4ms3NnEmBsgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514855; c=relaxed/simple;
	bh=/0B7zLuLLBn/F+1Mj4XJN7q3Z7xwjBzwUIhtm1FUook=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnjFPJ5hG1B78f3z5TTQSq4GqjeTkRT7SDeBQGxqirsZCelOpuyBhEW0deZjXmhSnuxp1emMHPuC3CVo8yoAcYrHtwBBzbK4YS6i01STQE+XDCCxln0jgJNFApaBDCWLXQfDH/XNR1/riG0JKI0fcrBFl4mC+VNImSBGJFqXICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AwG+gb1n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 36F1319AD;
	Wed, 15 Oct 2025 09:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514750;
	bh=/0B7zLuLLBn/F+1Mj4XJN7q3Z7xwjBzwUIhtm1FUook=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AwG+gb1nriQofnj108uo7omC5OoGyjXDrvA0u6wvr0z1BmIetBNBmcaH2M6UxXO+x
	 ul0RXvWXfP71te9LbGhf41i/DEWXIVLCR+sZ6AMTzrkbE4BO3Pu32mu3XMTRh4RByN
	 D87eAnMIe3sL1m/LCSGXjR7abhztFWGO4BEYPJw8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>
Subject: [PATCH v2 04/25] media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:27 +0300
Message-ID: <20251015075353.22625-5-laurent.pinchart@ideasonboard.com>
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


