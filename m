Return-Path: <linux-media+bounces-62562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MpXNUL/D2pvSQYAu9opvQ
	(envelope-from <linux-media+bounces-62562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 09:01:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D09965AFC72
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 09:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89C23306906E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 06:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47B13905E7;
	Fri, 22 May 2026 06:59:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB433815D8;
	Fri, 22 May 2026 06:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433174; cv=none; b=I+4WOmKlObUdv8fnNbBPE7Oj7MG1Vg60WhwQqmrUCoSaJV2gnyYLdgiZmbXopWVdcxQKiP6kkvldE+KmV8JqVJLUfXxNbaZ8cxZ6BTVEmMbiUTielZr34Qm/hKopSwPJ5eONcMTuwpbqdAT2dyovwol3diGCfbeCMNZLsZQ/cis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433174; c=relaxed/simple;
	bh=qZLCOl4W8vKKfpEMYxYDgjNqQ2kxwQKRemmao8EJeTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k/rt37UcvBFyaXTKG7fRoWET1V2zWO4CR75itLekHWK9wu/3wAmbYTXAqDf1QZ1PSjk1DkiNFte+Yga8l0WDlQrXHcMCQhbNffnIz63npv7XintWFPb6Q3qy7de03kuVKts4zkTRyGK7qWn7pnEywrx3ASjqPHRFpzuyqlWPC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAXvmnG_g9qxkskEQ--.2633S2;
	Fri, 22 May 2026 14:59:18 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil+cisco@kernel.org,
	gerald.loacker@wolfvision.net,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: rockchip: rkcif: Fix error handling for media_entity_remote_source_pad_unique()
Date: Fri, 22 May 2026 14:55:48 +0800
Message-Id: <20260522065548.2438545-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXvmnG_g9qxkskEQ--.2633S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFW8tw47GFWUtFWkKrWrAFb_yoWktwc_XF
	Z2yFZxWF10yrs0kwsrtrWru3y5t39I9Fn5JaySka13GF98Cas5AF1jvrW3X3WxJryY9F1U
	Grn8KFyUua1rCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfU5iihUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62562-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[iscas.ac.cn];
	NEURAL_SPAM(0.00)[0.472];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: D09965AFC72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The media_entity_remote_source_pad_unique() function returns an error
pointer on failure, not NULL. Fix the check to use IS_ERR() and return
PTR_ERR() to correctly handle allocation failures.

Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..542aa877919d 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
 	struct rkcif_stream *stream = to_rkcif_stream(vdev);
 	int ret = -EINVAL;
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity))
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
 		return -ENOTCONN;
 
 	sd = media_entity_to_v4l2_subdev(link->source->entity);
-- 
2.25.1


