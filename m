Return-Path: <linux-media+bounces-54714-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JhnKMKXqmmIUAEAu9opvQ
	(envelope-from <linux-media+bounces-54714-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:00:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 514CD21D8C7
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E334C30DAB3C
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B4E329E57;
	Fri,  6 Mar 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tuHwJ0vO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED77025DD1E;
	Fri,  6 Mar 2026 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787387; cv=none; b=Tu5q8BFY+5ntkCmJ3GuQI7Nd+RjiGFdUSTbSfkJ7wQr/anJSqamDN/9UuM6VSFuFKoMXof5KfildMGjwlSZNQ/poNo0DR+bTd+JkqfNKZA6nVPRjBNeNLDuiQ/Hb/d/311mJVQCC4uijxV1Mdh79QQGvnR+fjEJFL/1NXmvdkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787387; c=relaxed/simple;
	bh=CqmetSlsO1ht2MuKvR3HS08d+xLH108esXwQ5bx1YmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFCSzSAIlSbEA64HtNplvtYVdzoBMDELFcOxONrwWQLB4NIo/7KhJRmMVjflRPorE1Od9GC0UaUHQdP9h50LVhX3GAYWJR9Qv/smGVvWTAQY3V/jiKV8zXStDX736hNyjZIduDf4wC5dNPLC3QenH97GlQa+8vWPQQQ4WVimx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tuHwJ0vO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91BD8591;
	Fri,  6 Mar 2026 09:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772787310;
	bh=CqmetSlsO1ht2MuKvR3HS08d+xLH108esXwQ5bx1YmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuHwJ0vObLMzqpzKtFUFoD+w0yeJ583Qa013AZijXK15FBq+6DFhUwBzKD9XpZ+0U
	 duB8vS9mgaMAdGuTV7vJAIsKrUMWoOf0PiqI5P8qvTLSYowodAxHtuFwZFz99FG9lG
	 tyhWvSkr5oY4cdKYzm4sJ23Z/4pN0XA9DNzECIB4=
Date: Fri, 6 Mar 2026 09:56:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	LKML <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>
Subject: Re: [PATCH] media: malic55: Fix possible ERR_PTR deference in
 enable_streams
Message-ID: <aaqV7Rw2hR0eqMyY@zed>
References: <20260207091822.601255-1-alperyasinak1@gmail.com>
 <b525c449-652b-4557-9517-ae695ffc3105@web.de>
 <CAGpma=7W2gOg__QnTL==5tydRRMyu-H=G+L0mvKYi=-cVEqNCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGpma=7W2gOg__QnTL==5tydRRMyu-H=G+L0mvKYi=-cVEqNCw@mail.gmail.com>
X-Rspamd-Queue-Id: 514CD21D8C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54714-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[web.de,vger.kernel.org,ideasonboard.com,kernel.org,arm.com];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[markus.elfring.web.de:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Alper,

On Fri, Mar 06, 2026 at 09:31:22AM +0300, Alper Ak wrote:
> Hello everyone, look like this patch hasn't been applied. Did I miss
> something I needed to do to get it applied? If there is anything I
> need to do, please let me know.

No, I think it's good.

The only think I see is my comment

As per the other patch for the CRU, it might be nice to attribute
credit to the static analysis tool you have used.

which makes me think there was a discussion on another patch about the
tool.

If you wish to resend to add credit, you're welcome to do so.

Otherwise, patches are collected in the media tree before the current
-rc6 (usually) so seat back and relax it might still take a while.

>
>
> Markus Elfring <Markus.Elfring@web.de>, 14 Şub 2026 Cmt, 17:37
> tarihinde şunu yazdı:
> >
> > …
> > > pointer or an ERR_PTR() on failure …
> >
> >                 error pointer
> >
> >
> > > Add proper error checking with IS_ERR() before dereferencing the
> > > pointer. Also set isp->remote_src to NULL on error to maintain
> > > consistency with other error paths in the function.
> > …
> >
> > * See also once more:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v6.19#n34
> >
> > * Were any source code analysis tools involved here?
> >
> > * Would a summary phrase like “Prevent error pointer dereference
> >   in mali_c55_isp_enable_streams()” be more appropriate?
> >
> >
> > Regards,
> > Markus
> >

