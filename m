Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83E53F3907
	for <lists+linux-media@lfdr.de>; Sat, 21 Aug 2021 08:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhHUGhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Aug 2021 02:37:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230375AbhHUGhI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Aug 2021 02:37:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EC1D60184;
        Sat, 21 Aug 2021 06:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629527789;
        bh=cM9yxJXxvjU48PWWvZH6/CR8A1K1QGlNiCoRfvilTqs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r2TFh8J4572fOe52104KRJ+orFqNSTjIAPxxayxqhsR/JJyXOIaw5dsa8gTwe4gbC
         2oVL4OCjwhHjweSuVT42soxlKRPNL5dVouj+tsBAZnYBPU5cdfBeWeNBcNCzQtC3uH
         ra44Gbe5Jewm3Z7F/bp5j5eBrtFC9AN8CaX9FDgMCs+Dck0Uwfqou2KCvYOyWonCaY
         W5stSG+PkF2yohx9hBJSqQR2ZYCvcBtk2uByaZZZQaQIZoSV0YcwdcJh9ehonxigjZ
         3txGsej37nu2ohjQUQQLSATqPAYvnD2/XHScobvFyxDueQeVFIUeAYB3sBqToNaXmG
         vJPg/VoLioEqg==
Date:   Sat, 21 Aug 2021 08:36:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
Message-ID: <20210821083611.3be2b5d7@coco.lan>
In-Reply-To: <202108202251.F3033355C@keescook>
References: <20210802143820.1150099-1-arnd@kernel.org>
        <202108130937.7848F6B318@keescook>
        <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
        <202108202251.F3033355C@keescook>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 20 Aug 2021 22:53:37 -0700
Kees Cook <keescook@chromium.org> escreveu:

> On Thu, Aug 19, 2021 at 08:24:11PM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 13, 2021 at 7:39 PM Kees Cook <keescook@chromium.org> wrote:  
> > >
> > > On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:  
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > The input_system_configure_channel_sensor() function lost its final
> > > > return code in a previous patch:
> > > >
> > > > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> > > > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> > > >
> > > > Restore what was there originally.
> > > >
> > > > Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>  
> > >
> > > I hit this too. Thanks!
> > >
> > > Reviewed-by: Kees Cook <keescook@chromium.org>  
> > 
> > Me too,
> > Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>  
> 
> Mauro, are you able to get this into your tree, please? Or Greg? It's in
> staging. :) This is breaking the build.

Didn't notice it was breaking the build for you.

Patch applied, thanks!

Thanks,
Mauro
