Return-Path: <linux-media+bounces-61208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIUiOkvQAmoTxgEAu9opvQ
	(envelope-from <linux-media+bounces-61208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:01:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570CF51B6CF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E411930B7A1E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 06:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6068F368D60;
	Tue, 12 May 2026 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CtLS/moH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4E368D47;
	Tue, 12 May 2026 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568895; cv=none; b=FNQJNI4ho2C0n4kiKmrdYTqbWTCM1SNQKQGp/4wk3JMEsqGWAjQ+4Y0ECeHtIqBqhTrgMrlmoGGMRmQ6r5DLn+pJtDGwpMAsQWE2T2HZbeDhKciQFaqpEusdlhFG0Nh49s7dFBoGJaTAt+0NZ83MpGIk6V7PiFzfIaTVUQ4BSZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568895; c=relaxed/simple;
	bh=MVqKZ0vuXMFTpxC/6KdkRp2/82BwHmKzBiNojqDY/rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WU/USg7auxEM8jei/gmTT+6HRdW7iCSIiEaJp+qU5cvrBZ0H8S7CmDYNqOriQ4EeB0v23owBroEGsxjd7I/g+RnpUvJb4g4T+WWZ4v55C2tX+0fCZITeuTqPs0pWZ0LFwUoeLVI754cKBafYaEkgC6IrdoANZ+lQr4rEQhpqBSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CtLS/moH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D01C6454;
	Tue, 12 May 2026 08:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778568876;
	bh=MVqKZ0vuXMFTpxC/6KdkRp2/82BwHmKzBiNojqDY/rY=;
	h=From:To:Cc:Subject:Date:From;
	b=CtLS/moH2yO+gJNksIaz2984CYOA7psu9vpEH3FgDmUNn2x7Ta7KgDDxcTEFRL5+y
	 7NnGCmpeoz9/0NlQ2fdbYn0l8onRhV9W7Cz5WnlyJhfrKvVdp1EdwI1vUvHdMQXRs5
	 BgGV25n6UejLLflY+V3n8OAVnUoDVfNqX26f5vz4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rzg2l-cru: Add MAINTAINERS entry
Date: Tue, 12 May 2026 08:54:26 +0200
Message-ID: <20260512065428.147375-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 570CF51B6CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61208-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

The CRU was missing a maintainer entry.
Add it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v2:
- Re-sort entries
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2be8f02dffb..c15d00d4f0e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22683,6 +22683,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
 F:	drivers/counter/rz-mtu3-cnt.c

+RENESAS RZ/G2L / RZ/V2H(P) CRU
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-renesas-soc@vger.kernel.org
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+F:	drivers/media/platform/renesas/rzg2l-cru/
+
 RENESAS RZ/T2H / RZ/N2H A/D DRIVER
 M:	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
 L:	linux-iio@vger.kernel.org
--
2.53.0


