Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301751E8E01
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 07:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgE3FZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 01:25:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgE3FZi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 01:25:38 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A5E120659;
        Sat, 30 May 2020 05:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590816338;
        bh=46C/MZyqqfW348u8hHBmn8Y6/AmlEi3b+slWuynbey4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PK8e5RZJjTZba3Rq6FzwcI8qjFcpj9ieVKqL2rHvjTQc4dMN70B3j06iDY+PmGC9b
         EsZznEABpjHDhEbADBORinHqT9C8CEMYMGyVdhHULttC3yyQpHwwPKr0ymJo4H7Ddi
         LG3UvHn6amp2ttclLLpreuU1/Osq6P4GRIPvuCmQ=
Date:   Sat, 30 May 2020 07:25:33 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 9/9] staging: media: atomisp: add PMIC_OPREGION
 dependency
Message-ID: <20200530072533.66591af2@coco.lan>
In-Reply-To: <20200530031129.GF1367069@ubuntu-s3-xlarge-x86>
References: <20200529200031.4117841-1-arnd@arndb.de>
        <20200529200031.4117841-9-arnd@arndb.de>
        <20200530031129.GF1367069@ubuntu-s3-xlarge-x86>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 29 May 2020 20:11:29 -0700
Nathan Chancellor <natechancellor@gmail.com> escreveu:

> On Fri, May 29, 2020 at 10:00:31PM +0200, Arnd Bergmann wrote:
> > Without that driver, there is a link failure in
> > 
> > ERROR: modpost: "intel_soc_pmic_exec_mipi_pmic_seq_element"
> > [drivers/staging/media/atomisp/pci/atomisp_gmin_platform.ko] undefined!
> > 
> > Add an explicit Kconfig dependency.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>  
> 
> It'd be interesting to know if this is strictly required for the driver
> to work properly. 

It is. Without OpRegion, the driver can't power on the camera sensors.

> The call to intel_soc_pmic_exec_mipi_pmic_seq_element
> has some error handling after it, maybe that should just be surrounded
> by an #ifdef or IS_ENABLED for PMIC_OPREGION, like some other drivers
> do.
> 
> Regardless of that:
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> > ---
> >  drivers/staging/media/atomisp/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> > index c4f3049b0706..e86311c14329 100644
> > --- a/drivers/staging/media/atomisp/Kconfig
> > +++ b/drivers/staging/media/atomisp/Kconfig
> > @@ -11,6 +11,7 @@ menuconfig INTEL_ATOMISP
> >  config VIDEO_ATOMISP
> >  	tristate "Intel Atom Image Signal Processor Driver"
> >  	depends on VIDEO_V4L2 && INTEL_ATOMISP
> > +	depends on PMIC_OPREGION
> >  	select IOSF_MBI
> >  	select VIDEOBUF_VMALLOC
> >  	---help---
> > -- 
> > 2.26.2
> >   



Thanks,
Mauro
