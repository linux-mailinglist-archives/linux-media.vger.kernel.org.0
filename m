Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B3F1D9E01
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 19:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgESRhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 13:37:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729219AbgESRhg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 13:37:36 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF409206C3;
        Tue, 19 May 2020 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589909855;
        bh=3DtAzNz+wcPQHyKjtyjku7FWzvr+3pCovDKtvDXKpHA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gnbmjDto8Cesd/z29WsfXCD60tVhCqdrkJ4rk+t2NtZRMMGsKYhV3Osja608HEF8q
         Tn2rclcWIdJ6d9idW2Q7jD9tNVrMuLEmSz4PN9Y52VVq9s5ZDANGFa0w/IctkLTQ+6
         4ZL3f0BvTclGEfPArtpuNQP3bbN8da4BXuG4Il0M=
Date:   Tue, 19 May 2020 19:37:30 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Finn Rayment <finn@rayment.fr>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT,PULL] Ressurect the atomisp staging driver
Message-ID: <20200519193730.6ff2c6f4@coco.lan>
In-Reply-To: <be10190f-d87a-aa9e-3fd9-747f7715a108@rayment.fr>
References: <7fa44621-963f-2d55-ab91-0fee483a94f5@rayment.fr>
        <20200516115459.4a24063b@coco.lan>
        <be10190f-d87a-aa9e-3fd9-747f7715a108@rayment.fr>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 16 May 2020 21:53:14 +0200
Finn Rayment <finn@rayment.fr> escreveu:

> On 16/5/20 11:54, Mauro Carvalho Chehab wrote:
> > Em Sat, 16 May 2020 15:23:57 +0200
> > Finn Rayment <finn@rayment.fr> escreveu:
> >   
> >> Hello,
> >>
> >> I've cloned HEAD from atomisp_v2 (commit bb1407f0d...), tried to compile
> >> it on a T100TA and have received the following error:
> >>
> >> arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function
> >> __kvm_gfn_to_hva_cache_init:
> >> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2442:42: error: nr_pages_avail
> >> may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >>
> >> Commenting out the third line in arch/x86/kvm/Makefile has solved this
> >> for me. Aside from warnings, this is the only error I receive during
> >> compilation.
> >>
> >> After installing the kernel and booting to Arch Linux, it gets stuck at
> >> "Loading initial ramdisk" with no extra information even with
> >> `loglevel=7` set. I will try to diagnose the issue and ensure I haven't
> >> incorrectly installed the kernel - will also try to compile on another
> >> computer.
> >>
> >> Let me know if I can offer any other help or more information, I would
> >> love to contribute to the development of these drivers.
> >>
> >> Regards,
> >> Finn.  
> > 
> > Let me enclose the .config file I used here. Perhaps using the same one
> > as a starting point would help building it.
> > 
> > Thanks,
> > Mauro
> >   
> 
> Thank you for the config. I've tried compiling on the T100TA itself and 
> a second computer and on both I am receiving this error now:
> 
> make[1]: *** [kernel/Makefile:136: kernel/kheaders_data.tar.xz] Error 127
> make: *** [Makefile:1722: kernel] Error 2
> make: *** Waiting for unfinished jobs....
> 
> I am unable to finish generating the modules because of this.

Weird. Why it is requiring a tarball to build the Kernel? Never saw that
before.
Thanks,
Mauro
