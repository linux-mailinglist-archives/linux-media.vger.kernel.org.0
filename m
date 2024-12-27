Return-Path: <linux-media+bounces-24116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB509FD0D7
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5431E7A15C8
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD9F14F9E2;
	Fri, 27 Dec 2024 07:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsgaJVqC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB31448DC;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283377; cv=none; b=E0zDNs+yhVaAeQTWG0gTtWN4tLotTIFxnTdRwacb6YwG5KreVv4roTT2336l4q5gMNSBB6x2Pa46EOec9ukxpYx9yPDTCNcGKerONoQMoDavY1PVElN3sEpSi3MXNzuoEZJDHKzqNMPlDP1oa3dFGbaLUnp2QAOYLH2yeXxSNno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283377; c=relaxed/simple;
	bh=HDphpUsmRZtsWH8FkarXiJDsgLNr+DgOnO7OwJIYx7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2jXBcBEww9hnZHbXQdvfLau87KPe9ZTCpazd1I0y4TK0hFrqnbUrizAa6iifmyd/DOkeAwseYM+QqBGWcmQhb5iD0HSm0phadSIHK4VdKeH85ec0w176nTEVq0GoIzbD9IdFeMeV+NQ6iUHxStsNg2H+vrP6prUsp2J15sXtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsgaJVqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55BA5C4CEE9;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735283377;
	bh=HDphpUsmRZtsWH8FkarXiJDsgLNr+DgOnO7OwJIYx7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gsgaJVqCE4GmUvVe1NmHWOzrQpQrD+cYnFMoREuQM8gc0qounJ/Y+6YFihKK5jupL
	 NjbVHIW46z/vVCJuPQ4Pbbsc8mNZF79I3Am36M6tb3XEbOwm6Gi8XWnYLeaLR2wJgd
	 xqQ0c4kDYMPHAf45I9DZ6CJL7wt08hQdIjoJwiaVvU/StMRwvhPHeoqb8j5reccodb
	 SFFxoUnASjAgGeORJ3LXIO1mAHQuOR9qKVUUZiyydhxHk4LqFj7aDbmuary3PY3XKg
	 qdcT47hdQg/vlCU/2VsqSp9PakOWph7je+CU6f+/0XIfhBJ15+5TASxBwg7Wc6pkiL
	 yEwHkkEm5XQcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEFFE7718B;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Fri, 27 Dec 2024 15:09:15 +0800
Subject: [PATCH v5 06/10] media: Add C3ISP_PARAMS and C3ISP_STATS meta
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-c3isp-v5-6-c7124e762ff6@amlogic.com>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
In-Reply-To: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735283374; l=2313;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=47Wr/QvwP+uFAvDY6Bi59wxrfL1TNanjthR6Z36FYT0=;
 b=djiN1eqL2kd5fCyWYmx/pavg3/pFi2vrtqmGx+at2Aiy+4wKHKSXN4bDM3Lg4yPx70R4Gz8Zz
 GLWN24avFlqDkiUimzhJJAH2usXi8wdZzd+1aWrqsBKGly5ngPKAo40
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

C3ISP_PARAMS is the C3 ISP Parameters format.
C3ISP_STATS is the C3 ISP Statistics format.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..dae34b1170d7 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1460,6 +1460,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
+	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..75e990e9d8b7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -858,6 +858,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for C3_ISP */
+#define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
+#define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
+
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */

-- 
2.47.1



