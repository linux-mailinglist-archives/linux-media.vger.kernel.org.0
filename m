Return-Path: <linux-media+bounces-24688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75287A0B460
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 11:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF571644A1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320AA1FDA65;
	Mon, 13 Jan 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="iNSZItZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528EC1FDA69;
	Mon, 13 Jan 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763565; cv=none; b=Gb0ZmffZb/t96il8rB5lx1Ljw73ZbOldq4ph3RmEXBUjSEAAxePDCkYOakzEbWzDVup2OXUH80VWVGp6Kwey/wtzQSbv2Y2o0d1CBOF2DjcoyheLW2oa9o3L3CXFcMvUuFMzOfytFbKHb9JIBmrS/TaQisgXKKAhU+EyTiybYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763565; c=relaxed/simple;
	bh=Atf8vMRZ9EIMzjhuE4SCf4QiTTMAuk7esCjrBpXl310=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eBvLKYxDHITEZJ0pAhl+t37SNuC1Cu6VwoQ9he55WSalmpWBE3wqzF1jyMhyUed0AbOB48zXmYpMpgKXVI7/KcLoPP+i8nZRXwG8+U70qTTw1UExMfYl+vadbXxnzKuUkjurMpDiak4jyhcrP/Cc9Ms/80REX11lYwxzGXW7jlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=iNSZItZ8; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 5E91E40769AC;
	Mon, 13 Jan 2025 10:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 5E91E40769AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1736763561;
	bh=AtvRmghQBumH5Uo/aCVKY22UwzEZ3zBckU0U0TF6LD0=;
	h=From:To:Cc:Subject:Date:From;
	b=iNSZItZ8utqaElptShFKvDnVQ74DEjt1cPA8qB5Z3tY3Ux+1kWIZn5Lfi27CRHxTt
	 sE+39s4qOHlnu6wqo5PGfcdwud/xznIeXfgrQ1SVZU/WCm0v7S9EDZmiGRtjFHTUZt
	 OODC28/pmUTSFjfvCwQ9Rd5mwxCm2kuAb7MECiAA=
From: Vitalii Mordan <mordan@ispras.ru>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <morimoto.kuninori@renesas.com>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	stable@vger.kernel.org
Subject: [PATCH] media: mt9t112: fix error handling in mt9t112_camera_probe
Date: Mon, 13 Jan 2025 13:19:14 +0300
Message-Id: <20250113101914.2441210-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro mt9t112_reg_read returns from mt9t112_camera_probe() in case of
an error. However, a call to the shutdown function mt9t112_s_power() is
required at this point. Failure to execute the shutdown function will
result in the priv->clk not being properly disabled.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 858424b998ae ("V4L/DVB (13670): soc-camera: Add mt9t112 camera driver")
Cc: stable@vger.kernel.org
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/media/i2c/mt9t112.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 878dff9b7577..82e2c42f4c7b 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1034,7 +1034,11 @@ static int mt9t112_camera_probe(struct i2c_client *client)
 		return ret;
 
 	/* Check and show chip ID. */
-	mt9t112_reg_read(chipid, client, 0x0000);
+	chipid = __mt9t112_reg_read(client, 0x0000);
+	if (chipid < 0) {
+		ret = chipid;
+		goto done;
+	}
 
 	switch (chipid) {
 	case 0x2680:
-- 
2.25.1


