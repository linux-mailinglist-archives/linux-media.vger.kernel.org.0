Return-Path: <linux-media+bounces-28782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA769A71584
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3AC16CF12
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A811F463C;
	Wed, 26 Mar 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LTm3OieY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751831F419E;
	Wed, 26 Mar 2025 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987447; cv=none; b=kjBI6jIsSIWxIWKQMsUqWaDRaZrQvAg6p2O7dJkVooNGfiTWFn5ctG3ee3fet/5uxf1GkkmlVH+L131qAwevj8mebHnbKqVpQrkSbRrdOONq7kZf80isg6epNXOZvNey3MvEjU9fIj74olnVoxpFm35RSusvDCDhFpTbMykZWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987447; c=relaxed/simple;
	bh=Smanb1nxDtTi2Zz0q9/a7xzSW0wrYV97VOh/qP6VxeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ah+9QkxfzGJidBfg+K5t8peCZKCuaCXwptUSn5ri94CHvetWKGpZlSLsszDvSOeJ1XsQOAjSfTA/RzuLnDxbxSZVEVLbmSYSmIcz2SQnolxydv6N2bYddNh0Vk0t5Jc2zIvNEkw3oSktBkhQvaUcVTQ14RIzBPc4zOL9PWAc/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LTm3OieY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59A183A4;
	Wed, 26 Mar 2025 12:08:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987316;
	bh=Smanb1nxDtTi2Zz0q9/a7xzSW0wrYV97VOh/qP6VxeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LTm3OieYfmwLQ7NfUgAIiFZK6+xwuBXAgIqdq5anr6rmzQ8gF5BBBzMDjnTuXDlzf
	 B4YZ/pVkf1Fl7uIbgONLYRFkYciWYQOXoq/E/kWwjlGrocXKkUzqaZ25sBF2mR/GA+
	 o04LzTzWoe73/2hKmrWDILaaL9HLs1OmKK5rE/rg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:37 +0200
Subject: [PATCH v2 15/15] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-15-d0d7002c641f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Smanb1nxDtTi2Zz0q9/a7xzSW0wrYV97VOh/qP6VxeE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CUtsAsdRCMJg1fSztF0EZpOO+TB0q1ENcwX
 x8zpmwLg4aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PglAAKCRD6PaqMvJYe
 9XRTD/oCU0QDXisa5jJK8im5p2dY97lRkWN4YoBFnMzQ4w92J9nRr/qYhTEJfGir21THyUKLF2g
 ak1qq0n2TH7x2dvIbp+ZJYgrvOlDT7mIi67Z5Onp1RSVJ3mHdl7CgupVwGLEAAuk7/6JQSD3GXr
 N7BIaP+qliIgkaRFsKNO/iXOzS+Yy/mRShikyR6dqajUfGZ6SCNiEIBnPUIbu/tAmEkmdeoKm5d
 3d5RN8Vwzjw8bLuzsseMuivKmylQqt+NmrL/0GjB4x6I3gogQ0ETLhPloan2aEJ2wrHx++VgkEU
 R0/iHl3moJUWc4il02qQr+ozzmv/2JzNJmeXSUEoScefh5KxH0ZSTb/igDQvcqJ54h+QCzIefzb
 q0hDZ2AkSK/fE70k9+yKVD3BMjRISpMR0MVhisCJbOuKrjkdm/ieGqEF2JBYwxjiErylP1iJhqL
 vKWoIdcx6hh0VRr8Mo85LkfwWRX7zmdMiIA2BhDRXF+E5ae9twO8J5PPu1t7GSz1kyhJz0rrPSE
 GPmRM9RJpUpmDPq1EDvaJ0JOwl7Wiruu34v0caENfA+mxy8Qe9CdPvzhkYeX0JUX9kbn0XlJD1T
 TdTjv04fvaJsp1bToOrPaHr7Vsa1kmxij3b+G7w9FFJ90TA1ktnEgjZjHWRuiBIUWaoSIjMA0Gq
 v82ORSORc9NeU3g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 41 +++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 53927954ba73..20aa451cc64f 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -342,6 +342,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
 	int ret = 0;
+	u64 sink_streams;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -355,8 +356,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		risp_stop(isp);
 		return ret;
@@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -379,7 +386,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
+	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
 
 	if (isp->stream_count == 1)
 		risp_stop(isp);
@@ -419,12 +431,37 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int risp_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &risp_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
 	.enable_streams = risp_enable_streams,
 	.disable_streams = risp_disable_streams,
 	.set_fmt = risp_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
+	.set_routing = risp_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {

-- 
2.43.0


