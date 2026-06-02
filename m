Return-Path: <linux-media+bounces-63429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gXu8GpYrH2p5iQAAu9opvQ
	(envelope-from <linux-media+bounces-63429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 21:14:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E6263154B
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 21:14:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm3 header.b=fYi8WswM;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="g HZnmpp";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63429-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63429-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=shazbot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C079F302D0F6
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DAE3A6B9D;
	Tue,  2 Jun 2026 19:14:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203953A6B73;
	Tue,  2 Jun 2026 19:14:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427663; cv=none; b=geSd4QuWhTri21YojL2Gv0VTLi9P+ihj+GB2xXs8dD1VVpAbt5pV0gG/4fcEU2+nJmGWaNe8exVwnqSy69tupDwKOtgOorF7QBvaDj4Zej1/C7zjuBsc6FcS37kNj8V9k9dlLxZXibNBAl51fz2CkrexoIZwDlXdyWS9DH6cZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427663; c=relaxed/simple;
	bh=tAzkKETTuRf48VD4z0ecJB0e+JzCLTbr80+eKXBKgI4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgfwiOTQi0998oEraQioTn1lGEEn7DgVcnlbofItP+2CcLXaHAWrGN6teRgnzlcGiOAmw/1gJ31rnhYtqa5q++lzzw9Xraxa4qiocfy5Hi55fwT1k+eF3Mnxmcf10+fyR3rWyJ19J+uejFWYh5xPHhS6crpqxOqebO7qTLZTCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=fYi8WswM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gHZnmppg; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DAE987A00A1;
	Tue,  2 Jun 2026 15:14:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 02 Jun 2026 15:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780427660;
	 x=1780514060; bh=SpvDioedx7EBp7REkfmzqAAh1WhYtz7APHz8F+X6T5w=; b=
	fYi8WswM+/hkbi1Bd3EOzRsKS9w1UWkyvLNnwfILgyvyDaBqcCjA1b8c6n4DxuHQ
	Rufm0/3+n7fZ26/ntN0+xsHEmNNi3P8QbUAcLR8nsZUosIqvWis3u8AolZriPI5C
	YuWzbB1x/a5RsQQ1T3bRDmQy07wOdEr+RnzVSVcyClofhmTc1p89+VepqJFS1A2s
	boZQIsQD2T1hd72DAgKjy38GRJ3hZX/K0uCtHnvNzynsNlyEpmni5pyFIc3DvAA1
	8mxM7s/xKW22LT3Tp2TeRal0XVGYLuqUPZFlA4P7fr3myk/3/p70msI7f0lMYXPR
	xsnJ7JUaM1wXfRmR3tavOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780427660; x=
	1780514060; bh=SpvDioedx7EBp7REkfmzqAAh1WhYtz7APHz8F+X6T5w=; b=g
	HZnmppgaNPwItEsd4IStTSIXHz/n3NR53RCJvTj0RmQJN0ZSzjnWudHLZVX8hvc0
	yYJ/eY/QzBkPOiNbalDsZSWi42bWUKGCUmefFmVZ2IL1XHDBYKhAFOqHH37GSFd1
	jC8iVrtGTTz/cfIOQnCTAmWEsJFY7EhljeRoSD+1k+zlg7G3Jf94qulTJTOesJv3
	Hzhbzen7f4bxAYIByco1J7y33aGJDc/xd5c/co7lCx1KXDa6hc/gLo8Na6N+Pttt
	0vW+LPbolONIOrIpL/GHLHus850xqwENSkNrZrJTbr1f6V9IdU4g0YuyK9cPKid4
	lDWDW3cMun2To0zyPP+iQ==
X-ME-Sender: <xms:jCsfatLxzGt4VmdphbTdirJSQA1MpXYAMU1AMk1ebq0AnJs_1Jeu1w>
    <xme:jCsfak1ywB2nbz5-55Y0zhhPWofz1giRpo09yL9rwnimIX7i-assB9XOPGWFIRpr5
    XJp7_E0K6tzBljN9p4UzOSfH8JF1N-pauhM5PzpmGWB3k6DpC3swnM>
X-ME-Received: <xmr:jCsfagYy5lIUmzqcyr8sK6G-KvfKQkqy25ngGic9PvuAbbyU2Qgn8s0qYKA>
X-ME-Proxy-Cause: dmFkZTEbaR6LWAxxEP7bF1oueZFOpQlufeO72chHj023mPTzizOII6z5ldTM+xHFULHcJd
    KN0hIAhV7kszSpGu8UYILvRB9QwRkTWj6khZsy0V2rhu6mvc3076amoNLLnrXC8wle5U8k
    e19xr29yQwkD+fyr3WNDGif+swnmavasRDpBG5bCnmixecj00gr5lXamekgkoOQ078cPts
    CnXa3RTvGxPZyyfK6c2P8lMcR3Bqd7Dd7ndk2OxIQZ0W8xoZoK4MdeQC//3l03vQWShVsD
    EnUUq+uNCd37UWLpguugGlt1xZl9XZO9lvsgn8Ktzy5+1OPCSQ/Hf4drjV01A/xmVAV8CJ
    XpXvFZZpm977G6evGreJs5c5E24hbpdLz+gaYoOYEQSSTCNZea3/qiLwfKEbttRfEGlnH5
    eUXReTuUjJSZw0Vjd1jXIAisrp6/6CqkroxMamWciT724xZYyeqP+Ou6NNohqsy1JhZxYY
    wZWHdg+ejxcOFd2TKlDcMQsLQWZ5XnT4kPV9vb0StqKqW//5ig/43r+FnPSQFBBGWf3uvi
    axl7yZ8MoHUEOb/wAdyn6SUir2uA6YCrKa/Q1QYRUeanFm58uZvdaCc2O2wVqV3rulFM8Y
    Pa1Mrg8R7jNWd7YPWht2zrHTwn4TzEafYAgL7BMKCrlHQjzA7rkyTd0Ts6Zg
X-ME-Proxy: <xmx:jCsfavX3pjxaVqCjv-vNEJkZoYem228vgb7Tlrw96X6YTaLmLZL0Dw>
    <xmx:jCsfajfxdiqfCns1rdUltuUBKkUkVuHpMkhTRGUDqFdzzagH_55Szg>
    <xmx:jCsfakMv7HPAAbuT9s2pnOQqBkP7VCw7ZvoO_vwFKLSo9goyHr3C9A>
    <xmx:jCsfajKkkggVbUx4PVdT_hrwyyf95lGKwviIP2ZwvTE3uw23DIrUXw>
    <xmx:jCsfarNoi6G6E-ic1DExI19pAuGQmsJuNEpE-Dvf8S4w2sXQo0GLhuNp>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 15:14:18 -0400 (EDT)
Date: Tue, 2 Jun 2026 13:14:17 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Logan
 Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH v2 9/9] vfio/pci: Add mmap() attributes to DMABUF
 feature
