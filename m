Return-Path: <linux-media+bounces-26389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A6A3C0DB
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC8553B8411
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD291FF1DB;
	Wed, 19 Feb 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nshLEZ4e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D301FECBB;
	Wed, 19 Feb 2025 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973016; cv=none; b=EnH1NTM9gjwTJqI8TOmqv7IaYOeLKHIOg1OomRp2UEjtb/JBRhmq8T7WkBJY7aR/xRc7hLECIBu7zx7OuhQrFF8fP1ApCJfdCmTFTQcCj8GwTRrCbKKQWmcAhqr1MGPTXTw8nSpQQMmUf9j3pxAZj4D/E9Yf6jNnwxKYpNnGIjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973016; c=relaxed/simple;
	bh=Smanb1nxDtTi2Zz0q9/a7xzSW0wrYV97VOh/qP6VxeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTVIPIWRQ/uAizuFHeqAVKgPVWk6/yskjf6m8nCTpRRewo24RN1J16nI2Xa0CHroAwG+OfRlvsCRL+PQGQB7Al4VYBPh7MyN8+4IhQD4wh/d4j1ThdDDqJ5sNzED92+DnDt5R9HAQ4yNvBTOuPLWazibtNALqKE3shTrSGCRlPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nshLEZ4e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99F86D21;
	Wed, 19 Feb 2025 14:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972914;
	bh=Smanb1nxDtTi2Zz0q9/a7xzSW0wrYV97VOh/qP6VxeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nshLEZ4em0TViY1OPTIr4VJ0p4XwSX2RmakEqFz5B2s4lEPCXUF2YLaZHxZn5BgWD
	 0yNCq0FcEkHeiM2ar/FU0bUqaUcJ56gpefFjC3c50Q6xutgZiUEDuV+vv/pdY9gH46
	 j7zyw+5y5XJebumqUv9XY6wiZkGF8iDyOASdWwwI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:12 +0200
Subject: [PATCH 18/18] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-18-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Smanb1nxDtTi2Zz0q9/a7xzSW0wrYV97VOh/qP6VxeE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF2TKP55dh9y4fRAgzn5VEG7cB9lTg/djK8H
 F0h7bqdTX2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdgAKCRD6PaqMvJYe
 9ZakD/431OIpfc5/fs1J7MrnfGxvhNgTlfcrBD3tigwuGvyVLL2m0BEMVaiysdI5vxuSL7wFKAR
 Y/woicudI8aeLOIQI3n6PrwAd643+00Ud2he9rsXY0YmBW+noupBcUV1Pjquvy+rZ4cW4ZfqOkT
 xaTR+6lLon/HYdjlX+eLRrQMaK60as/DWpvWw9+E30q/eSqy6Lr13o/0AQLbQm4n1Ge5qhD9YfP
 KUxM2vBqqyWcVkCzbD61+tUMTfwQ0JLfilvIW6/aR/BavHk3kaqk/nn5hlLZxoXZP+TDeU6JCTU
 IKfAZ/f/p5X0FCEIwghddDX138m7e3UoUG5wgbbFy82Or1ayW9JxzqMz45b2Oki1+zmEvc5jHsC
 74ZaJTCYcLKpGOZkl5tz/MFzA8VtFDN//MN/ysatuIozk36yF3wnLidBWIuo+fMYHR7IELXO2or
 cf99U4oXgB1Ei87CO61DkOFsC3rKvzYiSby3a0lxO1trg/P9rBbw/QIgPxr4cGV0Lsu51Rkt82Q
 sMcho3Xmbj5XyA0A+aYVkuVyGEWfzi03RciiIN0TMFm58+nJxqGNNEdYfSQPnIm7lopUA5uoZOr
 8DI9qluCFpkdNeNIPpN9YrXo66K7Rd48c2f/BUQyqIY4QwXbWpBoGRpQ7J2vaeet2HnJ1/owET0
 MZkvfszaaNR7+Kg==
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


