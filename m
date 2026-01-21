Return-Path: <linux-media+bounces-51183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DgbF+5EcGnXXAAAu9opvQ
	(envelope-from <linux-media+bounces-51183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:15:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0F504E1
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D0C35079A3
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8C4358D2C;
	Wed, 21 Jan 2026 03:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C9jVfd4r"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCDE357721;
	Wed, 21 Jan 2026 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965326; cv=none; b=mH15XvU01IhnzdhkTOrNcAK6HNqaHdKgHlliaxJsw8ElsEjR06hmmAApbB2zx2etrjTy8lxx/CzXgMC4yQdWuI71n0jdNOkOTyg895yg9iqKcsaUH76gbW3nnVahrJ6oDpJET3I+oFR7szTBLOW5qV9dTnVCKVSMGku1Brux9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965326; c=relaxed/simple;
	bh=MqEZZtyb+ZB9dVxpPI9nzTOnN+xWfyTdGxYmCce2zBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gNCygSg8jfX70WHI0J25qpLG2QGXGj0ueloMoiYkHNhtroofEhynx2KPal8OIur9OeCpWdGxtoRfISvYfr4IXVmOWt3GGF7QGWZjxqrxWvMog0IWbC6vzrYQlsHpzbQ35pBB5F1iQMN4Hd8kEDsd9E1ZOSgRurEGfEYEXAQka94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C9jVfd4r; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=s9
	JFg6PTq/CjDbdDzIdzsabJLGCWJstZ/YiPUqVPE3U=; b=C9jVfd4ri/Kdjjbf+Y
	JxsG7NcJAoDDieMkxCNxDKwQEdLWBeTDL0czENRsfeazKKq6a4fQGYYsn46Hy7UY
	j0RUjH6Sgfp9DC+nPNQpfVCjGbMrYjLA7rX0/6X3UmCxlh6PP8MRwzAUCLn3vW+L
	rWDbf01uXUyxx1QPJzciTEWPo=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDH06OyRHBpY7BOGw--.20658S2;
	Wed, 21 Jan 2026 11:14:59 +0800 (CST)
From: "luo.liu" <luo.liu.linux@163.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luo.liu.linux@163.com
Subject: [PATCH v2] media:v4l2-async:add debugfs under CONFIG_DEBUG_FS
Date: Wed, 21 Jan 2026 11:14:56 +0800
Message-Id: <20260121031456.1125096-1-luo.liu.linux@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDH06OyRHBpY7BOGw--.20658S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7ur1UXF4kCr4DWFykXwb_yoW8Xryrpa
	yDKFsFyr4UZr48urW3Ary5ur93X34kKay3Zr9rC34Fq34xXFnrJrySqryUZr4vgrW7Gr1a
	qFWfZrWakFyUGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWCJkUUUUU=
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6xOzJWlwRLMo3wAA33
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[163.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51183-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[163.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A9E0F504E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All debugfs-related code is guarded by CONFIG_DEBUG_FS to avoid
bloating the kernel when debugfs is disabled.

Signed-off-by: luo.liu <luo.liu.linux@163.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 1c08bba9ecb9..f6a1a57149ba 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -947,6 +947,7 @@ v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
 		return "nil";
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int pending_subdevs_show(struct seq_file *s, void *data)
 {
 	struct v4l2_async_notifier *notif;
@@ -967,20 +968,25 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
 
 static struct dentry *v4l2_async_debugfs_dir;
+#endif
 
 static int __init v4l2_async_init(void)
 {
+#ifdef CONFIG_DEBUG_FS
 	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
 	debugfs_create_file("pending_async_subdevices", 0444,
 			    v4l2_async_debugfs_dir, NULL,
 			    &pending_subdevs_fops);
 
+#endif
 	return 0;
 }
 
 static void __exit v4l2_async_exit(void)
 {
+#ifdef CONFIG_DEBUG_FS
 	debugfs_remove_recursive(v4l2_async_debugfs_dir);
+#endif
 }
 
 subsys_initcall(v4l2_async_init);

base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
-- 
2.25.1


