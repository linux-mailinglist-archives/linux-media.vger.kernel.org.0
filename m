Return-Path: <linux-media+bounces-65062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U3khFue4MWrtpQUAu9opvQ
	(envelope-from <linux-media+bounces-65062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 22:58:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9894695545
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 22:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sD26MNSY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65062-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65062-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC0F8315FE6D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 20:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D691239B954;
	Tue, 16 Jun 2026 20:58:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F016D397B1B
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 20:58:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781643486; cv=none; b=VH7GcZa+vRjOB8QkQ1TpxOXtPw89FPtY5mlA63BaswqvC/dyqGQMQXgC9feBIGQc3BXPJ6KZhC2TtvnBx9TKx0LL3BGv4DYpRo/oyOLehUKL4Q12M8FyRcWRFh9p06kZjKaiCARszyfLeye/tAI2z3hsY9ZmIV8X7B7DUIjZZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781643486; c=relaxed/simple;
	bh=MUmT4WQ8gikQW/FOLoONsetD5u39tuO3VxiIsFbd268=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl6vK6Gv8LMig/kx98ZbpSzrpDBOLcOhPZLiXdEuz+EXiCMmVMH/ienvRB1mdC3uc34QDtNaq/dgeAj3ZhWSy68Lsmmv8GxCfsMGsP4GJnjilS9ovglMzSJRL1V1nxONdSCOcyIUe2NOSdcThol/WoKQfrn3UpZQIjbsEsp8ErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sD26MNSY; arc=none smtp.client-ip=209.85.160.51
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-440e2b605ddso1131578fac.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781643484; x=1782248284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG4yjs4p+4H4P31U7PQCtrU7WZ2EeT+JyZMQJymeW5U=;
        b=sD26MNSYv9ZLMxqb1P8qI+3XPTH8FSD8SWooLHUuiCQ1s6THX8h2d9oZK9otgepkmZ
         L+7vw5kRLiFhMm4ptzIFb5v7SpJrr4VPdidEvKSkm3rQM7zsNu16TuLbxqzbvApfenPl
         Bc92wTJuZwFBksaYq+LNEJtqL8qMNArEaK/atLfBq4M5ys37Mkq3NJqEO3nDsQ3RjZnm
         uAZgzEI+ZYytvvmatKMEPQNndEF5C7AER/T55UeFVWLeLPCZqneogbKrZrNsOsahY1JO
         gpRzR0Fuf69BQoin4mtTuxrSj23kj93piIP2Ibn1fjn5ZOkwXSlYiw7aRLu3ADWyY4e5
         CTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781643484; x=1782248284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG4yjs4p+4H4P31U7PQCtrU7WZ2EeT+JyZMQJymeW5U=;
        b=JrzDGmQhwZMoVfKBVK0bZRM47ZfJGTtQRF4ciz9F1XIpAOOTMY6CHCvKMGYcGWGLwK
         3wH+vV5Z+1OIslzAby/wkf/sGmVRBexfK5J19Bnz2+jsd8yLfNNADw+Kwg/mw4+umDaH
         lhLMDEcNzhQEG2WoFyUqwIeWeZwPdvOgt6f0IuVT4QhqASZ8a7hRWqL/f+uNb7YRptVP
         W/ePBFlfu6YGhiU/kiOttAaHzmLcBEUyuh6QcEKxNvEDrLEPam5Jzk21o7jqtY1H3IH7
         Yz5+vs/l1LnX2yw5gyiKnr8/SMIraCZTveLBLsIr9PXHaHfYcZW8sBeqRDqO7ciK4Bx8
         Wu9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gmwD6VWE0hVuK1qGwIe7xHZaStxWa6a+cHVW+ZMjck3+qr6lPVYFJtnLXW8H+ABafC3K6BO9njZbELQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++j7IFLuSgabNP3FEvmgp9wT2+GIGZ/6YBLarws9FLTbC/dZS
	1uyxyXAotpOcwWooLrFnrRAhxC7xO0DEjNe7puncaM4flOcj1mMTd0az
X-Gm-Gg: Acq92OG8nTP8fz88LKtrb0u1hfoIIm6tRsXRWPPsEI6UTkxUV9g47sfdlDANLIQaxpF
	dpgsAqP0y+HkLhrBA2+ot6RiI5aHKTHH2af+PwXsIPyrin4nzekDnlKLZ2pzOuHuPlV8oxJwTLO
	la28/vd2o6td01Ik9QCZR9r+qz1S3b0p6o247l5fQbtvDC5ejidM1pViXv5mInoK3zktxpwRK1T
	LblZWER411kZmytVAeb/etuWMp7lshY2j2gck/tNy99FSu7w8Xs4skmy+8PkFRHb3XzqcNukXQZ
	yDVvuzEKJ0SimRq/bWSmzQsVbvExwvLT6YZuG2JuJQ3gbzlppgzvtXdQ9EFZW7mblOSrPsiiOKS
	eq+nYwH5qFyWrnR95YFXznAh8EWh05gpT3Y+ror8saioaOuagafZTuK27LghHOpgaXbLx4vLueq
	Ob6rY2nkmlIUjV7h2RTFmQqOnuNB+xWkIU03mFpqIrnFU=
X-Received: by 2002:a05:6808:2f0f:b0:479:f7e7:4a81 with SMTP id 5614622812f47-489425d7d4cmr1016628b6e.0.1781643483758;
        Tue, 16 Jun 2026 13:58:03 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875df7fc36sm5099675b6e.9.2026.06.16.13.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:58:03 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:57:49 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>,
	"razor@blackwall.org" <razor@blackwall.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"almasrymina@google.com" <almasrymina@google.com>,
	"matttbe@kernel.org" <matttbe@kernel.org>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"dw@davidwei.uk" <dw@davidwei.uk>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Message-ID: <ajG4zaK9zu7qZT1+@devvm29614.prn0.facebook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
 <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65062-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vivek.kasireddy@intel.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:jgg@ziepe.ca,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,linaro.org,amd.com,ziepe.ca,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9894695545

On Tue, Jun 16, 2026 at 06:04:03AM +0000, Kasireddy, Vivek wrote:
> Adding Jason to this discussion.
> 
> Hi Bobby,
> 
> > Subject: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
> > folio
> > 
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> > underlying folio was larger.
> > 
> > Instead, walk folios[] and emit one sg entry per folio. When folios
> We have recently merged a patch (that will make it into 7.2) from Jason that
> replaced sg_set_folio() with sg_alloc_table_from_pages() in udmabuf driver:
> https://gitlab.freedesktop.org/drm/tip/-/commit/5bf888673e0dda5a53220fa0c4956271a46c353c
> 
> Since you are relying on sg_set_folio(), the core argument against its usage
> in udmabuf is that it doesn't work well with offsets > PAGE_SIZE, resulting
> in a malformed scatterlist. Not sure if this can be fixed easily.
> 
> > represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> > page. Normal PAGE_SIZE sg tables are unchanged.
> > 
> > This is helpful for importers like net/core/devmem that expect dmabuf sg
> IMO, udmabuf needs to detect whether importers can handle segments that
> are > PAGE_SIZE and set the entries appropriately. Please look into how the
> GPU drivers and other dmabuf exporters/importers handle this situation, so
> that we can adopt best practices to address this issue.
> 
> Thanks,
> Vivek

Hey Vivek,

It sounds looks like that patch might solve my problem. I'll apply and
troubleshoot from there.

Thanks!

Best,
Bobby

> 
> > entries to be size and length aligned. Prior to this patch udmabuf
> > handed over one PAGE_SIZE sg entry per page, so devmem only saw
> > PAGE_SIZE chunks regardless of the underlying folio size.
> > 
> > dma_map_sgtable() does not always merge contiguous pages for us, so we
> > do this internally before exporting.
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 52
> > ++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 47 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 94b8ecb892bb..9b751dd98b12 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -141,26 +141,68 @@ static void vunmap_udmabuf(struct dma_buf
> > *buf, struct iosys_map *map)
> >  	vm_unmap_ram(map->vaddr, ubuf->pagecount);
> >  }
> > 
> > +/* Return the number of contiguous pages backed by the folio at @i.
> > + * A udmabuf may map only part of a folio, or reference the same folio
> > + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
> > + */
> > +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
> > +{
> > +	struct folio *f = ubuf->folios[i];
> > +	pgoff_t j;
> > +
> > +	for (j = 1; i + j < ubuf->pagecount; j++) {
> > +		if (ubuf->folios[i + j] != f)
> > +			break;
> > +		/* Same folio, but not a sequential offset within it. */
> > +		if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
> > +			break;
> > +	}
> > +	return j;
> > +}
> > +
> > +/* Count the contiguous folio runs in @ubuf, one sg entry per run.
> > + *
> > + * Coalescing folios into a single sg entry up front lets importers actually
> > + * see large chunks. We can't rely on dma_map_sgtable() to do this for us
> > as
> > + * the dma_map_direct() path preserves the input scatterlist lengths
> > verbatim.
> > + */
> > +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> > +{
> > +	unsigned int nents = 0;
> > +	pgoff_t i;
> > +
> > +	for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf,
> > i))
> > +		nents++;
> > +	return nents;
> > +}
> > +
> >  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf
> > *buf,
> >  				     enum dma_data_direction direction)
> >  {
> >  	struct udmabuf *ubuf = buf->priv;
> > -	struct sg_table *sg;
> >  	struct scatterlist *sgl;
> > -	unsigned int i = 0;
> > +	struct sg_table *sg;
> > +	pgoff_t i, run;
> > +	unsigned int nents;
> >  	int ret;
> > 
> > +	nents = udmabuf_sg_nents(ubuf);
> > +
> >  	sg = kzalloc_obj(*sg);
> >  	if (!sg)
> >  		return ERR_PTR(-ENOMEM);
> > 
> > -	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> > +	ret = sg_alloc_table(sg, nents, GFP_KERNEL);
> >  	if (ret < 0)
> >  		goto err_alloc;
> > 
> > -	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> > -		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> > +	sgl = sg->sgl;
> > +	for (i = 0; i < ubuf->pagecount; i += run) {
> > +		run = udmabuf_folio_nr_pages(ubuf, i);
> > +		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
> >  			     ubuf->offsets[i]);
> > +		sgl = sg_next(sgl);
> > +	}
> > 
> >  	ret = dma_map_sgtable(dev, sg, direction, 0);
> >  	if (ret < 0)
> > 
> > --
> > 2.53.0-Meta
> 

