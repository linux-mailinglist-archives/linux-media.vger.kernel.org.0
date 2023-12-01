Return-Path: <linux-media+bounces-1479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F67E800DFB
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 16:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49AB4282850
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 15:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EF048CD6;
	Fri,  1 Dec 2023 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IcMSvVS5"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DAEA8
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 07:06:26 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3BFBB87684;
	Fri,  1 Dec 2023 16:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1701443183;
	bh=aG2bxALTPoE/i7BHeVL4NBOIewpYx3YvCkzeCfdeP90=;
	h=From:To:Cc:Subject:Date:From;
	b=IcMSvVS5+GHLYHLAJAUtDa3jWvgIwJxBVnOSC+zc0nY4MonaJJ666Zp85oFk5JrYY
	 FaSzR7cjEqABuLSVaP7QPGVzSBE+34P/tjmpNizaq12ILeKbrg+A3PAXI0Q0XR6VLE
	 35gDHUJhufK083K3wN9v42OWRg0sbL7/sRIX3pZbEzekey2xYrzOd399wowuXqFGB1
	 9CRTQTuJ3z9nkUqy2okKxte0in4hj08P5TVldI+cIvU6GySoCRRQCPqM2HI54YNv90
	 xiu7FdYr3Ewaw0/TanPAdIrdTX078qWwQ9MfuqauFlY+DvugFKR6c7N1KavcqWUbdK
	 YvOEWu0efLjJg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: nxp: isi: Check whether pad is non-NULL before access
Date: Fri,  1 Dec 2023 16:06:04 +0100
Message-ID: <20231201150614.63300-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The pad can be NULL if media controller routing is not set up correctly.
Check whether the pad is NULL before using it, otherwise it is possible
to achieve NULL pointer dereference.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 792f031e032ae..44354931cf8a1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -160,8 +160,14 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	}
 
 	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
-	sd = media_entity_to_v4l2_subdev(pad->entity);
+	if (!pad) {
+		dev_dbg(xbar->isi->dev,
+			"no pad connected to crossbar input %u\n",
+			sink_pad);
+		return ERR_PTR(-EPIPE);
+	}
 
+	sd = media_entity_to_v4l2_subdev(pad->entity);
 	if (!sd) {
 		dev_dbg(xbar->isi->dev,
 			"no entity connected to crossbar input %u\n",
-- 
2.42.0


