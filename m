Return-Path: <linux-media+bounces-28579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68BA6BE8B
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C623A5025
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A786C22D7AE;
	Fri, 21 Mar 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s4JNUeYn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898322D4F9;
	Fri, 21 Mar 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571957; cv=none; b=qmjxj49MMHjWiKfOOKkCLMRR0TetWeu/gFQg5gPR2R2e3NSS4l+mfUT+QsQNjnddvKIt8Cn8s7vGQMyMalGjcJQHXMM1IkGvkP0X/tYbW5AoqX7XDZSUE0JJzzKUQopl5LoRm2hDX4fOsWmGS7K20s6jSxGXfzHdHltcVH87Jls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571957; c=relaxed/simple;
	bh=RZNS0y+0e/yCc3+LUuaBbUDmxpcUGtmHMOolcJUG42g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tX+bNQ7gEnO2vcJeQtH2zFAp7w2uTeHgrP2DLsYkIi92UBzPnE4uMe0nwOT4ukViYs7ajVJoEUXYLqFHHszzAoOigmS89lDEhmw3fZ2UfrHIfhEouuGkKx+KBKC32HbVJ8/cWRTXSTVjeMYHINtt2bmVy/rkxuQgpxm+tijSF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s4JNUeYn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB634185A;
	Fri, 21 Mar 2025 16:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742571842;
	bh=RZNS0y+0e/yCc3+LUuaBbUDmxpcUGtmHMOolcJUG42g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s4JNUeYn1jK8dO0rd3r7q6TyjNhcr0bmW9ofrZVjcEpT5bFPuZJuC0rwOSd4YAOo8
	 wsvzKsmNB3a2LfXRh7X+tnGJ8u23ILGJPwgxWLiw2cWK5qOezw91DEB/m08XNTRyjn
	 q/yrcij+ViOLum+HYEAefJB+es5w3iOfLuhuQVHs=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 21 Mar 2025 16:45:39 +0100
Subject: [PATCH v6 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-v4h-iif-v6-7-361e9043026a@ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
In-Reply-To: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4668;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=RZNS0y+0e/yCc3+LUuaBbUDmxpcUGtmHMOolcJUG42g=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn3Yml1iyjbylAxWpRNzTtOrtQhkATYsIMz+BEY
 73xA+85od+JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ92JpQAKCRByNAaPFqFW
 PLaJD/9roQ4yb2g79T/zGESS6D3dKSCgP7LHwnomWVZkvsoITgVYE+nYke31Zst/phbxpFdWva2
 AlP3eR/EG29NrZqc+LZvYF2kfezgbLS+mjhWGD2CGslt/59thWXRz18Y34WvXmLDkVwigL8NtxF
 QdUkLWTQYAs+gTBpyETCTDyj+hpfVvi18MvpgZN+opadJmuq5FeLD7AgAKJqeq5xP85cz2US1mk
 AUmbalx3zGBDgFBcHKYxrgPpCaZ7wOTDAOUhHbgau7HgtIF8w6g968sK1EG4+AFOvgXCKfT45sY
 afEAWodPhxt3zv/Ug+LpfUAt41IOayy9XIaVuy4B6HTu1HbmnSwXNF254lqOqEdo9SS783QU7CC
 GC+nPIOiSjNcxEnUhARI0u2Rn722cVM52qUllMlo8CEuPP9Ucc/joZura60ddRrYN4xlMHTley/
 CFmP+06qlepiISQc4uJ1Ek2HCWToZ2KIlFE4OLv8UuO0BfFvk8FAsDM5piHLbAYIDnzg7v71He8
 D10i5ZzuqHetI8W4g2lL4vWoCpnmB5fwmIH7SzhrcMt2JjpOP009QR4KLbn69XZ3ZjZNdZzpoz9
 MF2+UX+CsIaeufSxGiLuUldY0eGKWIgdRKUDMlLN35OBCuDKdkjQG1ohQlpftrWVs6UQhfOZZXB
 FPwNl2cFBXqzZBw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add formats definition for RAW Bayer formats in vsp1_pipe.c.

8-bits RAW Bayer pixel formats map on VSP format RGB332.
10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v3->v4:
- Fix SWAP bits for RAW 10, 12 and 16
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 8e9be3ec1b4d..a51061738edc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -30,10 +30,80 @@
  */
 
 static const struct vsp1_format_info vsp1_video_formats[] = {
-	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
+	/* Raw Bayer 8-bit: Maps on RGB332 */
+	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
 	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+
+	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
+	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
 	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,

-- 
2.48.1


