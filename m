Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FCC2E945F
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 12:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbhADLxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 06:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbhADLxa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 06:53:30 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104D4C061574;
        Mon,  4 Jan 2021 03:52:48 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id h16so27004305edt.7;
        Mon, 04 Jan 2021 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DfLO+6tfprck9fHLo23dyUoOOWOsjqNfG6uNyohQRMk=;
        b=HAbFoPe7kJgftSTM6Cp0zywsuxO1wwZDza5qZ8wGoKJdGT4X8Z6fpRxRKeezb1NO49
         /m7GQQc3e2ytK/oPtW+ntn8UC1CDwaKqEgAVMnYE5P51Hjz3QGPJuxqj9C46bHrj8HBF
         pDbz3MQJEsRX4j+uuTZrN/q7Gv54PjdVfMjlUAWE/1zeoEoLtCZbzsQqx41Nut0kqGUH
         UxlozevuP3aumaz+7h+blD1f+O4UBk84RXuaah+DMy7lNNDF2oQ+79CYBBhKPLiNAI/b
         A2MI9riV7Qq24/uELst4Z9Hp+ZIJ7FWQXm1ySYDgyjS4IgZAyi7D2P/CLwozaN3oAV/g
         d3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=DfLO+6tfprck9fHLo23dyUoOOWOsjqNfG6uNyohQRMk=;
        b=dQ0hTFrvMWs3bxvk+7XNkdAJZUodPeELtS+V6ofRQ1YX71wNGt90Prk5hVY4ewnlM9
         AZsz6G43QlmshGQUL5ud0hvCrmHBniSlaykjKbbjZ0XkTR7U5KMUKd6u6vxP5ZTxXuBs
         yAtoLQqxl0k71Hw7uw3wHeARtuHXh018a7xXH5coRW8A0R/2ERSPmTLeG99KxCvoWdJL
         mUHwAtigmNQhg6iENeEEj85OLRUBHwl8Z+Nz9c4uojQIdFnByohkFqaBbubBkYELek1z
         EeHgvhsHLbuCCsZhuupYvVPAq/03K1gqVhWFwws7iDo8Y6aetnbSoznEQpfRnRJYRNNx
         jcmg==
X-Gm-Message-State: AOAM5333AieWMQYQJga/0AnuJ/E3SoANAwAQopvhBQID+mwan9Jn99VA
        9NMWh123V02nkkI1h0rNk6dPTFh/b94=
X-Google-Smtp-Source: ABdhPJyCRra5INYJCm1uVFgnKV1GOhoChn4TLjK7zpSbjFHjFmpX5DhL8lNI7qBck/pTS8zBsZWutQ==
X-Received: by 2002:aa7:c886:: with SMTP id p6mr70719840eds.207.1609761166651;
        Mon, 04 Jan 2021 03:52:46 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id c25sm23342778ejx.39.2021.01.04.03.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 03:52:45 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH] dmabuf: fix use-after-free of dmabuf's
 file->f_inode
To:     Charan Teja Reddy <charante@codeaurora.org>,
        sumit.semwal@linaro.org, christian.koenig@amd.com, arnd@arndb.de,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <1609760177-6083-1-git-send-email-charante@codeaurora.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0dcbf9c5-3c28-0f57-0069-3fe5dc3aa7f6@gmail.com>
Date:   Mon, 4 Jan 2021 12:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609760177-6083-1-git-send-email-charante@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.01.21 um 12:36 schrieb Charan Teja Reddy:
> It is observed 'use-after-free' on the dmabuf's file->f_inode with the
> race between closing the dmabuf file and reading the dmabuf's debug
> info.
>
> Consider the below scenario where P1 is closing the dma_buf file
> and P2 is reading the dma_buf's debug info in the system:
>
> P1						P2
> 					dma_buf_debug_show()
> dma_buf_put()
>    __fput()
>      file->f_op->release()
>      dput()
>      ....
>        dentry_unlink_inode()
>          iput(dentry->d_inode)
>          (where the inode is freed)
> 					mutex_lock(&db_list.lock)
> 					read 'dma_buf->file->f_inode'
> 					(the same inode is freed by P1)
> 					mutex_unlock(&db_list.lock)
>        dentry->d_op->d_release()-->
>          dma_buf_release()
>            .....
>            mutex_lock(&db_list.lock)
>            removes the dmabuf from the list
>            mutex_unlock(&db_list.lock)
>
> In the above scenario, when dma_buf_put() is called on a dma_buf, it
> first frees the dma_buf's file->f_inode(=dentry->d_inode) and then
> removes this dma_buf from the system db_list. In between P2 traversing
> the db_list tries to access this dma_buf's file->f_inode that was freed
> by P1 which is a use-after-free case.
>
> Since, __fput() calls f_op->release first and then later calls the
> d_op->d_release, move the dma_buf's db_list removal from d_release() to
> f_op->release(). This ensures that dma_buf's file->f_inode is not
> accessed after it is released.
>
> Fixes: 4ab59c3c638c ("dma-buf: Move dma_buf_release() from fops to dentry_ops")
> Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>

Not an expert on the debugfs stuff in DMA-buf, but the explanation 
sounds perfectly correct to me.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 0eb80c1..a14dcbb 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -76,10 +76,6 @@ static void dma_buf_release(struct dentry *dentry)
>   
>   	dmabuf->ops->release(dmabuf);
>   
> -	mutex_lock(&db_list.lock);
> -	list_del(&dmabuf->list_node);
> -	mutex_unlock(&db_list.lock);
> -
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> @@ -88,6 +84,22 @@ static void dma_buf_release(struct dentry *dentry)
>   	kfree(dmabuf);
>   }
>   
> +static int dma_buf_file_release(struct inode *inode, struct file *file)
> +{
> +	struct dma_buf *dmabuf;
> +
> +	if (!is_dma_buf_file(file))
> +		return -EINVAL;
> +
> +	dmabuf = file->private_data;
> +
> +	mutex_lock(&db_list.lock);
> +	list_del(&dmabuf->list_node);
> +	mutex_unlock(&db_list.lock);
> +
> +	return 0;
> +}
> +
>   static const struct dentry_operations dma_buf_dentry_ops = {
>   	.d_dname = dmabuffs_dname,
>   	.d_release = dma_buf_release,
> @@ -413,6 +425,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
>   }
>   
>   static const struct file_operations dma_buf_fops = {
> +	.release	= dma_buf_file_release,
>   	.mmap		= dma_buf_mmap_internal,
>   	.llseek		= dma_buf_llseek,
>   	.poll		= dma_buf_poll,

