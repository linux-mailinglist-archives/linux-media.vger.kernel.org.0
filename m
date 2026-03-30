Return-Path: <linux-media+bounces-57534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIdoH7HsyWm13QUAu9opvQ
	(envelope-from <linux-media+bounces-57534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 05:23:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0994355068
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 05:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93BCE30094D2
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39177391E44;
	Mon, 30 Mar 2026 03:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="eGGkyaxa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0AB14A60F;
	Mon, 30 Mar 2026 03:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840999; cv=none; b=aKo67lcARa+fP/G6mWRrlPN8247r+JrvQ2YCh4O21XHUFeCf1doM9qRTJip3b7w0w32ulzLLd7xQTswRGYFOzU0q4m6jTXJVY4aq7xXhnH2EGdOLNBR9ogL1+pHbp0A8d3046yb6qbUPNk8dpSfA1g0Eyj3C2Cu1fUVw3CyBD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840999; c=relaxed/simple;
	bh=EvltsQEtlX/z8fkim66jY6/k/cloeLtZjKyyr6RwzMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KglSZqHceLt3oMT7EVuZ3smORMHvZtKKRg7b///Gl9h7mGhD28ISe4pgaj186Bku4MpKdOd3ZhSXOurIXUkl5hRg632SAvx6InKU6qBU6v81nvD2ptWKekM1hVwsFwXTVojGwR+gp2fhC3xQCfc/svV6pNzZICTP/+N0/uz5Hj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=eGGkyaxa; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1774840957;
	bh=XBkj5RGWlabFTe4i9VUZIQ6vQcbQZT9PVkdqJtoTeH4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=eGGkyaxamYr2Z1Y49UiXG1cHLTcHj1rKiRsXismuD0/1Q7H511RBYMv6mmGIR2fok
	 hiU0uol87Gc+HM7ubnxpqPqsYk6oxTroQCB0Xm6mpEANaOHxdA629qep94IrQMzmN6
	 QJ+17trMCqwwLnL/F4VgIzwYEmetQbBVZOi+Zk4g=
X-QQ-mid: zesmtpip3t1774840933tc0eccdb5
X-QQ-Originating-IP: 5+7X5JfM9waCMDOlCyHNjmBe7fTH8kOoH8RRagSytXo=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 11:22:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12096208937238635833
EX-QQ-RecipientCnt: 6
From: Morduan Zang <zhangdandan@uniontech.com>
To: mchehab@kernel.org
Cc: zhanjun@uniontech.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangdandan@uniontech.com,
	syzbot+4a824e616e58ca2b3d25@syzkaller.appspotmail.com
Subject: [PATCH] media: hackrf: fix use-after-free in hackrf_probe() error path
Date: Mon, 30 Mar 2026 11:22:10 +0800
Message-ID: <49E2947100B6EA2D+20260330032210.14080-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDu8aKWRFc7DrDQ0tFNSSUcwP5IIhQhumSZXo20ZpbSLGUxKdFhaEwfD
	CSPqSJd9zKy/PVrYIXaK+mwM9AHxFux9RqxkUJWm+dgA69IV6X8dGuSJIpiIrv48Fv6mPR5
	Z0SycTinktvMNvWL7PljaWNs2hPzEidY16CW3L2/nAbB/hbDF7loJS3eIsyhlwzpIG9Fzlb
	YwM3IxWe5IDTzrujDO6peoR9oEUUWFZs4wzzZ1pu2bUC3YpNIkUYhSRJkw0Q3s8w8GroFPq
	kfriihlkl3l7oFzL82a7J9G2ANKiI5ARKEtriXwLMkgMMVzA6cpSA/BpyyG4OPHxJG/BdQ0
	pOmxIKY5wvsiEo0f0+rXnGdvi7WbVpmlC11OKljiMVIUqpk57T6s2SM7MFpm3s7uf4qC8oP
	7tmCi94Rs/49d+eWYwvcOhwldW9IBoytt2W1RgiM/LG+vCEpQ4QtzbdSjlPoTBPUZVxqpts
	nn3wqkItNZuRZayuDU+KysDPOO9v2tlNrj2fAc57jZaU58bsTW9uFu2VwFslEe/XxEB1KkZ
	qpSeC5rujAWbxm2dc/HGCJPJH0z4AAKAqbhYBpsrwWsjSVogAp0CSAGTJe2eVCjbulEOLMB
	IBu1K58MivKqOHPzzCDPq9PtSCqCvEslIHlJhqNKbkzrGy7wIM89LUm1rpuQhij07m3DjFy
	UMwO8ouBuQ/dlktf/CFOFIXBYfHZix5rH7VhKEUO7Qieticri//ppT2fGRI1rzODGddBgaE
	Z3WPJvZjJtxmCZQmzam5Cl4BmhUyIxwMPU63Sf6e6nIj0p+fAZogauv6pqBTOl+Ip9lhsiY
	5K5QhxvhxMSAyvXEMDlSUUlsk9IoesTtkaGXwJ3LyjzLMqSbleA85X7mpSQpARzLAzCJmoP
	toVHwoj/bxVXr+/W4ubrrW0gy9BltrBlYyNPvfFC9IgRkmFHZGGPcpPZiLXuPE3xhJV+cvV
	agO+vF9uQqjnhdASq7kH5i0b81aTm5mdo27zWYdUJR8C0XgoNXelZIDhdDvVpdo5KRgauQG
	PwmE0CG6OWg3DsXDq4xWs47Pvt37fYdIH0DFwxu+WdcA+ghUS2PAc3sm22ptRKVE9mNpUFk
	qi6u7hiL4fX
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57534-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangdandan@uniontech.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,4a824e616e58ca2b3d25];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,syzkaller.appspot.com:url,appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0994355068
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhan Jun <zhanjun@uniontech.com>

