Return-Path: <linux-media+bounces-56665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJCLMTj6wGkwPAQAu9opvQ
	(envelope-from <linux-media+bounces-56665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:30:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D18492EE457
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1378300442A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D9137104E;
	Mon, 23 Mar 2026 08:30:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AB035D615;
	Mon, 23 Mar 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254641; cv=none; b=kBAdi9wGzQ2FwvFoA3ka9tOqUSU/CC5jZ3McHpuwp/9Ti2q0uAbOUCwIm+m5K7GL3QvPTaJ7Nxp2gWtmVMES7dldrS/2T4/QJRT0KkPmVc3nJqUNWKVc5xxXNYnWwZo+0MNdFJX9NVw9Vq4/BrNaR9kYa6oWApsyG+vJ6QLNzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254641; c=relaxed/simple;
	bh=ZE3Gy4rrbXh77juSOs6V3jV1ew0+ePIwyVi9fDou43s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/IwjCxJcnC6mT1w99rjqc58d1TyWORvYr4Kg97PWes+JZj3HkeX3aRWTBXzE6J9aj3g3fgZJaIz/j2HZeUjCJ6ISchEJ0zOSDEgqzo6/E7TxfKVT0mqkAm5g4mSnzgq0lVNvP21jml6beuinavHiMC8b8+q2lWZP/8Q6PVSyOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABXcNcn+sBpFsqHCw--.33847S2;
	Mon, 23 Mar 2026 16:30:32 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mchehab@kernel.org
Cc: hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	opensource206@gmail.com,
	jernej.skrabec@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 16:30:31 +0800
Message-ID: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXcNcn+sBpFsqHCw--.33847S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4fAr4kCF47Cw43WrWkXrb_yoW8uFyxpr
	WYqrnIvryUJr43AF4akr1UXF98Ca93JFW5CrWay3WxZF47tF17Jw1UGry8ZF48ArsY93y7
	tF12qrWUKFy3CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUeXocUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56665-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linux.intel.com,ideasonboard.com,gmail.com,vger.kernel.org,iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D18492EE457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HEVC slice parameters are shared stateless V4L2 controls, but the common
control validation path currently does not verify the active reference
counts or the ref_idx_l0/ref_idx_l1 entries before driver-specific code
uses them to index fixed 16-entry DPB arrays.

The original report was triggered by Cedrus, but the missing validation
is not Cedrus-specific. Move the bounds checks into the common HEVC slice
control validation path so every stateless HEVC driver gets the same
basic guarantees as soon as the control is queued.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v2:
- move the validation from Cedrus-specific try_ctrl() into
  drivers/media/v4l2-core/v4l2-ctrls-core.c
- keep the checks limited to HEVC slice reference counts and indices

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395..4e7563c8bf4a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1260,6 +1260,30 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		p_hevc_slice_params = p;
+
+		if (p_hevc_slice_params->num_ref_idx_l0_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		for (i = 0; i <= p_hevc_slice_params->num_ref_idx_l0_active_minus1;
+		     i++)
+			if (p_hevc_slice_params->ref_idx_l0[i] >=
+			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+		if (p_hevc_slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_B)
+			break;
+
+		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		for (i = 0; i <= p_hevc_slice_params->num_ref_idx_l1_active_minus1;
+		     i++)
+			if (p_hevc_slice_params->ref_idx_l1[i] >=
+			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
-- 
2.50.1 (Apple Git-155)


