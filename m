Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9E120B54B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 17:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbgFZPwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 11:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:42036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728355AbgFZPwV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 11:52:21 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B87020702;
        Fri, 26 Jun 2020 15:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593186741;
        bh=eQ/gqvaPGuNwhaaseFP3g+9qc6WdZn+I0SkmtvJtzVk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=zMxTt5DgSj+wSUx53bzzYetueSNvKZYhfDM6vNemQpzFLMrLsa3P+XHyrpMXNKhhx
         xOsCiol1sHByjvwwq95RdEuWCEPS1EwHBogXpKIk6C9e7M1r7uTwuEN08EYsTM90pE
         mfe/SYDVaCR2S1HWGpVrEABH77f9ktmOHElC25WU=
Date:   Fri, 26 Jun 2020 17:52:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/7] Some atomisp fixes and improvements
Message-ID: <20200626175216.7955c374@coco.lan>
In-Reply-To: <20200626150021.GY3703480@smile.fi.intel.com>
References: <cover.1593180146.git.mchehab+huawei@kernel.org>
        <20200626150021.GY3703480@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 26 Jun 2020 18:00:21 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> On Fri, Jun 26, 2020 at 04:04:52PM +0200, Mauro Carvalho Chehab wrote:
> > Those patches are meant to improve device detection by the atomisp driver,
> > relying on ACPI bios when possible.
> > 
> > It also adds a basis for using ACPI PM, but only if the DSDT tables have
> > a description about how to turn on the resources needed by the cameras.
> > 
> > At least on the device I'm using for tests, this is not the case.  
> 
> Is this in your experimental tree? 

Yes. 

> I'll rebase mine on top and test.
> After I will send the rest from my series and give a tag to this.

It would be helpful if you could test removing the DMI match table from
your board. If your device has a DSDT table close to the one I have, the
new code may be able to get everything from DSDT.

> 
> > 
> > Mauro Carvalho Chehab (7):
> >   media: atomisp: reorganize the code under gmin_subdev_add()
> >   media: atomisp: Prepare sensor support for ACPI PM
> >   media: atomisp: properly parse CLK PMIC on newer devices
> >   media: atomisp: fix call to g_frame_interval
> >   media: atomisp: print info if gpio0 and gpio2 were detected
> >   media: atomisp: split add from find subdev
> >   media: atomisp: place all gpio parsing together
> > 
> >  .../staging/media/atomisp/pci/atomisp_cmd.c   |   2 +-
> >  .../media/atomisp/pci/atomisp_gmin_platform.c | 393 ++++++++++++------
> >  2 files changed, 267 insertions(+), 128 deletions(-)
> > 
> > -- 
> > 2.26.2
> > 
> >   
> 



Thanks,
Mauro
