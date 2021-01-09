Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7332EFC9E
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 02:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbhAIBLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 20:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbhAIBLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 20:11:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E926C061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 17:11:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 046FDDA;
        Sat,  9 Jan 2021 02:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610154663;
        bh=vgQe4vhX4wb01npxhMEht4ZlvF5nje3y96Dc+DQF3GE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qxp3XMRxj1EDEzloS+zPd4rATg8/sIL6sJM3eIdJKP64ZuHbLAfiqIRibqK25LBsG
         9t78b8cU9SbHSl21rhRqpQKoIa2PCzqYs4R49B0nD2TYaSk+BaL12bHsyp2l7mGO8U
         ds2jIEKr7tSwz4dzp22KcqdzTeQ0YwOyjjrA2ZGY=
Date:   Sat, 9 Jan 2021 03:10:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
Message-ID: <X/kCmomKdjh3Yepp@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
 <X/XaJ0UA04ekdWpi@pendragon.ideasonboard.com>
 <CAOMZO5CkT1i3TMhC=VuZ4c3B6VnKX7jDj6wYON9VLMyQdDODKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5CkT1i3TMhC=VuZ4c3B6VnKX7jDj6wYON9VLMyQdDODKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Jan 06, 2021 at 06:10:44PM -0300, Fabio Estevam wrote:
> On Wed, Jan 6, 2021 at 12:41 PM Laurent Pinchart wrote:
> 
> > Would you be able to bisect this ?
> 
> Sure, the commit the broke camera capture on a imx6ul-evk board was:
> 
> commit d2c66a98046a42ccb7d8a7b761a5dd6867815171
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Tue Mar 10 16:04:01 2020 +0200
> 
>     media: imx: imx7-media-csi: Disable legacy video node API
> 
>     Support for the MC-centric API has been tested on the i.MX7. Enable it
>     for that platform. i.MX6 should be converted next.
> 
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If I use your imx/csi/imx7 branch, and then revert the above commit,
> camera capture works for me (with the additional patch from me and Rui
> as discussed in the other thread).

Ah of course, I should have mentioned that, sorry. Without the legacy
video node API, the pipeline has to be configured with the MC API and
the V4L2 subdev userspace API before starting the stream.

-- 
Regards,

Laurent Pinchart
