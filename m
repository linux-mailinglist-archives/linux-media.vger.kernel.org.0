Return-Path: <linux-media+bounces-51280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLNMFMsAcWmgbAAAu9opvQ
	(envelope-from <linux-media+bounces-51280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 17:37:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D659FD4
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B12D76B977
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D67A4B8DEC;
	Wed, 21 Jan 2026 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yey+oVbG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209264B8DCB
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006862; cv=none; b=qc5/NOdAWelpqKBUhE2nrmK1q1ppTs0sxmMp+wAZmQwwa7iUcwi3YP01SBH1hib9SfxB4OpNNH1qPiwV9nn3iDGNCpgBG4lZ8xzNgqyWAfAhRXCzut4CPCc3UsMTvScNgti+q6+rWsjLfA6uYHqQhsnJUi8yCBUiMOQ+b5F7HnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006862; c=relaxed/simple;
	bh=ACESqUkTA5xhzkocxzu1Q/cYXSAEkWy1ze88m+Pg+BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVZpoc1S6h6VCdiPXHdNLlGYO3giQ90Lmc8wPoa5luBjlJSO3y2FAYH4MKaYTzry8CyP/8BKPggREQAEoCdU0576SfB75/0+E1zeq/RPZkqH3mdKxlgJaEGrccuuGX+F9ZfLnTAQ0YOpY7l6h6VevrkaNp9Shk8ZyQJx0LyEu70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yey+oVbG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a35ae38bdfso75445ad.1
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 06:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769006859; x=1769611659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMkS4BFW7iikoL2BjP1nG2XKvn880JyWpxnGNG3+/cM=;
        b=yey+oVbGOy2ziOs0M8k3ZrA9edvNtdE03FMxfDRDoifwSsfAb0EE7GHHjZJzUd+MTs
         SvuC5M7f5WQiWgNrDPx5uw7akEzXnBnVI1QQ4ZX9E3vOA/hbeIbtsGYl6Qgoxi/Cl9XS
         7hMY4cLC/zEnCIzUJxRMRYWlz3mIzETDIb5dbFs4h8jX0x8w0lQ+jI+2voclHqR7wAAy
         G5Xt4MfWQqRvGEnV78wX1znSRFXl4x+CxsGqq+kv9BTI0UQVphGEFTYfydVB0EQfROaf
         UYc/cXx2GMnq/oBI//eTUlUP6Rvqysuwn7EOlCmIXYshtBrCQwyWWETrRCPautpjxFlO
         1b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006859; x=1769611659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMkS4BFW7iikoL2BjP1nG2XKvn880JyWpxnGNG3+/cM=;
        b=a6B/Xtj1V6UmcimiDqAtRF7coAfrJZP1UcwtwUhBhz/YIb9yr985pksek42xsNs6aB
         rwUN5qkUEP8tqhX/425pHcRtOQVwXszdW/sQRP9/TfpHn8R5jkKfOA9OLvud43quC37h
         aKIfurVmSQksBIg2XuUvWhFdcEi3iPC7J2Nk814u3GEmJDofv778ikoBI0RrwjDF0MQd
         XxOW8lkYJdK1H6pAMmUcs7e7GlcbALcgobY9PqhG/qdaxqmGS+2EpP5gyQW3LR5LAcei
         sIep+l1Ig5Zd+XrJ9vHx4whuFzC025R2cHdV3p95OJBC662Cd8W+x3sQQR3bWRE6BjN1
         z3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVOJfFjnjccKpeYewWK+aByZ+x1hLgPpXRNddw8tAQUItsFYTb2zDBT9P1IWFoFwPH+xPJu9P03bdZn/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMj4cXaGKKOvXZSsfW6Pep52FrIzL65m8vA7OVLXQ4+6z6KO8
	eabrL9XjGNCRDNmFBrUIkbLqweQJyLC1dJIdpFU+9Kgh2T40EuFArIBNRbQAVOKUTw==
X-Gm-Gg: AZuq6aKp6gl4Ju+XYTCdznA0AJnaCoJ5AAEs1lt0AX542XFOpPxGB3s5gtHXNHNkLxi
	AwQxu8ymrYRPm2wOhZGcUXYcKDRak6n+W/8xePzJCpYSotj0GsFwQgxyy7yAYswd9ydIAS8UJbT
	jRE86dcka7RKbUI1S1IBGYMYqhG+93ece+kMZRd0buZZBhwwFyeGOmy2ZZY+75SorbzrVfFrvgG
	gX0btXYC41QUrcc3flw5wgq75hAEQatRB8WLdrYoxyoNNMzIjTfrd5k6dM7HL3RPup/eroJ+sAF
	1dUnJvDTzf1kKw/YkuijIYcvUpyTFcUGsCe6oNCMN8yhUl76yPmgdATOYLmLLAQTizKO1LbarF0
	x3DaiOelI/kZmMZRwziNchS6Jx2zzCGeUq86LumtJ6/UFa0XB/X7u1d/8BJsQZ+QhYp0MlMKQ64
	G9foo+kfXgtBqMZmYv7sjOUxyba8YNOp08aawd9WHkWnWOG/St
X-Received: by 2002:a17:902:dac8:b0:2a7:87c2:fcde with SMTP id d9443c01a7336-2a7a245b58cmr2655545ad.15.1769006858836;
        Wed, 21 Jan 2026 06:47:38 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b21fsm15434806b3a.13.2026.01.21.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:47:38 -0800 (PST)
Date: Wed, 21 Jan 2026 14:47:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v4 8/8] vfio: Validate dma-buf revocation semantics
Message-ID: <aXDnAVzTuCSZHxgF@google.com>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca>
 <aXDhJ89Yru577jeY@google.com>
 <20260121142528.GC13201@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142528.GC13201@unreal>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	FREEMAIL_CC(0.00)[ziepe.ca,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	TAGGED_FROM(0.00)[bounces-51280-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 044D659FD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:25:28PM +0200, Leon Romanovsky wrote:
> On Wed, Jan 21, 2026 at 02:22:31PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jan 21, 2026 at 09:47:12AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 21, 2026 at 02:59:16PM +0200, Leon Romanovsky wrote:
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > 
> > > > Use the new dma_buf_attach_revocable() helper to restrict attachments to
> > > > importers that support mapping invalidation.
> > > > 
> > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > ---
> > > >  drivers/vfio/pci/vfio_pci_dmabuf.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > index 5fceefc40e27..85056a5a3faf 100644
> > > > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > @@ -31,6 +31,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> > > >  	if (priv->revoked)
> > > >  		return -ENODEV;
> > > >  
> > > > +	if (!dma_buf_attach_revocable(attachment))
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > >  	return 0;
> > > >  }
> > > 
> > > We need to push an urgent -rc fix to implement a pin function here
> > > that always fails. That was missed and it means things like rdma can
> > > import vfio when the intention was to block that. It would be bad for
> > > that uAPI mistake to reach a released kernel.
> > > 
> > > It's tricky that NULL pin ops means "I support pin" :|
> > > 
> > 
> > I've been wondering about this for a while now, I've been sitting on the
> > following:
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e4..962bce959366 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1133,6 +1133,8 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
> > 
> >         if (dmabuf->ops->pin)
> >                 ret = dmabuf->ops->pin(attach);
> > +       else
> > +               ret = -EOPNOTSUPP;
> > 
> >         return ret;
> >  }
> > 
> > But didn't get a chance to dive in the history yet. I thought there's a
> > good reason we didn't have it? Would it break exisitng dmabuf users?
> 
> Probably every importer which called to dma_buf_pin() while connecting
> to existing exporters as many in tree implementation don't have ->pin()
> implemented.

Fair point. I agree with Jason that we cannot leave this open for VFIO
and we can have a pin op that always fails.

But at the same time, I'd like to discuss if we should think about
changing the dmabuf core, NULL op == success feels like relying on a bug
I agree that it means the exporter has no mm, but I believe there should
be some way for the importer to know that.. the importer can still
decide to use the exported dmabuf while being aware.

Thanks,
Praan

