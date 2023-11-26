Return-Path: <linux-media+bounces-1034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3747F90E1
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 03:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ACB728139C
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 02:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCD61392;
	Sun, 26 Nov 2023 02:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kb/rZDaV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD96D11B
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 18:09:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE6BD29B;
	Sun, 26 Nov 2023 03:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700964549;
	bh=pwX17rxtk9vEE/BsAnMU6sgXYNYOB0ovZJpbOl7Bm5o=;
	h=From:To:Cc:Subject:Date:From;
	b=Kb/rZDaVhUaSRwgCK4jyCggRIi/qd3eCRUaPiKvvJ8zzFrdZUObxjfURdim9A6clb
	 h8QRIlsB/lEOYSe0MN9EEe3IZyjUwVMk8HhIOU/JD2BSL/bbaUi3hI8MRLb25DJFHU
	 SJtPT0P3PCOk5mNU2R/QRkGY9Z5+8owj0GeqN58g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] media: rkisp1: resizer: Stop manual allocation of v4l2_subdev_state
Date: Sun, 26 Nov 2023 04:09:48 +0200
Message-ID: <20231126020948.2700-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Supported media bus codes on the resizer sink pad are identical to the
ISP source pad. The .enum_mbus_code() handler thus delegates the
enumeration to the ISP's operation. This is problematic for two
reasons:

- Format enumeration on the ISP source pad is dependent on the format
  configured on the ISP sink pad for the same subdev state (TRY or
  ACTIVE), while format enumeration on the resizer sink pad should
  return all formats supported by the resizer subdev, regardless of the
  ISP configuration.

- Delegating the operation involves creating a fake v4l2_subdev_state on
  the stack to pass to the ISP .enum_mbus_code() handler. This gets in
  the way of evolution of both the ISP enumeration handler and, more
  generally, the V4L2 subdev state infrastructure.

Fix those two issues by implementing format enumeration manually for the
resizer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Paul, Kieran, would you be able to test this for regressions ?
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index f7af360dcb28..a8e377701302 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -330,12 +330,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
-	struct v4l2_subdev_pad_config dummy_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &dummy_cfg
-	};
-	u32 pad = code->pad;
-	int ret;
+	unsigned int index = code->index;
+	unsigned int i;
 
 	if (code->pad == RKISP1_RSZ_PAD_SRC) {
 		/* supported mbus codes on the src are the same as in the capture */
@@ -355,15 +351,29 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	/* supported mbus codes on the sink pad are the same as isp src pad */
-	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
-	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
-			       &pad_state, code);
+	/*
+	 * Supported mbus codes on the sink pad are the same as on the ISP
+	 * source pad.
+	 */
+	for (i = 0; ; i++) {
+		const struct rkisp1_mbus_info *fmt =
+			rkisp1_mbus_info_get_by_index(i);
 
-	/* restore pad */
-	code->pad = pad;
-	code->flags = 0;
-	return ret;
+		if (!fmt)
+			break;
+
+		if (!(fmt->direction & RKISP1_ISP_SD_SRC))
+			continue;
+
+		if (!index) {
+			code->code = fmt->mbus_code;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
 }
 
 static int rkisp1_rsz_init_state(struct v4l2_subdev *sd,
-- 
Regards,

Laurent Pinchart


