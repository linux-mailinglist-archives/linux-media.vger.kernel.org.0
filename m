Return-Path: <linux-media+bounces-55577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL9xOii1s2l5aAAAu9opvQ
	(envelope-from <linux-media+bounces-55577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:56:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B879727E68A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35427302A693
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C0C35DA74;
	Fri, 13 Mar 2026 06:56:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEF4330305
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384993; cv=none; b=exuz2ia8Svoa0EbSoINnj1Ioc6lVYsN2hpTwi5WM2TJiTqWkp/HqYNkaT5UNO1NlGTVql+7/ayC8vHV+M7o0q4eDH7eJ1OugM6xZdsVPHDR6Qzf5g/h7yFD7kAey5TZ42hVIb05RqQ9ieZoQzv3kuuAriwUr+1RrKT+4E7iQlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384993; c=relaxed/simple;
	bh=XyBvSaasTDuyDkNKls15ydkXNvdR4qeP0gVKkL5Cb7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R0eTSDmfviMPZup205qqopZQdsq/Mqa5gOma94KFwEPX88LAq19o1Lpy9K5S+Q96Pd3YbQsF2Htsw1F1Jg6XFqkSD01TZcEMwKtR7lGhCvtLaeg6FWtQCfjlLNu+VHbENZfIQujY3xCHdDYDfFQTaQUeC8//cjJb+zs88oa0mj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAA34m0NtbNpJ9zsCQ--.15583S2;
	Fri, 13 Mar 2026 14:56:13 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kees@kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: v4l2-subdev: Fix error check in v4l2_subdev_get_frame_desc_passthrough()
Date: Fri, 13 Mar 2026 14:39:46 +0800
Message-Id: <20260313063946.3220962-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA34m0NtbNpJ9zsCQ--.15583S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyUWw4rWr4fXw1xXw43ZFb_yoWkuwb_WF
	1kuFsrXrn8urWqk342yryjv34jvrZruFn3WFW3ta13tF15u3WDXFn2qry3Zrs7Gan0vFn8
	A348WF43Zr97ujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUnBMNUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55577-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: B879727E68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IS_ERR() and PTR_ERR() to properly handle the error return from
media_pad_remote_pad_unique(), which returns ERR_PTR() on failure but
never NULL. The previous code only checked for NULL, leading to invalid
pointer dereference.

Fixes: a564839e630c ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
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


