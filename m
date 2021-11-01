Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409A44422B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 22:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhKAVgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 17:36:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:57034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229712AbhKAVgb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 17:36:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E3D860EE5;
        Mon,  1 Nov 2021 21:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635802437;
        bh=7tNPkR8LH3M50AiRO4S5v3pmlMXimGrDP2pqpUEozag=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kTxkiUJlqckzc2BKIMPQSR0+jqOH4GFbnePFnsVAhskMQV9sd8pPSF6fn++ivsI8r
         YlVnnfEzKi5EJlhN+bVEkoNv+mckCB+9GRbTfp2SWkDUYHpxYPhYolpiIkHFlxq9+X
         v7N0PtGIrOycR5eK0AyZF7zWVOumQy6mBNC4DJkxiF/tOQoaATu78XTa5POkvrdKT6
         ux22YLvmEYIpKDjrYg2UeD8qg58pMr2PVp1WL8plbqAFZMTumLM2TbMug54eOjOAht
         ChFNS9pzXAgPkHDOQn+qHDVTSYHz0kcR2Qln8YbE10L1SGESQOCq9i0fqoqXtR139J
         cvdxtCRdysXag==
Date:   Mon, 1 Nov 2021 21:33:52 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <20211101213352.0600bceb@sal.lan>
In-Reply-To: <8b81025d-a35d-da91-b059-eab1108013e8@redhat.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-5-kitakar@gmail.com>
        <20211026092637.196447aa@sal.lan>
        <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
        <20211028123944.66c212c1@sal.lan>
        <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
        <20211101141058.36ea2c8e@sal.lan>
        <2b81ca7e-fcaa-5449-5662-4eb72e746b02@redhat.com>
        <20211101200347.2910cbc7@sal.lan>
        <8b81025d-a35d-da91-b059-eab1108013e8@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 1 Nov 2021 22:06:12 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 11/1/21 21:03, Mauro Carvalho Chehab wrote:
> > Em Mon, 1 Nov 2021 20:06:52 +0100
> > Hans de Goede <hdegoede@redhat.com> escreveu:  
> 
> <snip>
> 
> >>    -Patch to not load atomisp_foo sensor drivers on !BYT && !CHT  
> > 
> > Not sure if it is worth doing it, as there are a lot more to be
> > done before being able to use a generic sensor driver.  
> 
> As you may know, I'm also working on IPU3 support for $dayjob atm
> actually :)

Didn't know that... Btw, I have one Dell device with IPU3. It would 
be great to have it working there ;-)

> So the drivers for e.g. the ov5693 sensor conflict, by adding
> a small (one line) check to atomisp_ov5693.c to not register
> the driver at all when not on BYT/CHT we can avoid the conflict
> on most devices for now. And when actually on BYT/CHT the user
> will need to blacklist the non atomisp sensor-modules which, well
> sucks, but atomisp is in staging for a reason ...
> 
> So the idea here is that with some small added ugliness to the
> atomisp_foo.c sensor drivers we can make the 2 drivers co-exist
> a bit more, allowing e.g. generic distro kernels to (maybe) enable
> the atomisp2 stuff without regressing the IPU3 support.
> 
> ###
> 
> Since we are discussing this now anyways, the atomisp_foo.c
> patches would look like this:
> 
> #include <linux/platform_data/x86/soc.h>
> 
>         if (!soc_intel_is_byt() && !soc_intel_is_cht())
>                 return -ENODEV;
> 
> In the probe() function and change driver.name from
> e.g. "ov5693" to "atom_ov5693".
> 
> Before I spend time on writing patches for this, would patches doing
> this for conflicting drivers be acceptable ?

Surely. Yeah, it makes sense to me. Feel free to submit such
patches.

Regards,
Mauro
