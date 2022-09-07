Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42C815B051B
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 15:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiIGN3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 09:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiIGN3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 09:29:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B533693517;
        Wed,  7 Sep 2022 06:28:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB61D618CF;
        Wed,  7 Sep 2022 13:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57D8C433D6;
        Wed,  7 Sep 2022 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662557337;
        bh=otJVLv3qO4PkH+KqReDdkKwCk5b9TW8h7qt02TkzLWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vTBrhGmTEc0CXKOlmvgFCl8CiLuE1kD6N10JzIOX8vRHIMJwCY6EraY/JfBGo61am
         8ROfLyYfHZDq8hdXePpmvGDzNfIj7btzs6yATBSXv4L6lATvXEn6sQJUGk5rc4Pt2j
         SI7O9M4YH9KBzCojGZzUsxBoeHFa9d7T4FA2uyAc=
Date:   Wed, 7 Sep 2022 15:28:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [RESEND v7 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <YxiclqKkPDQR8qMM@kroah.com>
References: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608105748.139922-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 08, 2022 at 12:57:44PM +0200, Michael Grzeschik wrote:
> This series improves the uvc video gadget by parsing the configfs
> entries. With the configfs data, the driver now is able to negotiate the
> format with the usb host in the kernel and also exports the supported
> frames/formats/intervals via the v4l2 VIDIOC interface.
> 
> The uvc userspace stack is also under development. One example is an generic
> v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]
> 
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1304
> 
> With the libusbgx library [1] used by the gadget-tool [2] it is now also
> possible to fully describe the configfs layout of the uvc gadget with scheme
> files.
> 
> [2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76f9d512f59fdc23b65cd5c46b7fb09eb4
> 
> [3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
> 
> The bigger picture of these patches is to provide a more versatile interface to
> the uvc gadget. The goal is to simply start a uvc-gadget with the following
> commands:
> 
> $ gt load uvc.scheme
> $ gst-launch v4l2src ! v4l2uvcsink

v4l developers, given a lack of review response to this series, I'm
assuming that you all have no objection to this series and I can take it
through my usb-next tree.

thanks,

greg k-h
