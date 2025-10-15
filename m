Return-Path: <linux-media+bounces-44537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1202ABDD3BD
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B2535353846
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA255315D44;
	Wed, 15 Oct 2025 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D/b/ywRM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8AA3148DC;
	Wed, 15 Oct 2025 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514876; cv=none; b=awkRCmXHONQCjUf+DVs7sj+TXcudlorXGrG8hpEAEAxPd7iPRGqPCrd4l7fwfEb/6ubFbRsnWYihLCq+e5uKJAWySVFbO8YoWE2ckpOinewmY9hW6pBrNHWfUV1zqUR+raajdNLceNec1PpVgjxdDonaVb2XcLDSQ0vpHwcD0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514876; c=relaxed/simple;
	bh=uNkZ3ANO+fNXrufEgNzJOtgaRoYTsmHdhMrMUz/CfjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8bxRvrap6RTEQc8IPipavkbNrnl6aKS51ijj9QHWZLLspng5Z1JT8rVpYFPhno3KtIWL8Ad6hYNo4tMJwIinAi3LU0TaO9+AGRZVMdTH7AULUZjWA8PDOK8kOmyJVQM5HsdtpY+aNzz4CqRgwQ2rRekhSCDiz/8AqkKH0R0fMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D/b/ywRM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 09D30E92;
	Wed, 15 Oct 2025 09:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514774;
	bh=uNkZ3ANO+fNXrufEgNzJOtgaRoYTsmHdhMrMUz/CfjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/b/ywRMN4R7/11fQhignb+FjdAimJXZloDhf0Jo9lQrPvQBaw4MtMHsirLEBYBYz
	 /Vt/35e3+Ue0LlcDvkgfNkoSQT++LqY68QsAGAWnDlz4ng9hl7tiQLPxq6pjeRjCsm
	 DSiRHL0KMxRuyqsgxTUkvZvziwCeBt1Yl8fQDD64=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 17/25] media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:40 +0300
Message-ID: <20251015075353.22625-18-laurent.pinchart@ideasonboard.com>
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

The v4l2_m2m_get_vq() function never returns NULL. The check was
probably intended to catch invalid format types, but that's not needed
as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
on the format type, so the type can't be incorrect. Drop the unneeded
return value check and, as the function has no side effect, the function
call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar_fdp1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index e615c56083f1..3515601030ec 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -1409,9 +1409,6 @@ static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct fdp1_ctx *ctx = file_to_ctx(file);
 	struct fdp1_q_data *q_data;
 
-	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	f->fmt.pix_mp = q_data->format;
 
-- 
Regards,

Laurent Pinchart


