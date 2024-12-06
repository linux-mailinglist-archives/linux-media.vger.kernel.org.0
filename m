Return-Path: <linux-media+bounces-22779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2209E68CC
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3F2316698F
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBF81DF98F;
	Fri,  6 Dec 2024 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t235QmXr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33261F4268;
	Fri,  6 Dec 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473646; cv=none; b=sRmQeIU7nLpuRDJ/sONekHBTmc+eIIIZ4ag4FkHqDwooDaRw9Kdj/dalOXhPCByFMFbE8fZt7EuvEbINmQZCFxVoE9FFbRSnYfYcXf3d1MaLH4BZik3DXy2iow1GsC1dCuiYTyMeUdK2jPChxBWrEkk2cpWPbyiiWnudebqkcVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473646; c=relaxed/simple;
	bh=LqMLlax5zuUS8olZLAzmyGpPwtLJTYz6ZSYf64WP1d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLD2FPwC+FOEOBMSpP9q+9PfuL+NDJHOvuLlKZvnnuoJVXJIys5aAibWtFp3+5m3nGU7KEz7LSt1lHkrhvO1f1kYpeyCSAtVp2IwY0aQeS2cdTMzBaTY6C8GkxYcpeEAYe7AS3XACE2IOMxrGb5nwe9qEShQxFDxtk+6hPI9qlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t235QmXr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E7C116D7;
	Fri,  6 Dec 2024 09:26:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473608;
	bh=LqMLlax5zuUS8olZLAzmyGpPwtLJTYz6ZSYf64WP1d8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t235QmXrlQhHMpzkVDDIxWUaEmM6zJpoJ2x3f9T6Vq1FiPu69p2+qeq0LjduV5KIq
	 W/3AQtu4C21aMS3GPHwJv+VdafFkt3xV+Xuz3tB/1Ik3fWDGnju8k86UnGebwHrE+k
	 6WvbOOviT3rHGS4/CXfi1aMgT0U0zp1hsHthOWes=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:41 +0200
Subject: [PATCH v4 05/15] media: i2c: ds90ub960: Fix UB9702 VC map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-5-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LqMLlax5zuUS8olZLAzmyGpPwtLJTYz6ZSYf64WP1d8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVdkeVpXm4moYQ4HREFcbmsMQH6wwGUrZkzb
 m8D5HXXd2SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XQAKCRD6PaqMvJYe
 9dltD/4o0AWt0nVl+bVSapDPIewBcE5EvWNl/wao3PDd4wGvsuVTpTXjks97PB57LGFOrubSk21
 EQeVULoxcTrlUXPmOZljg+ZAP8EKptMZpjvaRwK6ayq4GHm8Y9Mb5dzuaU+ocEJrlZZVnMcVYwZ
 OElWDe3wnVrsUan7R4iKv/C59jZoagK4QYM8hKlov2OM/ukysj0QChqHgRJyQiYPS8hKly3Hpo0
 Zb9LGB5jJ2HQ2Zt7Y+Gr7PHD7gYTLc+cRrIxwotc2mgKG+C02SBiW3i1CYmWCh9GsDBRfmPoVvT
 6gY9xpm4lQB6JVDEmuRgBTWTyJTLcybXX1nyCQP5X0FjdFH48epFXmNEQbvIIPaEoRxLc/XF09E
 kZwyO8nOExWngD/uUhFEANBz/IRf/B1vqkEqArV9kzps9QgEIb1igtshEV8PmRwl78odJaFj4lu
 PPCGzV5B7wbK4EbEZLY9/XGsZPPdL7JWfLxQdkoJiv1AlsjjyTqQyw96Jpp6JFuwbSRfKG/6hMr
 K54wtIWcOy5Ohmq5cKzyIB2UHi5fihpNO6dfi4EIWDAgg2J6S9X37FOqESJj5d381prIFu/8z+C
 kUfl4My1g5AEieUvWHPKMH4Z8q/lQK9HnPGTOyGs58jMEHI879S3lHobiYTRHSgsERn0cX8uTOx
 O/1yKWvcu/UCbrQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver uses a static CSI-2 virtual channel mapping where all virtual
channels from an RX port are mapped to a virtual channel number matching
the RX port number.

The UB960 and UB9702 have different registers for the purpose, and the
UB9702 version is not correct. Each of the VC_ID_MAP registers do not
contain a single mapping, as the driver currently thinks, but two.

This can cause received VCs other than 0 to be mapped in a wrong way.

Fix this by writing both mappings to each register.

Cc: stable@vger.kernel.org
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 94c8acf171b4..bfffa14e2049 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2533,7 +2533,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB960_RR_VC_ID_MAP(i),
-							   nport);
+							   (nport << 4) | nport);
 			}
 
 			break;

-- 
2.43.0


