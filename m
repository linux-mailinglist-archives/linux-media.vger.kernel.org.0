Return-Path: <linux-media+bounces-67277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iIlIDRPUUGp65gIAu9opvQ
	(envelope-from <linux-media+bounces-67277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:14:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE473A063
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:14:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KZv25cTf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67277-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67277-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8629D30427E3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7F6411685;
	Fri, 10 Jul 2026 11:11:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C268413220
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681912; cv=none; b=vDIc5PyQ7dP/s2HAEMjtYHkLdzXVqD3Tyw+0FWZt9nwtOi7acd+t60FiCFewWho7u4wl8CC3MZrp78SRi9D+/fJoAxBtPJB4KsabIlrKyRlxLJIDJ/zeJ797OoYpHqo1yz4OqdmJ0iiJspFqZcykQ+bIzfdgMPYAT5bFTOSyDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681912; c=relaxed/simple;
	bh=6LXmpXKrmbDRaHEDCD3wRzC5AkkTFx0GGcIaWKn/4mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFe9ItsjW0TDDHWAczkRYMJ3jtB0Mns7wxG2sqRk4n6WHDiv6uIXZHOEv0y0E/cb5/O1uH0UrU521/oJ7OGOgPqdylVpkIyFbkt4rKWaVQ7M8P8z1napzwHmOdI7LALpJKxgWzQC0KW4ax/jSKFSMl7StoyOzB9nCbNH/viQv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZv25cTf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438AC1F00A3D;
	Fri, 10 Jul 2026 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681910;
	bh=1cM3XErb0VCzMYdqO+Wdl+ZaYPjAQe7lhabor+yX5GU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KZv25cTfE0paz8JIAbcW2PbXfgFMygjrAiMeDnjZOh48pGEWHUP4Wc4TjRgeUcgl6
	 8ylWDcTxp6YVFtM2XKztB5MgandJNzujtNafXC+YKvPOzSO4t2RsqtoCgj61KkGY+q
	 nnzJIPry8dd22LSCAHd572G/fnLYlx8v6hcLwJL+Jk1Lpv2asorrJLaZe1+CdxCuw1
	 G63/NcPGnJXEhPDsPF/jFOz1V5RWEf9kA7/w0C8UKjMO8n+Tuz36fVZeiaiwKzMH85
	 QCzt5zSXL0i2LhopY8nG5LIK3z38tattu5WCvdHjKP7MMe3JsnwbKu8JTs4h55XYKi
	 DFf08y5u4fr2g==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 4/8] media: cec/core: drop cec_post_state_event call
Date: Fri, 10 Jul 2026 13:07:32 +0200
Message-ID: <cc357768324be21b0133799326e8230face817ad.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67277-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47DE473A063

No need to call cec_post_state_event() if the next call
is to cec_adap_unconfigure() since that will also call
cec_post_state_event().

This fixes the case when, when the physical address is
invalidated, you get two CEC_EVENT_STATE_CHANGE events:
one with a non-zero log_addr_mask and one with a zero
log_addr_mask.

You just want to see the event with phys_addr set to
f.f.f.f and log_addr_mask set to 0.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index bbd5395fa67d..5c7ede88c3df 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1708,7 +1708,6 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 		cec_phys_addr_exp(phys_addr));
 	if (becomes_invalid || !is_invalid) {
 		adap->phys_addr = CEC_PHYS_ADDR_INVALID;
-		cec_post_state_event(adap);
 		cec_adap_unconfigure(adap);
 		if (becomes_invalid) {
 			cec_adap_enable(adap);
-- 
2.53.0


