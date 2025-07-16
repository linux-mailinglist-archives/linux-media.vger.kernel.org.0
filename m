Return-Path: <linux-media+bounces-37876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC72B07772
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 15:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1271C280D7
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA361E5B88;
	Wed, 16 Jul 2025 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L61GihwD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7E1DB551
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674220; cv=none; b=WgHpfZbI1kBkV1esiRs+5fHXj9MfFzS4jVO+u2bkRIZAPxoBX1xaT4AHKMoaMa4t+RMsfF6o4DVpRg96zGb5plCXc93o3kdWtEE30zG4Tk1vrXEE1gVJ+wv+icqaZsTKfv/JBJeU2mh0uhdOXYKPbTwV8JGlx7FYXSMXA1szKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674220; c=relaxed/simple;
	bh=iPt/IuCgv7X6wzHFK3I4GCGSIo9yuavU0rKQEyFHi4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqnomWujjtdJwNJeJK0bX2Dd6WdMamXlHpEKRf+W0yiQ+F46u6X4uW4VY9DBqqdBXnrwl4n9BOXntN7pq+N8ebR7N3Y1/bwwcQ8OcJUkMbsK3w2svKH53LvKmOl9hEx/vEqysf76XXsMtquZyf6Ly6kBD+rTQoJLnTRHY4alnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L61GihwD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752674217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8fU90Rrx5Q2FZQjCI0B6EMx3qMx3LCWE+lzijdY4q10=;
	b=L61GihwDy/vdDkbxdH5X7JDQTKh273eATNLOMvg0jHLdLvF/by76EUwI819bfvtskglYVE
	jAmAb8+GMRXE209O2mm+ZYJ2jreY7MaKUoPEGOtCYYAN9t8cAjBqOLkETiZzgnQIEON4VX
	wWvxb8jhLe8UcZ1wwTH0YAE1nm/bsQc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-yyg1wSWPP2O2hX6aeMVnww-1; Wed, 16 Jul 2025 09:56:56 -0400
X-MC-Unique: yyg1wSWPP2O2hX6aeMVnww-1
X-Mimecast-MFC-AGG-ID: yyg1wSWPP2O2hX6aeMVnww_1752674215
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so2632636f8f.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 06:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752674215; x=1753279015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fU90Rrx5Q2FZQjCI0B6EMx3qMx3LCWE+lzijdY4q10=;
        b=k1lo4UeDiFL0k5PTXl6sha6lMtW7cCiXCZ+rPHyPnd7Vo0iIolJe9+i1WGb24Kbvsf
         jTEHwVn8xH6Gmmoo/jw1UBxvMABFY2V5DiVsI/bmm/u53S+jslE0CmDiCDIZjWy3tnoj
         9lzP01ONq0KaC4+YmrToZLOVHkhg/YQlh5hPe9JLL4ME0w4uklt7tLB1ftOraCMalXSh
         n8DfqnWZS8Mi+/qrZqVQVnBiu7Z2t5l/1KVNNdh79fJp4i/HGOHm78G5/u36mXAoJH5T
         lf7jGxoGw7cj4JEZVg2JobYvwIQLIW4oqS/WI23vOTbTYC/kMsZXdqlnEFxsmoVtAVho
         HYoA==
X-Forwarded-Encrypted: i=1; AJvYcCWJayNkQR9Dkf9QYpsQ5UjijGB6TP5fbWZS4H07eIg6JDQfUDloVfKoYhlwqJ4w0P+Oo7dQ+BPMdCjung==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jJdSnJhv1MGF5yBkzoWiGlAUYxPrQ8tWMCRNkFoyCO6yfBiz
	0iZtisr7/sSvtw3wvlYf2w5Ej84LlTK7ftikSEZmU8BzPcsivyeOWWgy4yXKSUK5OPq/RwSKhla
	siLWHRvGjxU19n7isYXax3H9fBl3k3pJ82MlV2HlltVmnzDVbIkeR3SQTisnEWIar
X-Gm-Gg: ASbGncvD/xvBH43V4bjc0ThK0v+9Zkp1uGQBZnQ9xBHTX9HUlHUp5pArjwQ1l6pn068
	bsm/B2B8khWDvEHP1jkMX/4w+59me/W5yNdjP/v4v02UY4zZhMxoTZDaM/ctCHwjqd1CIexA3IX
	tIS8Sw5oWS4PuzDLaCm37FngO+zR6qrwtqnRgjwDt/zjKBIkiNg2heoEoMDSh0NrIfIFbUDdtB9
	VwM2EnAEx+jlK0qZbrihTAfyy8o3VXWelYYtYg3ZdWpIiF5PyZf68kKeaGVKARHeukwOYCM45xA
	pCDDVnw0sbsR6B6YPLIqnvFfjdzZnVFe
