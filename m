Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA8A5B07D7
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiIGPCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiIGPBm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:01:42 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D98DB56E9;
        Wed,  7 Sep 2022 08:01:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CBEECCE1C6D;
        Wed,  7 Sep 2022 15:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579CDC433D6;
        Wed,  7 Sep 2022 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662562889;
        bh=B1RFHDYjAoVZRTWvba1bqSzmamDoRJ3U+kJYlgeCapY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lYMQVv5DZWkg2TGQ0jL206/PsqnS0Fg7i+j4sOlHGbFxQLqSdtJGrjyvXcdMEjpkF
         sMnLYyY4Pk0nUl5g5wKzwgFzUd0Q3abz4XsHUibohbVnKxm/tglW0z9x9sL2JtjkpW
         YOeYWpu+Q1uepN+r5T0iTev7mfT2YM3CsfHRnZGM=
Date:   Wed, 7 Sep 2022 17:01:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v8 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <YxiyRvUCkPYVt3PH@kroah.com>
References: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
 <YxiqkhQl60E+tnAB@kroah.com>
 <20220907145204.GE18739@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907145204.GE18739@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 04:52:04PM +0200, Michael Grzeschik wrote:
> On Wed, Sep 07, 2022 at 04:28:34PM +0200, Greg KH wrote:
> > On Wed, Sep 07, 2022 at 04:02:50PM +0200, Michael Grzeschik wrote:
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
> > > 
> > > --
> > > 
> > > v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@pengutronix.de/
> > > v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzeschik@pengutronix.de/
> > > v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzeschik@pengutronix.de/
> > > v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschik@pengutronix.de/
> > > v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzeschik@pengutronix.de/
> > > v6: https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzeschik@pengutronix.de/
> > > v7: https://lore.kernel.org/linux-usb/20220608105748.139922-1-m.grzeschik@pengutronix.de/
> > 
> > Please say what changed somewhere :(
> 
> I addressed each patch individually.

Ah, yes, my mistake, I see that in the individual patches, sorry for the
noise.

greg k-h
