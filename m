Return-Path: <linux-media+bounces-60539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN8SAW7/+mkOVQMAu9opvQ
	(envelope-from <linux-media+bounces-60539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:44:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBA4D8051
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35E89301A39C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364D93E4C84;
	Wed,  6 May 2026 08:42:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7EF30CDAB;
	Wed,  6 May 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056957; cv=none; b=hnfrkNtrAE19X3aEtZb0BuYJkiRha6Rejd7sTdO+2FvucmFNGq4xp0zRGuNwcEsOKB2O88GMnYkmqYq4Qff5eQMGQsgnT/sRSZPcZAA3eajY/7/CxfsPVoEA56w5sme4BQMP7Zs4VQFpz7qzJF30YOkdGqpJdxz5Eqd0Zu9VbvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056957; c=relaxed/simple;
	bh=WDcvTOAJLpOog3e5jIvgabNP3Ik824dY+XaPH0IQsao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uSVXAKGthTWQdrAKyQx1GR/1Ktfh/t1afD9gX+50MUkFm/8dULSC72jx5OYB3fDIdYnWgGiXPvcOnLguUAXcGUe7uA3eFEKraLL2VMBwiwRfZoaYplFN9BCGFARL8oVhi4FsBdj7eONG5BN9FoiwgbZHCEbYYqiYxapFbNas5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowABn9Qjn_vppWvGIDw--.2900S4;
	Wed, 06 May 2026 16:42:19 +0800 (CST)
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
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 2/4] media: mediatek: vcodec: remove redundant return value of vdec_vp9_slice_setup_prob_buffer()
Date: Wed,  6 May 2026 16:42:01 +0800
Message-Id: <20260506084203.202882-3-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABn9Qjn_vppWvGIDw--.2900S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uryrWrWxGF1xArWfKr4Durg_yoW5JFyfpr
	4YkrWUZFyjyFs2yaykXF48ua1rCrWSqry0gw4ak34Fyr98tr1UXr1Iyr9IyF45Grn2ka4r
	uw1jqry8WFW3Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwwTE2n6yxrNzwAAsL
X-Rspamd-Queue-Id: 78EBA4D8051
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-60539-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,ideasonboard.com,pengutronix.de,ndufresne.ca];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihaoxiang@isrc.iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[isrc.iscas.ac.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]

vdec_vp9_slice_setup_prob_buffer() never fails, remove 'return 0' from
vdec_vp9_slice_setup_prob_buffer() and modify its signature.
Also, remove the return value check in vdec_vp9_slice_setup_single()
and vdec_vp9_slice_setup_lat().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c       | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 092fd34e21d2..0f47b2671353 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1013,7 +1013,7 @@ static void vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instance *inst
 	vsi->row_info.size = 0;
 }
 
-static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *instance,
+static void vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *instance,
 					    struct vdec_vp9_slice_vsi *vsi)
 {
 	struct vdec_vp9_slice_frame_ctx *frame_ctx;
@@ -1030,8 +1030,6 @@ static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *inst
 	else
 		frame_ctx = vdec_vp9_slice_default_frame_ctx;
 	memcpy(instance->prob.va, frame_ctx, sizeof(*frame_ctx));
-
-	return 0;
 }
 
 static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_instance *instance,
@@ -1170,9 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	/* setup prob/tile buffers for LAT */
 
-	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
-	if (ret)
-		goto err;
+	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
@@ -1804,10 +1800,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 
 	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
 	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
-
-	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
-	if (ret)
-		goto err;
+	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
-- 
2.25.1


