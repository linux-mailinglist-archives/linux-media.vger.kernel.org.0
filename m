Return-Path: <linux-media+bounces-39213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7FB1F671
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAAAD189BB8B
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E8127E071;
	Sat,  9 Aug 2025 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DLgqPheQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F22B27875C
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774275; cv=none; b=GsL1A2sZz+FXve+lVjkFy1otIQwdWjLP8FjFNmQ99IdMNv+cNG4/m4ElKg4TdpteZyWpfoVn66rxrBXdkkB0DDk9pJ20S51VxW1H1KFC4cNhHXDg6w56blZ7O3gOJT5wY5wadEsq4HU+DMm5m7TfX6s8cpVaGjSD4/KiEgUwA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774275; c=relaxed/simple;
	bh=NWigm93A9K58rTU8h3adMFOJOlUHm1z1Jag75QuHFxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0WDrtfzdvkhJbOtJgbXff6w3teLvQpXaeLDy+9xF1Mel8BQ66xvoNjero0vhGMKPDauQcs1OVu7UGPwKxoRFwhfTH0Gm24XK7L1x3JFN1mLNo9lNZJWUrWi8IM0ZH2HHAc1zN4PFHz9Lwgf4fhLil2NLjOUefnSwEAIlbitJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DLgqPheQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 58F0B32CA;
	Sat,  9 Aug 2025 23:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774208;
	bh=NWigm93A9K58rTU8h3adMFOJOlUHm1z1Jag75QuHFxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DLgqPheQt5WNh6TA9rZSjONPajLjGfdUf6x1q6ZFejn7uLWSpCA28nZBKK9/iVozN
	 16MXQGL+EFQy3odIqEku9q4HNcEcU02YzzfhQAS+YomcALXmXmj6rreW4eSJaYEAZ7
	 AAdHlTFK8e2C8RxnWwtqRWs6tvnQJ7t0rAkGwMY0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH v2 18/76] media: rzg2l-cru: Do not set file->private_data
Date: Sun, 10 Aug 2025 00:15:55 +0300
Message-ID: <20250809211654.28887-19-laurent.pinchart@ideasonboard.com>
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The RZ G2/L CRU driver sets file->private_data to the driver-specific
structure, but the following call to v4l2_fh_open() overwrites it
with a pointer to the just allocated v4l2_fh.

Remove the mis-leading assignment in the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a8817a7066b2..941badc90ff5 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1078,7 +1078,6 @@ static int rzg2l_cru_open(struct file *file)
 	if (ret)
 		return ret;
 
-	file->private_data = cru;
 	ret = v4l2_fh_open(file);
 	if (ret)
 		goto err_unlock;
-- 
Regards,

Laurent Pinchart


