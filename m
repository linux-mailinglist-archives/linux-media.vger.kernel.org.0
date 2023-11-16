Return-Path: <linux-media+bounces-454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44977EE49C
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BD62B20E49
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7286E36AE6;
	Thu, 16 Nov 2023 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BoW5jHi1"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BC1194;
	Thu, 16 Nov 2023 07:48:29 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 09DF8660734D;
	Thu, 16 Nov 2023 15:48:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700149707;
	bh=kpFEYAw6aX6fSWJ1Whx5HzIMLRtUw788ZzIbHzPRFQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BoW5jHi1P6XONRt+b+n3+2IUxFCWrO3slHGgiXFBkFcTeZALt+fyfodz6GWNoL9tB
	 6/2JeGLs6Mssqfcud8XhQvuzwp3EfsF+TlFLYH2Pg0BVPXLFvbXAblxGloalaQveOk
	 jDRNal0m1cMVlv1Ms3R9rI7H8MebhcVQE2yncryKUDNx+sa2e1UNXwo+EMdnnjcXHg
	 8PxrIhccT9hawaTHWMVfhy3PzxaPc9PuZWqlOz50sz3vbA1Ya8Y9Te4MbiAk8rfMEh
	 hiDcrPIPTYsNAaYFGkECX0DGYo36C4xQO7NbfvvG1o6oqjopFwZdbSaclXMYhJBVsT
	 wJghBO/KwxgYA==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	kernel@collabora.com
Subject: [RFC 1/6] media: verisilicon Correct a typo in H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE
Date: Thu, 16 Nov 2023 16:48:11 +0100
Message-Id: <20231116154816.70959-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116154816.70959-1-andrzej.p@collabora.com>
References: <20231116154816.70959-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a FILTER and not FILETER.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_h1_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
index 5062ee1c87a2..57e89bb975ae 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
@@ -65,7 +65,7 @@
 #define    H1_REG_ENC_CTRL1_INTRA_PRED_MODE(x)		((x) << 16)
 #define    H1_REG_ENC_CTRL1_FRAME_NUM(x)		((x))
 #define H1_REG_ENC_CTRL2				0x048
-#define    H1_REG_ENC_CTRL2_DEBLOCKING_FILETER_MODE(x)	((x) << 30)
+#define    H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE(x)	((x) << 30)
 #define    H1_REG_ENC_CTRL2_H264_SLICE_SIZE(x)		((x) << 23)
 #define    H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV	BIT(22)
 #define    H1_REG_ENC_CTRL2_TRANS8X8_MODE_EN		BIT(21)
-- 
2.25.1


