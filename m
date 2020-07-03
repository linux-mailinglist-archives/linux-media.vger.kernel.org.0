Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF03E21349A
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 09:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgGCHEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 03:04:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:50236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgGCHD7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 03:03:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57B4A206DF;
        Fri,  3 Jul 2020 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593759838;
        bh=OnqYeeLDkLVTTdrfYGx84bxSdL6vSKVYH4IYcErCpHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VOXctAaE2VR2kSEm2Y3wmxasnbWAWwm1kcY5sdtt+tfJr76ii7o3hWr7PHQF/erQE
         rD7+fZOLbqa4fIqVXviPRrY8BQ9gD5iWu2qXhAG5OYQGWrMQUAfXF2Kox8luHMbxTT
         C8IKmIOWz2ym35LjMWpuaBz41jUU6+Mk2vV/2XVg=
Date:   Fri, 3 Jul 2020 09:04:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     driverdevel <devel@driverdev.osuosl.org>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Todd Kjos <tkjos@android.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        Laura Abbott <labbott@redhat.com>,
        Anders Pedersen <anders.pedersen@arm.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        nd <nd@arm.com>, Martijn Coenen <maco@android.com>,
        Laura Abbott <laura@labbott.name>,
        Christian Brauner <christian@brauner.io>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200703070403.GB2221524@kroah.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
 <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
 <CALAqxLW-txNEqW=P_9VTxvOVu_fgpjzHHDbR5BhtpYwhg1SXgw@mail.gmail.com>
 <20200421080544.GA611314@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421080544.GA611314@kroah.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 21, 2020 at 10:05:44AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 20, 2020 at 01:03:39PM -0700, John Stultz wrote:
> > On Mon, Apr 20, 2020 at 1:22 AM Christian Brauner
> > <christian.brauner@ubuntu.com> wrote:
> > > On Thu, Apr 16, 2020 at 12:25:08PM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, Apr 14, 2020 at 09:41:31PM -0700, John Stultz wrote:
> > > > > But I do think we can mark it as deprecated and let folks know that
> > > > > around the end of the year it will be deleted.
> > > >
> > > > No one ever notices "depreciated" things, they only notice if the code
> > > > is no longer there :)
> > > >
> > > > So I'm all for just deleting it and seeing who even notices...
> > >
> > > Agreed.
> > 
> > I mean, I get there's not much love for ION in staging, and I too am
> > eager to see it go, but I also feel like in the discussions around
> > submitting the dmabuf heaps at talks, etc, that there was clear value
> > in removing ION after a short time so that folks could transition
> > being able to test both implementations against the same kernel so
> > performance regressions, etc could be worked out.
> > 
> > I am actively getting many requests for help for vendors who are
> > looking at dmabuf heaps and are starting the transition process, and
> > I'm trying my best to motivate them to directly work within the
> > community so their needed heap functionality can go upstream. But it's
> > going to be a process, and their first attempts aren't going to
> > magically land upstream.  I think being able to really compare their
> > implementations as they iterate and push things upstream will help in
> > order to be able to have upstream solutions that are also properly
> > functional for production usage.
> 
> But we are not accepting any new ion allocators or changes at the
> moment, so I don't see how the ion code in the kernel is helping/hurting
> anything here.
> 
> There has been a bunch of changes to the ion code recently, in the
> Android kernel trees, in order to get a lot of the different
> manufacturer "forks" of ion back together into one place.  But again,
> those patches are not going to be sent upstream for merging so how is
> ion affecting the dmabuf code at all here?
> 
> > The dmabuf heaps have been in an official kernel now for all of three
> > weeks. So yea, we can "delete [ION] and see who even notices", but I
> > worry that may seem a bit like contempt for the folks doing the work
> > on transitioning over, which doesn't help getting them to participate
> > within the community.
> 
> But they aren't participating in the community today as no one is
> touching the ion code.  So I fail to see how keeping a dead-end-version
> of ion in the kernel tree really affects anyone these days.

So, any thoughts here?  What's the timeline for ion being able to be
removed that you are comfortable with?

thanks,

greg k-h
