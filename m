Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0512A79F9
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 10:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgKEJEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 04:04:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:48792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgKEJEk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 04:04:40 -0500
Received: from coco.lan (unknown [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB096206FB;
        Thu,  5 Nov 2020 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604567079;
        bh=o1BOKc8oc8Zf6jNWwb3C5sMendnBzwpP/u0Myph/PAU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p6cbUcXTw2/2TyV9T3Zck5T7vNPW2MIFs8ZHHtmDc4AkcOmSvvmxwvXv0EjG/UTDV
         bL3X94Qv/aeAGgyF3gzrJsVVRlLPEbxIPbC5pCYChZXiBAQYChrA5THdTetBeDn0Lf
         npzRu3BT23KvHJzAKXl3tjsdkD5XkoOszl6eLXZw=
Date:   Thu, 5 Nov 2020 10:04:36 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 001/106] smiapp: Generate CCS register definitions
 and limits
Message-ID: <20201105100436.67300628@coco.lan>
In-Reply-To: <20201105080105.GU26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201105081950.43f0613f@coco.lan>
        <20201105080105.GU26150@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Nov 2020 10:01:05 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> Thank you for the review.
> 
> On Thu, Nov 05, 2020 at 08:19:50AM +0100, Mauro Carvalho Chehab wrote:
> > Hi,
> > 
> > Em Wed,  7 Oct 2020 11:44:21 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> >   
> > > Add register definitions of the MIPI CCS 1.1 standard.
> > > 
> > > The CCS driver makes extended use of device's capability registers that
> > > are dependent on CCS version. This involves having an in-memory data
> > > structure for limit and capability information, creating that data
> > > structure and accessing it.
> > > 
> > > The register definitions as well as the definitions of this data structure
> > > are generated from a text file using a Perl script. Do the generation here
> > > and so avoid making manual, error-prone changes to the several generated
> > > files.  
> > 
> > I understand the reason behind using a perl script to parse some
> > text file in order to generate register's definition files,
> > but I can't see what's the sense of storing the perl script and
> > such texts together with the Kernel building system, re-generating them
> > every time.
> > 
> > I mean: register definitions is something that it is supposed to be
> > stable, and nothing something that will change on every Kernel
> > compilation.
> > 
> > How often are you expecting changes at ccs-regs.txt?  
> 
> When there's a new version of the standard, or a bug is found. At least. So
> not very often.

So, it should likely take a couple of years before any changes on it.

> After pushing the set to a branch in my linuxtv.org tree, I also noticed
> that some architectures are built by kbuild bot without Perl interpreter
> being present.

Well, kbuild bot is doing the wrong thing here: it means that it is not
testing documentation - as building it requires perl ;-)

> This suggests that Perl is not currently universally
> required for building the kernel albeit there seems to be some PowerPC
> hardware (?) related driver needing it to be built.

I doubt that Perl is a requirement for building the Kernel itself.

Adding such requirement could cause troubles on some embedded distros,
like Yocto, OpenWrt, etc, whose have a distinct toolchain that needs
to be compiled on some early step.

If this were something that would require dynamic changes on every
single compilation, it would make sense to add such extra dependency,
but this is not the case here.

> I was thinking of putting the files produced by the script into a new patch
> and leaving the script and the text file in the directory. The files would
> be rebuilt when a specific environment variable is set. This would in line
> with what crypto drivers are doing.

I would, instead, place the script and instructions about how to use
it inside Documentation/driver-api/media.

Thanks,
Mauro
