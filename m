Return-Path: <linux-media+bounces-50402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A21D11793
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270BE306579E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D3F347BDC;
	Mon, 12 Jan 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="0MCcXtZj"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1BF310762;
	Mon, 12 Jan 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209634; cv=none; b=EsebYHxZmll7IgSjTa0aTc7RZx+sDNPwsWBrUFEBoF0XkDLia3Gisi+aL12IXGGokonhfFRn2szZvhsjdVl/pdx7WG327SIcvWxk9LEte1ilQljYEhNN2OiZ7ypuvTrPHTTfIs/V2NzOEXFDt0E9wXVhglAXLE+QAZLFgxcCX4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209634; c=relaxed/simple;
	bh=YcoDp1xRfU2RgOGualudavWqplWNYj+vqh7bdVcfYNY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NlsXgY3q8bc9YnDAIV3J6A8OVyYaPie/mclmfS1iOtcbWBBG6bMZszfXu5tsPhsVxSMO5P4josgMdUhMqIvhdpIWyDEHwhXT3VDaThJKnci3JleL5yv0RT2YDPBppB11qrRCS8q+iW/0oYL3VvunvOQcc25ZU69tsHycCTSVEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=0MCcXtZj; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1768209629;
	bh=9YVDhrBinYzjrRTisNlGCOPvmAc8V6H7vwl9pQeQ6Jo=; l=1905;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=0MCcXtZjRsPdlLanQPVbNuv1aFfftI3cdnXM6NSneYdmwFjJNWBBHyB1wnPNy7Yj6
	 sQ4r8n+UU9Q5EtYiN3q5xTQ0tIYzJpI+M2hZck7OWyv6mbiuDgurGoy2MbVw6neY9h
	 S9bM+3ECCzkj+D1CnbHrPQ7arGc/d/IzdEu/L1hYnG9mWpm9iGF7bGnCgNeXCZWEsm
	 blvtvN+eMbc4GZLGWNl1J6APf1dHWpZj0MckF1/1UCFZxiFwapb1MmgvA9zxCVSHsP
	 fDUDixx9WhU/YBvgWp0zGmhPdUdEroiNmMQLqpGDWYVVRryUs6TRP0c18epsW959jQ
	 dGcahCLqlXPdA==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572445:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 12 Jan 2026 17:20:08 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 12 Jan
 2026 17:20:07 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 12 Jan 2026 17:20:07 +0800
From: <cy_huang@richtek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Bryan Wu <cooloney@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>, ChiYuan Huang
	<cy_huang@richtek.com>, <roger-hy.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v3] media: v4l2-flash: Enter LED off state after file handle closed
Date: Mon, 12 Jan 2026 17:20:04 +0800
Message-ID: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
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
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Still cannot pass patch integration check, send v3 patch to fix all.

v3
- Remove 'Reported-by' tag
- Fix identation check for patch integration

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
index 355595a0fefa..46606f5cc192 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		return 0;
 
 	if (led_cdev) {
+		/* If file handle is released, make sure LED enter off state */
+		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
+				       V4L2_FLASH_LED_MODE_NONE);
+		if (ret)
+			return ret;
+
 		mutex_lock(&led_cdev->led_access);
 
 		if (v4l2_flash->ctrls[STROBE_SOURCE])

base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa
-- 
2.34.1


