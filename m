Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA3C5B63A5
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 00:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiILW0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 18:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiILW0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 18:26:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6D1205D2
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 15:26:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-79-70-nat.elisa-mobile.fi [85.76.79.70])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B4A7415;
        Tue, 13 Sep 2022 00:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663021609;
        bh=W7BfMKJVW+kGLt0fQJsaWwkKiTclRbMaG7+jctDyxKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nmhyU2RuOiCaDHvHFa/J2fS6Sv+1K0tMQUEVCV229vkmBo7oxNcvhvrp8M4PyaAxO
         5W6cFeyqfjLCePt9Gvs15tn4oBgwUrkupKRTpPLQkXpxAD1wmVyyNn95C4NIj+P2JZ
         LKBXDDutiLVN3KdK+q/L3Fb7ydOur6UeEBnf1Df8=
Date:   Tue, 13 Sep 2022 01:26:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        p.zabel@pengutronix.de, rosenp@gmail.com, sakari.ailus@iki.fi,
        sean@mess.org, user.vdr@gmail.com, xavier.claessens@collabora.com
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Message-ID: <Yx+yF3/9Q+cICUdD@pendragon.ideasonboard.com>
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
 <20220912180454.1b956a3d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220912180454.1b956a3d@coco.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Sep 12, 2022 at 06:04:54PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri,  9 Sep 2022 16:44:07 +0300 Laurent Pinchart escreveu:
> 
> > Hello everybody,
> > 
> > This series is the latest (and greatest) attempt to switch v4l-utils
> > from autotools to meson.
> > 
> > Compared to v6, the first noticeable change is that fixups have been
> > squashed into their corresponding commit. Detailed changelogs are now
> > included in individual patches.
> > 
> > The second big change is that the last patch from v6 ("Makefile.am:
> > Distribute meson related files") got replaced by 5/5 which drops
> > autotools support, completing the switch from autotools to meson.
> > 
> > A branch that includes this series can be found at
> > 
> >         git://linuxtv.org/pinchartl/v4l-utils.git meson
> > 
> > Ariel D'Alessandro (4):
> >   Move README to markdown syntax
> >   Add support for meson building
> >   Copy Doxygen configuration file to doc/
> >   meson: Add support for doxygen documentation
> > 
> > Laurent Pinchart (1):
> >   Drop autoconf/automake support
> 
> With the risk or repeating myself a couple of times, I have no
> idea what was built with meson, when using the version from
> your repository:
> 
> 	git://linuxtv.org/pinchartl/v4l-utils.git meson
> 
> (which btw seems to have some patches that are different
> from the 5 ones you submitted) 

I think I've already pushed some fixes on that branch. There will be a
v8 on the list, I'll push a tag with the version number to avoid
confusion.

> as it doesn't provide anything similar to what current 
> autotools-based support provides:

Sorry for missing your comment before. Meson has a summary() function
that can generate similar output, I'll enable it in the next version.

> $ ./configure
> ...
> compile time options summary
> ============================
> 
>     Host OS                    : linux-gnu
>     X11                        : yes
>     GL                         : yes
>     glu                        : yes
>     libelf		       : yes
>     libjpeg                    : yes
>     libudev                    : yes
>     pthread                    : yes
>     QT version                 : v5.4 with QtGL
>     ALSA support               : yes
>     SDL support		       : yes
> 
>     build dynamic libs         : yes
>     build static libs          : yes
> 
>     gconv                      : no
> 
>     dynamic libv4l             : yes
>     v4l_plugins                : yes
>     v4l_wrappers               : yes
>     libdvbv5                   : yes
>     dvbv5-daemon               : yes
>     v4lutils                   : yes
>     qv4l2                      : yes
>     qvidcap                    : yes
>     v4l2-ctl uses libv4l       : yes
>     v4l2-ctl-32                : no
>     v4l2-compliance            : yes
>     v4l2-compliance uses libv4l: yes
>     v4l2-compliance-32         : no
>     BPF IR Decoders:           : no

-- 
Regards,

Laurent Pinchart
