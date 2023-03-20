Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A755F6C2361
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 22:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjCTVHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 17:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjCTVHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 17:07:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A205218AA2
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 14:07:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D3D210B;
        Mon, 20 Mar 2023 22:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679346442;
        bh=htu3seepPw+TZ/QeJTCSCejKENAUNrdGvUMfHI9cV1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QqiwB8+ljStLiF1DfA4wK6GLYtBOBrC5qJmSC/5arvjG2M2wgURtzn6ylIIhRrWBC
         tWg9eMSS78Xa3uJp1k/2TVuC+VR7ZEXl1qQJMA0P+VPbYTA2JrZM9ViLd8h3K3e4HO
         BoPWdpQ0XXycBtngZy5mgMtlVGpiEb8rB1EQEO68=
Date:   Mon, 20 Mar 2023 23:07:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [PATCH] meson: Fix install location of doxygen's man pages
Message-ID: <20230320210728.GL20234@pendragon.ideasonboard.com>
References: <20230320195057.16195-1-laurent.pinchart@ideasonboard.com>
 <20230320213619.3cf1affb@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230320213619.3cf1affb@coco.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Mar 20, 2023 at 09:36:19PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 20 Mar 2023 21:50:57 +0200 Laurent Pinchart escreveu:
> 
> > The doxygen man pages are incorrectly being installed alongside the HTML
> > documentation. Install them in the right location, in the $mandir
> > directory, by specifying a separate install location for each doxygen
> > target.
> > 
> > As a drive-by cleanup, replace the join_path() function with the meson's
> > '/' path concatenation operator.
> 
> Thanks for the quick fix!
> 
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  doc/meson.build | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/doc/meson.build b/doc/meson.build
> > index fef3e83fa432..02a30dc5688a 100644
> > --- a/doc/meson.build
> > +++ b/doc/meson.build
> > @@ -15,15 +15,16 @@ doxyfile = configure_file(input : 'Doxyfile.in',
> >                            output : 'Doxyfile',
> >                            configuration : cdata)
> >  
> > -doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
> > -                                 '@0@'.format(meson.project_name()))
> > +doxygen_install_dirs = []
> >  
> >  doxygen_output = []
> >  if get_option('doxygen-html')
> >      doxygen_output += 'html'
> > +    doxygen_install_dirs += get_option('datadir') / 'doc' / '@0@'.format(meson.project_name())
> >  endif
> >  if get_option('doxygen-man')
> >      doxygen_output += 'man'
> > +    doxygen_install_dirs += get_option('mandir') / '..'
> 
> This is hacky, but it also sounded to me the easiest/quickest way to
> address it. I wonder if are there a cleaner way to avoid it to place
> files under ${mandir}/man/man3. e. g. /usr/share/man/man/man3.

Not by using the custom_target() install_dir argument, as far as I can
see. meson provides a set of install_*() functions that may be
leveraged, and also allows running custom installation scripts with
meson.add_install_script() if needed. I decided to go for this small
hack for simplicity.

> This shouldn't be causing real problems, though, except if some
> distro would use non-Unix standard places, like setting mandir
> to something like "/weird/distro/manual_pages".

Yes, that would be problematic. Let's fix it when this theoretical
problem becomes a real one :-)

-- 
Regards,

Laurent Pinchart
