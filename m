Return-Path: <linux-media+bounces-1561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD080347F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7BA1F21053
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA65A250F9;
	Mon,  4 Dec 2023 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RQhD8+PK"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7807C4;
	Mon,  4 Dec 2023 05:23:46 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BFC276602026;
	Mon,  4 Dec 2023 13:23:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696225;
	bh=Dywo70CQG363NbYL8uLIRlzPbx56pDtvUEKi675FEes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQhD8+PKDoxYdoPM4Ao1lagEw4nKvvEQJorzb4rCzzTZtgUARwzbUeralYHdgJu0j
	 lN9R+DCAN7FbZamZnn+YIJvE/IbgyM/egma+s9RcVmF+w07BkZQvseYPKntPS+Zvyt
	 YDMD/Lwx+Kp/xMe9H7361+qBQHdt+KU7ZLVeAZ9WvkJi8/cBmG78hFKTteBWQIwkxR
	 6mDdqwHuNIk7UceZdtv8j35Br69iXMeWZkJPvPQvtoSpeVP5D5O0MDQdfZ93S9hbeQ
	 zPDyOACJlcJaQiZrwCmPPdAp7vocEuT7RHlYOj+z81pUm2P6jisNZD/eJlb8og+0yZ
	 9OLTh1x4wHtZg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 05/36] media: qcom: venus: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:52 +0100
Message-Id: <20231204132323.22811-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver uses min_buffers_needed which vb2 uses to ensure
start_streaming is called when at least 'min_buffers_needed'
buffers are queued. However, this driver doesn't need this,
it can stream fine without any buffers queued.
Just drop this unnecessary restriction.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com> (maintainer:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)
CC: Vikash Garodia <quic_vgarodia@quicinc.com> (maintainer:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org> (reviewer:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)
CC: Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
CC: Bjorn Andersson <andersson@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
CC: Konrad Dybcio <konrad.dybcio@linaro.org> (maintainer:ARM/QUALCOMM SUPPORT)
CC: linux-arm-msm@vger.kernel.org
---
 drivers/media/platform/qcom/venus/vdec.c | 2 --
 drivers/media/platform/qcom/venus/venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index dbf305cec120..8bdffe546219 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1641,7 +1641,6 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct venus_buffer);
 	src_vq->allow_zero_bytesused = 1;
-	src_vq->min_buffers_needed = 0;
 	src_vq->dev = inst->core->dev;
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
@@ -1656,7 +1655,6 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
 	dst_vq->allow_zero_bytesused = 1;
-	dst_vq->min_buffers_needed = 0;
 	dst_vq->dev = inst->core->dev;
 	dst_vq->lock = &inst->ctx_q_lock;
 	return vb2_queue_init(dst_vq);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 44b13696cf82..f2e6bd44ed15 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1398,7 +1398,6 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct venus_buffer);
 	src_vq->allow_zero_bytesused = 1;
-	src_vq->min_buffers_needed = 1;
 	src_vq->dev = inst->core->dev;
 	src_vq->lock = &inst->ctx_q_lock;
 	if (inst->core->res->hfi_version == HFI_VERSION_1XX)
@@ -1415,7 +1414,6 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
 	dst_vq->allow_zero_bytesused = 1;
-	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = inst->core->dev;
 	dst_vq->lock = &inst->ctx_q_lock;
 	return vb2_queue_init(dst_vq);
-- 
2.39.2


