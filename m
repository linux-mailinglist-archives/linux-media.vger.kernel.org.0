Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C450C5B0621
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiIGOKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiIGOJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:09:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12471A07F;
        Wed,  7 Sep 2022 07:09:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CD6BB81CB3;
        Wed,  7 Sep 2022 14:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326E2C433D7;
        Wed,  7 Sep 2022 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662559795;
        bh=K/KsIfvrFq9SzocNl8CKHN2GWRmhpf37njgbFoR7Cww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mw1dcaOwgOalP8H794ETn2moK1XTstJzt19Pcudq76GPfrG6M9T+pPNp3I835U1gD
         0f8UUfq6c5If/JVG62GzP5NMX1VD2Q1JM1Imvn9m5w+EOQ9fUnkZk2Mqs/CPahC5pC
         u7I8DXitY8+LSqjYlDsZcLk2h/bhrDBIIiLkw9A8=
Date:   Wed, 7 Sep 2022 16:09:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [RESEND v7 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <YximMNDbVJMVK/iY@kroah.com>
References: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
 <YxiclqKkPDQR8qMM@kroah.com>
 <20220907140341.GC18739@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907140341.GC18739@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 04:03:41PM +0200, Michael Grzeschik wrote:
> On Wed, Sep 07, 2022 at 03:28:54PM +0200, Greg KH wrote:
> > On Wed, Jun 08, 2022 at 12:57:44PM +0200, Michael Grzeschik wrote:
> > > This series improves the uvc video gadget by parsing the configfs
> > > entries. With the configfs data, the driver now is able to negotiate the
> > > format with the usb host in the kernel and also exports the supported
> > > frames/formats/intervals via the v4l2 VIDIOC interface.
> > > 
> > > The uvc userspace stack is also under development. One example is an generic
> > > v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]
> > > 
> > > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1304
> > > 
> > > With the libusbgx library [1] used by the gadget-tool [2] it is now also
> > > possible to fully describe the configfs layout of the uvc gadget with scheme
> > > files.
> > > 
> > > [2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76f9d512f59fdc23b65cd5c46b7fb09eb4
> > > 
> > > [3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
> > > 
> > > The bigger picture of these patches is to provide a more versatile interface to
> > > the uvc gadget. The goal is to simply start a uvc-gadget with the following
> > > commands:
> > > 
> > > $ gt load uvc.scheme
> > > $ gst-launch v4l2src ! v4l2uvcsink
> > 
> > v4l developers, given a lack of review response to this series, I'm
> > assuming that you all have no objection to this series and I can take it
> > through my usb-next tree.
> 
> Since this will not apply anymore, I just send v8 with some minor
> changes.

Thanks, I'll take that series now.

greg k-h
