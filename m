Return-Path: <linux-media+bounces-45164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB5BBF8C29
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 22:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D0184E13DC
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBFE2820AC;
	Tue, 21 Oct 2025 20:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bt2URJXI"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2E25C6EE;
	Tue, 21 Oct 2025 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761079608; cv=none; b=eKlkFNybH0EoT+uNgtuS6WOFAcEOANili6q5lNunANtVBYgA06JCCMtL07oQCvSVwkrRt2JIX1RV1gi21QTG15rHuabrDtleeYWWad8q9KAZJ3ma8WAZTElSVBms+85q4SmzUrPAoblcO+BR35hh06TSwFnZ8YxwBulZdWLl8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761079608; c=relaxed/simple;
	bh=hxoUGzw7ETeIvgYoFvUBa+elRqVmf1UtxvpnhOkiJxk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UwfLjUQArhdKifywq+qQgEctt5FewCEUZfDmuizfrXfSpF+6AZY0d07GU88D+Yn7a+Ys3VnsZXr19JXnkezu1TJskyaiscv6R2mGIUIYI7WaCXdfYGfZGYgfOYw3ZcSQ8+pRhiDPFYrzLUq+m4vT4LziWYXVbBlJkkk9DfIeYAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bt2URJXI; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59LKkRIX1244879;
	Tue, 21 Oct 2025 15:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761079587;
	bh=QBP3QfRnfIamzhwaxwbtj1LkpxU7f5gKMVd3rl/TpKI=;
	h=From:To:CC:Subject:Date;
	b=Bt2URJXI0LsfgNa8zMrNeUyz/tW/yN5wVUIg8J1t3wVIboezqWwQVkOv2e51F2voJ
	 MikCOoQq3Nq1v/F0xCAxe27DfD3ZgSBz7g/BzClpxH4lhRRzH5dJAZbsnyWSBDNVdb
	 tmvD2Wiy++ZazQsye9Tr40rcoQGfwVq2pwDPSF6A=
Received: from DLEE206.ent.ti.com (dlee206.ent.ti.com [157.170.170.90])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59LKkQB51491540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Oct 2025 15:46:27 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Oct
 2025 15:46:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 15:46:26 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59LKkQ9C113737;
	Tue, 21 Oct 2025 15:46:26 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee
	<jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nicolas
 Dufresne <nicolas.dufresne@collabora.com>
CC: Darren Etheridge <detheridge@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH v2 1/2] media: chips-media: wave5: Fix conditional in start_streaming
Date: Tue, 21 Oct 2025 15:46:17 -0500
Message-ID: <20251021204618.2441939-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

When STREAMON(CAP) is called after STREAMON(OUT), the driver was failing to
switch states from VPU_INST_STATE_OPEN to VPU_INST_STATE_INIT_SEQ and
VPU_INST_STATE_PIC_RUN because the capture queue streaming boolean had not
yet been set to true. This led to a hang in the encoder since the state
was stuck in VPU_INST_STATE_OPEN. During the second call to
start_streaming, the sequence initialization and frame buffer allocation
should occur.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1978551a28fa..0a2eab372913 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1367,7 +1367,8 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto return_buffers;
 	}
-	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming) {
+	if (inst->state == VPU_INST_STATE_OPEN && (m2m_ctx->cap_q_ctx.q.streaming ||
+		q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {
 		ret = initialize_sequence(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
-- 
2.34.1


