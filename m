Return-Path: <linux-media+bounces-28777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94578A71572
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D80A3A6EA2
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F4F1DC993;
	Wed, 26 Mar 2025 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="owGd6asi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1CA1F1927;
	Wed, 26 Mar 2025 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987440; cv=none; b=T8y23RDjEZxLOQQXF2KmWKGhjuH3r6LYiJWboElsk8MIrGBk1t2x/0/j/7f80N+55vir42srz6HNUC9nKxND13qnGapRtHsK836ybViCSJ2sVPrP80wZP4QXjk6SQpSiJJJKED5EHB6bVDT76e7X38TE4P9KDqpSD/EliLPME04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987440; c=relaxed/simple;
	bh=AAoZrLKhCu46h4eqW0AD+WoWoaATspJrEVsuJ1Kip4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rttQ2TKx0dz2gqzDG7oERPsBKQlqGBimmCmHhrrfhnfKibb342fUMuS4pTe+FWkV7WH7xeLFmeMFrEng+eqJbKhSIn4hgFAY9jicsAEmXBp86fiHXPwMJJnDBWSt6uGJqbTwuBto0r3KF/jK6XAz0d6g3kjINttuaiyT2nnoHDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=owGd6asi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90663198D;
	Wed, 26 Mar 2025 12:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987314;
	bh=AAoZrLKhCu46h4eqW0AD+WoWoaATspJrEVsuJ1Kip4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=owGd6asiZvm8V+trWzTTnqjakE0pLhte/jpR+75E1AxEIog3mdRVbhpJwTSwQ7bjW
	 8Opprxl6vieoC8/ohmenyzR/D3BmhtRkDDb1+wWQJ9H4UU0EF4rcCAmPdy+Vqh6qNE
	 Z7I/SiesviG82dEMJZqnzlLXqo0aUMFtw4WCX7G0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:33 +0200
Subject: [PATCH v2 11/15] media: rcar-isp: Call get_frame_desc to find out
 VC & DT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-11-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4530;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=AAoZrLKhCu46h4eqW0AD+WoWoaATspJrEVsuJ1Kip4g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CTSeOhmR6vyrQHamdBuTa0I6L/A08uiih1f
 7NOxc+oWBmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkwAKCRD6PaqMvJYe
 9aygD/0ZrSer5dk/P04kIIIoNeKU250r8G6kDebkoW94BqQTTO/iLr3B94gdO4pcxipmvxvmwLX
 bkIEADShOwkhkAuRKI9K5DseVjIjoX7BdUqvziIgW2opVlp2nx0QiDMq2POzWVo89eS+xl4CYtt
 Br9oQJhE4uL/kxwG35L2Pxni+udtmB6XdhJpUiMrjAsyHdz0XKVoOfSTVjEoak2Gjmo4jBnvL16
 UD6/RX/GFkMG8jB6yST7vDQP8dyTFLj+uVQd8lqNbvGMlvK5aNU3VOJ4admKdXI+kbNUKjfKSFl
 AwjJ6cKxiRbA/HaeXImQwiAiQ2ddWSmY7UInkSnaszvgiZrsOiqWECLSByuFdt1+8N5EaMx41OD
 A1aeH/jqxLD6UtOxnW9x9TBidbFFnIamSRtr1iFDjAMpmTtZbOMW1MloHHKL5uadbVcme/2qDDp
 Hi+75HgzXxd8umaztWxHEdGVha2Q4uhRHJJYB5mVPggKzCvS+kjI6MLvgv3Pp8NEx4B9G8QNq6L
 ejDj0PgnhUNy+bqsfZLoXZui7ICoamLZ/o+Bx07CWr6GxpCaGBmfLROw51dRUE5CI5Pn7yL+NJD
 bOeaeBBlB8G/JO8TjDgQFvLhIIxK8OwpzW66Ab7UuRNds/+2U1hY76Dbg1mxzyAB1se2Ep1JUT4
 3OxtWIq7P27mLyQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
routing and deducing the DT based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 108 +++++++++++++++++++++---------
 1 file changed, 77 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 5f3fcdb7e37e..53927954ba73 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -225,24 +225,86 @@ static void risp_power_off(struct rcar_isp *isp)
 	pm_runtime_put(isp->dev);
 }
 
-static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+static int risp_configure_routing(struct rcar_isp *isp,
+				  struct v4l2_subdev_state *state)
 {
-	const struct v4l2_mbus_framefmt *fmt;
-	const struct rcar_isp_format *format;
-	unsigned int vc;
-	u32 sel_csi = 0;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
-	if (!fmt)
-		return -EINVAL;
+	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
+			       isp->remote_pad, &source_fd);
+	if (ret)
+		return ret;
 
-	format = risp_code_to_fmt(fmt->code);
-	if (!format) {
-		dev_err(isp->dev, "Unsupported bus format\n");
-		return -EINVAL;
+	/* Clear the channel registers */
+	for (unsigned int ch = 0; ch < 12; ++ch) {
+		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
+		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
 	}
 
+	/* Clear the proc mode registers */
+	for (unsigned int dt = 0; dt < 64; ++dt)
+		risp_write(isp, ISPPROCMODE_DT_REG(dt), 0);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct rcar_isp_format *format;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
+		u8 vc, dt, ch;
+		u32 v;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(isp->dev,
+				"Failed to find stream from source frame desc\n");
+			return -EPIPE;
+		}
+
+		vc = source_entry->bus.csi2.vc;
+		dt = source_entry->bus.csi2.dt;
+		/* Channels 4 - 11 go to VIN */
+		ch = route->source_pad - 1 + 4;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		format = risp_code_to_fmt(fmt->code);
+		if (!format) {
+			dev_err(isp->dev, "Unsupported bus format\n");
+			return -EINVAL;
+		}
+
+		/* VC Filtering */
+		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
+
+		/* DT Filtering */
+		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
+
+		/* Proc mode */
+		v = risp_read(isp, ISPPROCMODE_DT_REG(dt));
+		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
+		risp_write(isp, ISPPROCMODE_DT_REG(dt), v);
+	}
+
+	return 0;
+}
+
+static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+{
+	u32 sel_csi = 0;
+	int ret;
+
 	ret = risp_power_on(isp);
 	if (ret) {
 		dev_err(isp->dev, "Failed to power on ISP\n");
@@ -256,25 +318,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	risp_write(isp, ISPINPUTSEL0_REG,
 		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
 
-	/* Configure Channel Selector. */
-	for (vc = 0; vc < 4; vc++) {
-		u8 ch = vc + 4;
-		u8 dt = format->datatype;
-
-		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
-		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
-			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
-			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
-			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
-			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
-	}
-
-	/* Setup processing method. */
-	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
-		   ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
+	ret = risp_configure_routing(isp, state);
+	if (ret)
+		return ret;
 
 	/* Start ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0


