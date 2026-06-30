Return-Path: <linux-media+bounces-66130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M0y2HZ3tQ2rBlgoAu9opvQ
	(envelope-from <linux-media+bounces-66130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:23:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B876E667F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:23:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=INnWOj+Z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66130-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66130-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62F5330D421C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F886477E4D;
	Tue, 30 Jun 2026 16:18:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC81477E2E;
	Tue, 30 Jun 2026 16:18:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836298; cv=none; b=bUWj7oc+Y9e4vJI0TxMvU/JwyHBMGoEBh/dO840FVodPmdKZ+9iPTDbcj4GrrBLHYc/hXqd+dpXRFl210fNyj3e/ApmeVHeDsOh3+7uqkkup/QzHG+7pmiKRwfcy4625dWreUF+8TaEvqaA2krEq1r7wb9I/wT3Ig8UzR7i/+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836298; c=relaxed/simple;
	bh=841d+YhP+MNXkyRqK9K+wBwhdiZ/j1kaBz/psiCJX3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZCvs5ymJaQ/hoBwrQrnxytF8/xPG1m6K1wimdFe2v+BVwUILKBxM5tdDXsUA/KDurWCs37wKFRmfSzsAML4y9IPCE40DagrvjM97TkUe4yuoESG8LGyzIo2fwwcg4/W6P7QbgYyoajiJsVUBfuYh88C5nrceTdXb7a2mjT+BTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INnWOj+Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10091F000E9;
	Tue, 30 Jun 2026 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836294;
	bh=e7ZpvWRdTbNDGg+iYm1on5rSyGRP+xxADCZLlIsXjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INnWOj+ZjJQVMe9Kk8c9uxKDHSnjjl4zaG552uvqZJmkAItsCf1AlQrj92EurxFl1
	 wEHBVL+K1wZErqlZxhwU5mj/RArbJBnU3MOChBYxy/5pVkWReOaf1PoSAAwa7A1xH9
	 HYLpz/Kx3vZSJdVGRLCqI1b5sFW9snQev5GjfaqNwIbrN1/uPn3hm/LMzEWosjsFcf
	 Y0MypWeXineVq+M6dZqzHiSe5usjW98BfMpyE0Q/sOpKxwNpopxfMjUw6n/rZe9Oz9
	 FpDNrw0CwTFeJKVjv5VUdHIFtbIuql+L5KCtGf1+g5m3TtSqKYtev6HWL/NTHsuIIy
	 TzLaou6pBZtHQ==
Date: Tue, 30 Jun 2026 11:18:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sean Young <sean@mess.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 4/4] media: dt-bindings: rc: Sync keymap list with latest
 list
Message-ID: <178283629280.3827709.11393612210856651562.robh@kernel.org>
References: <cover.1782300922.git.sean@mess.org>
 <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66130-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1B876E667F


On Wed, 24 Jun 2026 12:39:21 +0100, Sean Young wrote:
> The list is out of sync, so add missing entries, remove obsolete
> entries and sort.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


