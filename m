Return-Path: <linux-media+bounces-55598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPJpCOLDs2mEagAAu9opvQ
	(envelope-from <linux-media+bounces-55598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:59:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64327F221
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FF2530162A7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3621936E48F;
	Fri, 13 Mar 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cib7yjeF"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B7A2D876F;
	Fri, 13 Mar 2026 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388732; cv=none; b=ZmGCTKBAwMAsiFMd+LxWdgjnC6XEoZ+UOpA9YcZ3wY6YRo/wp8D+D1CfOd5Kgw7R188Jxp92/r7a42PKWSar88eIMscBxV6MTQfsitBDrOfPdXmCEJgTdSCHWl91GbB0jJPtyZQIbM+yHtyXe7esoOUhZJtWPm+YipzxWnt7KYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388732; c=relaxed/simple;
	bh=pp87Wq5LmqxkTxid6XnFXaHkwl8ofaqkbQrwpMlF8n8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b5EvGPKqNn4lav9m8ggoGKbD3cRbxMNalun3kJ86N5wD3RipgP1n26XL7MAKgJE44VxL3RMbcD75oPDCSDSLEgF3tnhiFcJhe7/HwyZ0ZNwFB9AJ6Z2mY9t55DdV1w0TIuBSPg/eBXGymhl8BHbJpjQeK9h0bqUqAy5HFUAOLuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cib7yjeF; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LH
	bWiGc6O5iUSm/qQtlUbxtKVFEEtJMGx4WnHT2tJoU=; b=cib7yjeF2M7bY3dO/N
	6HG+3Hi2F7u0cbIcKiy9rxQ251M9EVTF81oNkf1VavfcQddw+54MV/LjNpy1i6JY
	0NuQpnvRIRR2wmVp4RQWzrSPDMXo5nfOlw4sRhsn21LtLATz5gGlzsMMLm7VFXlW
	oX+IvYXPD/yNYjOpvugwLBPBI=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v3Ojw7NpaE3XAg--.35455S2;
	Fri, 13 Mar 2026 15:58:27 +0800 (CST)
From: "luo.liu" <luo.liu.linux@163.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luo.liu.linux@163.com
Subject: [PATCH] media:v4l2-async:debugfs for registered subdevices
Date: Fri, 13 Mar 2026 15:58:24 +0800
Message-Id: <20260313075824.2818713-1-luo.liu.linux@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v3Ojw7NpaE3XAg--.35455S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWDAw48tryDGry8JFyfCrg_yoW8AFWxpa
	98KFyayr45XFs7Xr43AF15uF93Wa40ya1fZr9xCw18J3y7WF9rtryftFyUZr4qgrs7AF12
	qFW5GayrCFy5Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_ZXoAUUUUU=
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC7ARh0mmzw6TcygAA3w
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55598-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A64327F221
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new debugfs file "registered_subdevices" under the "v4l2-async"
directory to display all registered subdevices in the subdev_list. This
helps with debugging by providing a clear view of all currently registered
V4L2 subdevices.

The new file displays each subdevice's name and device path (if available).

Signed-off-by: luo.liu <luo.liu.linux@163.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 888a2e213b08..0f90ee268d99 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -966,6 +966,25 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
 
+static int registered_subdevs_show(struct seq_file *s, void *data)
+{
+	struct v4l2_subdev *sd;
+
+	mutex_lock(&list_lock);
+
+	list_for_each_entry(sd, &subdev_list, async_list) {
+		seq_printf(s, "%s", sd->name);
+		if (sd->dev)
+			seq_printf(s, " (dev: %s)", dev_name(sd->dev));
+		seq_putc(s, '\n');
+	}
+
+	mutex_unlock(&list_lock);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(registered_subdevs);
+
 static struct dentry *v4l2_async_debugfs_dir;
 
 static int __init v4l2_async_init(void)
@@ -974,6 +993,9 @@ static int __init v4l2_async_init(void)
 	debugfs_create_file("pending_async_subdevices", 0444,
 			    v4l2_async_debugfs_dir, NULL,
 			    &pending_subdevs_fops);
+	debugfs_create_file("registered_subdevices", 0444,
+			    v4l2_async_debugfs_dir, NULL,
+			    &registered_subdevs_fops);
 
 	return 0;
 }

base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
-- 
2.25.1


