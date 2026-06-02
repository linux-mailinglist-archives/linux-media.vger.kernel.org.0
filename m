Return-Path: <linux-media+bounces-63427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hBkxBg0pH2okiQAAu9opvQ
	(envelope-from <linux-media+bounces-63427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 21:03:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9663145C
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 21:03:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm3 header.b=GPoOJMnn;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="N +BDXpk";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63427-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63427-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=shazbot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8010E3014269
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 19:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D6D3A48F1;
	Tue,  2 Jun 2026 19:03:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B34D3A4512;
	Tue,  2 Jun 2026 19:03:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427014; cv=none; b=A2MAa7xzIzgUOBJySSLZxWEOQ0ea/1rN+xNqcTBF+OrELCuO7z3o6uxDzcpat+ocKJDl3tJyeEZIy14X67xG+k/xX+M0JOK1tg8BxIKjs1qqkwMt6yG5ZDSLpX9Jue50a/2Pw+JaGCjrPoZmUvuFKOuqm2S1DriUJVb4P3YUrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427014; c=relaxed/simple;
	bh=dFLXJ2mTsebzTbG9hxzV8u9ehvJ1W/Ges/pAC/5JwYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MloQvplRHITtseCzNcU0U9Z5NTg3pbiaGIs4kkJ2A7GHCvCy4D+zaaKkaNnom5rnfyI2v4CPl6JoRJ1mwu2a76Aj7xyFdOfuNTpEMhmvPyyy037O552/ceDdYym3djWsVsyj7n2kzGKolzt3oI6PtLL7o5DDit5jiCNGsAIJwUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=GPoOJMnn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N+BDXpk0; arc=none smtp.client-ip=202.12.124.149
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6F7371D000A8;
	Tue,  2 Jun 2026 15:03:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 02 Jun 2026 15:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780427010;
	 x=1780513410; bh=cd0bId8TE8oR/ADKSdyMkH7b1BoNJ2xKm74dFlDDlhM=; b=
	GPoOJMnnOoqJzBnPc48CZp1+tnFTZY9xKs84zcxcZoF5rM5HLE+pt8yw77j4Umcw
	uVJsAg2BlremrnWMC72NSAjRdElS7yyxr4Ji+G6yvapuaeCaUPw7Z3Gi4tc3VkDL
	H8KwVMMe/QpT0g0ZPC5L27tZGQseWzxIjzfPdrcsvfq+RYvuNY+eeJUTzv8AK0nA
	KcH3bGlh7OLtefDYC/ZEqR1wAGHi/vT6tP3Cs7ycbe61ZDjdwKddAbrv2yx1mcvH
	+4oJ3xgPhiktqvlLc674Kgdu+qGqNundjKmBU282Kxmyac4TW5ldd+XdznlDH0CY
	GBP0/v5iN2iQ9UnnWvCZrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780427010; x=
	1780513410; bh=cd0bId8TE8oR/ADKSdyMkH7b1BoNJ2xKm74dFlDDlhM=; b=N
	+BDXpk0A3iPxZ8RMaJvB979RSJrmmF2EwBvUXlPgE2yWScIhlJl8oJ8bEKAkM7Wg
	L0H7jVeW3vb8oDzxTLp0EqvjoZR+R0+s919W1N0ti88+WUEHgek2bNXYwf56JAke
	4yAE+klP3nXukI4EF+I84rW9BX8zv4lWCtCfZH0OfsebEnRso1hYMSDxXlIK6j3m
	Mea68pKJlvIaUe2LrcZ0YDBE73F0pUWKEBgIsp5KfrX270bfEaj5wbi8gpjYRiFs
	NSXJ/9J6hmeBNEtdyCV4PEdLtrdB9R/WzlEkb2/ajzPXQmz96RuqsyKYgOHifWmv
	AjES5xisNIXSv0Pydwy5A==
X-ME-Sender: <xms:ASkfaiWM-Czb1TYty-CbxJxRAp1W5c7QTPPkYmT2T5FS7w-vSGy00Q>
    <xme:ASkfaqS5e8gt28jbwuRj0iOrYdmv_mOlLB0zK5H2oV6NlOhEoBX6P6a8j7cbm1kb0
    tgc5DdDffJKyWhJ99HRAt_sLJT6q6In7SCR5ke3Q00nanXopPKtbw>
X-ME-Received: <xmr:ASkfahG873z7UAjZb6Viz0phUbZdBpJsFBRvM-idqUMtJRNBGZi_zCsYUSg>
X-ME-Proxy-Cause: dmFkZTEugpXXuty+LAuPDMg/HDjmtCKhMH9hR+UnSPrr64oSg7b6jTY5v1Iuk/1wnfVpGD
    9wJzzqijOna9OQq6LuAouAbC+7+DZuCw56Bn6VvFxcbMCs87QVMK/aghDrBbnj5Om/0jLt
    PQXYJGKpekTsZMATIWzUcIXRJ4KgIW7S34TMHc5kiSCfR8najzHgBso5FISyUm/MclajxG
    P0Tbd0bQ/S3bG5V7iLr3WVaZPf274PuzRZq4mCr01PbcEa8bGEZxF4A1i2jL3xCGO+EeP+
    QbG03vlrsNjOcN0QmGq3uY9V3zuTSY94Y2R8gV6ekOWz3wuRcnf7pIKCFcNQEwT6cRdiau
    YlqnBwTqg0SMbskungw4/aAzVjlM65V/VneBtJbPKuMAb9X2E6M78tsnnMWuj8geAPVqYx
    EHo12DHWUZMbUzY6qLPATk/yoIvoBRRYw6EYpAdRhaFK8ndFX5YRjdBX7CXm4oBfRnTzZo
    SXgYN/IaHy01v6tfajpGgWV10nfK34SvtlDaqNve38kyzKLJc5V13fxwDzAQ0g/zA2T4Qc
    6EgWfS0IgMOTo2rMVS2ghGL4pWsbjPpMzmWaSOPoWBC644XLQxt5cfvi5dUjp+nG6oYl3k
    Mh30Lz4pVvIY8gQqPMtoPYN/VnEgjtZacOq/TU1+2IGQ7Ipy0pAqWq/ztdHg
X-ME-Proxy: <xmx:ASkfaqSg4IDy1ROG6I3wocJQnL7NgtVLfiOCRusO5fdebsmyzT1DDQ>
    <xmx:ASkfarr95EeFQG4l9iF62OtC3uC36de1qAjiz6_KTrDZg5swL3ib8Q>
    <xmx:ASkfago1yf1MqfS2O0gyKXB4Up6Rn9W-cetWT3nKMDhmKLwxb6njTg>
    <xmx:ASkfau3jUjQ6HCUzqSf2eiDC1zin-UMJ97FnJPsYJHfUR4lhqk6MiA>
    <xmx:AikfapazUI7tA5D3d1uMWAUPkDzpMCqXNMaolXvbIBSNEM6gHcnB8WIi>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 15:03:28 -0400 (EDT)
Date: Tue, 2 Jun 2026 13:03:26 -0600
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
Subject: Re: [PATCH v2 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Message-ID: <20260602130326.6b7a8d0c@shazbot.org>
In-Reply-To: <49c3554f-8ba7-4a00-aa20-a311b173fc0f@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-8-mattev@meta.com>
	<20260528171527.46d0c21a@shazbot.org>
	<49c3554f-8ba7-4a00-aa20-a311b173fc0f@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63427-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,meta.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BC9663145C

On Tue, 2 Jun 2026 18:35:25 +0100
Matt Evans <mattev@meta.com> wrote:
> On 29/05/2026 00:15, Alex Williamson wrote:
> > On Wed, 27 May 2026 03:23:10 -0700
> > Matt Evans <mattev@meta.com> wrote:
> >> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> >> index 733607371082..4b3b15655f1d 100644
> >> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> >> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> >> @@ -27,6 +27,32 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> >>   
> >>   	return 0;
> >>   }
> >> +
> >> +static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> >> +{
> >> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> >> +
> >> +	if (priv->revoked)
> >> +		return -ENODEV;  
> > 
> > Questionable validity to testing revoked without a lock, but doesn't
> > this also fail to follow the "map regardless, sort it out on fault"
> > paradigm used elsewhere in vfio-pci?  Thanks,  
> 
> Kind of, though this was intentional.  (I had removed a crappy comment 
> here from the RFC, but should re-add something better...)
> 
> You're right that, if we don't test this here, the fault handler ensures 
> safety.
> 
> In the revoke ioctl^Wfeature header UAPI comment I'd suggested a 
> revocation prevents a new map (in addition to prevents access to an 
> existing map) with the intention of making userspace easier to debug:
> 
>   - I'd rather trace an mmap() failure than a SIGBUS (eg. if another
>     process has revoked my DMABUF and I didn't get the memo).  For a
>     prior revoke this is a reliable & useful test.
> 
>   - Even if there's an active race such as userspace doing an
>     ioctl(RESET) at the same time as an mmap() (!) then obviously this
>     check won't always catch it, but when it does then that's useful.
> 
> I'd prefer to keep this belt-and-braces check to early-fail (with 
> comment), if you don't mind much.  It _is_ testing revoked outside of 
> any synchronisation as anything we can lock against here doesn't have a 
> useful effect AFAICT.  (Taking the example of a concurrent ioctl(RESET), 
> a revoke still manifests "before" (caught here) or "after" (caught in 
> fault handler).)  Maybe READ_ONCE() wouldn't hurt, if only to indicate this.

Hey Matt,

I think only the permanently revoked semantics are up for
interpretation here, mmap with memory disabled or across reset is
currently allowed and better debug'ability is not sufficient to risk
breaking compatibility.  Thanks,

Alex

