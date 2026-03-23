Return-Path: <linux-media+bounces-56658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKWTJBbnwGl6OQQAu9opvQ
	(envelope-from <linux-media+bounces-56658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:09:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8202ED4BC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E114304ADB9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1345535DA5D;
	Mon, 23 Mar 2026 07:04:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8435C183;
	Mon, 23 Mar 2026 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249488; cv=none; b=KMgIjQO7aIyug99njEkRG9un4dx+nvxCenQY5QCQ1+uL5TvLb8V3hcctDRYRsOHudjEt+cHKM3wOcXTeyVp8ZbQcttSGW7yL2All5KQMi0IAtmDlWLdd2chLMw20q3SFEmWE78Hx63qkVYLMDNuXe9uZqsQAxHjLLEkEH/IsD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249488; c=relaxed/simple;
	bh=tMEYlVHp6hUFnHSYMVowf2FmdIrqmaKgC8udEcLl9Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcurdbTFq/0qPZPujw4dkIlpqKelePh27qSaQY22Z3XcAqpgzHQTAnfy2p+RPRc0WoYbimf5BauV9JGXIC0JZqYBIaY8WStsNslUXK7vplld05QiRgnJr6I1FQAYirKGe/bnapGg0hm9IMz0f5YGe1arq5aaBUrWGCGQ1GiR1lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAC31dyy5cBphAWGCw--.41446S2;
	Mon, 23 Mar 2026 15:03:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mripard@kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 15:03:14 +0800
Message-ID: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC31dyy5cBphAWGCw--.41446S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4fAFW5ArWrGF43AF18Zrb_yoW8Cryfpr
	4Y9r15Za1kJr43KFW3Zw4UZ3W5uas3AFZxGrW7W3WxuanxtFyxXr1Yka45ZFn5Ar4rCrWx
	Arn3tw1jkFyUZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56658-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 0C8202ED4BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cedrus consumes HEVC slice parameters directly from stateless V4L2
controls, but it does not validate the active reference counts or the
ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
reference arrays. Oversized counts or indices can therefore walk past
the end of those arrays in the HEVC decode path.

Reject HEVC slice controls whose active reference counts or reference
indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e..d68da1eaa7aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->bit_depth = bit_depth;
 			cedrus_reset_cap_format(ctx);
 		}
+	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
+		const struct v4l2_ctrl_hevc_slice_params *slice = ctrl->p_new.p_hevc_slice_params;
+		unsigned int i;
+
+		if (slice->num_ref_idx_l0_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		for (i = 0; i <= slice->num_ref_idx_l0_active_minus1; i++)
+			if (slice->ref_idx_l0[i] >= V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+		if (slice->slice_type == V4L2_HEVC_SLICE_TYPE_B) {
+			if (slice->num_ref_idx_l1_active_minus1 >=
+			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+			for (i = 0; i <= slice->num_ref_idx_l1_active_minus1; i++)
+				if (slice->ref_idx_l1[i] >=
+				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+					return -EINVAL;
+		}
 	}
 
 	return 0;
-- 
2.50.1 (Apple Git-155)


