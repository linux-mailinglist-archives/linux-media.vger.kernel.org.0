Return-Path: <linux-media+bounces-59072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHesIpdX42mbFQEAu9opvQ
	(envelope-from <linux-media+bounces-59072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:06:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015B420A05
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 844513034647
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8FF344D9D;
	Sat, 18 Apr 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="eiW2iJ3B"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07B3346BE;
	Sat, 18 Apr 2026 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776506761; cv=pass; b=K839+tT7Qj0p1cNN6mE74WkPTT316ulaM8o9NmEWRs9DTTfsXwvejusjCSOAVa6+IuqAmGgRIe+mHNA8ihbF2Gv2rspO374SjP/dqqzpI8ijp+XD6sx+/NzxRcYSLUCTs7EXs7Tg8ksF/NT6bNJyToEGdp0qHD/DLcTpfEJpZMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776506761; c=relaxed/simple;
	bh=QqQh2z0bWdMLX1rWeetMZ029Q7s8UznLGFiZh2wysJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TERLFYalmPgiVs10kP1TMVWKAo+wVYdAyv2xVJOYG7c0NfhQqCkBsPaXeeWZYg6uPbu2jHSRsOhyj1ne2SrFyNETiKLQJLh7EydFsNRZyuIFIbhOFOTZBOLZfWJX/9cKkEz8+c2K26gp1uJwXZCg5jbOUo3YEjLsbxHz/unOzbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=eiW2iJ3B; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyS7T5t0CzyRb;
	Sat, 18 Apr 2026 13:05:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776506758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k75HbUPAfDwcnaGtvNJ9Ps5xMsySfbKoriw0MX0Pf6w=;
	b=eiW2iJ3BxJ/VwubivVXEv0YWFzM9yVZDFZ3txzdyzKUf5Fso1JPap+QgDLDOO6+vgRQ3zF
	6aqJKNucLCp7DpM5W3ZX/myT6T34k+BZaiAVXIDTNagqauj62oXFlCGriMcf7GKX1NvFEw
	6fasNCSLSAisA6KFAU4ZgrZW5dEe6Rs=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776506758;
	b=r9t4iM2tETpsBSVySFjXwsMCSFcLcCm5OOif+G0As28O2VevsIeplta7LUQ4QPf/y0jGjw
	zTg+caaGn/Qapi9o3QWK01fXOIkbGR41qSI8CIvskyIXpcMgdOkgezMqkVvxux2fhNzbcu
	w9z5akga/1ixX2f5GbugQQrHIEDz+kk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776506758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k75HbUPAfDwcnaGtvNJ9Ps5xMsySfbKoriw0MX0Pf6w=;
	b=bet0HK/KMqv+uzhqLKMbZO9II0QXex7ec3SdWQA92B1mfjDffOU78Koz6u5Veb4pudbUE7
	j3PQjcjRh0a4enoPh1nohRHlIOKnKDXduK1ayFZPiAT/KzNAj9uLJgrOdMGuMhcAysOmQN
	KMarOgkubfgLrU6z0MsbxUGsCeriH1o=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 610AD634C4E;
	Sat, 18 Apr 2026 13:05:57 +0300 (EEST)
Date: Sat, 18 Apr 2026 13:05:57 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	dave.hansen@linux.intel.com, tony.luck@intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: media: atomisp: Fix typos and formatting in
 headers
Message-ID: <aeNXhZQEthlSb2If@valkosipuli.retiisi.eu>
References: <20260209162026.18907-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209162026.18907-1-hamdankhan212@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59072-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: 0015B420A05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hamdan,

On Mon, Feb 09, 2026 at 09:20:26PM +0500, Hamdan Khan wrote:
> Update block and inline comments to follow kernel
> commenting conventions, fix typos and wording, remove
> redundant comments and reformat long comments for clarity
> and line length consistency.
> 
> Although some comments used the /** ... */ style, they are not
> kernel-doc comments and are converted to normal comment style.
> 
> No functional changes are intended.
> 
> Signed-off-by: Hamdan Khan <hamdankhan212@gmail.com>

This no longer applies to my atomisp branch.

-- 
Sakari Ailus

