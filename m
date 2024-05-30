Return-Path: <linux-media+bounces-12245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7268D4CA0
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62ED22842D2
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A3E1C9ED5;
	Thu, 30 May 2024 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="MFP2uTCD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB35183069;
	Thu, 30 May 2024 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075591; cv=none; b=DciKQyBtJcYeaakkVNrgYpGSOFiwEZGLTaMwuJRRyq4K7vrJbhts6G6KauexZuwVN86wOd71m+JViwXmdgZmq4K5NL727J5aGTb815wAvQ3D5GyaLvMmyhpU2X/FkIvYkStMiSYjPo88xEU4kCEPOL8PbBiiJKKsEt9T9+xNWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075591; c=relaxed/simple;
	bh=PQ1FKcCUCeRWDVTvkdg1KM0e85klmalQaoUcQrh9OsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQyA+/w6VYITYBCwiBl1O+CHyZ5s5FXijQCcUoRFVjscf5EFrME7v2QSkbDY04ReLBB/VNBW9R4NIR7ewaXNQH4TD6iPP9DmAqNkMPanoXu6MCB5wT+TmNeWqEKDjI9SgcrTOv9WkyQ9kTHlmk5c98KlB1vDOSJiJwpSjolIk2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=MFP2uTCD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=z+2wS/pFD/rzX9s5/BP3xqTq5VR+XvUAMuFhzTB9kkw=; b=MFP2uTCDoJJowZkS
	5LU2z+54wlBrwA3G9F4tcg4zDfg/r53YInB4WsM1bRLH7zC/Xm9ZGcQ4LkS/kTt1FaqgIDSLQTiFt
	85ajGwzGm7e49Lf2gclIZjl9YRR35kyGM84cNOKabzX1eJ9gEj+Jts+JZjuJ94J9lKdNcJS6gDkgt
	JXeNGivQoN3gmltCuFpgZOZhzRBimSU3H27vTM4TG1fS1uUOaAo6D7nj8tUROHDW24ltW2GZN1QOI
	tJhp4WtzjrORTIOH5k1/vLAP73AO5lxID1jCt1Z0ayxiS9ZeFmkZsBt9gh6Qt6Qzl+JHVaO1CUoa2
	FWWMEO5RNi6nEhwFVg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sCfnU-003N3v-1E;
	Thu, 30 May 2024 13:26:24 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 2/3] media: m2m-deinterlace: remove unused struct 'vb2_dc_conf'
Date: Thu, 30 May 2024 14:26:18 +0100
Message-ID: <20240530132619.71103-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530132619.71103-1-linux@treblig.org>
References: <20240530132619.71103-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'vb2_dc_conf' has been unused since the original
commit 8f0755c06b90 ("[media] media: Add mem2mem deinterlacing driver").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/m2m-deinterlace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 96b35a5d6174..5adcef80c698 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -724,10 +724,6 @@ static const struct v4l2_ioctl_ops deinterlace_ioctl_ops = {
 /*
  * Queue operations
  */
-struct vb2_dc_conf {
-	struct device           *dev;
-};
-
 static int deinterlace_queue_setup(struct vb2_queue *vq,
 				unsigned int *nbuffers, unsigned int *nplanes,
 				unsigned int sizes[], struct device *alloc_devs[])
-- 
2.45.1


