Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB4D641B90
	for <lists+linux-media@lfdr.de>; Sun,  4 Dec 2022 09:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiLDI33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Dec 2022 03:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiLDI3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Dec 2022 03:29:25 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B711788B;
        Sun,  4 Dec 2022 00:29:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6229FCE09FA;
        Sun,  4 Dec 2022 08:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B2CC433D6;
        Sun,  4 Dec 2022 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670142560;
        bh=+a58Xlrk1zPi1XTGswW/fpzCd8HEgPcXN9oAM3qng3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ItYEw8VOEtKMLq/2r6U0ly/j4C2Lidu+tiBqhbnzk+g0Ddmvp36fGOJfNkuA/TbRm
         bBgciIxRm+ztkjq6ZhkvPIQzB3p2isKI04kyrY+BRWxVNsIi1glQC08jHNazN+Snfp
         i2aOPaXSsmzOCTj8Yj/tUPcQXMXqVxdLwhjRs6r8=
Date:   Sun, 4 Dec 2022 09:29:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <Y4xaXHLoiPupWM6V@kroah.com>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
> Hi Michael,
> 
> On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> > This series improves the uvc video gadget by parsing the configfs
> > entries. With the configfs data, the userspace now is able to use simple
> > v4l2 api calls like enum and try_format to check for valid configurations
> > initially set by configfs.
> 
> I've realized that this whole series got merged, despite my multiple
> attempts to explain why I think it's not a good idea. The UVC gadget
> requires userspace support, and there's no point in trying to move all
> these things to the kernel side. It only bloats the kernel, makes the
> code more complex, more difficult to maintain, and will make UVC 1.5
> support more difficult.

I can easily revert them, but I did not see any objections to them
originally and so I merged them as is the normal method :)

thanks,

greg k-h
