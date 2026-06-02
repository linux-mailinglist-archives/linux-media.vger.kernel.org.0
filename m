Return-Path: <linux-media+bounces-63453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/NULpplH2qQlgAAu9opvQ
	(envelope-from <linux-media+bounces-63453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:22:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23694632E31
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:22:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N2mPJg3k;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63453-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63453-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26FA43117270
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552B43D348F;
	Tue,  2 Jun 2026 23:15:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5EE3D16F5;
	Tue,  2 Jun 2026 23:15:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442147; cv=none; b=o2oms8L6RMebD9MoHglczrwwSzluzV+VqWhIEo9oSGqyHdjEqOWhek1p0rijAfjFy2nidzyhwGH/x7e34Qb3uME7Qv0TuK+6APhG0CnSsbo03f2tqsChSVTbD/pYPcnUsNGMYVT1b4UQ27aOL/AyEsq1q9PhfhKZaP8MUqU9RGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442147; c=relaxed/simple;
	bh=wjegPUbJizYHzlt7m7SurwYFezlj/v1w7gh8+nfoLss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=R30IwSaTqdyqtAbAi0wc3jbGIs3B2XLmneYeW2HkCJorpD88ms1d28gB8NQVaKkrEk1nvKdQfmqSfUy05HaOj6l3dGwzgNdZ8423XfXODEXT66brS75pWzwhCFI6pDqPdiOZtPYcI/tg4Qf6rsF8lTqRG4HOQZk2+4/Djn/08Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2mPJg3k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3DE1F00899;
	Tue,  2 Jun 2026 23:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780442146;
	bh=m1CzT/FegTVhiz2V/jIdgcuKX7uJJJRBorHZPlYKY2o=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=N2mPJg3kZyWLmhsnrEjf07ebPGAYhX7UGDiTNy/w32GHULQdRS47NNrd/Ma64P/4F
	 GdArmxlAtEAJxfqVHU3B/aVzDmSAGX71oAnYkqMJsXpqElgD5vaKJxtT7X7ZH0On3s
	 9OJulxoi8MdV1iI/cRraWf9bqaq4D6bkHavrL28IcUishg4bFz3K+NTyhswXFlgLU5
	 E7xCJ6zL4RHwlm5ycq4QcAxq2EwDY+WybmAShvMN5D5rWDDC0ZBE005CofgPz3Mlfk
	 CzyjkN02ISKHZN957qFTzQwfrYNnekniUYnlEX0+5rZlKshxZ8iTrQo98OM+fVsbaU
	 vKYU9Mlsn70Yg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Wed, 03 Jun 2026 00:15:40 +0100
Subject: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
In-Reply-To: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
To: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
 hverkuil+cisco@kernel.org, Frank.Li@nxp.com, michael.riesch@collabora.com, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=bod@kernel.org;
 h=from:subject:message-id; bh=wjegPUbJizYHzlt7m7SurwYFezlj/v1w7gh8+nfoLss=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqH2Qe7dkgkpjE+aEokAc3IRLf81kj3e4pZMA9m
 n2GJreazS2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCah9kHgAKCRAicTuzoY3I
 OuF1EACgrDv+Xf0U9AIvCopcauAiIC/N09Tg9uq9JO8Vw3l4G8Qh5iYhf9EPW1UU0AI80p57k8x
 xGe/VwVSnCWKrDopCLdkRc5M/GsCdB1B7xKa6arKxfudeKEfvi13GEsvQh1Iv8Kei8OdMwPibtZ
 HptcgL9S08/GgGCjdrTrHJI26pp/UWy3YlUQDdVAFGSH586YSviZnyBI+1510bVbqTIv7ZJmvj+
 momW81jYu5rRsAiIc54w5zTTscdVVI3tsQAHId4fVZHuLb++EEb3g9L9NG2t0VNcPAWR+0O67A1
 gpguD974eVtqyZ8K4WrQW9nb7BU7IQZTDEHLZsqNtt2zVH3tEo3frULVaew3/i0vz1h+t3aQ4j7
 zvCqYDnR706JtzBj39TAc0l/jOns7yK3RyZgsApn49HqYGv3y12blJuSmbv9fr1Wt/9JK0riDXw
 H2bm1ZN+dl2qrpsuWid4VkKZaTCJxbUijId3o59X33M67cXF4j80GlDdXq8lgwaK1Y8xUo716Lu
 sMQ43Hl4JWkOUSMzMO9C3PAMBow58VeF84vxbxpzezXQbMEoFqpEvI3o+/QfTW/T4vnQdFmS/w6
 yNixIpgPqiwecgJrqgsqmyxjIiC8SM0j5lnVugRveirbgSP/XbYGtF9FUKt0LIQW8GBW+IJh6+q
 +CP5Sp9n5i2wb+A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63453-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:Frank.Li@nxp.com,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,posteo.de:email,vger.kernel.org:from_smtp,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,puri.sm:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23694632E31

At the media summit in Nice this year we discussed that cross reviewing
from different people on LKML was lacking and desirable. Laurent suggested
NXP/Qcom do some cross pollination.

Happy to read and review NXP stuff in that spirit.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efbf808063e50..8436428865aac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
 M:	Martin Kepplinger-Novakovic <martink@posteo.de>
 R:	Rui Miguel Silva <rmfrfs@gmail.com>
 R:	Purism Kernel Team <kernel@puri.sm>
+R:	Bryan O'Donoghue <bod@kernel.org>
 L:	imx@lists.linux.dev
 L:	linux-media@vger.kernel.org
 S:	Maintained

-- 
2.54.0