Message-ID: <20260602131417.41366391@shazbot.org>
In-Reply-To: <8854824e-06c2-43b3-86c2-8c2c28f9ad63@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-10-mattev@meta.com>
	<20260528171432.771a1a30@shazbot.org>
	<8854824e-06c2-43b3-86c2-8c2c28f9ad63@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63429-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mattev@meta.com,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:alex@shazbot.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,meta.com:email,vger.kernel.org:from_smtp,shazbot.org:mid,shazbot.org:from_mime,shazbot.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49E6263154B

On Tue, 2 Jun 2026 17:50:04 +0100
Matt Evans <mattev@meta.com> wrote:
> On 29/05/2026 00:14, Alex Williamson wrote:
> > On Wed, 27 May 2026 03:23:12 -0700
> > Matt Evans <mattev@meta.com> wrote:
> >> +		uint32_t old_attr = priv->memattr;
> >> +
> >> +		if (flags & VFIO_DEVICE_FEATURE_SET) {
> >> +			switch(db_attr.memattr) {
> >> +			case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC:
> >> +			case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC:
> >> +				priv->memattr = db_attr.memattr;
> >> +				break;
> >> +
> >> +			default:
> >> +				ret = -ENOTSUPP;  
> > 
> > -EINVAL  
> 
> I'd like to push back on this one; ENOTSUPP distinguishes trying to use 
> a wild attribute value from all manner of other screwups such as
> trying to GET (with it no longer supported), passing an fd that isn't a 
> DMABUF, etc.
> 
> I'm not wed to the value ENOTSUPP, just something distinctive versus the 
> other errors userspace might see, and that value seems appropriate.

It needs to be a uAPI errno though, aiui ENOTSUPP is an internal NFS
errno.  How about EOPNOTSUPP?  Thanks,

Alex

