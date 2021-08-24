Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14AF3F5958
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 09:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbhHXHsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 03:48:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:48654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234618AbhHXHst (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 03:48:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E0D061183;
        Tue, 24 Aug 2021 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629791285;
        bh=KgbcpAcVlKxkKPGLwIaqYxCZnA9LBhYWX45e1GRD3p8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oUMAgzI/pFM9ctDnnM6eYGOcKD/LYVTiF/AmevfMdxjhpISQ5uWEOMEkfZWdlgD/i
         HVXX50N4XuR5IpDAmWUpgpn/TQ0Lgj6sz/PjM3tXiD3cGi/16nRO4iUrBLWt+ciiHS
         +wjv3MKh7lAbAuwlnCWCJ7ggEuiw36ZcvYP77dg+drS7W6NPWVmJn8nEnOiXQl+nHg
         zzjrmUlDzFuFHwezgRJ45ubvaJtAuSeawQt17XBK79lNndbVlhsShyipacDn8uyaju
         I5ecsdcECw8OKpvjN9YTvoiwqqPkkJRLjP1XWB436M9zdDf24dt4qOklvMEhVq5YWv
         iRqJ5k/knR7oA==
Date:   Tue, 24 Aug 2021 09:47:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Soeren Moch <smoch@web.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Regression 5.14] media: dvb userspace api
Message-ID: <20210824094754.32ad5eab@coco.lan>
In-Reply-To: <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
        <20210819133128.45ef4353@coco.lan>
        <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
        <20210822194709.4b9d33d4@coco.lan>
        <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
        <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 23 Aug 2021 09:58:00 -0700
Linus Torvalds <torvalds@linux-foundation.org> escreveu:

> On Mon, Aug 23, 2021 at 7:59 AM Soeren Moch <smoch@web.de> wrote:
> >
> > Linus,
> >
> > Is what I described directly above the new linux maintenance policy?  Or
> > is linux media a private kingdom where the community should keep away?
> > Is this a place where the subsystem maintainer is on a mission to
> > destroy everything instead of maintaining and improving it? Please tell
> > me what I understood wrong here.  
> 
> So technically, the regression policy for the kernel is purely about
> the ABI - the _binary_ interface. That seems to not have broken - old
> programs continue to work.
> 
> We very much try to discourage user space applications from using the
> kernel header files directly - even projects like glibc etc are
> supposed to _copy_ them, not include the kernel headers.

Unfortunately, media APIs aren't part of projects like glibc. Almost all
open source media apps keep their own copies of the uAPI header files.

As far as I'm aware, the "full-feat" API is implemented only by some
modules of VDR. I don't know any other open source application using
such headers.

> Exactly because re-organization and changes to the kernel tree
> shouldn't be something that then causes random problems elsewhere that
> are so hard to test - and synchronize - from the kernel standpoint (or
> from the standpoint of the other end).
> 
> That clearly doesn't seem to be the case in this situation. Which is
> annoying as heck.
> 
> Mauro: there clearly _are_ users of those header files, and even
> apparently that one old driver out there. And those headers were in
> the 'uapi' directory, so while it is annoying how user space programs
> used them this way, I think it's also not entirely unreasonable.
> 
> I have reverted the header file move. But I would also heartily
> recommend that whatever user program includes those headers (VDR -
> anything else?) should take snapshots of these specific kernel
> headers.
> 
> I'm not convinced that it makes sense to move the av7110 driver back
> from staging - it may continue to work, but it _is_ old and there is
> no maintenance - and I would certainly suggest that any other
> out-of-tree driver that uses these old interfaces that nothing else
> implements shouldn't do so, considering that nothing else implements
> them.
> 
> So the only thing I did was move the header files back, and mark that
> move to be backported to 5.13 stable.

Ok.

Thanks,
Mauro
