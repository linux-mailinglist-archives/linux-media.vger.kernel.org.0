Return-Path: <linux-media+bounces-64473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XArXKDmEKWrGYQMAu9opvQ
	(envelope-from <linux-media+bounces-64473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:35:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479766AD95
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=UuSViu1U;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64473-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64473-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BD193057398
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9175E3B47E2;
	Wed, 10 Jun 2026 15:28:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097013DDDB8
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 15:28:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105289; cv=none; b=NjerWBwdm4HwiId+QKWjLMWnhz09mSOWlXfxXj8a46ExtmdcRxA1SpBHu0XESr5PJuYhqmkoP27dCpoqja5AJby0Bq09kwrjiMBPMHelE6iLF11z3E2CMSZoCgnhV5EXOa+A4jdJ3qAc85nB29n1Eusz69b6iy7GE8cNd5akAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105289; c=relaxed/simple;
	bh=UfgjSrJv5x93WLnwBClpKnVXrgqeDqs+cM42kwPrScc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2nTIqsYPqPWI6f3CiqdNXnMPo9AH6yC+LC3STZ+S5PT+aFnC73GBuyMima6JNF028wTqjahgHaQc+wnxghd3ZQRAdFy7j+6BR73f3mqCU2f31CvBqFQHA1YDJSjn92WLJkWt39N5rLtMvAcR1fjqRz3gnmJMaTuTxCpn4CYvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UuSViu1U; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf22c18ad3so104175ad.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781105286; x=1781710086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRGcDEeCGM58JoYwcY0kneIT0WSa4bKVwTj3Opbvtug=;
        b=UuSViu1UGKFFX74cajjbEFJ7xVtKBndYL0DocayMpjiMCsactJBZLNsehZDDcNwHxe
         9Y16F8huDvl8pFGidJdOj5VuQKJhzwbyDnFjQLX55kqZzZKPq4WnTUtttIrBeHKPmU7W
         ceq2lnQf6ix+EV5EdvezEfcykpr9JzMM6dcC8Cuw68texJofrOajMHd+g5a+0Uwu8+Ga
         pX5A5PAzKTNsbpc2aQ59MpTXwHPPqSpL6gozLRpd7UKJdiE/GSXAr0wEkfJ5pjA4Qsxd
         2PmDP9E3SI+/f6a45Hm64sgUtW6zXT7OBmu9iiWXEoZU8K/tum7ISPuugiozydhP8RAx
         1buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781105286; x=1781710086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRGcDEeCGM58JoYwcY0kneIT0WSa4bKVwTj3Opbvtug=;
        b=oeTnJFEatd+9N107wNAz7UbVoFvLCOc8k/YxKhZSpGyJHBj7ikUO/RRLSl8jE8kFW1
         /1e0EaEONJdy+y0lStzY1Ta8Ba+Au47Z5jFX3pmIAfH/VJOB5OrFeHHLFjM5JcAhVd9c
         YorI8BtguAmy0iTyt6tFUduzUCI5svWLyI8oFEE0lBiwgVqCIs/HcXBN708PDtN6HDIT
         ySn85yGcVSPncIlO1lC0kEFgAN8NKyS4DPLO+sxa9vWy97DT09t9jJzPsOjSmbPPKIVG
         6TS7WmRHrE5xOxbpgur8Fd27gkuJ8YLwU6mvBfXVniFBWtG23TyYva92mixBUY7TOUMr
         kCWg==
X-Forwarded-Encrypted: i=1; AFNElJ/dYGd6QKBllSAK5xmQpvya+yoaBbyw3ca7k5IsaVoZ2Iof2LZcY7Etd6TdzF0IhPMan9ZcZ4mxyRh1JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2fsP108g2mna5jo1bKM4zMZSB2XgDJTwlAfkTmcv2yz/iYfa
	IxZxmQW8ekoZPQsKlCEKx8uav38n10PidmrpgFuWyNowwW19fmicI53N+HoyJa9KhQ==
X-Gm-Gg: Acq92OHPPh4nTX9bBFu3vnyx7EHYdMhQ19hIBM9KJoZoDrCE4BAOBvrNOgCXF01GRZP
	poeMmcA1QUuwkJ4Ii2QF/AyPVvJ6oZqUcF7v5vadzbf765qPfo6Kx1/EJ156CW4Won1fyPm5rGe
	dx6tSUVR23ds045VNLFgXmBluryOrYl33D0QdRpWUvnCBNfjFsWsFqIF13OXDkZ8ZYtYv0wv6aU
	4ko4RKK8cLfXIZ01tHBLc4Y3KBzHSSbYXknykA3g6RCb1NmZhmr7Pe2Wyk5EyijBW4wxG7V6tXS
	mAwb5PzWHAs6S/mo4dExRBR0D7eziqO/7/jiknBmTTW2Kb4apshiMKF+wm2gqHJ4VNA3U2XOXVP
	zLjUN+Zfwz6DNribrbAIgmwrxcIKwDNCnZWH7LEx0ximQTPg+fx0xnIZhB1ZDH5dsqy+6hM5KNg
	mrVYqRmjvRvi2W2u3VTaWjlLVPgg9RL+FHlTO6EUJ+07HvaDoN11susOmDuRaWTGdZxbC51Cg=
X-Received: by 2002:a17:903:1ad0:b0:2b0:b925:da98 with SMTP id d9443c01a7336-2c2d941bcf3mr118265ad.19.1781105285671;
        Wed, 10 Jun 2026 08:28:05 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm237800395ad.32.2026.06.10.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:28:05 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:27:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@nvidia.com>,
	Matt Evans <mattev@meta.com>, Leon Romanovsky <leon@kernel.org>,
	Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Message-ID: <aimCfaCM-m4TS2g9@google.com>
References: <20260527102319.100128-1-mattev@meta.com>
 <20260527102319.100128-2-mattev@meta.com>
 <20260527150946.312b3042@nvidia.com>
 <20260529230553.GE3195266@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529230553.GE3195266@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64473-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:alex.williamson@nvidia.com,m:mattev@meta.com,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4479766AD95

On Fri, May 29, 2026 at 08:05:53PM -0300, Jason Gunthorpe wrote:
> On Wed, May 27, 2026 at 03:09:46PM -0600, Alex Williamson wrote:
> > This deserves a /* CONFIG_PCI_P2PDMA */ reference like the previous
> > long span, though potentially a better solution would be to split the
> > core code out to a separate file with shared header.  I asked opus to
> > see what this would look like and it generated the patch below
> > (unverified, compile tested only).  Bigger diff, harder to follow
> > blame, but the shape of the core is much more apparent.  You're welcome
> > to take or leave it.
> 
> I think it is a good idea, it will make it easier to add more stuff to
> these different aspects.
> 
> Really they are now two different things with one layered on top of
> the other.
> 

A little late to this party. I agree with this split per status quo.
Although, one observation from me, I've posted a concurrent RFC [1] that
implements ZONE_DEVICE P2P registration for VFIO. That work relies on
pci_p2pdma_add_resource(), which requires ZONE_DEVICE and the full
CONFIG_PCI_P2PDMA stack rather than just the CORE part.

I guess I can be careful to guard the ZONE_DEVICE P2P registration 
feature in VFIO with the full PCI_P2PDMA config. Apart from that, this
split provides a clean foundation for both series to coexist.

Thanks,
Praan

[1] https://lore.kernel.org/all/20260610151853.3608948-1-praan@google.com/

