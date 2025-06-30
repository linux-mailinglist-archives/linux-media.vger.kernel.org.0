Return-Path: <linux-media+bounces-36302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FDAEE068
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792093A3390
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F37925B30D;
	Mon, 30 Jun 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rhfBPB9v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BC241684
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292997; cv=none; b=tYInIXIFwgjNdH1N/m+Zhfm4om79VSF2Wn9lvj/oUz5eaZ93qhF4RXCkl/OVNk4uR2zMJ3m7Q96/xeDUU6KpxMb5zFszbZ/T1AS4bX2dTrtDaHK09yQGqnWwkTzhVFcQCYo9pjiia4xl8Taz0086NTwwH26/V1ygmINtxCv5Q5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292997; c=relaxed/simple;
	bh=uU4NWYJg1V5Vn9H6OG3dYNvVtaH+6cljDRAzH8j8WGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQfz3WBbgompcK4bhx0FsvOjf0P/m/I1/aK7tk+y2KmgMMGXdxapbuUIyPioSe89AhY81U44qVxPSzqkU4Nt/bXRhnj5uENwKx80rHTB1pOvQhpeGpE8mfdQdL1LN+K1jxZHtSUSdkRxIY57ica/t0UmtzKIDIU6sAzI1rdePfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rhfBPB9v; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-700c7e4c048so28537986d6.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751292993; x=1751897793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=rhfBPB9vhQ0qfVtYh3kbeQQ2Nc3S6zC1q6fJbCmRneEz997tmu/S0tIauTuKEvaZG4
         Niab4xQ7P1YjMa+mvtFDlJmFOzv7t6n4bG2bKhLPB9A39RStkLYCGGckv19pCHQrFm8r
         LD42esuaxUAE7pavYND12NTwXHdGvxdnrqsPu7cs6HTby/gz/ABddT6BWGhl0ArWQMX2
         lkV+sSvMJTDFqnmNBVHy6FwcK3ynRx+SIS6GN/EI/k8dtcH/GBQR+3bRrledT8Te4Ens
         jAqIxyXG7E65e5o62o5EqKfl3eTCTefOalWOHar5V7km6qUeIsnGFrPJDZZYGoi68G1J
         wetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292993; x=1751897793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=fCvlGWuifp3+2/J76Byei6tlgngVCHoy+veCzoD2TgmLPjXSnBgQwCZRNYhc62EKkt
         tQiGOKTBn7rqAnpusqRqSQ6hqaQUwgXGLVdrYua9DmxpMtOBB6ZXkbgNpG/Bx/krRyZB
         89coDDG4t35YuuZelN0B1hGSQEOar8OkBX1Ky5VVpwibWh2khQWt/cxnjBrwOxXZgSwq
         xsOWAHfyO2dGVP8F0cnmgcn4/iH3PV8KsSPF0fvffxW7U0NWfO1897kDbM9b20uDxg+L
         PP6spXbiVq+/dJeei8CGaWhXJmw+b+do9mCZ2AsiOEhRSS/wNxG221aVr1YL8gSXmiia
         E2/w==
X-Forwarded-Encrypted: i=1; AJvYcCU/y1QqKQNXL1sp9mfcPACpHJYXJaUkwabnS2ONRUbnn+0opXX6C4+rXVIwqGFGUzTTH+NdpuL5z4IlTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGfwa9zeXCI7UMzRUOglW4SByF8yH3zaE5KO/d30/rkkdy1nG
	DdLxPE1lJRa4DVaEQ++gnjx+WdA+ke7GHsGqK+dcDWVtTMHm271+3n6SFXuUyEBaWQ==
X-Gm-Gg: ASbGncu+pIGDcG4eT2hiLoUGDa/TG6Wp4MKBmoyPYWtvpp7j9uJnVGIJoBuRQOuzV1Z
	dEqNtSWZFyBxOz4inWR9hmRZEXiM3Qnw4YD1d3pdi/WeR2VTANv70v8K+Gn5oj+ia0AqpYsl1q+
	qL/w9G4m93mjbzi8GFSoeUM6nvyMpARin8RU/wey/YtFVxMLj3afj9lfLy2Vb/DXI1twTbjzrNY
	zwoAcJxRIdqF+qI1ezffuwDSHZH6sJXmmtEenbTa2nKp/fI8tYDxRxMeTf/lqmoiPfvFS38SgNq
	G5Oau6OCSRdeayXdm61AmU+oO9UNqC+wBYbVdr4Kdu1Z9rjkH36qBMxe+lN/qsyTSurqZq3Z1wI
	ZCnpp
X-Google-Smtp-Source: AGHT+IGaIIkTev/B5UEJVGSeX7xX1oX3gVRWMPdbwKe6ttPOQvsQWLp4rii4GvhcrE/sVorKmumxgw==
X-Received: by 2002:a05:6214:4b10:b0:701:894:2b91 with SMTP id 6a1803df08f44-70108942c74mr23152286d6.14.1751292993290;
        Mon, 30 Jun 2025 07:16:33 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772fc8f3sm67860476d6.84.2025.06.30.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:16:32 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:16:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>, Christoph Hellwig <hch@lst.de>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>

On Mon, Jun 30, 2025 at 04:18:51PM +0800, Xu Yang wrote:
> > Also, the material that this routine replaces in the uvc and stk1160 
> > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > here?  Was this omission a bug in those drivers?
> 
> According to dma-api.rst:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664
> 
> "Once a non-contiguous allocation is mapped using this function, the
> flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
> be used to manage the coherency between the kernel mapping, the device
> and user space mappings (if any)."
> 
> Possibly the uvc and stk1160 missed calling it, but since they won't be
> the only user of the USB core, so we'd better call these APIs.

Documentation/core-api/cachetbl.rst says:

  ``void flush_kernel_vmap_range(void *vaddr, int size)``

       flushes the kernel cache for a given virtual address range in
       the vmap area.  This is to make sure that any data the kernel
       modified in the vmap range is made visible to the physical
       page.  The design is to make this area safe to perform I/O on.
       Note that this API does *not* also flush the offset map alias
       of the area.

  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``

       the cache for a given virtual address range in the vmap area
       which prevents the processor from making the cache stale by
       speculatively reading data while the I/O was occurring to the
       physical pages.  This is only necessary for data reads into the
       vmap area.

So invalidate_kernel_vmap_range() is not needed for data writes, that 
is, for OUT transfers.  And ironically, flush_kernel_vmap_range() _is_ 
needed (but only for OUT transfers).

On the other hand, Christoph may think these call should be included 
regardless.  Let's see what he recommends.  Christoph?

(Actually, I would expect dma_sync_sgtable_for_cpu() and 
dma_sync_sgtable_for_device() to handle all of this for us 
automatically, but never mind...)

Alan Stern

