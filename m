Return-Path: <linux-media+bounces-16060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0C94D42A
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 18:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDA31C20C8A
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 16:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBF81990BA;
	Fri,  9 Aug 2024 16:06:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB61870
	for <linux-media@vger.kernel.org>; Fri,  9 Aug 2024 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723219614; cv=none; b=kobPpDHm30ueF5VQ+efHR9pAI6ZaURJVo0qNZ1V2ni2Hn6snql1LY24pkcaio2kxSKNRV7rv2JI/idgZhl/uzPufl26P6yWbv/qzF41ICEf/c+9XaQb5UhEh7Kp/KKT3VUTQzTVhLkGGUADrtXKFp9q2GRAUWh26TDb7d/G8RLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723219614; c=relaxed/simple;
	bh=cKTX2w0MWm9oxuXyQvCOma1IOlz6lDag/wcZ/sU9B6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I85IzLYAHIeCJiLHz5DMULToCj9WPsSvISZNvFl872lA6Nxgrc+6a7spPHj6gwSdRmLzdeUEITiCNEmOZsgbR2YptUNOxSmpp2MREFWKrWHMUwo6U1nvWrwTfVSIuuWfRL96xlqJToEdgqfT7DdallBOC6eO2+AB2eM7DhMg6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1scS8Y-0003Fl-Lx; Fri, 09 Aug 2024 18:06:42 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 09 Aug 2024 18:06:30 +0200
Subject: [PATCH v2] media: rockchip: rga: fix field in OUTPUT buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-rk3568-rga-v2-1-c8052f5af10c@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAIU+tmYC/22OQQ6DIBBFr2JYl4ooWrvqPRoXCINOmgABamyMd
 y+66aarnzeZl/83EiEgRHIvNhJgwYjOZuCXgqhZ2gko6syEM94wwW80vGrR5pgkNcZUWjPFVSd
 IFkYZgY5BWjUfioU1lcl5VOVPOv58AIPrWfocMs8Ykwufc8NSHde/dUtFGR37pgUhdK/r7uHBT
 u8UnMX1qoEM+75/AUz7CwjRAAAA
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@pengutronix.de
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Returned buffers shouldn't contain V4L2_FIELD_ANY as field. Set the
field to V4L2_FIELD_NONE, if it isn't set.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Fix the Streaming ioctl tests reported by v4l2-compliance for the
Rockchip RGA driver.

The remaining Patch 1 fixes the field of the returned buffers. Other
patches from the series have already been applied.
---
Changes in v2:
- Drop already applied Patch 2
- Remove v4l2_err() to avoid spamming the log with invalid user input
- Link to v1: https://lore.kernel.org/r/20240528-rk3568-rga-v1-0-b946e55d9d37@pengutronix.de
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 70808049d2e8..9e87ac79e8c6 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -119,6 +119,13 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	if (IS_ERR(f))
 		return PTR_ERR(f);
 
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+		if (vbuf->field != V4L2_FIELD_NONE)
+			return -EINVAL;
+	}
+
 	for (i = 0; i < vb->num_planes; i++) {
 		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
 

---
base-commit: 812765cd69540b1e3ed5f02e25ccb9904f6a82f7
change-id: 20240528-rk3568-rga-fff1dd0c2c75

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


