Return-Path: <linux-media+bounces-33682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC99AC90C7
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85F71C01547
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B212356A2;
	Fri, 30 May 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IYRF1N2S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570D235065;
	Fri, 30 May 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613117; cv=none; b=ZHYzIPvakn67Hq2wjMXGrpnTfHy1Dn0yjmJI1ZM0CCnuxVI7P4rJjpIoFuzCOU1YZOtVbasm0S+yolrPOqgy91+mHFf1ffy+QImW7V3nGDQHqFndZByvzb0x3wKFvmABBBOzTTqyTL1i/6UUXGc/V65/nxNkqV13/h5v7zC8u3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613117; c=relaxed/simple;
	bh=89CbSrBJkWcuOU906rNizxWcRDno1foXQRch/TOtTL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qz2VLXrvC7bmsvQr3e7A9k2l5DluBkYAjNlBknJKi4xyyOR8LEf5kXkjn7drU+Rk0w5rxfPSdFizOBVMAc39m02rtdLj17+cn+BIwE9anU/nL0fEAac7HbOVesjroxRPxgwcqITspgjYV8moRDCshpSMASGSH75a+oOtbsFBZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IYRF1N2S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 016EF1AC5;
	Fri, 30 May 2025 15:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613072;
	bh=89CbSrBJkWcuOU906rNizxWcRDno1foXQRch/TOtTL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IYRF1N2SuLYO6k0F01Bcp0fm+sgyk0CRUeECEBqR/uQ7NItDJD2A3+Axg2wxVwRrB
	 8gBtbCHoCBkwwtCCXxc2YeCk7f06Wsx+BAbgtHd96wfR9hGiFupARw4FEQ9Sns852z
	 EWu2RXINsJMFgQmb/Avsr5qrk9hLSzSjJfKmZg1A=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:44 +0300
Subject: [PATCH v3 15/15] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-15-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=89CbSrBJkWcuOU906rNizxWcRDno1foXQRch/TOtTL4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfgHUbawz0aW0hTJhZs6yMIY6sIJd2+aI03f
 i1YEfrtuiSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm34AAKCRD6PaqMvJYe
 9bRYEACvjIzmj8rx3lxrXsE3XqIPjaXAe+CRiexW6+YxMFWsTgI40RjNK9m5KkcsPoddBmojJkw
 Jq9xy68N81yezJGwrJk1pt9BCyI57GiUKITFB/ZeiU+j+XmodLMuUPbzSiOii/iXCY0SWiXDVTA
 ROixDUamy1rR8VuQzU8HVhulO/J1vrnpUPkIwTxmmbSS6viKv1KVPdYMhnJXre6naD7Ev0jvXdp
 1zIjYcwpNMNa9WT+SzhnnOFAuHgod3xn1X1kIeJe7knJNcymMlnFTd86zJoLDRCelzeC4KiTD40
 f54D4hLpgUxIDL0XJrv1lqUWp6Z0BMfAmw/pO+Z7hBWQHx6hA/QyqtSm2KrCq73zjmOGOOgZ2Ya
 q5iMCkkJIKl1JRgiQkoA5Bg7MRJqiymEfxZ0ulZPMnUT0zKfVFc6TObILpKwA9uR/GtVzWnJVEe
 Bpl4bmtUAKTp7QFmjVJmt4Dq2U+fcSbyUbHiy1ZQyUXNCvePnDjf+oOSyFCKyO5fkc2uRvZrQDp
 c0itZHzrS5cvzCEBG+DgrKpeneTgXkQc7xsTFuA76ZmT8354MoPGlQAgaLLlhyx5AqiAph4bBEF
 qiKXrXOlHmgzov/cSoo/wEigT8XdAJhVpyhrHIrdkzPUatoslSMxYa0KSlf86RYv8HneOY63QL6
 pKUByQChLNkCYeA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 41 +++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 887d8eb21a3a..101d69a2eba4 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
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


