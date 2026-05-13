Return-Path: <linux-media+bounces-61372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAZhJw9UBGp/HAIAu9opvQ
	(envelope-from <linux-media+bounces-61372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:35:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16453161E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F139330B0B21
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D3E3DB964;
	Wed, 13 May 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W0fZthl5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207ED3E9C1B;
	Wed, 13 May 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668513; cv=none; b=hOvh3hCHYKsZarkR3FTehXNr0vmLdUc3jA2aKA+FQ/CjPm76cW5j5yl7s6iW8E5M+wicwd/mtYW03OIi0o9OTLbu2A2mhdtGE+buLOEoUKWWr0n/+vMxOR38cGreUycNjAY6JBC5aUgnGSkvujxifywR2maWfa14KCuT5a3Ama0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668513; c=relaxed/simple;
	bh=CNVqvxuflpv01TqYicHY//GunBd6rKLoprGNHOlMSiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLVA38O3knLqgRq6CSREH5xEKaqhGqWfK/KijyiAhneqx3TtLauiPe9topIbB65RqWZ7aWZkXVojxQzQ3DVEBbG0ewiP9e+ECKHbXV9ae19ZMHEPeupR0tk1qw9Sz+vlUlGp3SdYr3y4/cwxL7ZWXv5F5VarYZaUJ6V6MR9gJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W0fZthl5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F38C2BCC7;
	Wed, 13 May 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668513;
	bh=CNVqvxuflpv01TqYicHY//GunBd6rKLoprGNHOlMSiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0fZthl5BHG6JPE61P7kCebwVYRG9RnnvgWTVVRImcfkF/qFBL37GzK9RHiSqq2Hz
	 kpxmoC1N9GoGwnwsA7sgzwL+tbJEMbeIa3pRzdA0ZkbbvAwAJffvv5w67DlPJfZRMz
	 zur+KNt4L9THJBLWNb/IxaabzMD2ecRXoDg8P254=
Date: Wed, 13 May 2026 10:59:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix trailing statements in
 input_system.c
Message-ID: <2026051315-oboe-sandbag-9bac@gregkh>
References: <20260513084146.57706-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513084146.57706-1-igorpetindev@gmail.com>
X-Rspamd-Queue-Id: 3A16453161E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61372-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:41:46AM +0300, IgorpetinDev wrote:
> Change-Id: Id89273d4ac76e8155aa6b1600d1f223407e0412f
> Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>

Please always run scripts/checkpatch.pl on your patch before sending it
out :(

