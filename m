Return-Path: <linux-media+bounces-61173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLw+FXs4AmrmpAEAu9opvQ
	(envelope-from <linux-media+bounces-61173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 22:13:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C64515933
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 22:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 785F4305FB31
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF9837F8BC;
	Mon, 11 May 2026 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="PwYyRk+0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PAAEvCIe"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA9037B02B;
	Mon, 11 May 2026 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530205; cv=none; b=fh4Qr8ljEnlrgYSKWwT1B066Khdf5iT7sSZ20SIAm4KzpBR1CXOmcdjbpPZOQWZxP3dqeXZ2Dr+Cl9zlGa3VIwOL/V0ek+EuU3c7AlUgqoKYXKP9fOvr8d/G53j+mNL1Ws1fP2SnrUGbgxR+SWvWnZPMyIZntPBlf/SACzO3QnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530205; c=relaxed/simple;
	bh=G0v2722C0h0uodYwkYgNAN0oHrh8GL3c7d7feBZLWIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jO5PkERAbYnOlxDDaVZNfJW9u/sF2iasFOho56iqk+DvBccbrxVtjBwcJLabWKIvjGs60piUpzvSJBhR8n0SoDEiC73Fyv4TlSvH9e8f5EQbk9I6FX/QyjtYgJUGFyUJ0MfR5a+9qoUGhOjqZBE5T8vCOEAWr72C3k0C5LukDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=PwYyRk+0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PAAEvCIe; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id CAD7C1D000F5;
	Mon, 11 May 2026 16:10:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 11 May 2026 16:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778530200;
	 x=1778616600; bh=w/jJechNkW7E0LVurksiul+ndqwmLEWiu+OGwNv1unw=; b=
	PwYyRk+0iVOdVXuz/8VHbIiLHEoKNhjSddEyaXI4WLxNed4oJB+5Hd6boIDLmO/X
	/ycckExDBc6GCMDrMGJeYACRebp/v3WoNnPNeQ5YCUHH6lShumpHk/31H/VbuO+W
	P+tiJDfPWC7vRhvDF3o6CdrHXJ070qqFnVGGub7+/4N/ylteHzNSEyguRiLuT5C7
	6xH8iee41Z1whvGDzQMnPoMPL+lBQbuuhFBjEnJ1iDGEerCARugWByAkPHE50KFZ
	yGQBgoJlr+2+LZUAo40GUHNB+vTO182BLawsAfKorM0uE6dL8hVwyJd6F7A6jMZ3
	3Y+D0PRD2GzL/JrNxHZ6fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778530200; x=
	1778616600; bh=w/jJechNkW7E0LVurksiul+ndqwmLEWiu+OGwNv1unw=; b=P
	AAEvCIe5WxftUxxaUKTnozoCRpp35QY7xXcr9srqzj2fGvDq3qzi14hsAmIyuPK1
	OB+HAzH49lwtmxPRVw0eirS8y2facxpbs8ZxjndVz4bDlikMLOrxERUxO03Q9YMq
	ZzrhKiGZuVqu7YMAFWykSQWwEqHdBUvGhZ+PsKRMDsQGH3yb5jQU53+BdA/TFo4B
	gt10A6T4pRem/APPpn0c3AUN3Ln6XFI1q8esHyXy1JeajIarBpHPa9xBFqZk1pwd
	MbCXCGNqd48pdPubwcMH5rLlxj14kksudMP1JHs8ODcSWrQ89ZkfSbBT6fp0q726
	qianrAnEfxsHjPzWeU+YA==
X-ME-Sender: <xms:mDcCanwZoBgY94pR6CgGx1aXMsUsiHtVgpAYsgsjUY0a_uGZ4HtnkA>
    <xme:mDcCator06ysxCDdBhVrXNTBxhoyxhyZoO9b2GFGS4wZWwKaIsc8Wqt4rHWFDwOQm
    JBc4Bv_-irhL3bMl7h2ZcrzFCEYdoU_3mpqToMXfyNF2JpvrSiIeqU>
X-ME-Received: <xmr:mDcCatVAs0PIpPycMEDa0aLxKAAYaat1b7iYqOm0xFH4xtZQgPIYVu-zc50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudelkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpeetlhgvgicu
    hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekheejieetffefueeiteejtdejffdvleelvdeuvdffvdefteeghfevkeeu
    vdefvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhg
    pdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    grthhtvghvsehmvghtrgdrtghomhdprhgtphhtthhopehlvghonheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepjhhgghesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprghmrg
    hsthhrohesfhgsrdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhg
    segrmhgurdgtohhmpdhrtghpthhtohepmhhnghihrggurghmsegrmhgriihonhdruggvpd
    hrtghpthhtohepughmrghtlhgrtghksehgohhoghhlvgdrtghomhdprhgtphhtthhopegs
    jhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsuhhmihhtrdhsvghmfigrlh
    eslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:mDcCakqPSRoKzyPGGXProFqYhH4qYKpgflb8Spsx6bK2Yvak4Gd4uQ>
    <xmx:mDcCahGgEJbSVtbnpYLanu5mqQCGZRveGu3g79YLyppoXoJCZIjPIw>
    <xmx:mDcCamshnuz0U_drzHUfOKcWk73kxV1nW7PxZm4wDep0feme0jrxgA>
    <xmx:mDcCakRquOgmfyzbwC0uVpaxobRtcOQaDFkpxWtGwg4yfJK0yK_Dww>
    <xmx:mDcCam7wLKey_JuLtJOlx4ChD12laJy6R95rvUhqAlL9MfIcaz87pHbT>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 16:09:58 -0400 (EDT)
Date: Mon, 11 May 2026 14:09:57 -0600
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
Message-ID: <20260511140957.25eb5d9d@shazbot.org>
In-Reply-To: <25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
References: <20260416131815.2729131-1-mattev@meta.com>
	<20260416131815.2729131-10-mattev@meta.com>
	<20260424183153.GJ3444440@nvidia.com>
	<20260426105215.GA440345@unreal>
	<20260427083644.4ee174cd@shazbot.org>
	<25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B5C64515933
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-61173-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shazbot.org:mid,shazbot.org:dkim,meta.com:email,messagingengine.com:dkim,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 16:30:39 +0100
Matt Evans <mattev@meta.com> wrote:

> Hi Alex, Leon,
> 
> On 27/04/2026 15:36, Alex Williamson wrote:
> > 
> > On Sun, 26 Apr 2026 13:52:15 +0300
> > Leon Romanovsky <leon@kernel.org> wrote:
> >   
> >> On Fri, Apr 24, 2026 at 03:31:53PM -0300, Jason Gunthorpe wrote:  
> >>> On Thu, Apr 16, 2026 at 06:17:52AM -0700, Matt Evans wrote:  
> >>>> A new field is reserved in vfio_device_feature_dma_buf.flags to
> >>>> request CPU-facing memory type attributes for mmap()s of the buffer.
> >>>> Add a flag VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC, which results in WC
> >>>> PTEs for the DMABUF's BAR region.
> >>>>
> >>>> Signed-off-by: Matt Evans <mattev@meta.com>
> >>>> ---
> >>>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++++++++++++--
> >>>>   drivers/vfio/pci/vfio_pci_priv.h   |  1 +
> >>>>   include/uapi/linux/vfio.h          | 12 +++++++++---
> >>>>   3 files changed, 23 insertions(+), 5 deletions(-)  
> >>>
> >>> Nice and simple
> >>>
> >>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> >>>      
> >>>> @@ -1549,8 +1551,12 @@ struct vfio_region_dma_range {
> >>>>   struct vfio_device_feature_dma_buf {
> >>>>   	__u32	region_index;
> >>>>   	__u32	open_flags;
> >>>> -	__u32   flags;
> >>>> -	__u32   nr_ranges;
> >>>> +	__u32	flags;
> >>>> +	/* Flags sub-field reserved for attribute enum */
> >>>> +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK		(0xfU << 28)
> >>>> +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_UC		(0 << 28)
> >>>> +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC		(1 << 28)
> >>>> +	__u32	nr_ranges;  
> >>
> >> Alex,
> >>
> >> The TPH proposal extends the flags field in a similar way, but I suggested
> >> a different approach to conserve bits. At the moment, we spend three bits
> >> on a single feature, which feels wasteful.
> >>
> >> What do you think?
> >> https://lore.kernel.org/all/20260409120415.GF86584@unreal/  
> > 
> > I already proposed a very different interface for TPH that decouples
> > the dma-buf creation from setting the TPH values:
> > 
> > https://lore.kernel.org/all/20260423132016.4a25e074@shazbot.org/
> > 
> > This is overall less intrusive than the TPH change proposed, but it
> > could still make sense to align this as an operation on the dma-buf,
> > that can be probed as a separate feature.  Thanks,  
> 
> I'll add a VFIO_DEVICE_FEATURE_DMA_BUF_ATTRS in a v2 instead to get in 
> line with the TPH work, no worries.
> 
> For the benefit of future hackers, how would you describe the criteria 
> for adding flags to this existing field?  What hypothetical feature 
> characteristics would be appropriate?  (Maybe it's that these attrs & 
> TPH add scalar fields in several bits rather than a simple boolean.) 
> Two of us have independently added something that's turned out to be 
> inapproriate so some guidance would be good.

I think the question of how we actually expand an arbitrary grab bag of
"ATTRS" is the central question in whether we should implement the
interface.  If we follow the direction I suggested for TPH, maybe this
is just a VFIO_DEVICE_FEATURE_DMA_BUF_WC, where it supports only PROBE
and SET, with SET taking only the dma-buf fd to implement the one-way
promotion from UC -> WC.

If we support a generic SET ATTRS feature, we really need to map out how
flag bits are indicated as supported and how a user untangles failures
from trying to set various attributes.  If we end up with a feature
indicating each ATTR is available, we might as well have just
implemented a feature for each attribute.  Thanks,

Alex

