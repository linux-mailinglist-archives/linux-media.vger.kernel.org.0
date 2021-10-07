Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C9442522A
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 13:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241054AbhJGLmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 07:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhJGLmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Oct 2021 07:42:14 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6EDC061746
        for <linux-media@vger.kernel.org>; Thu,  7 Oct 2021 04:40:20 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id x9so5878387qtv.0
        for <linux-media@vger.kernel.org>; Thu, 07 Oct 2021 04:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t6zk3xfTxx+/7P9iF/K8HrCXbNIyzmGrI92g0qF/r8U=;
        b=Z5BfJR12ZF73sqboFqV6Iftg9Fca9z5gXZZEXjYRHqQq4qghp9RcfRyFFD74hFJVbF
         FNLutLPICI+kRSkp0Z/yFqmimbN9Ix8EcbdmC0wcW6HYgMzZJ9IIWTzsnMKZKBZoNhv9
         zaexlFTVGrzQz2Ql0HdZgeURLnwPVZTWxTAHSKEEeFsa+vKjn/xx0eRp4/wVP1DzlqFE
         ar+4ieCc7nQ6y3JoLjU0zomWckcMr9Zoag4Qfwzclr8meuO+iIDsNKzFr7jgwJ99Du0E
         soapNjOR5PLotwgmP+WLBkjuhluBIgE9jOgZiReEmqHG6viISNvPtCsj7/VSuA1TZOC6
         0mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t6zk3xfTxx+/7P9iF/K8HrCXbNIyzmGrI92g0qF/r8U=;
        b=Lvab8XDagH6hDDBrSMUxz5hm6JkGUxaiiDc21fVNdKNzPjtkUVDaW6x0Wc911obygo
         VfVacQCuu33/yMhaqmC/39seM0nDYpQt69Cn9r0RJcgKDPBoWjFySJT7yujTWpgsvfGQ
         24V0xtrqKfbi5redZxr7QEZO4Ahos7ecWsBg4wzCyUT7MnDgOi1g6koVRavQ4dRGS4BP
         o+NB03KilplSq3Y5nBj40gI096T2iZJt4+hMTQNNJzjJ0mNw+QtD4DIHPIS/0w95Cbp+
         F93Nz5DH7fQe3r/rgazrVmejXnzDYHZicE0A8HNSQgSUf5gA28ouWrSK12sl7nYZ/fr8
         BTmw==
X-Gm-Message-State: AOAM5326LD7FwNp92tWas3/tXSBmfA48BpZcruiFNJEnbIYfx9GiP/4p
        dAv4qrlqm7R52TjKb1P2ctvxZA==
X-Google-Smtp-Source: ABdhPJymysJt76mkPddOVzIeZPor2OGBI9wov7yUB7IjZKcEEdbzf/i3QALNpMKmZP+iJVKPXTtQ+g==
X-Received: by 2002:ac8:57d0:: with SMTP id w16mr4342934qta.96.1633606820017;
        Thu, 07 Oct 2021 04:40:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id v8sm17498391qta.21.2021.10.07.04.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 04:40:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mYRl4-00Br7G-Sw; Thu, 07 Oct 2021 08:40:18 -0300
Date:   Thu, 7 Oct 2021 08:40:18 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Gal Pressman <galpress@amazon.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Doug Ledford <dledford@redhat.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
        Oded Gabbay <ogabbay@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Yossi Leybovich <sleybo@amazon.com>,
        Alexander Matushevsky <matua@amazon.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Jianxin Xiong <jianxin.xiong@intel.com>,
        Firas Jahjah <firasj@amazon.com>
Subject: Re: [RFC PATCH 2/2] RDMA/efa: Add support for dmabuf memory regions
Message-ID: <20211007114018.GD2688930@ziepe.ca>
References: <20211007104301.76693-1-galpress@amazon.com>
 <20211007104301.76693-3-galpress@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007104301.76693-3-galpress@amazon.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 07, 2021 at 01:43:00PM +0300, Gal Pressman wrote:

> @@ -1491,26 +1493,29 @@ static int efa_create_pbl(struct efa_dev *dev,
>  	return 0;
>  }
>  
> -struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
> -			 u64 virt_addr, int access_flags,
> -			 struct ib_udata *udata)
> +static void efa_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
> +{
> +	WARN_ON_ONCE(1,
> +		     "Invalidate callback should not be called when memory is pinned\n");
> +}
> +
> +static struct dma_buf_attach_ops efa_dmabuf_attach_ops = {
> +	.allow_peer2peer = true,
> +	.move_notify = efa_dmabuf_invalidate_cb,
> +};

Shouldn't move_notify really just be left as NULL? I mean fixing
whatever is preventing that?

> +struct ib_mr *efa_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
> +				     u64 length, u64 virt_addr,
> +				     int fd, int access_flags,
> +				     struct ib_udata *udata)
> +{
> +	struct efa_dev *dev = to_edev(ibpd->device);
> +	struct ib_umem_dmabuf *umem_dmabuf;
> +	struct efa_mr *mr;
> +	int err;
> +
> +	mr = efa_alloc_mr(ibpd, access_flags, udata);
> +	if (IS_ERR(mr)) {
> +		err = PTR_ERR(mr);
> +		goto err_out;
> +	}
> +
> +	umem_dmabuf = ib_umem_dmabuf_get(ibpd->device, start, length, fd,
> +					 access_flags, &efa_dmabuf_attach_ops);
> +	if (IS_ERR(umem_dmabuf)) {
> +		ibdev_dbg(&dev->ibdev, "Failed to get dmabuf[%d]\n", err);
> +		err = PTR_ERR(umem_dmabuf);
> +		goto err_free;
> +	}
> +
> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> +	err = dma_buf_pin(umem_dmabuf->attach);
> +	if (err) {
> +		ibdev_dbg(&dev->ibdev, "Failed to pin dmabuf memory\n");
> +		goto err_release;
> +	}
> +
> +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> +	if (err) {
> +		ibdev_dbg(&dev->ibdev, "Failed to map dmabuf pages\n");
> +		goto err_unpin;
> +	}
> +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);

If it is really this simple the core code should have this logic,
'ib_umem_dmabuf_get_pinned()' or something

Jason
