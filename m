Return-Path: <linux-media+bounces-64032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jsa/OSCxJGq3+QEAu9opvQ
	(envelope-from <linux-media+bounces-64032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 01:45:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E264E863
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 01:45:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=notrealandy.dev header.s=sig1 header.b="EQTE/ibJ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64032-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64032-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3998302DFBF
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 23:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EA133D4F0;
	Sat,  6 Jun 2026 23:45:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host11-snip4-4.eps.apple.com [57.103.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81592ECE91
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 23:44:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789501; cv=none; b=dcVGdvnGTQBE1J84aHF39ZlRM3gWc6OS9pqth725BiufVBvO+UJfO0Tm1Re/OAe+980IU8ib6ncdA1ZCu8G7miCthBTeqTO+OyBcTPT8WTobrE9kjoURwe9T42WtLcmFDZbWMP2wRZ3Tw82oDanF66VOdH0eBC8NxPeCNdLzK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789501; c=relaxed/simple;
	bh=f25YXMh3jw6eY1n4wR9IpEbBJgwzmFwEbXaDXDu5f/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDgQ1wFnyQpRpqHEz9J+7D5+F81occLkA0+2Dg9xWtDB8khy9wfTN2fSeL2vtGuB04zmo6InNqdEhwfjlYNrQCZzcu4jZ8rbbKdTWQ507eAowxNIpBt9jLVau2ZHwllDV0YOMiNyrhlInAQoUqnI576xTWwqeL1v+aRwuTZPBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notrealandy.dev; spf=pass smtp.mailfrom=notrealandy.dev; dkim=pass (2048-bit key) header.d=notrealandy.dev header.i=@notrealandy.dev header.b=EQTE/ibJ; arc=none smtp.client-ip=57.103.76.47
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPS id 3D7CD1800883;
	Sat, 06 Jun 2026 23:44:55 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFNHVwOWBxAF0kGTVIPDxxQFkYVdwVdBEsdUgFWBVYJFxxWGxcNVk1XF0cfUgpeEVccSkNTDkRQSxsOVBcDVxxWRVwYQwldBVccHR5DRVsTVRdGCRkIXR0ZCEcfCjADQg5WA0MHRQAtGRxXUFkERgJcGV8MWQ9LXl0dRU1aAlZNBUoDXwFbBEAPSgBZA1kFXgBBA18aWh8cUBZGFXcFXQRLHVIBVgVWCRccVhsJS0YJSR0ODkIYRh9UJ1cCWgpbHg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=notrealandy.dev; s=sig1; t=1780789497; x=1783381497; bh=D1StYL6U9gU2+jj+JbZhPSY5gf8iUhPFr30wac770RQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=EQTE/ibJYw/oyasmViiRoGKEnzn7KZ578dnmal8QX5tyO8UGnx1PI6VWalqyp05A8FL86uTZBkZVmGPumnGBqW8GO9u84i7nDYh3f+DyYs+PtVOHc295PaVcmDFWfM3fviY1Bkkf51ffUu3kqBvsMomIUldkB9OLDXphvXj+Wm7v3dHhqmRNwuXNVYPv9XE93YTk64FJ6uJpqrqF1zJhmysEL84SQP+v3XgxsE/sBJHy7IBhFVGRxOzHL6ZxIpM6D2vt89Gyn0p+ugpm8N2ywnWUXwvljJWVym+liX8jwpHGUmf6AANvZpBm4zF20xCa2CQa+cBLtMR+coY//Cy5Ig==
mail-alias-created-date: 1780788294906
Received: from 68c3084b1005 (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPSA id 3F5F1180088D;
	Sat, 06 Jun 2026 23:44:53 +0000 (UTC)
From: Andrew Soto <linux@notrealandy.dev>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Soto <linux@notrealandy.dev>
Subject: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc with multiply
Date: Sat,  6 Jun 2026 23:44:27 +0000
Message-ID: <20260606234427.9902-1-linux@notrealandy.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6a24b0f7
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pDUkijPYcnCcty---KEA:9
X-Proofpoint-GUID: oE_mK9xeJBWVOZBbE9luOc4P5Dxo5xvS
X-Proofpoint-ORIG-GUID: oE_mK9xeJBWVOZBbE9luOc4P5Dxo5xvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0NCBTYWx0ZWRfX99RJ7y57oxFR
 W6H8oEEslXafKXJXFqf1g6SBkf0UTdWJuWkCOudJBmkvszAVPZowSxfR29RBWMdNV9ECn255Vas
 bnInCWGHvPnqVdmFzyQ4nwMUgcHSda3P6T0CEB93vPtftFABJcmcd76FJHH2W9Cne3A9MXkwdvX
 4sbyBw1H+ASMpUq67g2jEMC001SLHFavgAMStRiwwRmIk3ys+IkLGEZi24LFvDaNy/5k9SybxC9
 tWOpfrDR2VqZMX/RdkhY9ff5qSPXpb9lsBcO8pIUx2493V1i6DRcn/hpjqXj/UtgBJ7eRfEPUoH
 SImPqw/gf6XQnOVm5von56z+JfW8N7aj/THkWCyWECj3ozvs63LYOiNehuiqwY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[notrealandy.dev:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-64032-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux@notrealandy.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@notrealandy.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[notrealandy.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[notrealandy.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[linux@notrealandy.dev,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,notrealandy.dev:mid,notrealandy.dev:dkim,notrealandy.dev:from_mime,notrealandy.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 534E264E863

Optimize memory allocation layout in sh_css_params.c by replacing the raw multiplication inside kzalloc() with a type-safe kcalloc() array allocation wrapper.

This prevents potential integer overflow vulnerabilities by validating the array size calculations before interacting with the kernel heap allocator, aligning the driver with modern kernel memory allocation standards.

Signed-off-by: Andrew Soto <linux@notrealandy.dev>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11..9147ca047 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3716,7 +3716,7 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 
-	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
+	write_buf = kcalloc(8192, sizeof(u8), GFP_KERNEL);
 	if (!write_buf)
 		return 0;
 
-- 
2.53.0


