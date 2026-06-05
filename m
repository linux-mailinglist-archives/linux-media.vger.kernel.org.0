Return-Path: <linux-media+bounces-63956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nyLCHNQcI2rgigEAu9opvQ
	(envelope-from <linux-media+bounces-63956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 21:00:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7EC64ACBB
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 21:00:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qUh+nclv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63956-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63956-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75C733066AB2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 18:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC0A3E92BD;
	Fri,  5 Jun 2026 18:44:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFC3E6390
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 18:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685045; cv=none; b=IsbuEddsd32/pN7dHMsiIFRbe4tHgLzeMgRTx2ftjD9PzUlx6fFVCL20N84HqUakf2lT8sofBFHnkf0+AURY+mR7Zo8meOiMCWCOhVywqfx7PWNuHMd8grtZTiYnSjbq40C/ffhF/Rf6ZvD0w/HzdaoYG52yJrS2t9cSOX36GWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685045; c=relaxed/simple;
	bh=jptZDNz6y+ZlDE7Z2+X6vsmedleZEP/GgTVJ8MIVCV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzR7rt8mHdFT5GDl7GfHYpHgshdRZ/ySFNJNbHfq58yGEqcXJcsDnEiQ9WO4cSqWSnRn9xNjNdqR1OGYDOtarVczy5JHx8OAcY00qI1heN482002xucawl0ouxQkLSW9HVbq4slX2FwXy1WDtujMaUOEjy70Dr3O9umpw96J6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUh+nclv; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf18c30bb2so16170955ad.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780685043; x=1781289843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmToUT+A6qp8UgJ/VhXar74M6fIQJS1C/pR1f1V3ExQ=;
        b=qUh+nclvgiHYKzX3b/kDCvzXL/O6elBYjQ0Y2BtzxFxe6Q7xZG239BaIL2RKL8XZzL
         vpWhSBYMKiVYN/Z77EnauJ1L/pZIRV9cnLxjZav6YlpKNmSLAoqsL5a63WDyRdf2HZ5Z
         SDorrWNZX/kTLWwY5g0zdRVpmLfo2EH/+B6Qvag5sHDi/7gmLd6ARvd71WRiRVjPhgYJ
         f6yxBKbfC+XzSkRLourk6ogx2MDz8T70pAWO1IIrzJNsSbbQ7w+oN5p8MK0feSaZP7JQ
         WcNCA+aT8d9qbLYSx20PhXjlpUFL0y2DJrBbI0O1sy4YfyojDK0hkrTvmVaCaOrqVUgH
         ZWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780685043; x=1781289843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmToUT+A6qp8UgJ/VhXar74M6fIQJS1C/pR1f1V3ExQ=;
        b=I129jVDN5v3+rNeS42ZmYzXk6Hkvld9Vx0zBKIFCGUh9srSwcKE/ge6Tb9plUm0fWb
         PQwcLcyuZX8P7GjoYoEZqFTdaOQvzID0XRQht6waodCfCEQZW9DoBN0Yw7wjh0muvvUh
         zPYS1yfsp/658U05kMk62A4H7R4OJA8XyCcIqiC7ZO0uzQq7vZs4MNcv2E9oJSafLTF2
         WSiVHkJw0o0Z070E8ippwfDDGk0hk+IjfBIf+k8hA99FfKUtW945hJHflSCRQGa1mYq7
         NAWtkyXLTevBrRNXbZJFQHayGEiaeqgxjwd3c0EAT0rKMFhUEFUICxtRxLEJBftdBIUa
         r3ew==
X-Forwarded-Encrypted: i=1; AFNElJ+BMwJaG7beHMQzi1vzYeTDghSxDajgFM0XGLLbQdwz4B/AmZFCDU2KRwHCJ/2vCRldaOBvTZCgJ3q1RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXYzkZUnsy1i9OxP/VybTUqbs2oTFjsoJnjtox0MRTfwdRBeVt
	7LiEI5z0Rdb4vu1x/QMKqiTAKxHVA4NOO8i/qj5tHM168I+mTo/Ggwjk
X-Gm-Gg: Acq92OEsNBWiUgqGKCgwnS0RmrA3F7YVn3bK+9y574dyoPb9VN/kndScIx+DqBckTBz
	FDXDsPopE21AM9cjglvJkI83fiBwR74zXe3SnXQLXVMBdLZaTo9V4jgA+/7HWyzYC2GCbEpfeZM
	R8xr+L5SlooXs5D0YeUwSwJrnXkTaJYcFaQu2RQKyuCkjCUgTjk+BOtf0tJphPilbVrFKN9PipH
	OlLJnmuYYaRb4Ob+Yd/zBeAYx/H8zOBBaVgMRp52zQ/uRR3P1pgZRlSxELGQvAviTtkAo0jieB/
	VzX2Fb5mHPILxn5JyHOOqQRPlB0aRPuy+Sk5grCThZhJ1AumpCx/rGCJW1WtILvc+Nfs0IfTYfq
	02cnlb45Gz+QEFVxPFUD+WBejtB4WiozESv5dCYmdZSnBCR/h0DzVRO00Ym8BO6kVQBhfhDoLqY
	TbctrYi1UGZzPzkv10vin5OBQQwJdBj/Xz4O6/CpTAY6AiFVO2iLQdx2c=
X-Received: by 2002:a17:903:18c:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c1e881fefemr54368775ad.20.1780685042865;
        Fri, 05 Jun 2026 11:44:02 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:58::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm96908105ad.67.2026.06.05.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:44:02 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:44:00 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
Message-ID: <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
 <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
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
	TAGGED_FROM(0.00)[bounces-63956-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:email,devvm29614.prn0.facebook.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC7EC64ACBB

On Fri, Jun 05, 2026 at 11:30:07AM +0200, Christian König wrote:
> On 6/4/26 02:42, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> > underlying folio was larger.
> > 
> > Instead, walk folios[] and emit one sg entry per folio. When folios
> > represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> > page. Normal PAGE_SIZE sg tables are unchanged.
> > 
> > Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
> > udmabuf.
> 
> That doesn't explain why this is required.

Sure, can definitely add. Devmem currently requires dmabuf sg entries to
be length and size aligned when it allocates niovs for NIC page pools.
Though udmabuf is not violating any dmabuf contract by emitting
PAGE_SIZE entries and the above restriction is probably more a
shortfalling of devmem, by emitting a single entry per folio this patch
allows udmabuf to be used by devmem for large pages.

> 
> Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!
> 
> Regards,
> Christian.

It seems both devmem and io_uring zcrx at least introspect through to
the sg-table to build NIC page pools (not accessing the memory itself,
however). Is there a better way?

Best,
Bobby

> 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 42 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 94b8ecb892bb..f28dd3788ada 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -141,26 +141,63 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> >         vm_unmap_ram(map->vaddr, ubuf->pagecount);
> >  }
> > 
> > +/* Return the number of contiguous pages backed by the folio at @i.
> > + * A udmabuf may map only part of a folio, or reference the same folio
> > + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
> > + */
> > +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
> > +{
> > +       struct folio *f = ubuf->folios[i];
> > +       pgoff_t j;
> > +
> > +       for (j = 1; i + j < ubuf->pagecount; j++) {
> > +               if (ubuf->folios[i + j] != f)
> > +                       break;
> > +               /* Same folio, but not a sequential offset within it. */
> > +               if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
> > +                       break;
> > +       }
> > +       return j;
> > +}
> > +
> > +/* Count the contiguous folio runs in @ubuf, one sg entry per run. */
> > +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> > +{
> > +       unsigned int nents = 0;
> > +       pgoff_t i;
> > +
> > +       for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
> > +               nents++;
> > +       return nents;
> > +}
> > +
> >  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
> >                                      enum dma_data_direction direction)
> >  {
> >         struct udmabuf *ubuf = buf->priv;
> > -       struct sg_table *sg;
> >         struct scatterlist *sgl;
> > -       unsigned int i = 0;
> > +       struct sg_table *sg;
> > +       pgoff_t i, run;
> > +       unsigned int nents;
> >         int ret;
> > 
> > +       nents = udmabuf_sg_nents(ubuf);
> > +
> >         sg = kzalloc_obj(*sg);
> >         if (!sg)
> >                 return ERR_PTR(-ENOMEM);
> > 
> > -       ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> > +       ret = sg_alloc_table(sg, nents, GFP_KERNEL);
> >         if (ret < 0)
> >                 goto err_alloc;
> > 
> > -       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> > -               sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> > +       sgl = sg->sgl;
> > +       for (i = 0; i < ubuf->pagecount; i += run) {
> > +               run = udmabuf_folio_nr_pages(ubuf, i);
> > +               sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
> >                              ubuf->offsets[i]);
> > +               sgl = sg_next(sgl);
> > +       }
> > 
> >         ret = dma_map_sgtable(dev, sg, direction, 0);
> >         if (ret < 0)
> > 
> > --
> > 2.53.0-Meta
> > 
> 

