Return-Path: <linux-media+bounces-22680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905EB9E50A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D27A16A691
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B72C1DB53A;
	Thu,  5 Dec 2024 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="if4xV3SQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74E1D88AC;
	Thu,  5 Dec 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389474; cv=none; b=u8rrgTRwdjGXVYkD4qcmh89kXO1yOLd5/61WG5WIFws//+c1q2ZfSF3vAQ43G3uAK0UMvwJXpR3h9CHYoVJ2rPY1m80YDM0g3vBz+8f9oFDWH9k2uJCqSDAnXRY0UC9PJSld/imvDAc0+95sSyi6JkWm5HGR9GHNqUd/8m9Pozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389474; c=relaxed/simple;
	bh=7HNUnB/2/Ym1NhOJlmU+C0s62IUWVqrDopMsaDt3XuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i251m9dVJSiUml9j6y02bySU9p9K+joERSLxSCVKI5SUsN+OlsUqHAOZr/kzRgiU2trBH9hN091tS7WYZGgKBVeRp4nq+T+okqqUSIRGAUWBdshC7VLnxffqlz1dmkf5c82KbYnVo+chsJct9OcCE+yeSGkT+rr4Z5Ea5c8DDEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=if4xV3SQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01A11C4CEF2;
	Thu,  5 Dec 2024 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733389474;
	bh=7HNUnB/2/Ym1NhOJlmU+C0s62IUWVqrDopMsaDt3XuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=if4xV3SQtXHsVe6gNUpZF0iKnTipjKjFebKqdhZRCpsLzJX/38+pQGoGv9nXXOp6Z
	 sTb7JAx2KrY60gRN3LhRyawBvwLUxYgN+5CJq++5fcUWnr+RqVkZatFGp2VdFuNgh/
	 N+5AM3003vu0dg5zjblbQzU+izdCBn6PwHi7g4ZRQFsPe/qtHmQNDdB0Rxh7ggv8jC
	 kXffDnqJk0diPr/HLoT1EezB47gjJYEqnq+W4xzna/GdLg92eWZ3mX1V/xMnUkqj4s
	 Q4IxCjWX74pR4N/tVyirX7M9SZUKimBsPHQoVGXUcCzAUvV3mDIC3AbzaR6bTg2PwI
	 6IrcPDBayXOLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C7BE77171;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 05 Dec 2024 17:04:32 +0800
Subject: [PATCH v4 06/10] media: Add C3ISP_PARAMS and C3ISP_STATS meta
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-c3isp-v4-6-cb1868be0105@amlogic.com>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
In-Reply-To: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733389471; l=2254;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=y4TLNIbyZ03A9g/4ZOEhmpfQCuqzNi3aXZPTz8esV4U=;
 b=J34kLHG77N0vwIAJ+qiHonE61HG/UauwpkuGEFev8p1wHHtXeYgQxxerePEwx6DFa2eEuAuio
 w0cYvAHwTLcDrhl672jnxuQKocfaczgqO+5O3Oe07iRY/WGxTB8mhLg
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
index e7c4dce39007..eda30640a7a3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -858,6 +858,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for C3_ISP */
+#define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', 'P', 'R', 'M') /* Amlogic C3 ISP Parameters */
+#define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', 'S', 'T', 'S') /* Amlogic C3 ISP Statistics */
+
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */

-- 
2.47.0



