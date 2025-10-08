Return-Path: <linux-media+bounces-43983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47CBC62FC
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCA094E7252
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1972C08D9;
	Wed,  8 Oct 2025 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rHXVmY2e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1ED2C0296
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945868; cv=none; b=Ejap1+UdCzjdYtaUMD4+7HgShB6peA2NM/GwVjpNtBAGhgCQvAE0n4riLcwRLDP6DKxSrQv0lErsxXejrOjFoH5WB75iUWZ5raJzHyNfASfL7b22F1bjUnEEiegay4WXXXCKTtSEeVN1edIazeLnaDkhq5K21FuwvIuSKEp+DHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945868; c=relaxed/simple;
	bh=XQX6D34+gPQM/J/HadphMcz8syJmOkK2ImYPlI0DfIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gv/CcsmY3PWQEi1MCoIAw8CqcxqpsZ+NU6V/nnETQA0ncA67QOYwJyQX44pJegGWn3ssby22eo7SL9PJIJwFVpt2AHmD2Un0DzAiirikKxqTzQTCSvFfDSDRcQ9qPwhIlgfte2iSlIqP0IDsinkeKOaZ/loLg6P53c/Qwyf60tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rHXVmY2e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DDA2219C4;
	Wed,  8 Oct 2025 19:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945769;
	bh=XQX6D34+gPQM/J/HadphMcz8syJmOkK2ImYPlI0DfIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rHXVmY2ep04sV+3PIFYg0nvcFUIieJRIkcGMb6qvbN6Z3PR+tmuuzVvoyBJDxymez
	 hbLXqnY6UH/Kvpa+qRyRFhTTJNg3HUR0E3qcJ917DnQ2uFgYd/5Q5zFxwtmxM3LljQ
	 OcsakwiorPVDgFwkJd4SUnCkn8XIYKzCy2NwywZc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 02/25] media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:29 +0300
Message-ID: <20251008175052.19925-3-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/allegro-dvt/allegro-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index eb03df0d8652..7dce4b9c1eb9 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3331,8 +3331,6 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 		return err;
 
 	vq = v4l2_m2m_get_vq(channel->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-- 
Regards,

Laurent Pinchart


