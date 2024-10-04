Return-Path: <linux-media+bounces-19095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5B9906C0
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523221F2144F
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A27D1AA786;
	Fri,  4 Oct 2024 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eit4FMkb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069443DABF4;
	Fri,  4 Oct 2024 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053245; cv=none; b=Pu6x//M5JbqLlmx43zhIKxNBQldOwrsVNVSKr+ar07+nFByvKkUdcHsnWx5PEOirePeuL0GtBRaEnmUwrGJhF+tY+Bsr2UjilrweYyd7M5H7uwBdgnAMtAj/fPSvesrTH1WdaGVkv7abZzMyNWp58EgKnF6JKHztbUQ/8QjO/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053245; c=relaxed/simple;
	bh=m/agzLE2lwDPpvkW3rkxmsai5ULvAy4bkgrMDdi+ocI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXIpXDkMl5eQx2vnGX49mPLtRc2l22ToLFqUxbqpzhOVkpU2owWQTrWo7S407/JjrtI2Z4Ce2md/MUSTz9jI1aslruiFmx7uyoVNxkmwHxVc/mPt1ZFk88CEkPzPgy6FVGfc0SyS3/j7UWGu2qGXpfzMLxqFPsGb+uNf61jnOjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eit4FMkb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5764EE34;
	Fri,  4 Oct 2024 16:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053142;
	bh=m/agzLE2lwDPpvkW3rkxmsai5ULvAy4bkgrMDdi+ocI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eit4FMkbZQv/MKdpAJLPaGbwvIDe4FP2r9zPa41I+qGvcxCpCHHjIpuEddWwOGrpE
	 bp/sVvhU0BgkNybcArQ5r2sgqtNPx4khgOjJogOPw14B3/CnmIHvDtGCIpZLW/VQ7n
	 W/P/ufzaXuDGiXCI8m7jrp9zwuq53RZarwgM9iMg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:36 +0300
Subject: [PATCH 05/13] media: i2c: ds90ub960: Fix UB9702 VC map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-5-e30a4633c786@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=m/agzLE2lwDPpvkW3rkxmsai5ULvAy4bkgrMDdi+ocI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///tSjkFPYzlJ8H1Ay00+6rF4db6v3Fhxg19L
 CKVvDgDXSiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7QAKCRD6PaqMvJYe
 9d2bD/kBlp6gRnmY6yA0FWM8j6ZYZQPfK1hiE82pIfONsZ8ZpkGD6527KTj5np5Od6qr2VBx1Iv
 ENRRiCbhY9lDCA/1kiGQQWh9zO2VuGDy/O+TfvoLU5cDIJZoAzfIBoXSUL09QejllpcWVgx2A5Y
 OG9l4bTTSrp4GVIfLHL3jQKNk2+3puMgBbcY7fumHsLXnBZxrtrHTiOrCiV+R+M18mH0QlS36u4
 2dQgJeIMcpfaZ3WArvHXQyJyop/gf+EqQfTSOQL9hu5d4qcSqKBhd1ipX8xr6p/LaBEEiLXfcuH
 IquGDA8fv1s6QFIIAPk7lsy7A/iXXnaVKfvjMh9THLLlQwGPp1ffReEN1fRBpjB/EwlFxbTjv9a
 yQ0+ShBhRE/9gPRt/BUn1xN+QuMaZctfo02onaXDZjlba9PT7JOD3lOddEp1VV/VJN3YrcJ+pk+
 xHAqQgzuBUUkFc/ZxSgHcaRLh/Mj2vIi8XtEdnCDblziqaUZ3hYQC1NU4BuGruCvlJdYonwSKVg
 LpehX91f4xI4ejgwu4IyoWdIYGG8v8TpVeZxcr5/kUpubUzwI3WLTV4Mhv/UrZT+CBGncmcEm2I
 pT+4EAInwguwilDUZ8CDzlmhddFC5b5FOG+6eSnNVVe6S/vwGItmQCNNuCiLlCQu/F67oC/QBw+
 +HIgMebPLlq+GFw==
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5c393ec6c682..9dc36bba0a87 100644
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


