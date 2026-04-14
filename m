Return-Path: <linux-media+bounces-58716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNbpIWD83WkRmAkAu9opvQ
	(envelope-from <linux-media+bounces-58716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:35:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F53F7667
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C53E3304F208
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43BD3B3892;
	Tue, 14 Apr 2026 08:32:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038A13A4527;
	Tue, 14 Apr 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155577; cv=none; b=lmNS/wwQw92fWoBBR8Kd0Zb5sMSiPleiQmEssEeymDuYGEB9TcSXdvmjuunHqmZiknkyV1/IpMrJbY+9hiL/CCcUmJJ+/a78Ls5FITWblBFRkbpcLDgFs76x8IcyaIG0wNXAZ6yPmRM8GugQiRLUrumuzEDkTw1lfNX89EZku0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155577; c=relaxed/simple;
	bh=eo73xe+otZUFCUKwN6cgMqrG/xDBLE+81EnljqUJjDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c4+wMD2Y29M095FQgHcrVyS1una42kt2PU5P7RnirkhPHFo31wOALpizJkiBhpJ3NoPGyrnwXYBL3B9QJU0Pb9v8tCXNrAStbtx6u/VmG692MJhmemCxgxs57aL5S0zSqi5yBiR8r4oqkex3YXi3Eg6Uyi85Ne9XWTRv8GVNJdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowACHnNOn+91pqzHyDQ--.11904S2;
	Tue, 14 Apr 2026 16:32:40 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] media: em28xx-video: fix missing res_free() on init_usb_xfer failure
Date: Tue, 14 Apr 2026 16:32:39 +0800
Message-Id: <20260414083239.34407-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHnNOn+91pqzHyDQ--.11904S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyUKr1Utw13tFWrJry7Jrb_yoWfZrg_ur
	409rWxXr17uas3tw17Ar4FyryUAw47Wrn7WFy0qFZ5Jry7Ka15ZasFqrn3WwnFyFW2kr1D
	XryqqFnrCwnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbw8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwwKE2nU1CKdFQACsT
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58716-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihaoxiang@isrc.iscas.ac.cn,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 167F53F7667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

res_get() is called before em28xx_init_usb_xfer(), but the error
path of em28xx_init_usb_xfer() does not release the resource,
leading to a persistent busy state.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/media/usb/em28xx/em28xx-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 2dfa3242a7ab..56f2326d2280 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1105,8 +1105,10 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 					  dev->max_pkt_size,
 					  dev->packet_multiplier,
 					  em28xx_urb_data_copy);
-		if (rc < 0)
+		if (rc < 0) {
+			res_free(dev, vq->type);
 			return rc;
+		}
 
 		/*
 		 * djh: it's not clear whether this code is still needed.  I'm
-- 
2.25.1


