Return-Path: <linux-media+bounces-59009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIPRGYIj4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:11:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E041B1DD
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D042930D0B1B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF70351C1E;
	Fri, 17 Apr 2026 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="JCOubrLG"
X-Original-To: linux-media@vger.kernel.org
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B91B366074;
	Fri, 17 Apr 2026 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427535; cv=none; b=c5pPLvi56KYlANlOzluyGQd8do9vDX97AddgFzRBclrIwYSNaQuyp7MvMVVjoZTl9xa4ryDn8AUXvsiDUurE5S1Fd78CKru0nKjCEI4n1oekBJQraMWFys+NlvwacKB8FeI6PK7zxEqAamOvR/RR41MPGk0n3Q93ConsvFG5yxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427535; c=relaxed/simple;
	bh=LthW74V8MHOfLTkITEeOwoQRK9NDcS8k4tmeAMOwSko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj9oHtJHydP1N0omVc6ilkjn/Mcw9M6lshFddfK0Mizy1klHP1A1mBI0AZN1lqIg7excyuh5AP3yM+BoZHHBLgGOPt0/28+VFr0re0JsuNXSyRluASR8jrcxflO72S1aUXWJ2Mh+/jl+goESVxy7gEqD1FHmzLtnUwM3IEVZew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=JCOubrLG reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776427523; bh=LthW74V8MHOfLTkITEeOwoQRK9NDcS8k4tmeAMOwSko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCOubrLGvdWvY0vokGklma+ZdlR+K5BdwUpnAN1Ad0GHxD2qcW1cHA3aANquHGNv8
	 lvfok6xw18m4dwbFcCBy+zvc0y8Vg0ioF8R3JvdP9QLUAk5ZtCZwah1GtjzwyKQQav
	 EUFa1vOZBcdvR19Dx36R4FU878BU9Ll9OUSIXayrY/ieBkPjRUytxIaUgLCnT/JxVE
	 4FfPulM7RVWdX+TfstRbj7XMRQkGE8Rybxawte/nhOQh0GAKitxcOPSOnbEaWvrOY4
	 apZh+WolG3ZpZAmhjL/yemTzqllAqkbV/xPjiKAxBNwcdpuGaQ18d598FcSm/OpOQQ
	 ic5Aiouhw7NaQ==
Received: from jovis.fritz.box (p54909809.dip0.t-ipconnect.de [84.144.152.9])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 8241822057F8;
	Fri, 17 Apr 2026 14:05:23 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id 27DA67E; Fri, 17 Apr 2026 14:05:23 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: gspca: Handle SENSOR_HV7131R
Date: Fri, 17 Apr 2026 14:05:06 +0200
Message-ID: <cover.1776426352.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776323993.git.pmhahn@pmhahn.de>
References: <cover.1776323993.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pmhahn.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[pmhahn.de:s=202501];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[pmhahn.de:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59009-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.756];
	FROM_NEQ_ENVFROM(0.00)[pmhahn@pmhahn.de,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pmhahn.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E43E041B1DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I found an old USB webcam 0c45:602d Microdia VideoCAM ExpressII.
`vlc` triggeres two OOPS as soon as I open the device.

The first patch prevents those OOPSes, while the 2nd fixes a minor spelling
mistake.

The camera still does not work and I get the following error:
> sonixb 1-3:1.0: i2c error writing c0 11 31 38 2a 2e 00 10

I'm still investigating the old driver sn9c102_hv7131r.c from [1], but so far
was unable to make progress. So feel free to apply this now. Thank you.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c0e11a2a24db782341f456877d19b9390c5998a9

---
v1 -> v2:
- Use __func__ instead of hard-coding the function name
- Break long code lines over 100 character long
- Break long commit message lines over 72 character long

Philipp Matthias Hahn (2):
  media: gspca: Handle SENSOR_HV7131R
  media: gspca: Fix comment in sd_init()

 drivers/media/usb/gspca/sonixb.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.47.3


