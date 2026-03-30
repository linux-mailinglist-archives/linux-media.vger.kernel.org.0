Return-Path: <linux-media+bounces-57531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D0a6Bs/ZyWk73AUAu9opvQ
	(envelope-from <linux-media+bounces-57531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 04:02:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A19F2354AC9
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 04:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B023D3003364
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 02:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6D02417D1;
	Mon, 30 Mar 2026 02:02:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895640DFC8;
	Mon, 30 Mar 2026 02:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836171; cv=none; b=s7yMl6VU1C63in+dX4sBgxRawI7M/AM/IQAWD1SV5yDykbI9JE/NO6snkI019E6sAVVvNLEVgMEKKcKVIRAdyRpDQUukdS83ip7Uoy/W/bQWkjwZzLGdYu6dw0D+WxcJb/lhKvib9QauvtOdxGJ6IYkqTHPDeTHjMEEhhk+Tfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836171; c=relaxed/simple;
	bh=/bQUV4TMelBakimuZPCmUVMnc5R21gcG/1qYEC2QR/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LJwuGg5h/jG5jemM9m5mQ84osiiCTQcjWG3GxYW7IJmAPgwDMQwli3IoH7zryol9Qf28GfLwXpXxCSWHjYQfpT2K8mWXacMg9d5/0yN168OqohaDBadWgyvrVYpXDoH4o2VPQ7bo5e7Zu57PgXbkjvDjl1JzxjLntVbuw9V0PW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowABngdix2clpVhhEDA--.40377S2;
	Mon, 30 Mar 2026 10:02:26 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	george.sun@mediatek.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: free working buf on error path in vdec_vp9_slice_setup_lat()
Date: Mon, 30 Mar 2026 10:02:24 +0800
Message-Id: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABngdix2clpVhhEDA--.40377S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWktr4UXF43AFykWrW5Awb_yoW8WF15pF
	4Y9rWUZFyjyFnFvay8JF48ua15C3ySvryxWw43u34SyFyYqr17Xr1IyFy3Ar4rCan2ya45
	ur12qryUuFW5AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ4CE2nJxcxTOgAAsW
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-57531-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,ideasonboard.com,pengutronix.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihaoxiang@isrc.iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,iscas.ac.cn:email,isrc.iscas.ac.cn:mid]
X-Rspamd-Queue-Id: A19F2354AC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an error path label in vdec_vp9_slice_setup_lat()
and call vdec_vp9_slice_free_working_buffer() to free
working buffer to prevent potential memory leak.

Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 decoding")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c    | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cd1935014d76..3dadb5cc8876 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1168,7 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	ret = vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
 
@@ -1176,14 +1176,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	return 0;
 
+alloc_err:
+	vdec_vp9_slice_free_working_buffer(instance);
 err:
 	return ret;
 }
-- 
2.25.1


