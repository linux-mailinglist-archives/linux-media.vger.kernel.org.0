Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E545FAC26
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 08:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJKGHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 02:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJKGHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 02:07:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013BF868AF;
        Mon, 10 Oct 2022 23:07:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4C3CB80EBB;
        Tue, 11 Oct 2022 06:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9505C433C1;
        Tue, 11 Oct 2022 06:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665468459;
        bh=Ztn/SuQD1VKNGNL2CbvXzTt1o6hjQCqxd0wod5i/mYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RGlaBgG68ZDPqlsZo/D/GSCBpsdN2djsBQ7SqS0vadinmCO4ehd6yl24C2fpt/0ck
         TGwzcNvlVFDZ20w+Ghu6KSCZl6HSotcTqDTawqRxEFYoE1h6vpT7Cq2nNkvSWh00IX
         +EbEq4mFC53nI4GM5QU1kB3/MMnUQ/XV1X4pN+iQ=
Date:   Tue, 11 Oct 2022 08:08:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: default the ctrl request interface
 offsets
Message-ID: <Y0UIVtyyJCfpsKpT@kroah.com>
References: <20221010182028.402155-1-m.grzeschik@pengutronix.de>
 <Y0R+z9gtW1+Yd71d@kroah.com>
 <20221010210359.GG27626@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010210359.GG27626@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 10, 2022 at 11:03:59PM +0200, Michael Grzeschik wrote:
> On Mon, Oct 10, 2022 at 10:21:35PM +0200, Greg KH wrote:
> > On Mon, Oct 10, 2022 at 08:20:28PM +0200, Michael Grzeschik wrote:
> > > For the userspace it is needed to distinguish between requests for the
> > > control or streaming interface. The userspace would have to parse the
> > > configfs to know which interface index it has to compare the ctrl
> > > requests against. Since the interface numbers are not fixed, e.g. for
> > > composite gadgets, the interface offset depends on the setup.
> > > 
> > > The kernel has this information when handing over the ctrl request to
> > > the userspace. This patch removes the offset from the interface numbers
> > > and expose the default interface defines in the uapi g_uvc.h.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > ---
> > >  drivers/usb/gadget/function/f_uvc.c | 16 +++++++++++++---
> > >  include/uapi/linux/usb/g_uvc.h      |  3 +++
> > >  2 files changed, 16 insertions(+), 3 deletions(-)
> > 
> > This is a v2, what changed from v1?
> 
> v1 - v2: - removed the extra variable in struct uvc_event
>         - replacing the ctrl request bits in place
> 	 - included the move of the defualt interface defines to g_uvc.h

Great, please submit a v3 with that info.

thanks,

greg k-h
