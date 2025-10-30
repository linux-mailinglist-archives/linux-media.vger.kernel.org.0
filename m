Return-Path: <linux-media+bounces-45988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C24C1F0A8
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8147C19C3DAF
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7057233B943;
	Thu, 30 Oct 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MtviTo/R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C3932D7FB;
	Thu, 30 Oct 2025 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813815; cv=none; b=nShBJ/U1yqEkj7szuF0AlPHVHX7HrCHVknsPYCSRdfKMdTS//8jHlVY3W9uxeMSh4HwN3mv7B7jny4Xo+olJIS3PGVku/jDi9Cc27WoE5RWXbxsqgOHpRRfMakX0E6RQKty8jNqyj7d9iy+BWx6Ebd7TKzpY+jq3iCMAeLeno6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813815; c=relaxed/simple;
	bh=8q8zjRMdQxgekD+7tRCl5Ed+AssG2njqN+QZF4x+aUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqmbuoZv6E58bJnqyfiz/rGTmD/VASlhKCVrtyD4nFYe9yDqX13xz0rw0CUWc3KSKaoKmv3whoUvPmKml73tuONbqBaXYbxG8MQlX6AbMzP/8laMU09yPGzWrsL48HS0dSHFx+HOMk9fRoqcfZL1RGohP/Beysvbvx05LP6eZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MtviTo/R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E50E1EAE;
	Thu, 30 Oct 2025 09:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813703;
	bh=8q8zjRMdQxgekD+7tRCl5Ed+AssG2njqN+QZF4x+aUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MtviTo/R51u4opv1in0gQiu2VpE6Gdach+o8n/DiUZKseHb4EdatjyvNHRdTQ8fNZ
	 ab9XrdQP+M1zvNGeZVmUggidg8WZPdpct+wOunIPKj8V5xaeQcPDn967Ks5SOcTu/Z
	 rvb7RwhuOK3rfcxuBW3u0x1lXlzyyWhtX20usqLo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 4/8] media: imx335: Update HBLANK range on mode change
Date: Thu, 30 Oct 2025 14:12:57 +0530
Message-ID: <20251030-imx335_binning-v4-4-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

While switching modes, updating to a different value of HBLANK isn't
sufficient, as this is a read-only control with a single allowed value,
and thus hblank_min == hblank_max == hblank of the default mode.

So to correctly update the user-facing value of the HBLANK parameter,
which is necessary for correct framerate calculation, update the whole
range when switching modes.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 145b4415ba590245ab49c0124d8094683adddf0e..77863a28c4725ae151ac60213ab05a46bd1549ee 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -493,7 +493,8 @@ static int imx335_update_controls(struct imx335 *imx335,
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx335->hblank_ctrl, mode->hblank);
+	ret = __v4l2_ctrl_modify_range(imx335->hblank_ctrl, mode->hblank,
+				       mode->hblank, 1, mode->hblank);
 	if (ret)
 		return ret;
 

-- 
2.51.0

