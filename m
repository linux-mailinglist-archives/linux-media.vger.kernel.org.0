Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5AA644DFC
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 22:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiLFVa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 16:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLFVaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 16:30:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCD63E080;
        Tue,  6 Dec 2022 13:30:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43C303D7;
        Tue,  6 Dec 2022 22:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670362251;
        bh=tBs83M2QsBCN9NOTFveDIruLwYdE0mCD5qEcCwI9UXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZfuPoBwH/eycgqpIiHEImgFsXQw9ZPWNbxUZL370cEaQI27RLI/GzdyMFVqQCkWDz
         FlBeXnKzNz+E8RDLnJrqKbECPHUPK6sYTelcb0uF1NFnCbCpzyizSMoLYV0W66rzQ4
         49fAiSlkNr89t4kIAXyBYzq5Sh6XHkk8nMnC6qYM=
Date:   Tue, 6 Dec 2022 23:30:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <Y4+0iK460LL0dKPE@pendragon.ideasonboard.com>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
 <Y4xaXHLoiPupWM6V@kroah.com>
 <Y45f272a3aa7KXly@pendragon.ideasonboard.com>
 <20221206170721.GB15222@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221206170721.GB15222@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Tue, Dec 06, 2022 at 06:07:21PM +0100, Michael Grzeschik wrote:
> On Mon, Dec 05, 2022 at 11:17:15PM +0200, Laurent Pinchart wrote:
> >On Sun, Dec 04, 2022 at 09:29:16AM +0100, Greg KH wrote:
> >> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
> >> > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> >> > > This series improves the uvc video gadget by parsing the configfs
> >> > > entries. With the configfs data, the userspace now is able to use simple
> >> > > v4l2 api calls like enum and try_format to check for valid configurations
> >> > > initially set by configfs.
> >> >
> >> > I've realized that this whole series got merged, despite my multiple
> >> > attempts to explain why I think it's not a good idea. The UVC gadget
> >> > requires userspace support, and there's no point in trying to move all
> >> > these things to the kernel side. It only bloats the kernel, makes the
> >> > code more complex, more difficult to maintain, and will make UVC 1.5
> >> > support more difficult.
> >>
> >> I can easily revert them, but I did not see any objections to them
> >> originally and so I merged them as is the normal method :)
> >
> > I don't think a revert is needed. The issue I pointed out regarding the
> > duplication of static const data can be solved on top. The API additions
> > from this series are, in my opinion, not a good idea for the reasons I
> > explained, but they don't hurt so much that we need to go nuclear on
> > this.
> >
> > Michael, will you be addressing the static const data issue ?
> 
> Yes. I will also move the uvc_fmts[] array and uvc_format_by_guid to its
> own compile unit.

Thank you.

> I will go with drivers/media/usb/uvc.c
> 
> While at it the headerfile will better also be moved from
> include/media/v4l2-uvc.h to linux/usb/uvc.h.

Works for me, especially for the GUIDs. For the structure and function
prototype, I don't mind using include/media/, up to you.

-- 
Regards,

Laurent Pinchart
