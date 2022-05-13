Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1584525FF1
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 12:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379279AbiEMKLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 06:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379278AbiEMKLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 06:11:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B91E275E2;
        Fri, 13 May 2022 03:11:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E2C1621C6;
        Fri, 13 May 2022 10:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BFCC34100;
        Fri, 13 May 2022 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652436691;
        bh=lu1qNSETH4oQiiGcY+W6ghL7tAUgm/HcpwE3q3hlxeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GvRKQGY8QdRuBsjoRwGKUGEJOPqhtJd04jJbt9BELDR2VhG3abOS6wOGoYcviFycA
         +Bw3M1/8yZr5Vr79zxyQGUgIT1fRX5+K5jrqenJWlp6i71HRBfMtpxUBVtXXLM4h8P
         BHdOh8veoLZbq/mF1YIkpD+G26T89/oYb4sDgPbo=
Date:   Fri, 13 May 2022 12:11:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Charan Teja Kalla <quic_charante@quicinc.com>
Cc:     christian.koenig@amd.com, sumit.semwal@linaro.org,
        hridya@google.com, daniel.vetter@ffwll.ch, tjmercier@google.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Message-ID: <Yn4u0AG8iC33S3jO@kroah.com>
References: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 13, 2022 at 03:08:09PM +0530, Charan Teja Kalla wrote:
> The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
> alloc_anon_inode()) to get an inode number and uses the same as a
> directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
> used to collect the dmabuf stats and it is created through
> dma_buf_stats_setup(). At current, failure to create this directory
> entry can make the dma_buf_export() to fail.
> 
> Now, as the get_next_ino() can definitely give a repetitive inode no
> causing the directory entry creation to fail with -EEXIST. This is a
> problem on the systems where dmabuf stats functionality is enabled on
> the production builds can make the dma_buf_export(), though the dmabuf
> memory is allocated successfully, to fail just because it couldn't
> create stats entry.
> 
> This issue we are able to see on the snapdragon system within 13 days
> where there already exists a directory with inode no "122602" so
> dma_buf_stats_setup() failed with -EEXIST as it is trying to create
> the same directory entry.
> 
> To make the dentry name as unique, use the dmabuf fs specific inode
> which is based on the simple atomic variable increment. There is tmpfs
> subsystem too which relies on its own inode generation rather than
> relying on the get_next_ino() for the same reason of avoiding the
> duplicate inodes[1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=e809d5f0b5c912fe981dce738f3283b2010665f0
> 
> Reported-by: kernel test robot <lkp@intel.com>

The trest robot did not say that the dmabuf stat name was being
duplicated, did it?

> Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> ---
> Changes in V3:
>   -- Used the atomic64 variable to have dmabuf files its own inodes.
>   -- Ensured no UAPI breakage as suggested by Christian.
> 
> Changes in V2:
>   -- Used the atomic64_t variable to generate a unique_id to be appended to inode
>      to have an unique directory with name <inode_number-unique_id> -- Suggested by christian
>   -- Updated the ABI documentation -- Identified by Greg.
>   -- Massaged the commit log.
>   -- https://lore.kernel.org/all/1652191562-18700-1-git-send-email-quic_charante@quicinc.com/
> 
> Changes in V1:
>   -- Used the inode->i_ctime->tv_secs as an id appended to inode to create the
>      unique directory with name <inode_number-time_in_secs>.
>   -- https://lore.kernel.org/all/1652178212-22383-1-git-send-email-quic_charante@quicinc.com/
> 
>  drivers/dma-buf/dma-buf.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a6fc96e..0ad5039 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -407,6 +407,7 @@ static inline int is_dma_buf_file(struct file *file)
>  
>  static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>  {
> +	static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
>  	struct file *file;
>  	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
>  
> @@ -416,6 +417,13 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>  	inode->i_size = dmabuf->size;
>  	inode_set_bytes(inode, dmabuf->size);
>  
> +	/*
> +	 * The ->i_ino acquired from get_next_ino() is not unique thus
> +	 * not suitable for using it as dentry name by dmabuf stats.
> +	 * Override ->i_ino with the unique and dmabuffs specific
> +	 * value.
> +	 */
> +	inode->i_ino = atomic64_add_return(1, &dmabuf_inode);
>  	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
>  				 flags, &dma_buf_fops);
>  	if (IS_ERR(file))
> -- 
> 2.7.4
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
