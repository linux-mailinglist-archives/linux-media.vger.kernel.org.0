Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FB41C73A2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgEFPKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:10:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727984AbgEFPKf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 11:10:35 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B5632076D;
        Wed,  6 May 2020 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588777835;
        bh=nVMidDTpYMLT3M7rBTeqns+BvJMlnFejZlCmwVrfkgE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HONcEXNbYTl9EfyIqSJhwetxv6GxtqQLXM9O6QUxiRpzpIhZ/2eao55s/Dw05SvIR
         Jef+FQceJj406moci/svbmyPfSCg8oDEMNY4LaURBjFpR1tgURE0IVpib7JgbH7Pr3
         dms9Ywhhi+yfxfW93ffM1FRvwqQLQPnmbWRJ76yg=
Date:   Wed, 6 May 2020 17:10:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200506171030.6b0a0bdc@coco.lan>
In-Reply-To: <20200504140833.11dd5622@coco.lan>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
        <20200504124539.77eac397@ASUS>
        <20200504140833.11dd5622@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 4 May 2020 14:08:33 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Mon, 4 May 2020 12:45:39 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> 
> > On Mon, 4 May 2020 10:49:34 +0200
> > Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> >   
> > > Em Mon, 4 May 2020 10:16:28 +0200
> > > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > >     
> > > > On Sun, 3 May 2020 18:07:51 +0200
> > > > Patrik Gfeller <patrik.gfeller@gmail.com> wrote:
> > > >        
> > >  [...]      
> > > > 
> > > > I was not able yet to compile the kernel 4.4 successfully yet. 

I was able to build this tree with gcc-7:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=yocto_intel_atom

Please notice that one patch there changed the default from "gcc"
to "gcc-7", just to avoid needing to pass "make CC=gcc-7" every time.

This is not needed and can be dropped if you want to use something else.

This patch mark some drivers as BROKEN, as one of the yocto's patch
changed the way Intel mid works, removing a "regmap" field from it.

I would try to build like this, as it should probably be enough to test 
the atomisp driver on an ISP2401 machine.

I this won't work, we may need to do something else.

Thanks,
Mauro
