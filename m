Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C3A64193B
	for <lists+linux-media@lfdr.de>; Sat,  3 Dec 2022 22:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiLCV3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Dec 2022 16:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiLCV3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Dec 2022 16:29:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF971B7A3;
        Sat,  3 Dec 2022 13:29:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ECCA993;
        Sat,  3 Dec 2022 22:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670102942;
        bh=nAqtfvMNjfjaBTNIv2cNIPuLeOgxoJWZRuZnQGrHG7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pXWj+xg89T9J+cgGbiNrHHDjSWnEL+S7+ZCIT9xtj/wLxRqkgUnbkfhPsrllh3dFx
         wNaTBIe+vj625aTNhI2C2k5ZkV+qGzZg+6O3w5JT3stULwtBTWaz0zmxHhaJzivNIS
         A3Sz9KZ2+wu7JAYwV1y+0xrU8i3k5WHaFvDXj24Q=
Date:   Sat, 3 Dec 2022 23:29:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v7] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <Y4u/nJGNrBsqDDm/@pendragon.ideasonboard.com>
References: <20221128103124.655264-1-m.grzeschik@pengutronix.de>
 <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
 <20221129102308.GO18924@pengutronix.de>
 <Y4X0unPRK7iAnfaH@pendragon.ideasonboard.com>
 <20221129152259.GQ18924@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129152259.GQ18924@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 29, 2022 at 04:22:59PM +0100, Michael Grzeschik wrote:
> On Tue, Nov 29, 2022 at 02:02:02PM +0200, Laurent Pinchart wrote:
> >Hi Michael,
> >
> >On Tue, Nov 29, 2022 at 11:23:08AM +0100, Michael Grzeschik wrote:
> >> On Tue, Nov 29, 2022 at 05:10:24AM +0200, Laurent Pinchart wrote:
> >> > On Mon, Nov 28, 2022 at 11:31:25AM +0100, Michael Grzeschik wrote:
> >> >> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
> >> >> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
> >> >> needs to be validated. Since the kernel also knows the limits for valid
> >> >> cases, it can fixup the values in case the userspace is setting invalid
> >> >> data.
> >> >
> >> > Why is this a good idea ?
> >>
> >> Why is it not? We don't want the userspace to communicate other things
> >> to the host than what is configured in the configfs. If you only object
> >> the explanation, then I will improve the commit message and send an
> >> fixed v8. If you have more objections please share your doubts, thanks.
> >
> >What bothers me is that this patch silently clamps invalid value, trying
> >to hide the gadget userspace error from the host. It may allow the host
> >to proceed one step further, but if the gadget userspace got it wrong in
> >the first place, there's a very high chance it won't do the right thing
> >in the next step anyway. This will make debugging more complicated,
> >while at the same time not bringing much value.
> 
> I discussed this and we came up with a better approach. When the
> userspace will send UVCIOC_SEND_RESPONSE we can return with a negativ
> return value. Like EAGAIN if the validation was seeeing some trouble
> with the userspaces uvc_streaming_control feedback to the host.
> 
> The validation code will then still fixup the data, but instead of
> transfering this manipulated answer to the host, it will return the
> changes to the application with EAGAIN. So now the userspace can
> react to it and it should even point out misconfigurations between
> kernel and userspace and so will simplify the debugging.
> 
> How about that?

It still adds pointless complexity to the kernel. I see no reason at all
for this. You're trying to guard against userspace bugs by returning an
error code to the application that has bugs in the first place. Why
would it then handle the error correctly ?

Please drop these changes.

-- 
Regards,

Laurent Pinchart
