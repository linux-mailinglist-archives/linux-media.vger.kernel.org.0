Return-Path: <linux-media+bounces-55987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xVmeBAnEuGm1jAEAu9opvQ
	(envelope-from <linux-media+bounces-55987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 04:01:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A312A2FC6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 04:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B68BB302A18D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 03:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9875D29D287;
	Tue, 17 Mar 2026 03:01:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1BEEB3;
	Tue, 17 Mar 2026 03:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773716484; cv=none; b=HTijH4D+IWXLO7LHaQ6kyoK4jVDThvMdEDmKVSEBYHea1HCQ4qd8hNUaabPhlX1kpBwhBFhBH/03bNieeE92kGEJ2nI4ChczuDJOKC4orc26qGjmkDA97uha0DVcwqi2S0ggu2V2lKcnvNCZ532vFujqeTZUhjHM1HzdVTspo68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773716484; c=relaxed/simple;
	bh=11xnGSmN7IJU/J0o0MDxkik7RRacvzp80P9GMfwY2xo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CWCGhLBaYOmXbNpizRzQXII4qgAd4Jvrpx/nvSa7wXMyhKGdOdDZYN4UxECm00JHjj4Trm+g6J7vano9FyuuN7sF5rULXlo7ZgrWlGL/CXLnJcN2j8MQTFIGqfn1aqnagcvnys5HQXdeW3WvwT02A6QFaLKktFnn5q5DcsIwaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACXKQ34w7hpGjmoCg--.33749S2;
	Tue, 17 Mar 2026 11:01:12 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kees@kernel.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] media: v4l2-subdev: Fix error check in v4l2_subdev_get_frame_desc_passthrough()
Date: Tue, 17 Mar 2026 10:58:08 +0800
Message-Id: <20260317025808.3602589-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXKQ34w7hpGjmoCg--.33749S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4fury8tFy7JF4xXw4DCFg_yoW8CF1fpr
	W7KF4IkrWjqFyrJan8J3WfJas5Ja40yFW2krWfXwn7ZwnrtF9rtryxt345ZFyvk392qaya
	vFn8urWxAFyYkrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYb10UUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55987-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,linux.intel.com,gmail.com,vger.kernel.org,iscas.ac.cn];
	DMARC_NA(0.00)[iscas.ac.cn];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.869];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 64A312A2FC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IS_ERR() and PTR_ERR() to properly handle the error return from
media_pad_remote_pad_unique(), which returns ERR_PTR() on failure but
never NULL. The previous code only checked for NULL, leading to invalid
pointer dereference.

Detected by Smatch:
drivers/media/v4l2-core/v4l2-subdev.c:2588 v4l2_subdev_get_frame_desc_passthrough() warn:
'remote_source_pad' is an error pointer or valid

drivers/media/v4l2-core/v4l2-subdev.c:2595 v4l2_subdev_get_frame_desc_passthrough() error:
'remote_source_pad' dereferencing possible ERR_PTR()

Fixes: a564839e630c ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
Reported-by: Ethan Tidmore <ethantidmore06@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changes in v2:
- Added Smatch warning messages to commit message
- Added Reported-by tag for Ethan Tidmore
- Kept both Reviewed-by tags
---
 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9efd14d4026f..7cb17e0a5617 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2585,10 +2585,10 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 			if (!have_source_fd) {
 				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
-				if (!remote_source_pad) {
+				if (IS_ERR(remote_source_pad)) {
 					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
 						local_sink_pad->index);
-					ret = -EINVAL;
+					ret = PTR_ERR(remote_source_pad);
 					goto out_unlock;
 				}
 
-- 
2.25.1


