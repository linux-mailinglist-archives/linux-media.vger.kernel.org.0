Return-Path: <linux-media+bounces-64053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IP5QNd9hJWrlHgIAu9opvQ
	(envelope-from <linux-media+bounces-64053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 14:19:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E89E650879
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 14:19:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=notrealandy.dev header.s=sig1 header.b=eGw9ywkK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64053-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64053-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4BB0301F9D5
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 12:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C333A6418;
	Sun,  7 Jun 2026 12:19:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.pv.icloud.com (pv-2006c-snip4-11.eps.apple.com [57.103.67.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A1332E757
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 12:19:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780834757; cv=none; b=T1HOTKifdsF9WY+p89aR9KV8Jtbvh1kueweTzX5yt68DJa4Lqy2iBBlbB+dslvp2JVBlGOUH8yb3X1bz2Yh1LpguI/OsXlkCu9szyCLxHI3OlLZQRIAljXUOmvjkeo+atIAwqwVy6jGc+EIlMPjeeAYNunlJHOlDZ+JDdSUCHMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780834757; c=relaxed/simple;
	bh=bJZSTeYt+Fk9hCdmhoJ2xLaDzIPW3Tkz5J0E7YG6PYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7z+hZfU46aH2H01kzJA8ROMiy6s/7/M1zt4Uf+BA1wc1ZpnHSlSf1mqSNLQOxTMTXTTAllv55QqAgxXQOoSCVTXvOQUkPuhRWex/5v1rhanUiA8WmdQqjS7JPQORNP4BPXDGM/XDdLuK0pprmN7HSx0Glg6JEIBJjt+SUclLBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notrealandy.dev; spf=pass smtp.mailfrom=notrealandy.dev; dkim=pass (2048-bit key) header.d=notrealandy.dev header.i=@notrealandy.dev header.b=eGw9ywkK; arc=none smtp.client-ip=57.103.67.53
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with ESMTPS id 2ACC31800269;
	Sun, 07 Jun 2026 12:19:11 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFNHVwOWBxAF0kGTVIPDxxQFkYVdwVdBEsdUgFWBVYJFxxWGxcNVk1XF0cfUgpeEVccSkNTDkRQSxsOVBcDVxxWRVwYQwldBVccHR1BRVsTVRdGCRkIXR0ZCEcfCjADQg5WA0MHRQAtGRxXUFkERgJcGV8MWQ9LXl0dRU1aAlZNBUoDXwFbBEAOSQFcD1gBXghIA1gPRgNdVRFdGE8rXB9NClYMWwpcFEBWVwhBVRIEQAhWUFQeQQRWFWwJWAZTGVc=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=notrealandy.dev; s=sig1; t=1780834755; x=1783426755; bh=6NRLS+ohDSLkxv5draASsGqMp9nEuaNId5sZjDP3Nqo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=eGw9ywkKV2EP+48HQxV5oPCUGD8MYbMyT9MjgbYDeON6ZqZa7B6FEuVBWk9ftxLWDOyxnzbZzcWbVYvIre6ADziHynFLpO267hWi/2jiaL4M/m7arK98cAm4hLjlFGr3fAgPKEVEQfpFE/u3jwiDfdB5GZ1IdpCrAI1at1NKfuS63qMLK4e5dubT7dGYH8gk7G9+p0+UW2Jou6NLQ859eJlL539f/3HE+0u8Mxb1Vgz5w9WaDURncVGPqMlWkGTf/He6kGfWUYsMxltQ6ZNxyLRFq0FydWnHOYl8jrloYcBmjcKcht3iYVP7ycE+/moXF96vF7KQuEoZSrUmpE/Ceg==
mail-alias-created-date: 1780788294906
Received: from 68c3084b1005 (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with ESMTPSA id 7404E1800264;
	Sun, 07 Jun 2026 12:19:09 +0000 (UTC)
From: Andrew Soto <linux@notrealandy.dev>
To: linux@notrealandy.dev
Cc: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] staging: media: atomisp: prefer kcalloc over kzalloc with multiply
Date: Sun,  7 Jun 2026 12:18:33 +0000
Message-ID: <20260607121833.10058-1-linux@notrealandy.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606234427.9902-1-linux@notrealandy.dev>
References: <20260606234427.9902-1-linux@notrealandy.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEyMiBTYWx0ZWRfX7ISrXGFDe+o1
 VbEaS4yzKihDPOCeUQNh/ZFNyGUc4CmoxXtEQ/vabmmFluqGaNg/OSG5sx9VWTm9hTuMr3Qu/HK
 t1r4wUhNuIyRLSuMwsQt69kFTyfkhfYCdpyz7kBh3z+ZreIjPSrv5RjVHCnOoLIvz2nFMT6Z9rJ
 eJQJKlRieziOFgei9eMnLPZc59r9PSvbvC0DtJNi/36nnzKxSI0bgu0YwuXBuOluUScArEANt/F
 MxHVCIo2YKf3EN7LrZ976JZwXeGrGN3agBlObFk9Z8qKtyA4NgPnoMXXDgpntWUQod7571QhE6h
 1yOe+CoKcn6DLJ8SftC7jgpRb5LFGasMzRSK47BiwwsqhA3Eg6uiKdjHthuGYQ=
X-Proofpoint-GUID: ouQsSK0GaBqPx5h9xcxbKtrUK10HCiPy
X-Authority-Info-Out: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6a2561c1
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pDUkijPYcnCcty---KEA:9
X-Proofpoint-ORIG-GUID: ouQsSK0GaBqPx5h9xcxbKtrUK10HCiPy
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[notrealandy.dev:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[notrealandy.dev:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@notrealandy.dev,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@notrealandy.dev,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64053-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[notrealandy.dev];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@notrealandy.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E89E650879

Optimize memory allocation layout in sh_css_params.c by replacing
the raw multiplication inside kzalloc() with a type-safe kcalloc()
array allocation wrapper.

This prevents potential integer overflow vulnerabilities by validating
the array size calculations before interacting
with the kernel heap allocator, aligning the driver with modern kernel
memory allocation standards.

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


