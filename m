Return-Path: <linux-media+bounces-30836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9EA994D7
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D2DB1BC5B6D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4287281374;
	Wed, 23 Apr 2025 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cDbjLwGo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6E11F2C45
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423861; cv=none; b=hdYNyWPBhjUQcibdhaMHInprYGTisKudMkOypAiPvGrDin44E6TfABhHUQqdW1w6EZiwLGAsRRiUNZZ+drlU/Ndvry50+pF6t3eMiMP2Tngr/eatPq4fpPcdQ9GNiuOlg8fVxQ2n/S02KGKyTDGKOGKAyhWVrr3lPLCkJFDG2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423861; c=relaxed/simple;
	bh=4i+Aa42MxjqCMrZwNRo+lSzwmT1xTOZvTjo84XR38Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvMAPJwCRzLkXcP6rHgz7tI06LdKk0dyyTlz8Qxiva1ijgFneWI6Syat9xfpg9ZF8tckypx5aFZOw4noOpTjb7jr36qr1tGxLKbQZ/U2jWOwFvigyy/FDwDkTYOjItcegZjCikMnVodurIIJGPpjDW7D8bXXwr5M1PxmJOHLScw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cDbjLwGo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745423858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sh+sYc0+MNHSUal421oTmCDMNe+GTwBu1Zv/uziK5zE=;
	b=cDbjLwGo5joWRNKQhGM20ASzex57ptwvPCVYqhR/q3g777s9S7wmEI0rPX+71F60oGvb8y
	Wih2hLE6duD+W46fb++rxqe5YbPCd8beDiAyiCTh6/RfYLvWOL4jmEghQTLGwahDHPlWtr
	Ltu7frdpycokk/4gYhzniJDO2eTo6q0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-nMWskRtTPUiZ3yQoPFis9A-1; Wed, 23 Apr 2025 11:57:37 -0400
X-MC-Unique: nMWskRtTPUiZ3yQoPFis9A-1
X-Mimecast-MFC-AGG-ID: nMWskRtTPUiZ3yQoPFis9A_1745423856
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso13144185a.2
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 08:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423856; x=1746028656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh+sYc0+MNHSUal421oTmCDMNe+GTwBu1Zv/uziK5zE=;
        b=EOJCOM97m4U7Cs+1G2rrTXn1ro/qtEZUde/Y9Gct52d2WHPku+VW2ipc85VW6rkiNM
         nbhUQqs4TNqe/KayUeahGy22iMA6sveOKfJhbERtRm6A7pHSMz8UecIekZqycVtyriUk
         ZUKk8b6Q3nW/fVryUATvCrR79K0KYjod3ypoq09AuZggtUzHG9wqaKjFTiGpJUlIARp/
         PhLMs8nyEr+tBfGSsjO8isTv5CkrRlAeZXaE3LuhVCbmNMyMrNJUYI8WkBLJfHTmE/WX
         mlP/8oYnCnpEpF1AwC2sjwOVBLXyCURG+r78niCacMvfgfcK+vj23blDxX0c1o3nMbkC
         RrXw==
X-Forwarded-Encrypted: i=1; AJvYcCXzq0PpDGYW80UycOdhKmuYkpkwcnDb8Mc/DOD6BMg/ZfA6r9NPaDNG/z/vElrPW8DOcHn6bzQEc+q7Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmc6o1GkXlhx3pP4oOJjc2xQXHkBnKyHI3o04CBRA2i7GthzkF
	97we3EnH/jdbzpCUgW1l/J/OOQ4coop15wTD7bimRMsu+TWOqniZgnNHHoxK+6RoY1saGGKixjC
	O7CUmkH7AVxvbFFChEpXgRZWwWSj4WlD/eVu5loEifypjnW1Vja6A+go0yOvY
X-Gm-Gg: ASbGncsLTNiRqKbAGYpnFeyjPYflxV5KzHBWWwRfbVtWxkBBLyrdSNglD3w5zNh5Ehs
	Wefir0AqFFvFUfC9SFH1DnnbGUJJyQJMdW4XdkWmXm0mipehOsKIttqJbdeG0x+twT73/gojizA
	cJZRTxyeQg+2G6wAV6KCsZbbSGbwc5T09bbV0znPv5dtZpoMx3cRr51o24gk8YpHm9WoQ2NaEem
	rtL7c9P64DBfieHOe3OvrDtz7SoMM2GKjb5zHXHULw0gEVBHxjUkk73SBIaeIW4IROxdubQ3PDc
	fUqbUFKRPZhugip4+h8jUywi2abXJIpSP7wDsG3mnt4=
X-Received: by 2002:a05:620a:414e:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7c955e14742mr15096685a.58.1745423855997;
        Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIWB7Ovf66R3odop/eHj81SRynR7IlhrgKznJ816AeoHzYOpFR49dK5BzR9wKwh5ZqiuAyNQ==
X-Received: by 2002:a05:620a:414e:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7c955e14742mr15093785a.58.1745423855655;
        Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6eb60sm698231385a.24.2025.04.23.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:57:32 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	mripard@kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
Message-ID: <aAkN7BXIT7RR85PR@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>

Hi Sumit,

On Wed, Apr 23, 2025 at 08:53:20PM +0530, Sumit Semwal wrote:
> Hello Jared,
> 
> On Wed, 23 Apr 2025 at 00:49, Jared Kangas <jkangas@redhat.com> wrote:
> >
> > Hi all,
> >
> > This patch series is based on a previous discussion around CMA heap
> > naming. [1] The heap's name depends on the device name, which is
> > generally "reserved", "linux,cma", or "default-pool", but could be any
> > arbitrary name given to the default CMA area in the devicetree. For a
> > consistent userspace interface, the series introduces a constant name
> > for the CMA heap, and for backwards compatibility, an additional Kconfig
> > that controls the creation of a legacy-named heap with the same CMA
> > backing.
> >
> > The ideas to handle backwards compatibility in [1] are to either use a
> > symlink or add a heap node with a duplicate minor. However, I assume
> > that we don't want to create symlinks in /dev from module initcalls, and
> > attempting to duplicate minors would cause device_create() to fail.
> > Because of these drawbacks, after brainstorming with Maxime Ripard, I
> > went with creating a new node in devtmpfs with its own minor. This
> > admittedly makes it a little unclear that the old and new nodes are
> > backed by the same heap when both are present. The only approach that I
> > think would provide total clarity on this in userspace is symlinking,
> > which seemed like a fairly involved solution for devtmpfs, but if I'm
> > wrong on this, please let me know.
> 
> Thanks indeed for this patch; just one minor nit: the link referred to
> as [1] here seems to be missing. Could you please add it? This would
> make it easier to follow the chain of discussion in posterity.

My bad, I must have dropped the link while revising the cover letter.
Here's the dropped reference:

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/

Thanks to you and John for looking this over,
Jared

> >
> > Changelog:
> >     v2: Use tabs instead of spaces for large vertical alignment.
> >
> > Jared Kangas (2):
> >   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
> >   dma-buf: heaps: Give default CMA heap a fixed name
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
> >  drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
> >  3 files changed, 40 insertions(+), 11 deletions(-)
> >
> > --
> > 2.49.0
> >
> 
> Best,
> Sumit
> 


