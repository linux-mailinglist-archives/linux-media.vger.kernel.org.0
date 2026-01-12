Return-Path: <linux-media+bounces-50380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1BD10497
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 02:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAA383037532
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 01:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C7723A9B3;
	Mon, 12 Jan 2026 01:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="cXgIGr/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF7B672;
	Mon, 12 Jan 2026 01:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182784; cv=none; b=QyE7f8WlnNkETZmMczKcRuVo9eKKWyjQF5zCOn+YQpGf5fECBtmfcPfnWEmdbUbms+F/6gEZrdeYmGwboN39Y69R2wTTbgz+LXVIfj4XHzDgoIQJvxdOIend1lm13s23tFcXZiCRMrNx9FmJ/v/AHAwKcXSIiHeBfRBIuaLySfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182784; c=relaxed/simple;
	bh=EzrQ79+hl45J3CfoE6xzSAkyRDxtujliatJMO9Bviso=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mBLJYi+ktUI8OCPsK1fbpI7F251/+ZExzQEm3IawWfKwAgNrZWCK09zV33XMWERLBbab+X3Zhpqqs7DSs7u0qd0+vBA1gbsqO8aSjntdIfLGh/+rnUzFpBC3eQbFo3rZuuiM/Y+aL+k9wGpwvT8XQi6/mkU5T+ezzspDfpAbR5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=cXgIGr/Z; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1768182778;
	bh=Cefewr4mvT2AuPprSC1fIG+Kyvw5hu4x1RrqRxfTXbA=; l=1807;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cXgIGr/ZN4XKfgagB448oNFAGvNxoNTywxtzA9Uo3VnwjvIaEqeQF2YxcQqewEN2b
	 nhh6B5oyIy+oWw6vlMwq0+1z9H2jBzX7vFQ8IisVJmXhQrZQMruvDKOrfVbI7bGp/I
	 m03rh9vMS0WYrHReOPZqZNZY84Jreamh51J9qGhbPZUpxgXysRE/jV1Z0q7U9MtFB9
	 r6HCJJNW/ZSOaDb/o0I7xZdr6AHc/3uOPjS4Axa8dwhXyScnLYuCwWTxEmFt8TkAqu
	 s873jKHb1MpiCxKGnMb/IR03R0uaPlzs22cMmicI+yTu/+30rcCZf2YJYRhqpeDVAV
	 4HjlHsVVF0lPQ==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572447:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 12 Jan 2026 09:52:52 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 12 Jan
 2026 09:52:51 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 12 Jan 2026 09:52:51 +0800
From: <cy_huang@richtek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: ChiYuan Huang <cy_huang@richtek.com>, Roger Wang
	<roger-hy.wang@mediatek.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v2] media: v4l2-flash: Enter LED off state after file handle closed
Date: Mon, 12 Jan 2026 09:52:48 +0800
Message-ID: <6f834257e1e16fb7d212412605c0f0fdd16cf717.1768182390.git.cy_huang@richtek.com>
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
Fixes: 42bd6f59ae90 ("media: Add registration helpers for V4L2 flash sub-devices")
Reported-by: Roger Wang <roger-hy.wang@mediatek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
v2
- Fix commit message redudant space cause patch robot parsing error

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

base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa
-- 
2.34.1


