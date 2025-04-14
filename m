Return-Path: <linux-media+bounces-30100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8FA87908
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 689C01892AB8
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB8A268FE7;
	Mon, 14 Apr 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyRBugcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D8265CA1;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616125; cv=none; b=Iaz/6tb6U/dgm12UvEDCi5KMrvVSNG0SmhsECAK1bIjFTIkhKx7/KH6Ib023yduu+JSabsz/QrzW8LiX0Myq4JOTE+GZ8RmbYq/AqoxKQQTK4jGxOSHNMVpeLAx37Ne1t/bGTYcg07Y+6a2aIQ9w3cZzSxzfjBc50pnysgIa7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616125; c=relaxed/simple;
	bh=BBSsw7qejkLDgYGv8NiplbAy6Y/6c/bP5gKdRfyOtFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbl5mjdbJWjuiNnF1d4kQXa1vxQT2QP9z0EdzlKlRTcsAk95o4YommLEIw9VdxWfPZRCSaUdDegGT1AQqViBYcnPeuL9lw4BAh4FJSj4mwIMsuCyax+j61Q9LUu4sGCNloAq6Zjj7t2+qA+vIYlFFty1y5dO8AcDmgpgmQUUSdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyRBugcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B44C4CEF9;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616124;
	bh=BBSsw7qejkLDgYGv8NiplbAy6Y/6c/bP5gKdRfyOtFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MyRBugcQiY0Qv6Jm4kfRRaeDJKoJIodVmwrQXfIjzk4VZKEWPhm7Uo/gceZV7zPI6
	 26Cuj1SSW3J0EYP6rvwtUUSGt+5cKreoVpQt1Qe3syd1TEg29bC/xi7wLMwNSPCs+p
	 Hq91o0fIeP697BqvmlZu5IFix4cPkwHIYT3rl+TJwWD3axoxmIr1GGuHOcekjQMRQN
	 vFy3l/zFhC22lsVJ8nrgnOOOp+xtSB2wyZ9ievFw5L1OpRXrCxRFY5F4fPiS4eGFwg
	 vcADxZ0vpfi7Eo6/z4nwe7yX3KmOr0k6dddIWqNLehmSR59NOI0PwGFN/iXiPPduNL
	 bAxlaDFevmzbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF59C369B5;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 15:35:19 +0800
Subject: [PATCH v8 06/10] media: Add C3ISP_PARAMS and C3ISP_STATS meta
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-c3isp-v8-6-9f89e537494e@amlogic.com>
References: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
In-Reply-To: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744616122; l=2313;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=3NkqZzVOjuFKb6tuYcKsddpGcs7rcCCDjPC2D0nuarw=;
 b=RfNkW1EUrQHUsgkZ4Fu2U0/SuxlL8OVKwanUNsxdhCq7N0YUm46V7E4HrIy4eXlnitLHBlTNx
 5hCS0oJtEtCCrdLAH0lSmAgpEYoU/YCRNJUVYGYRNMjDjOM+Qv96LJ2
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
index e97881f74c0d..ebdfe2c970ff 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1464,6 +1464,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
+	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index ca7b3e8863ca..9e3b366d5fc7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -868,6 +868,10 @@ struct v4l2_pix_format {
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
2.49.0



