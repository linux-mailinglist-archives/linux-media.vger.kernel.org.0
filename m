Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603B21C6C51
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 11:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgEFJAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 05:00:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:40582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbgEFJAE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 05:00:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCDA5206B8;
        Wed,  6 May 2020 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588755604;
        bh=wkCAig0biVYQrEo5tBbvfhG1E6y87apeatskJQTVqog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mQmMQDiZka3D9Q1N6qzzTCXfYAf3wfcemPa9IqGbBtf9GV/iFilGTX045Pna2M1kY
         ntwlaXgPCCXah5ilHODHM1+lfE6cvJIsMpQCqNWjAk7jTaNnfmd1xi2xu9GFCuxSCB
         IL3hx8OgIoE9iC/Gg5tPwBl9PpskaokP21NHTZsk=
Date:   Wed, 6 May 2020 11:00:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Charan Teja Kalla <charante@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, vinmenon@codeaurora.org,
        sumit.semwal@linaro.org, ghackmann@google.com, fengc@google.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix use-after-free in dmabuffs_dname
Message-ID: <20200506090002.GA2619587@kroah.com>
References: <1588060442-28638-1-git-send-email-charante@codeaurora.org>
 <20200505100806.GA4177627@kroah.com>
 <8424b2ac-3ea6-6e5b-b99c-951a569f493d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8424b2ac-3ea6-6e5b-b99c-951a569f493d@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 06, 2020 at 02:00:10PM +0530, Charan Teja Kalla wrote:
> Thank you Greg for the reply.
> 
> On 5/5/2020 3:38 PM, Greg KH wrote:
> > On Tue, Apr 28, 2020 at 01:24:02PM +0530, Charan Teja Reddy wrote:
> > > The following race occurs while accessing the dmabuf object exported as
> > > file:
> > > P1				P2
> > > dma_buf_release()          dmabuffs_dname()
> > > 			   [say lsof reading /proc/<P1 pid>/fd/<num>]
> > > 
> > > 			   read dmabuf stored in dentry->fsdata
> > > Free the dmabuf object
> > > 			   Start accessing the dmabuf structure
> > > 
> > > In the above description, the dmabuf object freed in P1 is being
> > > accessed from P2 which is resulting into the use-after-free. Below is
> > > the dump stack reported.
> > > 
> > > Call Trace:
> > >   kasan_report+0x12/0x20
> > >   __asan_report_load8_noabort+0x14/0x20
> > >   dmabuffs_dname+0x4f4/0x560
> > >   tomoyo_realpath_from_path+0x165/0x660
> > >   tomoyo_get_realpath
> > >   tomoyo_check_open_permission+0x2a3/0x3e0
> > >   tomoyo_file_open
> > >   tomoyo_file_open+0xa9/0xd0
> > >   security_file_open+0x71/0x300
> > >   do_dentry_open+0x37a/0x1380
> > >   vfs_open+0xa0/0xd0
> > >   path_openat+0x12ee/0x3490
> > >   do_filp_open+0x192/0x260
> > >   do_sys_openat2+0x5eb/0x7e0
> > >   do_sys_open+0xf2/0x180
> > > 
> > > Fixes: bb2bb90 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> > Nit, please read the documentation for how to do a Fixes: line properly,
> > you need more digits:
> > 	Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> 
> 
> Will update the patch
> 
> 
> > > Reported-by:syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
> > > Signed-off-by: Charan Teja Reddy<charante@codeaurora.org>
> > Also, any reason you didn't include the other mailing lists that
> > get_maintainer.pl said to?
> 
> 
> Really sorry for not sending to complete list. Added now.
> 
> 
> > And finally, no cc: stable in the s-o-b area for an issue that needs to
> > be backported to older kernels?
> 
> 
> Will update the patch.
> 
> 
> > 
> > > ---
> > >   drivers/dma-buf/dma-buf.c | 25 +++++++++++++++++++++++--
> > >   include/linux/dma-buf.h   |  1 +
> > >   2 files changed, 24 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 570c923..069d8f78 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -25,6 +25,7 @@
> > >   #include <linux/mm.h>
> > >   #include <linux/mount.h>
> > >   #include <linux/pseudo_fs.h>
> > > +#include <linux/dcache.h>
> > >   #include <uapi/linux/dma-buf.h>
> > >   #include <uapi/linux/magic.h>
> > > @@ -38,18 +39,34 @@ struct dma_buf_list {
> > >   static struct dma_buf_list db_list;
> > > +static void dmabuf_dent_put(struct dma_buf *dmabuf)
> > > +{
> > > +	if (atomic_dec_and_test(&dmabuf->dent_count)) {
> > > +		kfree(dmabuf->name);
> > > +		kfree(dmabuf);
> > > +	}
> > Why not just use a kref instead of an open-coded atomic value?
> 
> 
> Kref approach looks cleaner. will update the patch accordingly.
> 
> 
> > > +}
> > > +
> > >   static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
> > >   {
> > >   	struct dma_buf *dmabuf;
> > >   	char name[DMA_BUF_NAME_LEN];
> > >   	size_t ret = 0;
> > > +	spin_lock(&dentry->d_lock);
> > >   	dmabuf = dentry->d_fsdata;
> > > +	if (!dmabuf || !atomic_add_unless(&dmabuf->dent_count, 1, 0)) {
> > > +		spin_unlock(&dentry->d_lock);
> > > +		goto out;
> > How can dmabuf not be valid here?
> > 
> > And isn't there already a usecount for the buffer?
> 
> 
> dmabuf exported as file simply relies on that file's refcount, thus fput()
> releases the dmabuf.
> 
> We are storing the dmabuf in the dentry->d_fsdata but there is no binding
> between the dentry and the dmabuf. So, flow will be like
> 
> 1) P1 calls fput(dmabuf_fd)
> 
> 2) P2 trying to access the file information of P1.
>     Eg: lsof command trying to list out the dmabuf_fd information using
> /proc/<P1 pid>/fd/dmabuf_fd
> 
> 3) P1 calls the file->f_op->release(dmabuf_fd_file)(ends up in calling
> dma_buf_release()),   thus frees up the dmabuf buffer.
> 
> 4) P2 access the dmabuf stored in the dentry->d_fsdata which was freed in
> step 3.
> 
> So we need to have some refcount mechanism to avoid the use-after-free in
> step 4.

Ok, but watch out, now you have 2 different reference counts for the
same structure.  Keeping them coordinated is almost always an impossible
task so you need to only rely on one.  If you can't use the file api,
just drop all of the reference counting logic in there and only use the
kref one.

good luck!

greg k-h
