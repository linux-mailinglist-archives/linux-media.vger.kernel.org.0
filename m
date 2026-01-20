Return-Path: <linux-media+bounces-51144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEy3GRDZb2n8RwAAu9opvQ
	(envelope-from <linux-media+bounces-51144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 20:35:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976A4A8B7
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 20:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BCC838A0077
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041C3365A0D;
	Tue, 20 Jan 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Qf3mD8Yx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A9366549
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932925; cv=none; b=lLvRDBmg5tUU7pxkr1PtsDKZPpJ/PAESWLt062hHp/H1/z9ZsItbT5xauJOT8uHtsE4ZN/z+jji/N5Fjk5P6Quvm1lBHY08NHIO+Ba2fLmFpXxv1lwqnabLRTRHIkw7OSclZih7tQGYk+UyWjjdFXTa+aXv6aoUsovrj5GTT7+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932925; c=relaxed/simple;
	bh=P7+NPENiCb9v28BZGi63qLThR+z5AOm6e7zj6+AnwGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI9bgUYxmPEoizQvGhQmIjHtd5CwLSiCpp2/uRK/jjviEZem7GhOitOqrLC47Xau0ikKjiGX2cmkFnVyBdjOG2J+qLqO8vYzkkARWlVCqhM108jlorxkR74joCojGz/E/450M1Mpr1ZjEb0sKR/swHJsyMinEUm19wt4PTEFntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Qf3mD8Yx; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5013d163e2fso57001781cf.0
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768932922; x=1769537722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u+h0EX6bJ4UpFAOqOLmeekiIIdrOYR0BoNDz6Hm/Icw=;
        b=Qf3mD8YxOwKMTiG29U6iQQXI2ObmVH9wgHx0GBbfjzqKpT2nf0x3iEzQ4f0yyjNftw
         /WgfkZIIP/ephlI6Yqq8i4lgMuXjflnlXT+IUnKLPE0hKyRC2CrEoDNzR6p8AvOuyIIW
         jTaPOMxobi9kA4h/PBRjkGMxuhpbU6DdLTHvbBLtyWweAi0xdMQjMWaXWmTF5E3Ac7BE
         AQr76Odj/l15XIF5xtglisnivdQn5hI2xtQogUmb56FviICrm5VDVNwcE4K4gMxbaqYp
         QTc1pawAnB6uPlNS15JMRCwB9z/lV0mJziI4XxfwxwOaQ8d+mVrz1c9EUnR3EkiylN+N
         u16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932922; x=1769537722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+h0EX6bJ4UpFAOqOLmeekiIIdrOYR0BoNDz6Hm/Icw=;
        b=RL0P7nnqRhQ3+7ekqP1mDR+S0bJihwWukaeWN4f5lqtwVeUHtDBP+IiFFWEF1gtEN1
         cE8gXCxhNi7/pc8283+XM4QQD+W085ar0yNqiQtSFv5LIA+fVEMnsXgGfzWZp0g+Tqj9
         D+VdiSm0bLgpUnu/Ppjj3oK8G5YDi0aHRshVbofJ9ysXXnG9JVe9g6GLzOy3ju8SQMji
         T/Pjy31q/jjeV44dIhBCOp8eYLnikD/3gqNA3TkRC3wfNCmayFEoV6eMbwm8kO9LF2J4
         zaJE4YwVTWOjAnQI7f6FfByCdVBlTaaFWPKLqPTJAEq8GAQCWsHWGYNDTp3l2KgNcbas
         3YkA==
X-Forwarded-Encrypted: i=1; AJvYcCVdBzjxLgpqalGVTlKftjJnOAi59DbOKyktvbWn7ZhBKgqSbbAT+RVxZ67ZnBxuxvtJZtMr3K+6w7TJrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfwKoiImhTcALaabMEgM+lb1wJzqhzXUItNpr58wqMw5YNoZc
	fsSmitVjXnVlUKgQ8xqaY6GVQ9tBVTCVJ/8vVJVoNlDomWw+vV9sugdzN9G7XT3w/oM=
X-Gm-Gg: AY/fxX5vpGrAS9Dv/9olijznsuQnyhtx8PhSY1028Kd4avpuHBlp3u/XkkRGzuUp29k
	QvHu4vqKram5yHai0OEmhpve5IgoUJdzt0ov/KBg738WAf4MHYfTJZ1HunMT4LEQBozcH+Le1rT
	8rGCP0tqVJZZACnTJufhpfsbbDD8kqJ6YJ/x7D5EL7KJAEhApLcFsOjZJKekwxVMBR0gLm+SGMW
	60wuL/5xYF8lsPLY4fPExGmhbH7wPKWZSdJMjtYoBdyJWjkixts/ALoQfePMNMsgKLbkE9zffKE
	YlMi7Ia/OEqUaMDiqiHMGLCo0vAc5ao4ZP4sSxJA3G6G2vVzTj9KVxeca5CaCi1+ix/6dGh+KuY
	dr41kAQfZgJVuiCVddTBEwgkjx0uR6Vc4osf43mbK+y/XJD/Os7vZBPQ0D8C0Iu4EAI9ot6312G
	M8681ujNurmF8cA2qu688JxgBCNHxwfJVCnYHsIxPHd5M7WhyyI2+/
X-Received: by 2002:a05:622a:1447:b0:501:3ccd:cb3e with SMTP id d75a77b69052e-502a1f7105fmr227831511cf.66.1768932921973;
        Tue, 20 Jan 2026 10:15:21 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d6e670sm99756901cf.1.2026.01.20.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:15:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viGG8-00000005aY4-3tNU;
	Tue, 20 Jan 2026 14:15:20 -0400
Date: Tue, 20 Jan 2026 14:15:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Edward Srouji <edwards@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <20260120181520.GS961572@ziepe.ca>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51144-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[ziepe.ca];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 0976A4A8B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 08, 2026 at 01:11:14PM +0200, Edward Srouji wrote:
>  void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
>  {
> +	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
> +
>  	if (!entry)
>  		return;
>  
> +	mutex_lock(&entry->dmabufs_lock);
>  	xa_lock(&entry->ucontext->mmap_xa);
>  	entry->driver_removed = true;
>  	xa_unlock(&entry->ucontext->mmap_xa);
> +	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
> +		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
> +		list_del(&uverbs_dmabuf->dmabufs_elm);
> +		uverbs_dmabuf->revoked = true;
> +		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
> +		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);

This will need the same wait that Christian pointed out for VFIO..


> diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
> index 18918f463361..3e0a8b9cd288 100644
> --- a/drivers/infiniband/core/rdma_core.c
> +++ b/drivers/infiniband/core/rdma_core.c
> @@ -465,7 +465,7 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
>  
>  	fd_type =
>  		container_of(obj->type_attrs, struct uverbs_obj_fd_type, type);
> -	if (WARN_ON(fd_type->fops->release != &uverbs_uobject_fd_release &&
> +	if (WARN_ON(fd_type->fops && fd_type->fops->release != &uverbs_uobject_fd_release &&
>  		    fd_type->fops->release != &uverbs_async_event_release)) {
>  		ret = ERR_PTR(-EINVAL);
>  		goto err_fd;
> @@ -477,14 +477,16 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
>  		goto err_fd;
>  	}
>  
> -	/* Note that uverbs_uobject_fd_release() is called during abort */
> -	filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
> -				  fd_type->flags);
> -	if (IS_ERR(filp)) {
> -		ret = ERR_CAST(filp);
> -		goto err_getfile;
> +	if (fd_type->fops) {
> +		/* Note that uverbs_uobject_fd_release() is called during abort */
> +		filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
> +					  fd_type->flags);
> +		if (IS_ERR(filp)) {
> +			ret = ERR_CAST(filp);
> +			goto err_getfile;
> +		}
> +		uobj->object = filp;
>  	}
> -	uobj->object = filp;
>  
>  	uobj->id = new_fd;
>  	return uobj;
> @@ -561,7 +563,9 @@ static void alloc_abort_fd_uobject(struct ib_uobject *uobj)
>  {
>  	struct file *filp = uobj->object;
>  
> -	fput(filp);
> +	if (filp)
> +		fput(filp);
> +
>  	put_unused_fd(uobj->id);

This stuff changing hw the uobjects work should probably be in its own
patch with its own explanation about creating a uobject that wrappers
an externally allocated file descriptor vs this automatic internal
allocation.

> index 797e2fcc8072..66287e8e7ad7 100644
> --- a/drivers/infiniband/core/uverbs.h
> +++ b/drivers/infiniband/core/uverbs.h
> @@ -133,6 +133,16 @@ struct ib_uverbs_completion_event_file {
>  	struct ib_uverbs_event_queue		ev_queue;
>  };
>  
> +struct ib_uverbs_dmabuf_file {
> +	struct ib_uobject uobj;
> +	struct dma_buf *dmabuf;
> +	struct list_head dmabufs_elm;
> +	struct rdma_user_mmap_entry *mmap_entry;
> +	struct dma_buf_phys_vec phys_vec;

Oh, are we going to have weird merge conflicts with this Leon?

> +static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
> +				struct dma_buf_attachment *attachment)
> +{
> +	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
> +
> +	if (!attachment->peer2peer)
> +		return -EOPNOTSUPP;
> +
> +	if (priv->revoked)
> +		return -ENODEV;

This should only be checked in map

This should also eventually call the new revoke testing function Leon
is adding

Jason

