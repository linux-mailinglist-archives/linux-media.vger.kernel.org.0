Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226AC49E35E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jan 2022 14:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbiA0N0V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jan 2022 08:26:21 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36914 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiA0N0V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jan 2022 08:26:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAD8461BB5;
        Thu, 27 Jan 2022 13:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE17CC340E4;
        Thu, 27 Jan 2022 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643289980;
        bh=07AsLnVk//JpBUNSbc03oRChtRXFN3tesPvzeOtsc/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AJ7v2xXoLXwPX+M9jhIMP2f0PezmrQzXM8urvMKhPIDsDW/t6Jorqf69sqppAqNJs
         ihcpPPL1Y7zwpkTDEDYIcXR+Vj/bcNTtA6uKa4gLOTcLTr5R6B6UM+C+eEoHJBL54A
         es7rJfiAuY0I68pTaIdvMGX+VakAIjz2SyvtEap4=
Date:   Thu, 27 Jan 2022 14:26:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mathias Krause <minipli@grsecurity.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] misc: fastrpc: avoid double fput() on failed usercopy
Message-ID: <YfKdeQ+rMRR8y97b@kroah.com>
References: <20220127130218.809261-1-minipli@grsecurity.net>
 <YfKdDUxj2wpglXQI@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfKdDUxj2wpglXQI@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 27, 2022 at 02:24:29PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 27, 2022 at 02:02:18PM +0100, Mathias Krause wrote:
> > If the copy back to userland fails for the FASTRPC_IOCTL_ALLOC_DMA_BUFF
> > ioctl(), we shouldn't assume that 'buf->dmabuf' is still valid. In fact,
> > dma_buf_fd() called fd_install() before, i.e. "consumed" one reference,
> > leaving us with none.
> > 
> > Calling dma_buf_put() will therefore put a reference we no longer own,
> > leading to a valid file descritor table entry for an already released
> > 'file' object which is a straight use-after-free.
> > 
> > Simply avoid calling dma_buf_put() and rely on the process exit code to
> > do the necessary cleanup, if needed, i.e. if the file descriptor is
> > still valid.
> > 
> > Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
> > Signed-off-by: Mathias Krause <minipli@grsecurity.net>
> > ---
> >  drivers/misc/fastrpc.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 4ccbf43e6bfa..aa1682b94a23 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -1288,7 +1288,14 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
> >  	}
> >  
> >  	if (copy_to_user(argp, &bp, sizeof(bp))) {
> > -		dma_buf_put(buf->dmabuf);
> > +		/*
> > +		 * The usercopy failed, but we can't do much about it, as
> > +		 * dma_buf_fd() already called fd_install() and made the
> > +		 * file descriptor accessible for the current process. It
> > +		 * might already be closed and dmabuf no longer valid when
> > +		 * we reach this point. Therefore "leak" the fd and rely on
> > +		 * the process exit path to do any required cleanup.
> > +		 */
> >  		return -EFAULT;
> >  	}
> >  
> 
> This feels wrong.  How do all other dma buf users handle this?
> 
> And you forgot to cc: the dmabuf developers, I think get_maintainers.pl
> should have caught them on this patch.

Odd, it didn't, not your fault, my apologies.

DMA BUFFER maintainers, what happened to the MAINTAINERS regex that
caused the above patch to not catch you all?

thanks,

greg k-h
