Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0DD14C69F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 07:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgA2Gpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 01:45:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:48854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbgA2Gpi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 01:45:38 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8292F20702;
        Wed, 29 Jan 2020 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580280338;
        bh=yTwt6zChi4FRgiu+DHf6yoPp/dBnWUympxWlomufo6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MjBjnM4E3ukJyQhYRivUYSUC5UBkfSoN7XRVXlQrfe7KsyfKYmAxEGpBaZzgxANBR
         YgfAz3CaifEO4JC2GZ372wWCFHdJ9vG388Ov23/MZ2V1XTR2g2y1OUGhsGtNMeQQ2x
         9RYKek02JMf2LMWm6VJn/mL4KTKqw/POIGryKg28=
Date:   Wed, 29 Jan 2020 07:45:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: usb: remove some broken references
Message-ID: <20200129064535.GA3771222@kroah.com>
References: <00008303fde6b4e06d027d3b76ae7032614a7030.1580193653.git.mchehab+huawei@kernel.org>
 <20200128134228.3c6f56b9@lwn.net>
 <244ed240-46aa-aa73-6f89-df7944d42cbf@infradead.org>
 <20200129074146.5f6077ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129074146.5f6077ca@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 29, 2020 at 07:41:46AM +0100, Mauro Carvalho Chehab wrote:
> Em Tue, 28 Jan 2020 15:47:18 -0800
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
> > On 1/28/20 12:42 PM, Jonathan Corbet wrote:
> > > On Tue, 28 Jan 2020 07:41:00 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >   
> > >> It seems that some files were removed from USB documentation.
> > >>
> > >> Update the links accordingly.
> > >>
> > >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> > > 
> > > Applied, thanks.
> > > 
> > > jon  
> > 
> > This warning has been around for quite awhile now:
> > 
> > lnx-55/Documentation/usb/text_files.rst:22: WARNING: Include file u'lnx/lnx-55/Documentation/usb/wusb-cbaf' not found or reading it failed
> > 
> > Looks like it has been moved to drivers/staging/wusbcore/Documentation/wusb-cbaf.
> 
> From the log of the patch that moved it:
> 
>   commit 71ed79b0e4be0db254640c3beb9a1a0316eb5f61
>   Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>   Date:   Tue Aug 6 12:15:09 2019 +0200
> 
>     USB: Move wusbcore and UWB to staging as it is obsolete
>     
>     The UWB and wusbcore code is long obsolete, so let us just move the code
>     out of the real part of the kernel and into the drivers/staging/
>     location with plans to remove it entirely in a few releases.
>     
>     Link: https://lore.kernel.org/r/20190806101509.GA11280@kroah.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> The plan seems to remove it in the future.
> 
> In any case, it makes sense to remove the broken link from the 
> documentation.

Yes, please just remove it, that code is about to go away in the
5.6-rc1.

thanks,

greg k-h
