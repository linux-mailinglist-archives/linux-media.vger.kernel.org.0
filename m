Return-Path: <linux-media+bounces-38298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1AB0FFD7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 07:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDD61CC7C74
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 05:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D581FF1AD;
	Thu, 24 Jul 2025 05:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="MHyNHo4O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DD1FCFFC
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 05:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753334082; cv=none; b=ZTgpDqBOJtDUXOOw4U6CYJY0qZKsNA7HIFdZc8FkHsPuwYB9aQnB8vu9gLWquVff95vVFRtpD+wtJPU844CtNrRqoLjbxhXCEe82fUzTaQBJmrkNwc5NvHxKfyE5tLeTQ1N7HNAO8Se2xWBtt6x9YSsGb2GhxMM3gIhy902gYEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753334082; c=relaxed/simple;
	bh=Vo2SdnJZK3om5RaPVgTp8e/yJvD9F7K+eZvYm4uzem4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APvYe6UFVN5aduDVHVb8PCsuTD4ONQecGY0vYonZHWEGfuURr3GMsbzQf/3ns/QXFLordx0AboZWalipYxvDgF9aBoKqEBR8zUw5UNQqFcL20coWUgA+dmpEO2lfr2sKyky40WBmWzyA4uGVGqLOmtlvyJ6bE/vYs0xNEGtcVt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=MHyNHo4O; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3508961d43so579836a12.3
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 22:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753334080; x=1753938880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7SimV5VJWEB25HagffS670JWUdLLyQFzQyMxpTCmMo=;
        b=MHyNHo4O85x5x9k9Dn69n2UtgdEPylU/uyqIrmKV51KhNKEiLgmQJAOYeSEUn13tG/
         SVZdOViKKtEd0ujxGEDNxlX0k7832Yw19MNK5L9mMpBd7rCw4VEijr4Y12xVoilkLJ3+
         I4EoIcmgaZKVA+nRfvKPOWIe2wBOJYpM4KZN6pswHoS4PBorMkGs3qioHdysTnn3neQ8
         mY+g9dr1jeCWiJ7lBoDooVVOFYPsJ4TU+8wsCr0j65pxAwA9+HCO0q7j74FH2B/DIVSL
         UAIG0rB8YnQfhqeHXA3C/v8/9nHMWwP7vtwMc5Y1cheoXVHNNuzJ+WWVEjmtc8SW1sJt
         nLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753334080; x=1753938880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7SimV5VJWEB25HagffS670JWUdLLyQFzQyMxpTCmMo=;
        b=FEyfFvaHXmUhfa07oMP3dU3Lsr4Yncei8MnNpHSU7OV316Kgcsk40cleq7E2m6zfBL
         L2XDoF+gxXOkXe5A2azJHLWpsCDgG8/nfBAcETx0kU4PHy2GuxlHnK+5t8utQ0HyXX7E
         iziFDD9zxYuXKH4DCxuvwveKxcHejyqrOuZ7naCv5nSLNuAe34M32NnP9EsQ1hNgINPv
         Gy2AC09yKhtJdO9ZkeqxtdxULHWkSEaKkprWBtf8UcY/Pj6YOYZ3dgoM7AH+HT5ad9M7
         axgTET8lGIZxccMr8CcC9EKbOTsKhdRji5vNquprB8uKfm/YkagLX593bvSfTjBHS8Kh
         t3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe56qLiWK43WoKImqx106FKosIQlML47bEPqF30ukMikiaNoGq4zVwJkUEnWBqLpIQ7r72pdWDya02Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznCYEYl0ag6VV7DDGfbvbT8qZqGC/Y4fWEwAt6FQfBmFF3Sh0l
	H4OobB9IQ8Lh2Z5+enEx5zg4Lr9ysbp2Y8TT6Tb7WTK6TrPTDMPf3b3ptYlOxLYTyguM
X-Gm-Gg: ASbGncu1QuMJuzD2wpjTpvmL8QOpX2fuD5wrmtHCjfdQNUTT9X46a/lg12Cz0ri3w8/
	SetmSln88APl83n+MJbT++NIvHil3AdoenHDntirxoeROluLb4Zq+nTvWEA3D+x9r3wjWjq5MCs
	+lXH1cfXWI9XvkIu/kbgdTMQRhKQi1CuD/3O+F6/8Srag7bBPeIP538hFApfUYHfvBu4p2hf5HU
	lFnTi8EYwEn2uu5h55tA+Nv5twEg5/7GIKlUTahbZrtmRqNIDhDqCuBSoq9Bwe22TY/5sbEmqf4
	T2bv4yxqvIaPnSzT6Ld53t/UfndtH0ZeIw0r/5VTdcLLYN98RcnkDyJGO7VSm9FGaXtoffHPKjQ
	QvwwZ5AHucK7REzqKRPeb928D
X-Google-Smtp-Source: AGHT+IENRsGq90aUM4ne2WTxB7vhhSJSRaiabdV70/A4kdHOS5MgcbNOqLONTS5Ybge8UgWLOEr1jQ==
X-Received: by 2002:a17:903:17c8:b0:234:c22:c612 with SMTP id d9443c01a7336-23f9821dfbemr89796085ad.43.1753334079646;
        Wed, 23 Jul 2025 22:14:39 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e662b3304sm378571a91.17.2025.07.23.22.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 22:14:39 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:14:35 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aIHBO_2-hKWgb8Dq@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com>
 <aIEiJL83pOYO8lUJ@sultan-box>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEiJL83pOYO8lUJ@sultan-box>

On Wed, Jul 23, 2025 at 10:55:48AM -0700, Sultan Alsawaf wrote:
> On Wed, Jun 18, 2025 at 05:19:57PM +0800, Bin Du wrote:
> > +
> > +	buf->bo = (void *)bo;
> > +	buf->gpu_addr = gpu_addr;
> > +
> > +	refcount_set(&buf->refcount, 1);
> 
> This discards the refcount inc triggered from amdgpu_bo_create_isp_user() when
> it calls get_dma_buf(), leading to a use-after-free. Move this refcount_set()
> up, preferably right after vmalloc_user() or right after `buf` is allocated so
> there's no risk of this issue occurring again in the future.

Following up to correct myself: please disregard this one comment from my
previous email since it's incorrect. Sorry for any confusion.

Sultan

