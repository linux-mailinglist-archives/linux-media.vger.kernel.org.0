Return-Path: <linux-media+bounces-66129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E4/7HVbsQ2p/lgoAu9opvQ
	(envelope-from <linux-media+bounces-66129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:18:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA326E65C6
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KWx+O3TD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66129-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66129-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5930E307CFF6
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B965E477E39;
	Tue, 30 Jun 2026 16:17:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC21477982;
	Tue, 30 Jun 2026 16:17:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836225; cv=none; b=fuZ4nYPpq32VBpkCC6XHJTTiJqaHQFIOmadGelxR9lc2RY1YmoM/Z8OVigWAZBMxV6nNIVcDyuGofJYlLbWFYSfs5aX06hdpMvbThUmSDALABl9JJuDz8wbUwBqmzZD3PUr8GpPvgNo8NUxK4CITnO7/Te5RDSlY9Es2KaAMUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836225; c=relaxed/simple;
	bh=+6OOHItpTaF/h+nadWc6FKiIaCw5jXWp2z/oy0XdOdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ahfx5JVEA6hDWSzeQ1E2jb04EbBFhUll/sGZI85N4Q5mx1pwCO5w51Q0ry5TSZbn/MJm1wsCBn3ovSsJRuJitZqkGCiVW2QClz2q9avJv6Nf5mOhhUQIorTQelsw6ONuyqF/I5GoJw3R8K9N3BGr2xz/FQIHHkAVndMj3qsEdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWx+O3TD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9981F000E9;
	Tue, 30 Jun 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836224;
	bh=mfneG00FYDfw9G098Kqg2HFmOi2sByNHAslBiEKNido=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWx+O3TD+foOsFZg+5qSNLcedrBrOCbkxaXlXT7pw8bUMgC1z8o7GrD9RQohW44kI
	 UoT/Pdx/GGkQpZaEOp7ZWQrEIDtjxwU32eXXGosCkWNuLNBKkqUYCwfOQKnZZwc/1N
	 jUxDSs63K3ISQh5NTNx7M26WWheL10SjekPrZeXAeq3h8rhlCUdtTKF3FWASbxfpnt
	 OP+h3N3J5UfQ3iEQkHTCA/UpiBphz12nBiv0aGUTHypOGIrg+zBS65k2t3lH3jZd3y
	 jfa2hugnZ6RE58oOC+aByGeAWm0CmT1197KH4wFArsl0wQrDxcYzbvMdDmp7C8a6WB
	 SCkoUxQ8JF98A==
Date: Tue, 30 Jun 2026 11:17:03 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Young <sean@mess.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: dt-bindings: rc: Sync keymap list with latest
 list
Message-ID: <20260630161703.GA3798331-robh@kernel.org>
References: <cover.1782300922.git.sean@mess.org>
 <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
 <akO_XqVQ-S72dveD@extorris.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akO_XqVQ-S72dveD@extorris.mess.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66129-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:krzk+dt@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FA326E65C6

On Tue, Jun 30, 2026 at 02:06:38PM +0100, Sean Young wrote:
> Hi Rob, Krzysztof,
>  
> Could I have an Acked-by: please?

You can look at patchwork and see where you are in the queue. No 
need to ping us. Plus, don't expect quick reviews during the merge 
window.

Rob

