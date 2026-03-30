Return-Path: <linux-media+bounces-57532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK1tD/LbyWlm3AUAu9opvQ
	(envelope-from <linux-media+bounces-57532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 04:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6B354B68
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 04:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 285A63011BC6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 02:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C0433D6C1;
	Mon, 30 Mar 2026 02:11:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17E41A8F;
	Mon, 30 Mar 2026 02:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836693; cv=none; b=kQH5i83XwxXTvnTB/vkJagOW579idVnLL6npoVRnr7v0mM4ki4vNIMOI3BoEO5wge2izK+wUL3RHwgnrHfjUNDFKLL41NdPOe7/iIDMqoYZFbrYQUULb0X/fwAs29J9IdmQ0aui1o6d//usZcDiK0msbwxEaYhP3HOTsA1ILBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836693; c=relaxed/simple;
	bh=q0JgO4Xr9jnMX0iPu7UjejUWQTzlbLYebq26I6+LuU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T13tjlekj8696uQNG07aweR/CjdlA7+XIixHvsFCh9XTW3kCCvFrWoC6Q3d5t0pcN5Kvh60a42Km1+jJFzzMGkjlwHPA39BuRzlqbweOwWAHzX91syva7itakxmbY/kRr/eANq5ZmQFfYPySbFMZHkX+66FO0cr1pxX8sXDf9nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowACnx96_28lpb0hEDA--.10595S2;
	Mon, 30 Mar 2026 10:11:11 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	p.zabel@pengutronix.de,
	benjamin.gaignard@collabora.com,
	xiaoyong.lu@mediatek.com,
	mingjia.zhang@mediatek.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: free working buf in vdec_vp9_slice_setup_single()
Date: Mon, 30 Mar 2026 10:11:10 +0800
Message-Id: <20260330021110.2733458-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnx96_28lpb0hEDA--.10595S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWxKw15Cr4kCw47Aw43Jrb_yoW8JFW5pF
	s09rWxZFyjyFnFvw48Ja1xuay5C3ySvryxWw13u34avry5tr47XryIyFy3ZF48CFnaka45
	ZrnFqry8Wr45AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRiSdgUUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwsCE2nJxjRbhgAAsS
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-57532-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,ideasonboard.com,pengutronix.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihaoxiang@isrc.iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,isrc.iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 95F6B354B68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an error path label in vdec_vp9_slice_setup_single()
and call vdec_vp9_slice_free_working_buffer() to free
working buffer.

Fixes: b0f407c19648 ("media: mediatek: vcodec: add vp9 decoder driver for mt8186")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cd1935014d76..b3ecb94bebb3 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1811,14 +1811,16 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 
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


