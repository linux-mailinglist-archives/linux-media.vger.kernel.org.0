Return-Path: <linux-media+bounces-61494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NobEovEBGrdNwIAu9opvQ
	(envelope-from <linux-media+bounces-61494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:35:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD4539098
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6254B30DF797
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B473AB278;
	Wed, 13 May 2026 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="ugb+w/Mo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n2G7CcIS"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A03AB271;
	Wed, 13 May 2026 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696864; cv=none; b=pFfSlBc1Q6/oD0XVmjrSHlrfgn0mPvy/lv2D6qUcOW0xZJdx10jHXKYpyHh2sJeHj7+sZlrSXOYopGy785yGmYQjuaG+I4BsQl2l0dCUqtPktXHWKEQHrZQDyB7DAf6ynREmTiIo70riTUMWYiphkHcYVq7iVIZhdOq/G+Jwsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696864; c=relaxed/simple;
	bh=l2KemC4Mqip6WS1Q842qGYE2kNmwg7yfBs0DwLThI8E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cg3HSs/cDl2N24+XMWOw0GWMtm3dbjdMAxnnOPnnviDAlCuqBw/gUzReF9hyNGq3JkrZ447QfQT7Zinh/zvRurc1yodhd9UrmbtZtmsxt0bcvzgKI+Y24N0ynQrzK5q7/rNzN1D2qoyCWHvJ4XcYe9vyRTSWM4ql1/2AmA6QqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=ugb+w/Mo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n2G7CcIS; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 6D3E81D000F8;
	Wed, 13 May 2026 14:27:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 13 May 2026 14:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778696859;
	 x=1778783259; bh=GbnJfjRBStiaKRZLT02VZB1354Hvx0h1gpT2X0Kvpt8=; b=
	ugb+w/MoCK+Cq76KPvoo+wISMQpprZXQdAk3i/dgnuTYPy3OkQxSs2xFN6MRw/2M
	fDw9YGXrGE8B01bJVgCgLHzhFpTS9QOlHoYqM1QXCwm5Ze24EjpAfIyORs0VLEP4
	mAHdBht7lRSDkgaBknw9fbXkWGZtyTihrXg3zxxJ6wcAkA9WtgD8rL4RHsztZCem
	Rsxp0gY2tcehmxqWfqGaEuHH8QEHjlwpdWYUb28t+YnVjVjYCnoQuau211sb/ygZ
	I95d/csNuJeEVJXsyrlmmxuRwmuye0dKesPtXphaf5+z0313rMwrNSpg8geNRX14
	IdFuFN4voLZy26kzty7deA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778696859; x=
	1778783259; bh=GbnJfjRBStiaKRZLT02VZB1354Hvx0h1gpT2X0Kvpt8=; b=n
	2G7CcIS5liB/toFj6ghq8YrTIMXPZsGeuHApr+SOQDFQ+h80ntmkyU1vu11TQNLn
	6wo9Q8HJEQ7Xzj7yJhmuAlljUcYGbn1ZezzqASVdULb7eLOe6oeVILfbZ9MADbUo
	EnidDJ5bsv5WM7nS3HZhDa718Y3QOKKrbnwxZ8vxkEXdP7EUYNtpJz+eZ1JGeviv
	XrO56AcRztohEmu280ftsqZfsYn3MafnOxfO9OJ0xrtZmznCXEXL2LV75UZmcvhr
	WOm87c/YFr2Pz+hejCT1jQ5DAP1BiDOyaEsM9kbjr7ehmOjDogiVLb/CMZGADjxj
	vfKEqakOKsuLjRz9Whymw==
X-ME-Sender: <xms:msIEal5CeibmOq0PCnIL7PBxOf49fDLoRWOFLCziKHN4tUjlg4e91g>
    <xme:msIEahSgyT-T0RaMchXzdGGmG9Nnviw6xPgZRT_fMv-Z-_FvnqINtRkrOnrtwe2r8
    Gg_stuv7xKsBNCtzPXLcvmlz-zgn1uIgMhjfiXvzmIhvDUAhkT-sA>
X-ME-Received: <xmr:msIEaofZhrS0KQe9p0LVgEjp526ztDG3_O4dGSYXPnrqfZYiGdNhbLpPN64>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpeetlhgvgicu
    hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvkeefjeekvdduhfduhfetkedugfduieettedvueekvdehtedvkefgudeg
    veeuueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grlhgvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepvddtpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehmrghtthgvvhesmhgvthgrrdgtohhmpdhrtghpth
    htoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjghhgsehnvhhiughi
    rgdrtghomhdprhgtphhtthhopegrmhgrshhtrhhosehfsgdrtghomhdprhgtphhtthhope
    gthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehmnhhg
    higruggrmhesrghmrgiiohhnrdguvgdprhgtphhtthhopegumhgrthhlrggtkhesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepsghjohhrnheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:msIEahR_qV9UuC2kZahvYM7vpuJVR17VDHGmXFC5xtuw5qvCJ9mP1w>
    <xmx:msIEahM1kYu8s--pXaSCxNbdlLG627KP8nKF3hwZrIMOKTzPH27PNg>
    <xmx:msIEakVfFRSlf7afEpvKFjWU9Ww9TuD8S5Dnnyz94-O7VniPJ7ybwg>
    <xmx:msIEahacB-lTAHRQfaLsechQRlclOtlcemlNYlBo-ddzPeUvY2P0vA>
    <xmx:m8IEagDolmbmx2QFR4KKx1ySonJwF1ARYPlv-gqKIIpCvhBQ7hOrbT3j>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 14:27:37 -0400 (EDT)
Date: Wed, 13 May 2026 12:27:34 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH 9/9] vfio/pci: Add mmap() attributes to DMABUF feature
Message-ID: <20260513122734.44ce8a68@shazbot.org>
In-Reply-To: <4af0c788-22cc-4fb1-9276-ab35439fb7c8@meta.com>
References: <20260416131815.2729131-1-mattev@meta.com>
	<20260416131815.2729131-10-mattev@meta.com>
	<20260424183153.GJ3444440@nvidia.com>
	<20260426105215.GA440345@unreal>
	<20260427083644.4ee174cd@shazbot.org>
	<25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
	<20260511140957.25eb5d9d@shazbot.org>
	<4af0c788-22cc-4fb1-9276-ab35439fb7c8@meta.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A6BD4539098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-61494-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,shazbot.org:mid,shazbot.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 12 May 2026 18:51:40 +0100
