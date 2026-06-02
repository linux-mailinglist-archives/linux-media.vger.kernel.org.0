Return-Path: <linux-media+bounces-63440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id txlXEehEH2qsjQAAu9opvQ
	(envelope-from <linux-media+bounces-63440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 23:02:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF60631FA1
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 23:02:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QiZtzDV4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63440-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63440-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20105304E414
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 21:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3526239BFE0;
	Tue,  2 Jun 2026 21:01:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C04314A8E;
	Tue,  2 Jun 2026 21:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434089; cv=none; b=bP1OsAHIGTBCeZI9IEPIFg8dYFQAWI/O60eYVxmeZntBDeR5xcBbItq5DX78w84gpWKsb+jebBy/DbKO1ocx7bbGZPJVJQhuni+s/zTsr00hEF42wRHEV1z0waAL53V6Y6T/ZqCfiuVF7nM2n4TE3A4153CIberNQZ0RteOnWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434089; c=relaxed/simple;
	bh=d+KJWTLgZJYOs5+X65Dcuf6f7s/MvSYeA2LbwouxE50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U1QJNj6OXedJ4zOr31Svb5KzjQ+yzsRhRTRexi+SH32Ug2Ka1bHeQH6qahMLrR5u28412VJUTH34/LqsqNS5btUe6TPEb6BsP7hY8cOynmw2O9UNgpO8h3pEcJSX8r5+HrhZezfuCdce9Zw8YklgVbpV7tQAaLMiX91wPkWYVFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiZtzDV4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4981F00893;
	Tue,  2 Jun 2026 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780434088;
	bh=NDfQ6oj47ch6KOymjyC/3inuJdPIFTjIotAPnLuKXN8=;
	h=From:Date:Subject:To:Cc;
	b=QiZtzDV44fzI/lZ+acsE3uxW29t1vWgLo7xZdlSQ0ezrpUrn7lQCHIfYL4LCRxqWy
	 rY8aZlg7DdjQbl+yAYkQjsUjxQF157VuuH8nfx104ijIucBFE4DgEwHZ4s0NoY49Aj
	 xkb8eabYiHVvTP17pxxuwayXVaDbtVHuxzHNO8hWbE/yrfLlOAcVu5Q38Z4OG4eEXp
	 z5ALystzhJviSv987I4AQO/XIND8qyyT4OiPzgYQbi4U1KT55bpCewEbNaG4r3vqEA
	 /vGLMilQAPhDqEMQX4aHM9iNpDwjT7quljvJ5DqIMhunNj4ahTDPasWNLsy7foMqlM
	 Cs9fapo2yX//w==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Tue, 02 Jun 2026 22:01:24 +0100
Subject: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBNGIaGuEi10mmpaWGhFEN09q
 +XHe/wXJI7CCZrigsiHJFlChi4LoMmFkZX02WDQWLRo1CCnjy7QpHzF2vWEyLWB/F8j5/Frtd3
 vtPuZaXsDcN8PNrZMiG0AAAA=
X-Change-ID: 20260602-fixbranch-b5e1adc00e92
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; i=bod@kernel.org;
 h=from:subject:message-id; bh=d+KJWTLgZJYOs5+X65Dcuf6f7s/MvSYeA2LbwouxE50=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqH0SmfsXyyF1JAGUPqFOj7kMXYbj6t8a2L1IqK
 3h73rJzqzyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCah9EpgAKCRAicTuzoY3I
 OjmHEAC3QqcRvUFXC2+l9wXISYbn/oAKTfw2ACxliFKYE90Ky54mCHnQxS0WXjye/CXz1tYQukm
 gemvP3BkQ4JKWhX2HcSdwTxNkoe6pu8l+5BaJjLb/Y9imNdrkN98E8Ap+YH3ofNmrBz0TbJc6a8
 2KeZVGjLtrUtIfTAbH29AxPBoNzth99Wd0g2iKmPQU+oKMsdzGi5HbtPxdnrx7e+wGnx4LP0snE
 0dtVfJ6xXKtz55dfKTOrLZyoC0bf1dwncDymeHPzWfbRFAV8r1uVw21XFBHThWZJaGbK/WC2//p
 FdIQlVcvvE/drTszDQoTj3PoYruVj+X1jsrdd/HGGyr/L/HNGhdNK/CHzj9/kFcAkRw6hZZ/Fmk
 xQGBrwFsBnaz5ldX/xelU5sIJXX/zwLDs3Ze3T7lCINqmJxDA/TB1YXtJTh2zSnRjLSeraFcWAY
 h1tE9XyIM+zJ4klrdLpW7G8ajlPPr0gFi7pdIryb07HEpI8dcv2io4XCw5BqZ20s4djHpKxvwyW
 MlIhlog+jDYaisBj8RPdl1wPNwSBux3fsIERyAk7Azx+Ednxb0rSzmnr2QC+oToNLpncMFXxLH+
 riTcY2AEEnKx7q1yp1SLqtLuHvsy9LngqL4tcVmDRjy2Ft0XpkPOZV+9AU1f3cNtA491a2NgvKV
 R57aKyCnmFlyUeA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63440-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:bod@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAF60631FA1

Use div_u64() instead of mult_fract as u64 operator division fails on 32 bit
systems which don't link against libgcc.

Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead in frequency formula")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Quick fix for u32 bit division error in -next.
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 5a85568c5ee1c..37dbfe433a085 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -444,7 +444,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 
 	/* 1.05 is VPP FW overhead */
 	if (inst->fw_caps[STAGE].value == STAGE_2)
-		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+		vpp_cycles += div_u64(vpp_cycles * 5, 100);
 
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);

---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260602-fixbranch-b5e1adc00e92

Best regards,
--  
Bryan O'Donoghue <bod@kernel.org>


