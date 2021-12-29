Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0AC6481731
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 23:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhL2WOb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 17:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhL2WOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 17:14:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1B2C061574;
        Wed, 29 Dec 2021 14:14:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BEFB0615A7;
        Wed, 29 Dec 2021 22:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF42DC36AEA;
        Wed, 29 Dec 2021 22:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640816069;
        bh=82V398wr5bTe6k2EBJ2donRy8RHvMUC8eqEC3CqKAUU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W72aIJn48n1PPUCzTWB4kfomrUMX7LUHphcuOR6MWbkbNBfbJO/qCT6l99VMDxVSm
         kCqXOJAOxMlNzrt/qVrykipceYsmtnpjaXNuyMLtnIxm52mbJe9s+q+JeuiWkeMTLh
         Nuo5oUlSW3rR9GnOHbam+MBO4BoeFAcR0kyArhu3yyTJ7sc7c8wEn1eQRiwuwNOcMu
         m8qd5wa7nGd7zZnWsABhvPbxaqadnMFfl7G+25Zi01bx5zdCJvHo+onTEL+Q9hqxhy
         gQ36cwpBmjyTQWGAKp0eRJvBly779gnmv/hMYxHRJ5kWR3v3MNH8kG+iTWezEvyjoc
         uB63JML1P8PzQ==
Date:   Wed, 29 Dec 2021 23:14:24 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: Status of selection.svg update (was Re: [PATCH 0/3] docs:
 sphinx/kfigure.py: Improve conversion to PDF)
Message-ID: <20211229231424.365d9d4a@coco.lan>
In-Reply-To: <e135a1fd-78df-d676-6678-9637a12ca8ec@gmail.com>
References: <de8def13-efbc-1d98-acb5-5cc1f6902e4b@gmail.com>
        <20211212113813.058e99fc@coco.lan>
        <8840a859-ca57-c49a-f542-0a37401ccdfc@gmail.com>
        <20211213073327.11191087@coco.lan>
        <60d50d23-e236-1105-dc2c-d6daca70e326@gmail.com>
        <e135a1fd-78df-d676-6678-9637a12ca8ec@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 29 Dec 2021 21:54:47 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> [+Cc: linux-media, -Cc: lkml]
> 
> Hi Mauro,
> 
> In case you are wondering what is going on in the update of
> selection.svg, here is a status report.
> 
> On Mon, 13 Dec 2021 16:53:07 +0900, Akira Yokosawa wrote:
> > On Mon, 13 Dec 2021 07:33:27 +0100, Mauro Carvalho Chehab wrote:  
> [...]
> >> No matter if this is merged or not, if you find an issue at the images
> >> at the media docs, please send them to linux-media@vger.org.  
> > 
> > OK. I'll compose a proper change log for it and post it later this
> > week or next.
> > (I'm not a type of person who is good at doing several things in
> > parallel.)  
> 
> I started the patch preparation, but I found the patch would be
> quite large in size (~500kB).
> 
> This is because current selection.svg consists of pretty high-
> resolution raster images.

No, it is not a raster image. That's why it scales so well.
Btw, the basis for this image is on this commit:

    commit 8032b526d1a3bd91ad633dd3a3b5fdbc47ad54f1
    Author: Rusty Russell <rusty@rustcorp.com.au>
    Date:   Mon Mar 16 09:05:07 2009 +1030

    linux.conf.au 2009: Tuz

> I see you had done several attempts to reduce the complexity of
> the SVG, but it is still large (> 200kB) 

One of the reasons why it is big is that the same vector image is added
there twice: the original one on the left, plus a second copy of it that
is scaled and has a clip group that hides the elements of it that aren't
visible at the image on the right.

> and conversion to PDF by
> convert(1) generates a PDF of more than 1MB!
> Even inkscape(1) generates a larger PDF (>1.3MB) with embedded
> raster images.

It doesn't matter the size of the output, provided that the image is
properly displayed on pdf and html.

> I don't believe what the figure wants to explain deserves such
> a large size.
> So, from my POV, adding another bitmap image to the SVG for the
> sake of browser compatibility is *not* the right thing to do.

I actually used a Tux-based svg image as basis because:

1. Tux (or Tuz, in this case) is well-known Linux image;
2. It is a nice image;
3. It was committed by another Kernel developer that already
   took care on having it properly licensed;
4. As this was merged to the Kernel already, it is under GPLv2.
5. It scales well on both html and pdf.

It could have used any other image, or I could have drawn a
random image, but, as I'm not good on drawing things and finding
something that won't cause a potential licensing and/or trade mark
headache could be tricky, I opted to use an already-merged Linux
image as basis.

> Instead, my suggestion would be to get rid of the embedded raster
> images and to draw some simple vector-graphics-based figure
> instead.

There were another image before selection.svg that used a simple
figure, but the cropped version didn't represent too well (IMHO).
That's why I opted to use a real figure, where you can see the
details of the image at the crop region.

I wouldn't mind replacing it with something else, but it should
be something that it won't cause licensing issues and will still
properly represent what selection does: crop, compose and scale.

> Am I missing something here?
> 
>         Thanks, Akira
> 
> > 
> > And the most easy fix is to install Inkscape on your system for
> > the daily build.
> > Then, convert(1) picks inkscape(1) for SVG rendering and you will
> > see right ones (of raster images, though).
> > 
> > You know, ImageMagick prefers inkscape over rsvg-convert.
> > I think it is the right thing to do in kfigure.py as well.
> >   
> [...]



Thanks,
Mauro
