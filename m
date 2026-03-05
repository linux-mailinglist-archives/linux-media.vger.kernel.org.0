Return-Path: <linux-media+bounces-54566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM6oODITqWlz1AAAu9opvQ
	(envelope-from <linux-media+bounces-54566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 06:22:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 707EC20AFA5
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 06:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14903303DD53
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 05:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73FC287257;
	Thu,  5 Mar 2026 05:21:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9986352;
	Thu,  5 Mar 2026 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772688100; cv=none; b=UbU2GJMay0iF7n1i8S9E+Hur6Xv1OMjJYSqJ0HsVvwAmOWzuDLMPWtP7K0BHQMQkvuXX2TLbvjLndo7QKLyro6FgBqyFwAFkL2QFJ5qAotmTWcM4gbcu7gJnSU9g6EdcgsDd7oF4iMMmifbSiZI5iWVK8K8a3eS7FHe/lxieofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772688100; c=relaxed/simple;
	bh=H36NYsTwp9o0k5uCWe9FNEn5RpOuwXTJinYpJ0cqSKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TG+5YTvxvj9W+yfXw3ahJ5epK35OpUQRi1sceI3I7RIm/4d4VecggZ/d+Wzoj86fu6DJH8IEjFEfr2y+e4MlyLjqfTbr4qlFWVQfXJ9F1crUG+t7hDE3YVeaLxkAt/laWTXMQpxyWPtVkXfRPUsl4I8mwiSm/xZoMwv/q+UEzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXO+LTEqlp5w_dCQ--.50419S2;
	Thu, 05 Mar 2026 13:21:23 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: dan.scally@ideasonboard.com
Cc: jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	nayden.kanchev@arm.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: mali-c55: Check return value of media_pad_remote_pad_unique()
Date: Thu,  5 Mar 2026 13:20:32 +0800
Message-Id: <20260305052032.827341-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXO+LTEqlp5w_dCQ--.50419S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar45Cr17GFy3Gw4UCr4UJwb_yoW8JFWDpF
	W8GFW0vryUJ3W5t3WUAw13uFW5Gw1YqFW2gr97u3Z7XwsxZFnFqr13Ca1akFyYyF4jka43
	JF4Sqr4fuFWqyaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUBuWLUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Queue-Id: 707EC20AFA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54566-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Action: no action

media_pad_remote_pad_unique() can return an error pointer if the link is
missing or ambiguous. The current code dereferences the returned pointer
without checking for errors, which leads to a kernel crash.

Fix this by adding an IS_ERR() check and returning the error via
dev_err_probe().

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 497f25fbdd13..7c58da3ee331 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -360,6 +360,10 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
 
 	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
 	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(isp->remote_src))
+		return dev_err_probe(mali_c55->dev, PTR_ERR(isp->remote_src),
+				     "Failed to get unique remote pad\n");
+
 	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
 
 	isp->frame_sequence = 0;
-- 
2.25.1


