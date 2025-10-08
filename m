Return-Path: <linux-media+bounces-43993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95052BC630F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 859244E5483
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAFC2C0F96;
	Wed,  8 Oct 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iuL3VnMG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C12C08B2
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945884; cv=none; b=Ftp/FI+GF0WcrIG+L59j0BO6/4s0TecWQgWrp8xs1RiKnCTONNqq/Jo6DfuV1T0B2gbx0lZ86GSZtesCUGkcQi3Z2517xNANBN+yFi2U3IvzNn9y9yi0umR24D+HeAXqi9UrECIMN8VqjOvKgTOAq8eK8AeChnYETZDMXAlonmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945884; c=relaxed/simple;
	bh=UFX+dEUBdcw4TCv0Sa2aSXJbi5QNte0jSA97Pgn18e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxZzskh+VADo2bexIpAmJHx8+tt5QqKaxBptpBE13J+uXjo0X4wshu1EwKN73xyQIjy4k7kSddBnk4sG+yfwTmFVtJiZHht+A0/OG+X+OpaOjNDrY6wv37uwG1ClNbQg+2X8qQHn5Y46XziCzgkWG2dhmNybCo7/gbjJqeJNuFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iuL3VnMG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 878E01E3A;
	Wed,  8 Oct 2025 19:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945784;
	bh=UFX+dEUBdcw4TCv0Sa2aSXJbi5QNte0jSA97Pgn18e0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iuL3VnMG7XN4+GOsEc9Hz/mq0luIqZmgWuM9bTRlAl2uo6W5kALNKsSLFh9AOJRXE
	 Pm+WcgXpGOEsGFD5rgWpsAcnrupgmaxkkJ6M+u86P1zqKs5SeJzNuDQAzyWNRrQtAM
	 ORCD6eHMFp+HGBN11YZWgeeStthLnuoDa30hHDAc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 11/25] media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:38 +0300
Message-ID: <20251008175052.19925-12-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 8681dd193033..37e0670f98c5 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2492,8 +2492,6 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
@@ -2529,8 +2527,6 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 		return 0;
 
 	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, cap_type);
-	if (!dst_vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(dst_vq))
 		return 0;
-- 
Regards,

Laurent Pinchart


