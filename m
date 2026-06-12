Return-Path: <linux-media+bounces-64720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CP/gESJELGpsOgQAu9opvQ
	(envelope-from <linux-media+bounces-64720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:38:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0567B672
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm3 header.b=iCyxNzMl;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="F Fr3U79";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64720-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64720-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=shazbot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B9B3273A53
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAC3407565;
	Fri, 12 Jun 2026 17:37:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B30383305;
	Fri, 12 Jun 2026 17:37:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285863; cv=none; b=lJWCz9A9/HtFbK3XvBcv6Oark/t/TluxD+4M2dK5S2XQrS5TKmp/0lpB34KMth8gJ3B4oHHIVppDC0sTw88VYnfyGEdOnqQJjtOMS0iB8EEWf0KmtP8ErF3hOiyUHQCEkAGn7gnNKwgauaAx17cd2Tcv9l6qw2iOnyxx8FgxZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285863; c=relaxed/simple;
	bh=g7SAaPqSaMVyfZ70ZryVMHXs9EiUdrrjA9QzhZGOu0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jXiXwtVYBsM2XHS1vtEIBSjMeCjzQ0UVXZOHpmjX9rc6KeCqmfUFB7fYYH469W0KnelHApn9a4I6035FhoKh4H3esWoI1GQenXjG9LYsACet9YlNtz307gMfvJXnE1RrhchA9jju/PlYxEa3YH/v3ZZ4uhhvLiAz0rIqTgV6+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=iCyxNzMl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FFr3U79T; arc=none smtp.client-ip=103.168.172.145
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B0C91EC0212;
	Fri, 12 Jun 2026 13:37:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 12 Jun 2026 13:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781285860;
	 x=1781372260; bh=3VYWrfjs01T0HYMxtoCq7P5BfvZQ30t2M5ITr0uVGYs=; b=
	iCyxNzMlJVT7dc+aJ1HyGHM6PQHg3v3snzeXlHF6DihxEQybJLHUk+DcOs3oEmzA
	iWZ8ggN22oRiiK2A6NaVlOQB3yk3oi9WrK8Ub8bH68jcaIJziQdFouqpLxsNwhu6
	fkeeDvWrT0s6AvZOKfEMIEBQ/utO4s8JUPkfg4Hrt7YWWNiM0tbFWtUBFTgabPyj
	g2h+hIL6nHIRGsdlbpnlF60TH+NJqihIChHoi6N53QKgtM7kCjmeDl0HbbdtjoI+
	u01WfikGuhhmBfw61wz073okYTtLqEEQFLbz+8jl/ik6cgKbt6vjCCC2y6vgGGcm
	y5b1RVG/BmfYrIcVWTWRSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781285860; x=
	1781372260; bh=3VYWrfjs01T0HYMxtoCq7P5BfvZQ30t2M5ITr0uVGYs=; b=F
	Fr3U79TvLQjj1ipEwQCF8lDE5xaXT9dDBiP9WBHsQGIQWlMw5ZbbmJwHHteCSUyR
	f9I79GT9JBK9VdUUsbZHKtbdGFs7ZV+zgs4xKLndVHAhjtnbOphPBaEPWx48yw26
	eDcrNDbSawn+G/8HIhkTpJdPkIHVMrlz5wP+0ZUK3HsoBCnvgCdpuvYHNP6ubEGC
	nZivXR25GiUUeigfNGT0gqGHAJr6tBt5pVjWNvAy8qusryNmJpZlP0JnjY+0IuzT
	QcdazJoplpmMGU69evHdr9/c8FkZoSAHePfqMSstYRDZnVPJd2jJHmJGqdm4ICqO
	IW9PMzRlIn+GHpG49iTIQ==
X-ME-Sender: <xms:40Msak5HBHkg-zeSR5GI6ns-o6YRj-cZze1oByOxGS7XVfltnvLrHQ>
    <xme:40MsahlAbctWIczDo5ihoVcT0fbdTv79lN_0RNwpaFHm8dOszfVZVxZ2vyYIU4aMZ
    2syho6S5wikcZrJDPW1dZAqSUO1YTvgXKeWRf6mLxZQzlYvdDG6Rg>
X-ME-Received: <xmr:40MsauIZbyZ1Pvt7KEwJ9Moo3QyqybuGKte5PGCSSXxl3vh096f7BNONPbw>
X-ME-Proxy-Cause: dmFkZTGoJQ8Lj+EDNN4hBQbznq/Yu29egQv6IxwZgvmjRMEYwcoQM2PY8Gx9pC5GfESZpI
    kbAq4sPedK8oiBdm7HZocnVtAYCQnz/MIZjclfarg7A/gqRUc5qAOpmh6thy7PcxH4zm/r
    jgYWYhufPeSHOdD9y9ltUC87YJFH5U48fWALEtJHQibyi1YGDYd6sm8Y4jPFV5QGG7G96E
    PF41HLNUvzODtqjMcyVp57mEIuUnDsUzNp+JeerUU5ussJDLmHU8mWqM89nDnGuzd7zU08
    zdrK2gvAbUslZQHHb+UNIsLUlwwnd3cSUlJsMhLkLL0S+aUrCW81QKL8FMougNkiuwLsmr
    xGa6mNUvgG64EHYj+IoV9fT67Q1WVobxX1X41d8ETPstbKjm+HkyfyBvM2TzLphFTcC4yj
    ZPSAJMYOmBLWXpvCEywX4eCylhb0Yuzy5ywLqnusbm0vhthrofM30d5lPS8m7hpIs+OK4E
    F74MsFXblySS+1WRtk14nAZBk+lf3kyUDL4M3LDewjjtUJpoD00k034eb/ehIlbBK62+4E
    4BpDdD3GHGcG4Guxkd0bqX9KP3atd2HiDcAcDaEZwh9P2pb+yDT9WLp98Ov0CNHvJ15+q1
    jNWAQtzbUBN7bdxWEcDA6JmSEqRAyIhB3/nNT1klgtjkpiCAJM79rKYwGBMg
X-ME-Proxy: <xmx:40MsaqFYEdXblsSoFvOxothyefVugzEAo_GVjiEOIaUuN7ANMwxyTQ>
    <xmx:40MsanOiLOn3zrSV4_FlMtmwwIFJrnqMOkP5rn8nxgYL2QID-eWLLA>
    <xmx:40Msas-N1E9snrI29D--02dXmRvv7rcr2U2GygY8380oxUe6lAOPzA>
    <xmx:40Msas6thAB3Nc67B_yTiFomVZYej913J2hUdjx827h0aarRAnE7sw>
    <xmx:5EMsaoNte4z6cXBVhix--ioay-2X1Qeuq3SMwr7OxY7wLFHpKX1WOo6v>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 13:37:37 -0400 (EDT)
Date: Fri, 12 Jun 2026 11:37:35 -0600
From: Alex Williamson <alex@shazbot.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: Matt Evans <matt@ozlabs.org>, Leon Romanovsky <leon@kernel.org>, Jason
 Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, Mahmoud Adam
 <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?= <bjorn@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
 <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for
 DMABUFs
Message-ID: <20260612113735.79518b15@shazbot.org>
In-Reply-To: <aisa6H-a-176MXhC@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
	<20260610154327.37758-3-matt@ozlabs.org>
	<aisa6H-a-176MXhC@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64720-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:matt@ozlabs.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:alex@shazbot.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,shazbot.org:dkim,shazbot.org:mid,shazbot.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BE0567B672

On Thu, 11 Jun 2026 20:30:32 +0000
Pranjal Shrivastava <praan@google.com> wrote:

> On Wed, Jun 10, 2026 at 04:43:16PM +0100, Matt Evans wrote:
> > +	/*
> > +	 * If we get here, the address fell outside of the span
> > +	 * represented by the (concatenated) ranges.  Setup of a  
> 
> Nit: double space before "Setup" and "But" below.

Some of us old school'ers consider this proper writing style ;)

Alex

> > +	 * mapping must ensure that the VMA is <= the total size of
> > +	 * the ranges, so this should never happen.  But, if it does,
> > +	 * force SIGBUS for the access and warn.
> > +	 */
> > +	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
> > +		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
> > +		  priv->nr_ranges, priv->size);
> > +
> > +	return -EFAULT;  

