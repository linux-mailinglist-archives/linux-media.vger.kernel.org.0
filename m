Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E284B172A6A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 22:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgB0Vpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 16:45:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:60190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729162AbgB0Vpn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 16:45:43 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32D23246A2;
        Thu, 27 Feb 2020 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582839942;
        bh=8XJZBF9Gy8hHoZDUS0PtRMxPXrviaenqitevpAhxcrA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oh2cP+xNjLkr5DLqrVw8GSSgWIyZSUkYd06gSRiC7EPSttnb1vKm1R/K1dS9HZmLI
         RzDlZa8eC1Ocxwi3gvHx5wKKrn+dw2U5xRwBqxJh78fues/UxHkn4QcJ9GQL/kiXul
         DCvEqnj240qrEUFUdNWY40I51KthAn/iKmDtCdbg=
Date:   Thu, 27 Feb 2020 13:45:41 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Cong Wang <xiyou.wangcong@gmail.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        LKML <linux-kernel@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org,
        syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
        Chenbo Feng <fengc@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Message-Id: <20200227134541.82309165d59b3ce10848563a@linux-foundation.org>
In-Reply-To: <CAM_iQpU7kXXGuxeOVvAGLoBRvjrhpuw2D=ih=PagGXKK-g_muw@mail.gmail.com>
References: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
        <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
        <CAM_iQpU7kXXGuxeOVvAGLoBRvjrhpuw2D=ih=PagGXKK-g_muw@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 Feb 2020 13:38:03 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:

> On Tue, Feb 25, 2020 at 5:54 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 25 Feb 2020 12:44:46 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:
> >
> > > dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> > > it never gets freed.
> > >
> > > Free it in dma_buf_release().
> > >
> > > ...
> > >
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
> > >               dma_resv_fini(dmabuf->resv);
> > >
> > >       module_put(dmabuf->owner);
> > > +     kfree(dmabuf->name);
> > >       kfree(dmabuf);
> > >       return 0;
> > >  }
> >
> > ow.  Is that ioctl privileged?
> 
> It looks unprivileged to me, as I don't see capable() called along
> the path.
> 

OK, thanks.  I added cc:stable to my copy.
