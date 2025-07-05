Return-Path: <linux-media+bounces-36873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8DAF9DB1
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 04:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 794E05448F7
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 02:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7B226CE32;
	Sat,  5 Jul 2025 02:15:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B926E6FF;
	Sat,  5 Jul 2025 02:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751681705; cv=none; b=Gv8CTRk7nI41bRoKZIsp78L/f+Ib9exzi3BuWWF3z+GrjpOmz1ZQ3sgQDXIgtpYpJPQDgoC8YPEzjaXJx3G6esVJ587mCb2pPWPkhbkQ2Fd0nenANQrOpQXaXGFdQP8UsPpA1UUCT9DEbh26oDIYp2PzkTv+KEjtDiz1WQxu5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751681705; c=relaxed/simple;
	bh=MoeOv5EYR7ND7dvTc6nQZXoheLui3KxYD5UFmlAelPs=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=Yxr02knSaqwlh8xAgi9gT4dusFWycMI6YtOOo+H2OthP8XAG/X1ay/3eEWK//VQIV4p7/52gh+6/LNwGw86LZjGOBcMMQIEBaFfvymc9p4QaaAijRblenLGSwwpVOQSxCPnCC2wWIax7Kw5rZlbUPu4iuJra+4KVKSxjpmGtAwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bYvGS6g6rz4x5ql;
	Sat,  5 Jul 2025 10:14:56 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 5652Esw6038063;
	Sat, 5 Jul 2025 10:14:54 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid31;
	Sat, 5 Jul 2025 10:14:55 +0800 (CST)
Date: Sat, 5 Jul 2025 10:14:55 +0800 (CST)
X-Zmail-TransId: 2afc68688a9f1d0-59690
X-Mailer: Zmail v1.0
Message-ID: <20250705101455762ft5u2uZEb7wz0TROzD52R@zte.com.cn>
In-Reply-To: <879d1fa7-04a5-403c-8d23-76631a67f560@kernel.org>
References: 20250704152047205U11FdEih1MxrmcmAz0Xpp@zte.com.cn,879d1fa7-04a5-403c-8d23-76631a67f560@kernel.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <krzk@kernel.org>
Cc: <jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, <mst@redhat.com>,
        <eperezma@redhat.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <virtualization@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gdmlydGlvOiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZm9yIHZpcnRpb19kbWFfYnVmX2F0dGFjaA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 5652Esw6038063
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68688AA0.001/4bYvGS6g6rz4x5ql

> > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/> virtio_dma_buf.c
> > index 3fe1d03b0645..18d261ba5197 100644
> > --- a/drivers/virtio/virtio_dma_buf.c
> > +++ b/drivers/virtio/virtio_dma_buf.c
> > @@ -35,7 +35,16 @@ struct dma_buf *virtio_dma_buf_export
> >  EXPORT_SYMBOL(virtio_dma_buf_export);
> >
> >  /**
> > - * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> > + * virtio_dma_buf_attach - Mandatory attach callback for virtio dma-bufs
>
> Read kernel-doc.rst. Missing ()
>
> > + * @dma_buf: Pointer to the shared dma-buf structure
> > + * @attach: Pointer to the newly created attachment metadata
> > + *
> > + * Description: Implements the standard dma-buf attach operation for > virtio devices.
>
> That's not kerneldoc. Which part of kernel-doc document documents such
> syntax?

Thanks so much for your time and feedback! I’ve made two specific fixes based on your notes:  

Added () to the function name in the kerneldoc comment (e.g., virtio_dma_buf_attach() instead of virtio_dma_buf_attach).
Removed the redundant "Description:" label and simplified the explanation. 

Let me know if you need anything else in the meantime!  

Best regards,
Peng

