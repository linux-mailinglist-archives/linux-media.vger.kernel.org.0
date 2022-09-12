Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB4F5B5DE2
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 18:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiILQFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 12:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiILQFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 12:05:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44512140BE
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 09:05:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A814061253
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 16:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7414AC433D6;
        Mon, 12 Sep 2022 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662998701;
        bh=Gp12jAitQnls/i4w1dCgEj9va5i0wDajJKFwOegiJP8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mS5jIPOtsw7xsMG2e4fsaJtwacCo1apvYMZ9s06Ky9TfrP+TiyRGc+WwKZodx4MEa
         rbiICar4uUqQ9NaYH61araKoC0sWUOSAqoiLn1UB4TvX1+FtzSyFXtst/mFPdRbQty
         kwhH33e+u58N3/3lvxNP5MzP+CtIcHYGQymv70XOgCIwPWg/X5kvgfiXkLTvTEyLd7
         J8rkNRIpzxe1VcxiVviT3w8x8nf8lSo5K7en0CfSQchN627SyH387Vx1uMdQPrT5Yu
         HTPtqSg3Az5OJrOkpt4h77jANp/n6linLAX4kOEuhGQ62O7FMIEY0P8N/dVVs8a6nV
         wiDTdK9Zwp+Ww==
Date:   Mon, 12 Sep 2022 18:04:54 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        p.zabel@pengutronix.de, rosenp@gmail.com, sakari.ailus@iki.fi,
        sean@mess.org, user.vdr@gmail.com, xavier.claessens@collabora.com
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Message-ID: <20220912180454.1b956a3d@coco.lan>
In-Reply-To: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri,  9 Sep 2022 16:44:07 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v6, the first noticeable change is that fixups have been
> squashed into their corresponding commit. Detailed changelogs are now
> included in individual patches.
> 
> The second big change is that the last patch from v6 ("Makefile.am:
> Distribute meson related files") got replaced by 5/5 which drops
> autotools support, completing the switch from autotools to meson.
> 
> A branch that includes this series can be found at
> 
>         git://linuxtv.org/pinchartl/v4l-utils.git meson
> 
> Ariel D'Alessandro (4):
>   Move README to markdown syntax
>   Add support for meson building
>   Copy Doxygen configuration file to doc/
>   meson: Add support for doxygen documentation
> 
> Laurent Pinchart (1):
>   Drop autoconf/automake support

With the risk or repeating myself a couple of times, I have no
idea what was built with meson, when using the version from
your repository:

	git://linuxtv.org/pinchartl/v4l-utils.git meson

(which btw seems to have some patches that are different
from the 5 ones you submitted) 

as it doesn't provide anything similar to what current 
autotools-based support provides:

$ ./configure
...
compile time options summary
============================

    Host OS                    : linux-gnu
    X11                        : yes
    GL                         : yes
    glu                        : yes
    libelf		       : yes
    libjpeg                    : yes
    libudev                    : yes
    pthread                    : yes
    QT version                 : v5.4 with QtGL
    ALSA support               : yes
    SDL support		       : yes

    build dynamic libs         : yes
    build static libs          : yes

    gconv                      : no

    dynamic libv4l             : yes
    v4l_plugins                : yes
    v4l_wrappers               : yes
    libdvbv5                   : yes
    dvbv5-daemon               : yes
    v4lutils                   : yes
    qv4l2                      : yes
    qvidcap                    : yes
    v4l2-ctl uses libv4l       : yes
    v4l2-ctl-32                : no
    v4l2-compliance            : yes
    v4l2-compliance uses libv4l: yes
    v4l2-compliance-32         : no
    BPF IR Decoders:           : no

Regards,
Mauro