When hackrf_probe() registers the RX video device successfully but the
subsequent TX video device registration fails, the error path falls
through to kfree(dev), immediately freeing the entire hackrf_dev struct.

Since the RX video device is already visible to userspace at this point,
a process such as v4l_id may have opened /dev/swradioN and still hold a
file descriptor. When that fd is closed, v4l2_fh_release() calls
v4l2_fh_del() which tries to acquire the spinlock vdev->fh_lock — but
that lock lives inside the already-freed hackrf_dev, causing a
slab-use-after-free detected by KASAN:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x40/0x60
  Call Trace:
   v4l2_fh_del drivers/media/v4l2-core/v4l2-fh.c:74 [inline]
   v4l2_fh_release+0x78/0x290 drivers/media/v4l2-core/v4l2-fh.c:99
   v4l2_release+0x250/0x370 drivers/media/v4l2-core/v4l2-dev.c:471

The root cause is that the probe error path directly frees the struct
instead of deferring cleanup via the v4l2_device refcount, unlike
hackrf_disconnect() which correctly calls v4l2_device_put() and lets
hackrf_video_release() handle the final kfree() when all references
are dropped.

Fix this by returning early from err_video_unregister_device_rx after
calling v4l2_device_put(), mirroring the disconnect path. This ensures
the hackrf_dev struct remains valid until all open file descriptors are
closed.

Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
Reported-by: syzbot+4a824e616e58ca2b3d25@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4a824e616e58ca2b3d25

Signed-off-by: Zhan Jun <zhanjun@uniontech.com>
---
 drivers/media/usb/hackrf/hackrf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 94d356fba612..ec4ac1b77d0b 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1513,6 +1513,14 @@ static int hackrf_probe(struct usb_interface *intf,
 	return 0;
 err_video_unregister_device_rx:
 	video_unregister_device(&dev->rx_vdev);
+	/* v4l2_device refcount was incremented by video_register_device().
+	 * Use v4l2_device_put() to let hackrf_video_release() handle cleanup
+	 * when the last reference is dropped, avoiding a use-after-free if
+	 * userspace still holds an open file descriptor.
+	 */
+	v4l2_device_put(&dev->v4l2_dev);
+	dev_dbg(&intf->dev, "failed=%d\n", ret);
+	return ret;
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_v4l2_ctrl_handler_free_tx:
-- 
2.50.1


