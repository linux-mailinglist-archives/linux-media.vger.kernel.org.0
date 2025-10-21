Return-Path: <linux-media+bounces-45163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3ABBF8C26
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 22:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AA93BFABB
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD32227F163;
	Tue, 21 Oct 2025 20:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r//dQ98D"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BC350A19;
	Tue, 21 Oct 2025 20:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761079603; cv=none; b=jW61DO3+FQSa/2FH8yPNiq1JrNvvZxU8a9f9yyNwVOhhVIA9Wr7hAsff+AXD2M6gUJHgWlQ+hkbUdS9dyiJWeytimfezlukljxa0bliPolsLvvl9HLK36iDtAaH/3GA3WlBU1Se4FeuHbsmUuMyocevdxBR17eZq2hRekDmYveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761079603; c=relaxed/simple;
	bh=g8txWwMN/Rz5kR8tRDpRkFlN929hs3Yj1mRDSwWBnxE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HP3ywomiUllVofykAUMGJQQ1HG89xI7GBOT/ilOqUtDSMIqpo+Ec2Ye/4ODq8INYZZYo8z1SS3XxwpB0WYfTnB2Cy+rTHm+oFe9c6K7cila/hPlw0R4of1tREMn4931VJG+JLFnJ9Oc/7gNhSdBZxCbw1UImFxgngLuck+99SO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r//dQ98D; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59LKkUeN099262;
	Tue, 21 Oct 2025 15:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761079590;
	bh=lRvmrxTunZ/iPqAJOmWYTU3iSMQVGNfJCPqDgSkGQDU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r//dQ98DlD/9rT+w/3J/TQ2Hfvj1SZLiCcdZahMiaBHLP6ExUBWn5CAQ0tlzu7nz/
	 pO0q1ralCGXxoPbwrnhYsLpCJx1rx/YZh5ak8/sVs8H0YKIZAQ+HmcKQAXUOdKvqas
	 joLzk4maxyhwvKhk4p4Y4QQT5XcHo/fWGSR0da+E=
Received: from DFLE202.ent.ti.com (dfle202.ent.ti.com [10.64.6.60])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59LKkULh1069044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Oct 2025 15:46:30 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Oct
 2025 15:46:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 15:46:30 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59LKkQ9D113737;
	Tue, 21 Oct 2025 15:46:30 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee
	<jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nicolas
 Dufresne <nicolas.dufresne@collabora.com>
CC: Darren Etheridge <detheridge@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH v2 2/2] media: chips-media: wave5: Process ready frames when CMD_STOP sent to Encoder
Date: Tue, 21 Oct 2025 15:46:18 -0500
Message-ID: <20251021204618.2441939-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021204618.2441939-1-b-brnich@ti.com>
References: <20251021204618.2441939-1-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

CMD_STOP being sent to encoder before last job is executed by device_run
can lead to an occasional dropped frame. Ensure that remaining ready
buffers are drained by making a call to v4l2_m2m_try_schedule.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 0a2eab372913..7ee77c9a30c0 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -649,6 +649,8 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
 
 		m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
 		m2m_ctx->is_draining = true;
+
+		v4l2_m2m_try_schedule(m2m_ctx);
 		break;
 	case V4L2_ENC_CMD_START:
 		break;
-- 
2.34.1


