Return-Path: <linux-media+bounces-65637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R0RZCK4uPWpmyggAu9opvQ
	(envelope-from <linux-media+bounces-65637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:35:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 702DF6C62C1
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:35:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bNAFcWzN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65637-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65637-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2CF630CE071
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD96832D45B;
	Thu, 25 Jun 2026 13:33:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B232E12E
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:33:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394389; cv=none; b=lTGphIgMCHDWQ3GB6rtfN76IXZq0huVXEImcTy9Hhda7sUdSQR6RQ1/v4VHqIrQPsISnxTvUcS/Ey8G5U7jjO+SG15/tQ+seaUlp6qaDYEpO9+t6PpE/ckZjn/Oo2/6xSX0diOfMkOPRSDthSz2axNqhDyrJsj8R2gb0Ds9mJrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394389; c=relaxed/simple;
	bh=M6AMpAtucOfQ0fsOouC39sh/vyDlHIpE9WNW3F6jSTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtyP8Url3CbHDVloZLjR6HxjQX2Mkvt9+77dRgFN1D9vuZIj5cQzEvSea6q9f36u43/hUKD38YewQOlwXiZa2gXMfiPkId4X9vSZYujATcCt5/oyfBj5xrpdDj1pOpok3Nc0zb2zS12iStMF26XmwvGqeq1xQ3fjpmYATyx21h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNAFcWzN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47B91F000E9;
	Thu, 25 Jun 2026 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782394387;
	bh=w3v/24ptd4YoqAlS2GWw3tpwst4Tpe/WHLJzViIkmOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bNAFcWzN1uKw1K0DgoArKiLiD84WIfSuEdEi5ZDK0tVEF9VYEBEq6NQ4SeiWPVdT/
	 ziDgEY6Kwd1TqQRjvwPJOITNQxAJJUwAlBqT1OGuWQvpFARGraUKBYRNEXag68L64d
	 ROKSLQBZCkf9LgGoZ5cFB3TJ/m6Ws0U49E1TpILKtlC4399YNV74sepvANr/+IrS1L
	 dRTRN84VdF4mgLD8UF/cscGRCetNENyeVjl4+WXFwAsD4g11nE7ZAFbvb6rPQLCyPZ
	 vRe9jzPrIOy1yIK2GSsFKxUHYz8/A0UZE9zkLyUkaUcQjygGhHlsULfZV3y+9bZshx
	 Frc6yki5N2C3Q==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wckCX-00000004EAR-29Yu;
	Thu, 25 Jun 2026 15:33:05 +0200
Date: Thu, 25 Jun 2026 15:33:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] Cleanups of rc keymaps
Message-ID: <20260625153305.6cf6d597@localhost>
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65637-lists,linux-media=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,localhost:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mess.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 702DF6C62C1

On Wed, 24 Jun 2026 12:39:16 +0100
Sean Young <sean@mess.org> wrote:

> I've written a tool for media-ci which checks rc-keymap submissions.
> This tool found some trivial issues.  
> 
> Sean Young (4):
>   media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
>   media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
>   media: keymaps: Ensure module name matches RC_MAP_VIDEOMATE_K100
>   media: dt-bindings: rc: Sync keymap list with latest list
> 
>  Documentation/devicetree/bindings/media/rc.yaml               | 4 ++--
>  drivers/media/rc/keymaps/Makefile                             | 2 +-
>  .../rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c}    | 2 +-
>  include/media/rc-map.h                                        | 2 --
>  4 files changed, 4 insertions(+), 6 deletions(-)
>  rename drivers/media/rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c} (97%)
> 
Makes sense to me. For the entire series:

Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Thanks,
Mauro

