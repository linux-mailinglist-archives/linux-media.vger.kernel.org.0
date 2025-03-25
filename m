Return-Path: <linux-media+bounces-28748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C77A70C29
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 22:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB4D3BB0AE
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 21:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F021269CF8;
	Tue, 25 Mar 2025 21:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OkCPTgFg"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735D265602;
	Tue, 25 Mar 2025 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938405; cv=none; b=GMTLWBUF1+Vb7zw1nduYE3LreK/6ej2eS+P2kD18kiQV6mlfJ1B8gpgHZL22WUaksIry2Z9fIqZVwf6vd1q0ciyOHOE5zhLs1mKGN4zn2j+CqJK5M500PrDtOSLuHJCAkTx0agi5/7mJ2qxMIfjSDh8JIxj1B+CEfTzST6pIuXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938405; c=relaxed/simple;
	bh=Ts/xdvdCdHAKpr7BiHXqfNHMmy4Q+yoCfeh9tDETd6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aF1n35d990B7LMHkgbpgftreW1iQnGa36rlUcx7xgGd8miyTgqBWVebrchkgw03oWEZw8/B5R6uSX8VfqDgaPEvxhLMNJqGSHeiRFa9OTreslbp7pSUjuYbCJP3IgHX+kaJYZQQLn7VWECjM9gwtj8w/ybTsMnmENB5hss67rSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OkCPTgFg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938402;
	bh=Ts/xdvdCdHAKpr7BiHXqfNHMmy4Q+yoCfeh9tDETd6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkCPTgFgMnq2UKHA4bDiI+vCoX211/3Z1FxNEPL62Cl3+DAOWKO1IOFHkd+ZhmEp3
	 wJYT23Tuep+/D/NGL8c+tLVf8olPn//G7xbBTKX9u49Rs6yI728cDAQoYbLDWoBb1/
	 KsqSeuKhW3Z/gvowriN2osr1R1XNOSKe4ICej/ySo0tXvZRbuGsFu14uaiulOcIR2F
	 A+e94ac97bTAXIk3oZLI0GeaoBwaMcSnYvItf44SitWf08Wl/avXLQdTqI7bSPTj3w
	 5hPWj7jOjTX3oLW/iuOMUyiL187BRfglwwHcveKJKvwCeTTQ9l7JUBtl02CxpzOdGs
	 3RHAHuqaj/MSw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62BBF17E0FCC;
	Tue, 25 Mar 2025 22:33:18 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 2/6] media: v4l2-ctrls-core: Set frame_mbs_only_flag by default in h264 SPS
Date: Tue, 25 Mar 2025 17:22:18 -0400
Message-ID: <20250325213303.826925-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag is needed for drivers that have a minimum height lower
than 32 pixels.

This is because when the flag is not set, the height is halved, which
would make it lower than 16 pixels if min height is 16.

Setting this flag will keep the height at its value and have a valid
SPS.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7bac..b2343f051e5b9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -111,6 +111,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
+	struct v4l2_ctrl_h264_sps *p_h264_sps;
 	struct v4l2_ctrl_av1_sequence *p_av1_sequence;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
@@ -179,6 +180,18 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		 */
 		memset(p_h264_scaling_matrix, 16, sizeof(*p_h264_scaling_matrix));
 		break;
+	case V4L2_CTRL_TYPE_H264_SPS:
+		p_h264_sps = p;
+		/*
+		 * Without V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY,
+		 * frame_mbs_only_flag set to 0 will translate to a minimum
+		 * height of 32 (see H.264 specification 7-8). Some driver may
+		 * have a minimum size lower than 32, which would fail
+		 * validation with the SPS value. Set this flag, so that there
+		 * is now doubling in the height, allowing a valid default.
+		 */
+		p_h264_sps->flags = V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
+		break;
 	}
 }
 
-- 
2.49.0


