Return-Path: <linux-media+bounces-67249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kgbWKVS5UGoh4AIAu9opvQ
	(envelope-from <linux-media+bounces-67249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:20:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E169E738F68
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:20:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UMekpdue;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67249-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67249-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D47D43150C60
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35223D093B;
	Fri, 10 Jul 2026 09:00:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160A13AA2F;
	Fri, 10 Jul 2026 09:00:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674033; cv=none; b=gGkEMk+ciSklvRPgwxB9GUwjtFbhb5OcnhqKzvDUr9Xu5uDqefSHfzRdGCa1h10oiqz5OQd/3fZp8bd8Kj5p+9XJaRPiegWU6nNDRYkx33PRVzHwq3/2ES8oZADCyKttb6GPdq6VkEsK5Mu1vmk3/AZCmCrbo6XhdmEpJ9uGO9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674033; c=relaxed/simple;
	bh=7hYeRZKqU/iA635dD/0e3+1VkT1NfPdDsivTDEwOBLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ig1AXMwBYG137jOoXBh0CnZ5fkIAFlQBn6zRfd5c+47Uq9zHMm1fuzmRA11cVnp4Ea0J5wY6oF8BrkRVVNDkYLQoPrrEykvHDTyIal3nngRKBF55zItyZEbKO1f7Ype6FgNkS+gTMvU6VMZAH0NGLBxis7nsBy9rzucPm5Q+Ung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMekpdue; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7301F000E9;
	Fri, 10 Jul 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674031;
	bh=PZTomhapv1GB4dPtZ31heISGx2ogyb6gdCRPTduPiCc=;
	h=From:To:Cc:Subject:Date;
	b=UMekpdue6x5QRMj0lrgfHkiJfql0BaTHgUQMAKo4RpskFmcxnvqgnvcGwqC/GA8Sn
	 VP42bN56yYvEDWQhmi/yR5DOZfSkTChmTGQW3NooOSzB1EOewiT1GctJbWP26snjrb
	 qubSbknk5Yx7hNrgV1UazD7fzfIb70wrVXlWb5ZIp4c71t4gCj/tbetaXWNjZGnZsa
	 UfplVIcJ1fe4K7IWb350+FWS5Xig1+qHFGZ+kscKfWEYGPt2mkSkKLuj5KOiWAmyaO
	 F/5UJswivmri3XOuF/+0Gjptq20l8yzAi84PHY95khRkw8QUOH5fKNVsvrNxVCmYmF
	 6Co+gk/n9G59w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wi75y-00000000Dcy-15Ix;
	Fri, 10 Jul 2026 11:00:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Clinton Phillips <clintdotphillips@gmail.com>,
	Daniel Lundberg Pedersen <dlp@qtec.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Petr Vorel <pvorel@suse.cz>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rito Rhymes <rito@ritovision.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] docs: custom.css: don't limit randering to old 800px monitors
Date: Fri, 10 Jul 2026 11:00:27 +0200
Message-ID: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67249-lists,linux-media=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:mchehab+huawei@kernel.org,m:linux-kernel@vger.kernel.org,m:clintdotphillips@gmail.com,m:dlp@qtec.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:pvorel@suse.cz,m:rdunlap@infradead.org,m:rito@ritovision.com,m:skhan@linuxfoundation.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,qtec.com,suse.cz,infradead.org,ritovision.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E169E738F68

Right now, base.css style imposes a maximum limit of 800 horizontal
pixels to be compatible with very old SVGA monitors.

Remove such artificial limit, letting the output to be adjusted to
the browser windows size.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx-static/custom.css | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 5aa0a1ed9864..1055db7dc1dd 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -3,6 +3,8 @@
  * CSS tweaks for the Alabaster theme
  */
 
+div.body {  max-width: none; }
+
 /* Shrink the headers a bit */
 div.body h1 { font-size: 180%; }
 div.body h2 { font-size: 150%; }
-- 
2.55.0