X-Received: by 2002:adf:f64b:0:b0:3b6:936:92fa with SMTP id ffacd0b85a97d-3b60dd8df46mr2367250f8f.52.1752674215069;
        Wed, 16 Jul 2025 06:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDkw4tjXyAdhQ6LVjUDIf1HaSWqF1ZS/CeOQWr/qZekbvwZ8qxdZocOeTQ+5WAYNkarEumJw==
X-Received: by 2002:adf:f64b:0:b0:3b6:936:92fa with SMTP id ffacd0b85a97d-3b60dd8df46mr2367218f8f.52.1752674214534;
        Wed, 16 Jul 2025 06:56:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd15bfsm18252140f8f.19.2025.07.16.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:56:54 -0700 (PDT)
Date: Wed, 16 Jul 2025 09:56:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jiang.peng9@zte.com.cn
Cc: jasowang@redhat.com, krzk@kernel.org, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, xu.xin16@zte.com.cn,
	yang.yang29@zte.com.cn
Subject: Re: [PATCH v2] virtio: Update kerneldoc in
 drivers/virtio/virtio_dma_buf.c
Message-ID: <20250716095046-mutt-send-email-mst@kernel.org>
References: <20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn>

On Sat, Jul 05, 2025 at 10:58:03AM +0800, jiang.peng9@zte.com.cn wrote:
> From: Peng Jiang <jiang.peng9@zte.com.cn>
> 
> Fix kernel-doc descriptions in virtio_dma_buf.c to fix W=1 warnings:
> 
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'
> 
> Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>


The extra documentation unfortunately just mechanically repeats what the
code does. Code comments should explain the reasoning behind the code,
instead.


> ---
>  drivers/virtio/virtio_dma_buf.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> index 3fe1d03b0645..0b39b1b209ee 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -9,13 +9,20 @@
>  #include <linux/virtio_dma_buf.h>
> 
>  /**
> - * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> + * virtio_dma_buf_export() - Creates a new dma-buf for a virtio exported object

virtio core uses the form without () consistently, everywhere.



>   * @exp_info: [in] see dma_buf_export(). ops MUST refer to a dma_buf_ops
>   *     struct embedded in a virtio_dma_buf_ops.
>   *
>   * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
>   * for an virtio exported object that can be queried by other virtio drivers
>   * for the object's UUID.
> + *
> + * Returns:
> + *   - Valid struct dma_buf pointer on success
> + *   - ERR_PTR(-EINVAL) if:
> + *     - exp_info->ops is NULL
> + *     - attach callback isn't virtio_dma_buf_attach()
> + *     - virtio_ops->get_uuid() is not implemented

Too verbose, no one will rememeber to update this when changing code.
Just 
	Returns the dma_buf or ERR_PTR

is enough.


>   */
>  struct dma_buf *virtio_dma_buf_export
>         (const struct dma_buf_export_info *exp_info)
> @@ -35,7 +42,16 @@ struct dma_buf *virtio_dma_buf_export
>  EXPORT_SYMBOL(virtio_dma_buf_export);
> 
>  /**
> - * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + * virtio_dma_buf_attach() - Mandatory attach callback for virtio dma-bufs
> + * @dma_buf: Pointer to the shared dma-buf structure
> + * @attach: Pointer to the newly created attachment metadata
> + *
> + * Implements the standard dma-buf attach operation for virtio devices.
> + * Retrieves virtio-specific operations through container_of macro,
> + * then invokes device-specific attach callback if present.
> + * This enables virtio devices to participate in dma-buf sharing.
> + *

Same thing pls do not repeat all of code.

> + * Return: 0 on success, error code on failure

we say "Returns zero or a negative error" elsewhere. seems clearer.

>   */
>  int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>                           struct dma_buf_attachment *attach)
> @@ -55,8 +71,12 @@ int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>  EXPORT_SYMBOL(virtio_dma_buf_attach);
> 
>  /**
> - * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
> - * @dma_buf: buffer to query
> + * is_virtio_dma_buf() - Check if a dma-buf was created by virtio DMA framework
> + * @dma_buf: [in] buffer to query
> + *
> + * Returns:
> + *   - true  if the dma-buf uses virtio_dma_buf_attach() as its attach callback
> + *   - false otherwise


one is return one is returns ... no consistency.

>   */
>  bool is_virtio_dma_buf(struct dma_buf *dma_buf)
>  {
> @@ -65,7 +85,7 @@ bool is_virtio_dma_buf(struct dma_buf *dma_buf)
>  EXPORT_SYMBOL(is_virtio_dma_buf);
> 
>  /**
> - * virtio_dma_buf_get_uuid - gets a virtio dma-buf's exported object's uuid
> + * virtio_dma_buf_get_uuid() - gets a virtio dma-buf's exported object's uuid
>   * @dma_buf: [in] buffer to query
>   * @uuid: [out] the uuid
>   *
> -- 
> 2.25.1


