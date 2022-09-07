Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7565B081C
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiIGPLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiIGPLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:11:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAE1303D7;
        Wed,  7 Sep 2022 08:11:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E99CEB81AE4;
        Wed,  7 Sep 2022 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C62C433C1;
        Wed,  7 Sep 2022 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662563504;
        bh=XRICJa+ezq54Fd7cpBA21DpTNtccB94hpEIEsYQYkIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i1y2orA1SmgRMyYcK0JMOmFe5Ax97W0BFHk4xygxhxKaPWgw1nQ0uF9ux/8qU1EHZ
         YiPyYDuaumitoHp42md96jtPBVI38kDrpe1hY1LcdFcHzLcs0eeGxQDz9zmfTFYw3q
         TEnohd/1gcKMzYnNa0kMYvbf1pJZ6gzryMsdnm1A=
Date:   Wed, 7 Sep 2022 17:11:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [fixed+RESEND v8 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <Yxi0rYshyU6hCoWE@kroah.com>
References: <20220907150457.2572474-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907150457.2572474-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 05:04:53PM +0200, Michael Grzeschik wrote:
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

This really is a "v9", the use of RESEND and "fixed+" will play havoc
with our tools.

Please fix up and try a real v10.

thanks,

greg k-h
