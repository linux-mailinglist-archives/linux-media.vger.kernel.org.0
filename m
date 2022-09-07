Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1EDC5B0693
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiIGO3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiIGO3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:29:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF137796BD;
        Wed,  7 Sep 2022 07:28:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A12B4B81D3C;
        Wed,  7 Sep 2022 14:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8EFC433D7;
        Wed,  7 Sep 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662560917;
        bh=kIp3nJ5A9VF94XoCWwemUr/svJYrnPp3XDh/SyImS0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sFnCM1dtJPIAmTPGx50AFCtW4YOg7xiw3+FzU9JPsaJc751kksD7UwX4wINrgXRUs
         gf2T8Xsl9DwFUYeAJQvjzNvAM+ZBYT7ubffXBVTOWDM7ViYmM/1GLZTiQ5WRh5KP/8
         JNL3o0CAPEZl0XCOZHiePhNU/+S24Gg6KoFnsHJU=
Date:   Wed, 7 Sep 2022 16:28:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v8 0/4] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <YxiqkhQl60E+tnAB@kroah.com>
References: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 04:02:50PM +0200, Michael Grzeschik wrote:
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
> 
> --
> 
> v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@pengutronix.de/
> v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzeschik@pengutronix.de/
> v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzeschik@pengutronix.de/
> v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschik@pengutronix.de/
> v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzeschik@pengutronix.de/
> v6: https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzeschik@pengutronix.de/
> v7: https://lore.kernel.org/linux-usb/20220608105748.139922-1-m.grzeschik@pengutronix.de/

Please say what changed somewhere :(

Anyway, this patch series does not even build properly:

drivers/usb/gadget/function/uvc_v4l2.c: In function ‘uvc_v4l2_get_format’:
drivers/usb/gadget/function/uvc_v4l2.c:258:42: error: ‘struct uvc_video’ has no member named ‘bpp’
  258 |         fmt->fmt.pix.bytesperline = video->bpp * video->width / 8;
      |                                          ^~
drivers/usb/gadget/function/uvc_v4l2.c:258:55: error: ‘struct uvc_video’ has no member named ‘width’
  258 |         fmt->fmt.pix.bytesperline = video->bpp * video->width / 8;
      |                                                       ^~
drivers/usb/gadget/function/uvc_v4l2.c:259:39: error: ‘struct uvc_video’ has no member named ‘imagesize’
  259 |         fmt->fmt.pix.sizeimage = video->imagesize;
      |                                       ^~
drivers/usb/gadget/function/uvc_v4l2.c: In function ‘uvc_v4l2_try_format’:
drivers/usb/gadget/function/uvc_v4l2.c:316:37: error: ‘bpl’ undeclared (first use in this function)
  316 |         fmt->fmt.pix.bytesperline = bpl;
      |                                     ^~~
drivers/usb/gadget/function/uvc_v4l2.c:316:37: note: each undeclared identifier is reported only once for each function it appears in
drivers/usb/gadget/function/uvc_v4l2.c:317:34: error: ‘imagesize’ undeclared (first use in this function); did you mean ‘page_size’?
  317 |         fmt->fmt.pix.sizeimage = imagesize;
      |                                  ^~~~~~~~~
      |                                  page_size


What did you test this with?

thanks,

greg k-h
