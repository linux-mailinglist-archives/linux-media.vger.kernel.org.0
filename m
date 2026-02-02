Return-Path: <linux-media+bounces-51991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAnWDbR5gGne8gIAu9opvQ
	(envelope-from <linux-media+bounces-51991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:17:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D9CABC5
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5299D300826A
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F20356A2C;
	Mon,  2 Feb 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jPA/ONOr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95C1DC985;
	Mon,  2 Feb 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027270; cv=none; b=DHUIw/Xqf/BS1VAFJtVt27xR7OMtGn4pWm3p+a7qGxIFPbkseoXvPXTI74PcdV+mlsfE3QthHOBCukxYJYNoawy2qsMHqPxzUjoSDPjyowqhfsdhEGwHzus+/a/ahUDIUOMeMXPlvtVMx2Aq+ksgbywb0ZFfFfpzUi1RJ6JuQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027270; c=relaxed/simple;
	bh=vAsvQtv3HuodHyxu3yECvLqdhqswRXgF0RVACw9J3gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKVpXvDcF21Xy/BkGWbEVpdLNLX2GCBkHmIewIWbiBIJR5gaGLXsMqy0Ep4EVZWqB/fGM7pFhY94wBS9vTu2SrqzOVvY7M2clTwU+O+xYqcgFErf/QDkUdf7a8hoaOsV6QlRg2pnEZMhZlufBD+zQdD/cwzmMJPy04khMtCkNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jPA/ONOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64402C116C6;
	Mon,  2 Feb 2026 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770027270;
	bh=vAsvQtv3HuodHyxu3yECvLqdhqswRXgF0RVACw9J3gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPA/ONOrMwUNiJhxI+anqfaQnXn7Ew+GOmazU69Wr1u35nSMa54mKElzcNnHhHuo9
	 b7MGPX631O+5bYzMaTjbkwZ95zuy6Mp3RCGGliqEageu7JvnIkTBqvQZkPVFP/m0sX
	 qtdI4nvOS73UZwbrgPgY2CzsSMhnngQAsTRpFirw=
Date: Mon, 2 Feb 2026 11:14:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bogdan Sandu <bogdanelsandu2011@gmail.com>
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Cleanup ipu3 driver
Message-ID: <2026020258-very-numbly-b36b@gregkh>
References: <20260202100310.4425-2-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202100310.4425-2-bogdanelsandu2011@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51991-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 246D9CABC5
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:03:11PM +0200, Bogdan Sandu wrote:
> Clean up warnings generated by ./scripts/checkpatch.pl regarding the ipu3 driver at /drivers/staging/media/ipu3
> 
> More specifically, the following files have been affected: ipu3-css.c, ipu3-mmu.c, ipu3-mmu.h, ipu3-v4l2.c, ipu3.c, ipu3.h

Was this an AI generated patch?

Either way, it needs to be properly broken up into "one logical change
per patch" like all others.

thanks,

greg k-h

