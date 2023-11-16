Return-Path: <linux-media+bounces-457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C17EE4A2
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F601C20A51
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2998639FF5;
	Thu, 16 Nov 2023 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="etCEYydZ"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF75A5;
	Thu, 16 Nov 2023 07:48:32 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5638A6607377;
	Thu, 16 Nov 2023 15:48:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700149711;
	bh=4cgLKTgnVvYWRE/faVahndrRcA5UJbNrZ9b/DGo2+3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=etCEYydZA2yxC3PIsk2+nUDQofJiiZUNeIKweun2Fe1TgNzSxuQtKBYgN/xIFCyxK
	 LwT2D0+u4yvJdNFEvnV1gI2mTy17gGqlPuSCealHhBEKlGh0x4mQH+iIcI6N93FwcO
	 uExFhkYsZ6Mu5Cy3GHLeexxea74Cs+8w4ej6rIw+Zx/6RJoFAAPJD64wWTrsVVQAFV
	 QdWqVLgZAUEFPvaXseelAUkczkIw1GjcvDWVoVRVPI6cvuvCZzv8es3eFj8qUL/pJc
	 prsnNwcMce4i5hWxAsKoYe3QNWpT8zQD5DmoLynPoT231EYmsBWN/LNv09rTd9MqhF
	 FuXv6uX2yt7sw==
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
Subject: [RFC 4/6] media: verisilicon: Update H1 register definitions
Date: Thu, 16 Nov 2023 16:48:14 +0100
Message-Id: <20231116154816.70959-5-andrzej.p@collabora.com>
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

Add definition of register at offset 0x00c.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_h1_regs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
index c1c66c934a24..efb46da23eab 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
@@ -23,6 +23,15 @@
 #define     H1_REG_AXI_CTRL_INPUT_SWAP32		BIT(2)
 #define     H1_REG_AXI_CTRL_OUTPUT_SWAP8		BIT(1)
 #define     H1_REG_AXI_CTRL_INPUT_SWAP8			BIT(0)
+#define H1_REG_DEVICE_CTRL				0x00c
+#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP8	BIT(27)
+#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP16	BIT(26)
+#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP32	BIT(25)
+#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP8		BIT(24)
+#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP16		BIT(23)
+#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP32		BIT(22)
+#define     H1_REG_DEVICE_CTRL_INPUT_READ_1MB		BIT(21)
+#define     H1_REG_DEVICE_CTRL_AXI_DUAL_CHANNEL		BIT(20)
 #define H1_REG_ADDR_OUTPUT_STREAM			0x014
 #define H1_REG_ADDR_OUTPUT_CTRL				0x018
 #define H1_REG_ADDR_REF_LUMA				0x01c
-- 
2.25.1


