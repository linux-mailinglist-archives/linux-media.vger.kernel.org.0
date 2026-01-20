Return-Path: <linux-media+bounces-51097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2FD3C010
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 08:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78DDD504350
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08913876CB;
	Tue, 20 Jan 2026 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qLKqIXz3"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419DE1DFD96;
	Tue, 20 Jan 2026 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892278; cv=none; b=HtpG73WPRs/8aYXp7yaTI/JkgnQ8zumsBU/NWfzF/u1jYTxSBEaGHMQre6U36aRd0YAPJPZUDtfN+dE8RreiNescZ5pmBjOihoMwh6udf/V1OKuon0ZwII/btH+1AZOsV7YyFwdf2LRAfn1sQO1bTfkw7nrKx7Auh1oL1HNG3jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892278; c=relaxed/simple;
	bh=hCg5cQ6mjVuDt3p1MAt/aaspYrW0tgEQvAgOByGWI1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NMyFFUjyD0h5yWr+UWJIyS7hpsGfS09olWCSR1tU7XgVUAec6+OeWuEMC3+JFOa8UKIcdZXhaAVWyY9uBjHZkYUV2TqWynVX+irnK0Rp4ZMb4Paw7Lfbspj4Py/pywBxpcascV8KtL8OCcZ45uJb8QQxQklJ2v1CvMh6gCORqqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qLKqIXz3; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QN
	cn3sNklWIW7mslFDbQ4mwgfAUtkTvwtiUK0HmaGP0=; b=qLKqIXz3mQJiCwX0/v
	67KJo+XkGJLCnFlV16s7q+ny24kkOuG61v9VzKeo0q5+VZ8nEiOJpqC7mcrbMAki
	cM+/BeoWX5I1VHADAlHR9sCMY3S9UUpq4nQL3krjYzodWstIKF8+ly8eSubEgD94
	oP5doMNgHDOiNFfmIEJHuI8nk=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wA3Q6dNJ29p8xS7Gw--.54789S2;
	Tue, 20 Jan 2026 14:57:18 +0800 (CST)
From: "luo.liu" <luo.liu.linux@163.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luo.liu.linux@163.com
Subject: [PATCH] v4l2-async: add debugfs under CONFIG_DEBUG_FS
Date: Tue, 20 Jan 2026 14:57:10 +0800
Message-Id: <20260120065710.1120819-1-luo.liu.linux@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3Q6dNJ29p8xS7Gw--.54789S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xry5CF45tr4DZF4UKF47XFb_yoW8JF48pw
	4DKFsIkrW8Zr48urWfAry5Wr93X34vgF43ZrZxu34fXa4fZFnrJrySqryUZr4vgrWxJF1a
	qrWfArW3KFyxGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pitfQAUUUUU=
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC7A4ThGlvJ04xRAAA3v

All debugfs-related code is guarded by CONFIG_DEBUG_FS to avoid
bloating the kernel when debugfs is disabled.

Signed-off-by: luo.liu <luo.liu.linux@163.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 1c08bba9ecb9..ad4c0441b00e 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -966,21 +966,27 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
 
+#ifdef CONFIG_DEBUG_FS
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


