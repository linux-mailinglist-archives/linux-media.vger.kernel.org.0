Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F04C18F29C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 11:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgCWKVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 06:21:50 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58176 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgCWKVu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 06:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=3WfSQ3OZhM0uMtvR96lPO9D2XEhT6VnleEL2HTMq9qc=; b=B5q6NfBAhKcSzZ3KlhdFVBHL7w
        DZB2imhu75xJbB3QtYbJRRfGTzNKz/YBND322z63b+tNyIQuKPbKkUZWry1fWF5T0/wsNa5MZpEfm
        Z3eEjbwIg8P7CrA/OOneVnMtgehQijD/+dIePxPF9uo/UPfCwTcpoqatNj54Z4WEc85Tw1YPAfGMK
        uVL9iBX5OyyKfNdtnWQW+pLmpCjMd0bqTghGYIZbjy0UEjxgGS3ktZJATt+VhxDnnfiuUif3khhOX
        ikM/lun32HfmT6ajMX9N6aDSPhtx4W/Ih/hXHQ1cblAEZZWO+DGSSV0GVgSxQl3Ei5IR2IaBEyEAp
        9XfudGdQ==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGKDM-0005ME-AT; Mon, 23 Mar 2020 10:21:48 +0000
Date:   Mon, 23 Mar 2020 11:21:42 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Martin Knoblauch <knobi@knobisoft.de>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: Build error on 5.5.10 after activating v4l in .config
Message-ID: <20200323112142.457a8a28@coco.lan>
In-Reply-To: <CAJtcoLZKbiSqRPvLMz-Bp142sxEFhuAkbZzx7P3n3VW2bNCtQA@mail.gmail.com>
References: <CAJtcoLYiGLa3UWQ-XBVc=ATQEnsFrfZuU0i_fS22b7Uv+S-Ysw@mail.gmail.com>
        <20200320161301.36866c31@coco.lan>
        <CAJtcoLZKbiSqRPvLMz-Bp142sxEFhuAkbZzx7P3n3VW2bNCtQA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 23 Mar 2020 10:44:42 +0100
Martin Knoblauch <knobi@knobisoft.de> escreveu:

> On Fri, Mar 20, 2020 at 4:13 PM Mauro Carvalho Chehab <mchehab@kernel.org>
> wrote:
> 
> > Em Fri, 20 Mar 2020 15:56:16 +0100
> > Martin Knoblauch <knobi@knobisoft.de> escreveu:
> >  
> > > Hi, (sesending without attachment)
> > >
> > >  today I tried to build 5.5.10 based on a working 5.5.6 configuration. I
> > > also enabled v4l in the configuration using menuconfig. This resulted in
> > > the following build error:
> > >
> > >   AS      arch/x86/boot/compressed/efi_thunk_64.o
> > >   CC      arch/x86/boot/compressed/misc.o
> > >   XZKERN  arch/x86/boot/compressed/vmlinux.bin.xz
> > > ERROR: "__devm_regmap_init_i2c" [drivers/media/i2c/tvp5150.ko] undefined!
> > > make[1]: *** [scripts/Makefile.modpost:94: __modpost] Error 1
> > > make: *** [Makefile:1282: modules] Error 2
> > > make: *** Waiting for unfinished jobs....
> > >
> > > After some searching the universal support tool, I applied the following
> > > patch:
> > >
> > > --- ./drivers/media/i2c/Kconfig-orig 2020-03-18 13:57:30.288639392 +0100
> > > +++ ./drivers/media/i2c/Kconfig 2020-03-18 16:44:03.938384192 +0100
> > > @@ -378,6 +378,7 @@
> > >  config VIDEO_TVP5150
> > >   tristate "Texas Instruments TVP5150 video decoder"
> > >   depends on VIDEO_V4L2 && I2C
> > > + select REGMAP_I2C
> > >   select V4L2_FWNODE
> > >   help
> > >    Support for the Texas Instruments TVP5150 video decoder.
> > >
> > > This made my build work again. But I am absolutely not sure this is the
> > > right fix or whether it is complete.  
> >
> > Yes, it is. There are other places where the same select is needed.
> >
> > There's already a patch upstream (linux-next) addressing this issue.
> >
> > It should be merged for 5.7.
> >
> > Regards,
> > Mauro
> >  
> 
> Hi Mauro,
> 
>  so I had the same issue again with 5.5.11 (expected). In order to avoid
> keeping a local patch until 5.5.7, I tried to deselect the driver. But it
> seems I cannot. Only options I have for it are "M" or "*". So, what makes
> this device different from e.g. TVP514x? I do not have the TVP5150 and the
> driver is also not loaded. To me it seems the forced selection should not
> happen in the first place ?

Some other driver you selected may support boards with tvp5150. By default,
it will auto-select all possible dependencies. 

You can disable MEDIA_SUBDRV_AUTOSELECT. Please notice, however, that this
may break support for some hardware.

Thanks,
Mauro