Matt Evans <mattev@meta.com> wrote:
> On 11/05/2026 21:09, Alex Williamson wrote:
> > I think the question of how we actually expand an arbitrary grab bag of
> > "ATTRS" is the central question in whether we should implement the
> > interface.   
> 
> > If we follow the direction I suggested for TPH, maybe this
> > is just a VFIO_DEVICE_FEATURE_DMA_BUF_WC, where it supports only PROBE
> > and SET, with SET taking only the dma-buf fd to implement the one-way
> > promotion from UC -> WC.
> > 
> > If we support a generic SET ATTRS feature, we really need to map out how
> > flag bits are indicated as supported and how a user untangles failures
> > from trying to set various attributes.  If we end up with a feature
> > indicating each ATTR is available, we might as well have just
> > implemented a feature for each attribute.  Thanks,  
> 
> Agreed, that's key.  Alhough, the aim of this patch is for attrs to be a 
> memory type enum rather than a bag of possibly-concurrent and 
> possibly-conflicting boolean flags.  Maybe 'memory attributes' would be 
> a better feature name.
> 
> I'm not sure about the feature-per-attribute.  Say we do a 
> VFIO_DEVICE_FEATURE_DMA_BUF_WC and then later support a second, 
> VFIO_DEVICE_FEATURE_DMA_BUF_UC_WEAK (like, say, Arm Device-nGRE).  Then 
> we have to specify that these two VFIO feature types actually 
> interact/override somehow.  I doubt we'll end up with a dozen but it's a 
> bit tiresome having a few features that interact.
> 
> At least if it's a single DMA_BUF_MEMATTR feature taking an enum, we 
> just encode the N different (mutually-exclusive!) valid states and done. 
>   I don't feel having a new feature for each keeps things simpler.
> 
> Discovery of support for a specific future attribute is OK with a single 
> ATTR too; we can take an enum attribute argument to a GET and -ENOTSUPP 
> for any we don't like.
> 
> (We could also add orthogonal DMABUF flags (can't think of a good 
> example...) but I'd suggest _those_ as semantically-grouped different 
> features, with the same issues of specifying conflicting cases versus 
> existing features.)

I think the GET behavior you're proposing is a bit counter-intuitive, if
not abusive of the interface, but I do agree that if the feature is
SET'ing a single value and not a group of independent flags, that we
can probably rely more on a try-and-fail model rather than advertising
each supported value as a separate feature.

For example, the user has some list of compatible attributes ordered
from most to least desirable, they try each in order until one works,
or none work and they decide whether that's ok.

For GET, if we implement it, I think it should report the current
attribute, mirroring SET.  We could almost get away without implementing
it, but I do worry about the case of nvgrace-gpu, where it might be
interesting for the user to see that the default attribute could be WB
rather than UC.

Where does the user derive the enum value?  Are we defining our own or
is it a system header defined enum?  I'm curious if/how we're going to
handle architecture specific attributes.  Thanks,

Alex

