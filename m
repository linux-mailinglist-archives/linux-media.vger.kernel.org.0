Return-Path: <linux-media+bounces-40144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3366B2A1F7
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF76217CD16
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C8E31E0F2;
	Mon, 18 Aug 2025 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sic9ij+C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175CB31B13D;
	Mon, 18 Aug 2025 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520305; cv=none; b=SmgBeJw1tuhPNDO3TY35CwPscuYbN1qwtwLcUrlyEp8zGioDHf4qYmsQISh4XvxID4F5IMldZ3VP4lHX1rQzWrYKLPin+p4VXD1/HQgpxYObxB9Ef3/XxID8RihzbeqwVLXp3rutZZnpCQsivH7r1aIGrPymnS010Yers2EuHzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520305; c=relaxed/simple;
	bh=9xto1WGjpE7C25ii2gC6fdKuCEsKYv14TdNP1gsfLeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aZ/pyBT0ZZiVHdMJJHIADKc+jQ92q2RoTz9JN9LuljHfwTEl7QXsCa6Cvb6+9GodJeZUYIvAccJgI8YWQhxSAx76DLy8FYVn95y5IkXg/Qfz6vqK64zYNLCpe+4IPOiGg8tPzXY8CqELqDj3YW5Wp9sWe7VZJt/9EV3vGK+uKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sic9ij+C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DB5C4CEEB;
	Mon, 18 Aug 2025 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755520304;
	bh=9xto1WGjpE7C25ii2gC6fdKuCEsKYv14TdNP1gsfLeA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sic9ij+ChZgwPgrM4kF7yOqIFX1ILzVm8emfabxekhi61BRonHlxhP7bVRju6if/C
	 mOxFmD+Et6kUwCxDaU2M4odiXi59m6NPTtwo0oIWEqPsm+DSp8ZCot2GlqKhiGG4/Y
	 rHJSOCidV9FoHsBlZ1E5Ehilw0dYPg+mWf2n0I7rt6eXSWpw5+D2hTfVcxM+JUq536
	 9/O5MHtE9IJBhQ7MT5e8onMR0MH5++RJty+ZqXYi4Nwh8rvTLJN0os57RwbK070Cge
	 4L4BjP+cg12SjPIypzqrEdOCkSMf1mVUqcYDBcDUtCmIo1jzjtrRK8j7Y+qxovhWD3
	 Oj1tk0YQe0zQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2FFCA0EE4;
	Mon, 18 Aug 2025 12:31:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 18 Aug 2025 14:31:43 +0200
Subject: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL before
 access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
X-B4-Tracking: v=1; b=H4sIAC4do2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0ML3czcCot4oDJdS1MTC0sLMyOLpCQzJaDygqLUtMwKsFHRsbW1ADT
 i1PdaAAAA
X-Change-ID: 20250818-imx8_isi-954898628bb6
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755520303; l=1552;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=AcOnQUcEtLtKRIGyS551I2XQVk8kQXwsf7E/+Yff8TA=;
 b=LxPyeY5OtSuWC0dqmLOomQR+CNhDogbAv7Ktm7eAvNyw3RLKGvRZnoWkjAVyF9zkpodT26fDt
 BSNSf84OWnoCe6aD49C3B4Ijd31VQ5j0Tg6aujoKeWnTgkb3HIY05zI
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

media_pad_remote_pad_first() can return NULL if no valid link is found.
Check for this possibility before dereferencing it in the next line.

Reported/investigated in [1]:

Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/ [1]
Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
I'm not sure if this should be a dev_dbg(), just following the pattern
around it for now, also not sure if EPIPE is the correct error.
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04a8752747f556bd1fc5a9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	}
 
 	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
+
+	if (pad == NULL) {
+		dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n",
+			sink_pad);
+		return ERR_PTR(-EPIPE);
+	}
+
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 	if (!sd) {
 		dev_dbg(xbar->isi->dev,

---
base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
change-id: 20250818-imx8_isi-954898628bb6

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



