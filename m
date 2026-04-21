Return-Path: <linux-media+bounces-59240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KuuLRvP52kIBAIAu9opvQ
	(envelope-from <linux-media+bounces-59240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 21:25:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B86BE43EED5
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 21:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D31163010234
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D28C3DCDB0;
	Tue, 21 Apr 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uX2Py62W"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7843939CE;
	Tue, 21 Apr 2026 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799505; cv=none; b=Oo5t4q+H7jlD1yzOkB5pCb1YPr17AvbgWtp4wEYtN2NFECT12rwRRvCG/IgkECj+QODKaAxEik3nNYDupoVugyO+4ZYa684pp3URfQ5Ysqi6yICxgU8haqU22N/HLEhAiRIip8CL/n8yJnVct9tNhHN1ODjoeNLvhlqI0zPWTbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799505; c=relaxed/simple;
	bh=JfaHf+e6RMVq7NJo5L59NpdOoVi7I5TEEk3uK5/BSWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPs9u55wwQBK05o2017Yvf4CbRy0z1/l2ltb916640QSEcAX6wAbylHxt/HV0w5voRNvkITQCc+smjutAtH5dL3vO5qVQUVUdzWj7tZ5lWXDy3rSmYHQNxnj5KcpxpCCF18wbWBUA9N0NxGqrGhPMjdIwchwpYebG1yPStebnm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uX2Py62W; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o6deFgf3TSUOCSZG6+tAuzqdmFfo+QpR+BZ0OTACt2s=; b=uX2Py62WULIFQATTm2gmuiKNpI
	YL9PmBX1ze0tN4vPHr8GeDbzaFGkvUAWBUegBnCjfm3rldJSi7hlHRvqUGlL2sKP6OFURh3e5LaFi
	qjsNkSlRfEphFPXi7GTTQpYC93jLUNzvxxlTOVZy6JSGuN27zyllJIUXSVxm83AYF/p7TTaqsmx0r
	+QbqjM9s83P3MnrlM9RSpSycQrcSKAu5qYFOzwoaro0UrWeJ8PPaVfAl9GUMjc9hH7sD5Yb1k1xB/
	vi9IEsAbQQSD5tSdJyo7WjXl9jOpzqe/UsOIXI6uo6VSVSgBfbHQM0l8WtfrrQ0iZbJfrKLIxtdAJ
	6uqOHNSA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFGiQ-0000000AaDC-0ryK;
	Tue, 21 Apr 2026 19:24:58 +0000
Date: Tue, 21 Apr 2026 20:24:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
Message-ID: <aefPCV4ZvrnrCmoH@casper.infradead.org>
References: <20260421175516.224960-2-manuelebner@mailbox.org>
 <20260421180200.225244-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421180200.225244-2-manuelebner@mailbox.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59240-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B86BE43EED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 08:01:58PM +0200, Manuel Ebner wrote:
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -135,7 +135,7 @@ Selecting memory allocator
>  The most straightforward way to allocate memory is to use a function
>  from the kmalloc() family. And, to be on the safe side it's best to use
>  routines that set memory to zero, like kzalloc(). If you need to
> -allocate memory for an array, there are kmalloc_array() and kcalloc()
> +allocate memory for an array, there are kmalloc_objs() and kzalloc_objs()
>  helpers. The helpers struct_size(), array_size() and array3_size() can
>  be used to safely calculate object sizes without overflowing.

This seems to have been done without any thought.  kmalloc_array() still
exists and has over 500 callers.  It should not be de-documented.

> @@ -151,7 +151,7 @@ sizes, the alignment is guaranteed to be at least the largest power-of-two
>  divisor of the size.
>  
>  Chunks allocated with kmalloc() can be resized with krealloc(). Similarly
> -to kmalloc_array(): a helper for resizing arrays is provided in the form of
> +to kmalloc_objs(): a helper for resizing arrays is provided in the form of
>  krealloc_array().

Think about why this is wrong too.

And you should have cc'd linux-mm on this.

