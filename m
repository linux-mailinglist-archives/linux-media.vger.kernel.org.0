Return-Path: <linux-media+bounces-18373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0D97B7AD
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 08:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50A721C22AD9
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0641D17084F;
	Wed, 18 Sep 2024 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGnD5sm8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD215C14E;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726639656; cv=none; b=qV2+quf7/AB9hxN+Rt+xf357nyL9GYN/LGfNv5IPArtDaBoZRs6w4f7KfxcU9SDLNf8z0jVPDV490IuuJBgTOOLtFCpMwMhWDFNJXWTRyLss11SBWtNkyaE4Sc83uPjVPvZKL0SwMu6d0LR5E9M2jPaNGeRgnNsQWYvwE8R7GI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726639656; c=relaxed/simple;
	bh=eU1HQMFCxErjcvWaDadkLK5YgaXUhPL5khZzjM98BSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfI+kjicQEi/OeD5AnmHm3MdYb4jM6Am/bIwZPmjhkGvh3TG7l/bozcvjTv2QKNv8SobK14T5xnpE3wou3P4jMBAURKxBt3+EGNRQwuTaJXQQf3HeuavpyKfJsbeCuLIRkAwpTM/Tkf1KgBogwptmLo88cOb8WiK0mCsFUrOL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGnD5sm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EAFDC4CEDD;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726639656;
	bh=eU1HQMFCxErjcvWaDadkLK5YgaXUhPL5khZzjM98BSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dGnD5sm8zQJ6YbhSZqxx3uRcqiP24nmZpSmfzUpt9jdT7BzahJtlATGsrB3P3hcrO
	 cGTrMM8K4fIlARAO/qvou8q1sWs0fgFuOOVQD/3KRUTRnB5f9MyXM8IQrzucYUezvg
	 JBBHQ5A0Dh8eiw9Wb4fThCzjHxG8c2vM4+WJW3ASMSeqpvqw6wLO9/7AxjvPd9sz7q
	 RFBSxa4M6wemGetQ6tA1jDNIxM7eAjLsW+Oz3yAq/bUEePm2RqglfyW2Ae7iogLT3S
	 d51drtoZpPir1eN6RoOuT4nU6K1xBOiOMnd5Im5Al2v61OTF1LHd1DwqHU1C4aIauq
	 CK+nB674yUUrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C6CC3ABCD;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Wed, 18 Sep 2024 14:07:17 +0800
Subject: [PATCH v3 6/9] media: Add C3ISP_PARAMS and C3ISP_STATS meta
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-c3isp-v3-6-f774a39e6774@amlogic.com>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
In-Reply-To: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726639635; l=2162;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=1oRu2lG8MHrXLJnw+JUMY2ovLWxxdjfkC+35WOnDZsM=;
 b=Xp08y3/+60VjbWI0SB2B61yV6fl2Btz4PdvaL31h966ruee+1lOBKzsixe9ys/hdLbbrT3fsA
 fgOV8G+pgEDAVrLTE/+xHOtWwOvGtm/VJ9F5fZ0TbJnVqR4A0snDtcN
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
index e14db67be97c..d0e346f301c1 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1459,6 +1459,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
+	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 27239cb64065..7d0a3e502a47 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -857,6 +857,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for C3_ISP */
+#define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', 'P', 'R', 'M') /* Amlogic C3 ISP Parameters */
+#define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', 'S', 'T', 'S') /* Amlogic C3 ISP Statistics */
+
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
 

-- 
2.46.1



