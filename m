Return-Path: <linux-media+bounces-49963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC5CF6CB4
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 06:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07A793017ED4
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 05:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4F528FFF6;
	Tue,  6 Jan 2026 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="0CGTsBkJ";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="XE3dY9hu"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8612DA77E
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678015; cv=none; b=WhnRLKEiaPCSiBy4VrqiFlJhtK2CLd63iFVrU98AGRuz4BipHA7PprCi7CPr+ztVAR5dWjamYjcUyrMWrBtKm50bBBj4plt0YKHp88s0OiySzRRfwdcIt0YwiX4OQoUZBZP/q0cOuuND2VVH5yASwQDz97gSGTC5tGNzmRKnHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678015; c=relaxed/simple;
	bh=nlZeKx/WsdUVRencZTnNcZrTLH/ONVDy/mFGibneVQE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bmDSpXr1MGMPF+wwkI21rIgH6Y9KQ4K4/dmF0TB1SCkc6xZ5db6G1HRXb63iIlUY0Qv/ziz6PJhYQFtjesQiosXKIi7QLNJEC/wrDD0XTbXrwWCdvo/kS+xJitY/2zlRUPsPaexghZHmeiRlFeKTlTJtDmZ2fweRGPUDF9cf5VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=0CGTsBkJ; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=XE3dY9hu; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1767678007;
	bh=jAXQypJwkEBdsBc3burggqz+vq2Lgfm2waHWJh0qX4c=; l=1676;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=0CGTsBkJFmtIAZ5L7iP4G23Y/8osD78UzZY8v/4Jc8bfM6vvMqi2dUp2rW68PYv0N
	 g3AXPc2EFR4Q7N/ntdpojTDSjMKCKm1M9VKOJAARCmc/HwQvDuy1HN3GsqT6XFEZXd
	 ECRCwbWeEOmR6CAYqB9i6yTIJq2td4dnaTsnXz7tFJc7YqpwGYK+MpZxj+UV0syfaR
	 78+GPlCDaBxj+lf2OOsx52DXgF49Ty8bIjdKHcSQkfVlj5lVG89yzdMbcTQdRvklZ8
	 SQPcXRk1aixAcsi39jDi7hyBdRrV/8UFYmSivebmMW0KzR8zxhAPYnvVK3n9THV1of
	 pfxhf2WMUSvoQ==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128079:0:AUTH_RELAY)
	(envelope-from <prvs=1464629B15=cy_huang@richtek.com>); Tue, 06 Jan 2026 13:40:04 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1767678004;
	bh=jAXQypJwkEBdsBc3burggqz+vq2Lgfm2waHWJh0qX4c=; l=1676;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XE3dY9huV1amArTOzVo1/bjGXctaqZK/i4k32D9VDoeTlt6IUQ7MIrNz+ZauCl5WB
	 t+rq8ibcxbyfTONnLCcDzial0qEFYxV43rrN5qBUDHCBdu2QcQGuW8Ms2GoU4zw+V1
	 bBRnxR7iqEC0fHu624vk/xgBcuRoidn8TYYgDihJvgfxStLWHHupds+bmfkmC77WEm
	 YdQNz1bh9fgaNNSDCAb3w883/Y0KQ9evws+vQMjw18k8x2YkABxXRPQlBJC379j1Z8
	 DJHfxquzv0Trd5SMxygW7tVXN5wKAkLVYTB6NNxl6L2QWwpuNjcGiUZuuZYUandwzb
	 X9yoec/TNfOOg==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572460:1:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Tue, 06 Jan 2026 13:33:05 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 6 Jan
 2026 13:33:04 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Tue, 6 Jan 2026 13:33:04 +0800
From: <cy_huang@richtek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: ChiYuan Huang <cy_huang@richtek.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, Roger Wang
	<roger-hy.wang@mediatek.com>
Subject: [PATCH] media: v4l2-flash: Enter LED off state after file handle closed
Date: Tue, 6 Jan 2026 13:32:59 +0800
Message-ID: <0e7005f10222b57f100b442a8b48bb5bc2747e78.1767674614.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

To make sure LED enter off state after file handle is closed, initiatively
configure LED_MODE to NONE. This can guarantee whatever the previous state
is torch or strobe mode, the final state will be off.

Cc: stable@vger.kernel.org
Fixes : 42bd6f59ae90 ("media: Add registration helpers for V4L2 flash sub-devices")
Reported-by: Roger Wang <roger-hy.wang@mediatek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi,
  We encounter an issue. When the upper layer camera process is crashed,
if the new process did not reinit the LED,  it will keeps the previous
state whatever it's in torch or strobe mode

OS will handle the resource management. So when the process is crashed
or terminated, the 'close' API will be called to release resources.
That's why we add the initiative action to trigger LED off in file
handle close is called.
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 355595a0fefa..347b37f3ef69 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		return 0;
 
 	if (led_cdev) {
+		/* If file handle is released, make sure LED enter off state */
+		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
+			V4L2_FLASH_LED_MODE_NONE);
+		if (ret)
+			return ret;
+
 		mutex_lock(&led_cdev->led_access);
 
 		if (v4l2_flash->ctrls[STROBE_SOURCE])
-- 
2.34.1


