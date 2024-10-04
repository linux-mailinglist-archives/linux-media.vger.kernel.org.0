Return-Path: <linux-media+bounces-19092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4589906BB
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234FD281CB7
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E0322080F;
	Fri,  4 Oct 2024 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BiKGrvZP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD42207E4;
	Fri,  4 Oct 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053240; cv=none; b=PzaJ4bFdfBCEGu+ecOPo+Z7OfCl1BiR57pixTcr1lEBw8q6cE6HOjO+Nd+3+XrS69YaqJuGkl3AnacLBZxpHQNknKf1P5EyfIWkeF+WsGovsIGdetJ3hQ9BC9iUS8BKWfiQ+59Bb/pvwSZSp7ZruPhq3DagePq4/bMcVWTGHTm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053240; c=relaxed/simple;
	bh=KEJUa+NA275qqmfLngLNAjLh7UNjtzQi4qbdB1cIyjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghAs++20g/DGt8oLJNBVMlYxWL+hIXWGBGYc1Y+S9Pieoytgfzv//bVvxfVgPdSbwP247k4BYe3rIcCkNVtqLhi4oLclolidrwXGOWwUrEZVKyA6mVI/4SmnTO/3q/xrgy3WEh5MidAB3695FN9KXAuTF82WLNeKC7lzoZ1sHUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BiKGrvZP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32C89C62;
	Fri,  4 Oct 2024 16:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053141;
	bh=KEJUa+NA275qqmfLngLNAjLh7UNjtzQi4qbdB1cIyjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BiKGrvZPt+oMw8JaZ8ZLefnljaJuH6Ta3wYOfrkWiLRs5vySNrk69iFGuCuEBJRUM
	 iOjrAlXu5QuDQUoYc+/KphP/UxBcJH9i9XT/GXp0/gg51QNiSPnGjEFL0kBkxJMkFw
	 uwtfqq/GHRvAZPzo2EuwL1Zn7+GwQUzRM11ZFfpE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:34 +0300
Subject: [PATCH 03/13] media: i2c: ds90ub960: Fix use of non-existing
 registers on UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-3-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KEJUa+NA275qqmfLngLNAjLh7UNjtzQi4qbdB1cIyjI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///s2ux6qwYAUE+td6KVRjl5XcLMg84d2E2lL
 4Xj6JvlnAiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7AAKCRD6PaqMvJYe
 9flJD/93tn6ulLNHvyRnRs0Bc4xTu0yf2Vbpfrc09Sa9WeeGT7Ds2oqinUSreMJcqE2b10yn0nW
 wvfwfNOr1jkf0T6ykSJouVF7iPL5eTaLmBpFK09AXI+y4YTrGyvXcwiZY50LATctxYOSYhxMI+3
 utFmFu7MCWZKtoJZmbqFMvwkprF4DQicPx6NgIgusTTAYa3Ec0H2YKGwLXhoTN0u088sRNLyuab
 GSCApE6Dy1KctgD1yEVNiNVEFB8jRViXxLounyEzSgTkQP3pziMyRBBpeN+MT0bt58bCWnxa57a
 bZHsa5GI4sTsh1d1tFUh5jWdKe2LSDWcbqfNCS4T+6LE6o9TJXbyfySG/jVCABRnOxorh8wo78m
 8BKbq9iq2sNuSOo1mu/AB1RyHsbQ7Pcy3tdLRbKZgB86CiQRKNsHoORt1w4hYRw6AlIyLgo2tGp
 uscu7Lr7az1S+NWiPt5UF0r8jdmHdpZBwLbwsa7vEV3MwLNyqsLBXjGeCJuFe5aoOGgl/jFjzTM
 AYKSzoVI58mhzKWyvou+Ac8nP61XG1Y+7T6UVZNNi0Nr0rCikNGVN1mv+gxEx0zEJICoYSMhU2N
 excVdjhZCNcBbSXcUyNPvPWyHTxDWdSs6vKNIeXBc6ieUsDl0kPhrUoVeGGp1Wp3z8VFi69cTby
 xWH/bKhfKaLfTpA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 doesn't have the registers for SP and EQ. Adjust the code in
ub960_rxport_wait_locks() to not use those registers for UB9702. As
these values are only used for a debug print here, there's no functional
change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index b1e848678218..24198b803eff 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1577,16 +1577,24 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v);
 
-		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
-		if (ret)
-			return ret;
+		if (priv->hw_data->is_ub9702) {
+			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
+				nport, (v * 1000000ULL) >> 8);
+		} else {
+			ret = ub960_rxport_get_strobe_pos(priv, nport,
+							  &strobe_pos);
+			if (ret)
+				return ret;
 
-		ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
-		if (ret)
-			return ret;
+			ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
+			if (ret)
+				return ret;
 
-		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
-			nport, strobe_pos, eq_level, (v * 1000000ULL) >> 8);
+			dev_dbg(dev,
+				"\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
+				nport, strobe_pos, eq_level,
+				(v * 1000000ULL) >> 8);
+		}
 	}
 
 	return 0;

-- 
2.43.0


