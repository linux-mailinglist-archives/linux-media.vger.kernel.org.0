Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5939C6436AA
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 22:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbiLEVRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 16:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbiLEVRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 16:17:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5901B2B61D;
        Mon,  5 Dec 2022 13:17:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4F34589;
        Mon,  5 Dec 2022 22:17:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670275038;
        bh=Y+OyTcoDSOHtxwOSNvGnkzOmsXXtUzLgi8zJ7E0AovM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bNuX5ngDIZaq3U3co1zuJbfeXWEBonPVm2Cb8O5o9/WIMOTo8qnbf0//mmvidpGaQ
         R5883zwhZDP0jzgOM1aDF4MAc9G4/uddNRaUADw40iEcA9Q+Ima9TCCik155MTc/SO
         6DuL+pX7t41xQI2lG0hni2/VSGGG/6DUJC+JQZ0s=
Date:   Mon, 5 Dec 2022 23:17:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <Y45f272a3aa7KXly@pendragon.ideasonboard.com>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
 <Y4xaXHLoiPupWM6V@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4xaXHLoiPupWM6V@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 04, 2022 at 09:29:16AM +0100, Greg KH wrote:
> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
> > Hi Michael,
> > 
> > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> > > This series improves the uvc video gadget by parsing the configfs
> > > entries. With the configfs data, the userspace now is able to use simple
> > > v4l2 api calls like enum and try_format to check for valid configurations
> > > initially set by configfs.
> > 
> > I've realized that this whole series got merged, despite my multiple
> > attempts to explain why I think it's not a good idea. The UVC gadget
> > requires userspace support, and there's no point in trying to move all
> > these things to the kernel side. It only bloats the kernel, makes the
> > code more complex, more difficult to maintain, and will make UVC 1.5
> > support more difficult.
> 
> I can easily revert them, but I did not see any objections to them
> originally and so I merged them as is the normal method :)

I don't think a revert is needed. The issue I pointed out regarding the
duplication of static const data can be solved on top. The API additions
from this series are, in my opinion, not a good idea for the reasons I
explained, but they don't hurt so much that we need to go nuclear on
this.

Michael, will you be addressing the static const data issue ?

-- 
Regards,

Laurent Pinchart
