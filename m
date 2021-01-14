Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57DB2F5A74
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 06:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbhANFdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 00:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhANFdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 00:33:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CD2C061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 21:32:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F899279;
        Thu, 14 Jan 2021 06:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610602345;
        bh=d3x2NpXgrQdm+He7VpOYvGQNrwq2KppuGvWiVjkYjmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GwZWufMCqB3hIwMuDU58WSSA/IfWOgnJa3P12/EYAO5cxcTdfzDg4vAiPNs/1mgSx
         FRcd9QBffP8AK9rO5JK50kKn1/jdc7Tf4nkkzyYzNQ8z64IF3IoNqM+bcfsiDOAxw6
         UT492VsBTcF3KuI9TJAFUitWryqt7yoFhNOoFR7I=
Date:   Thu, 14 Jan 2021 07:32:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <X//XWJ5NG/FGjUf/@pendragon.ideasonboard.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
 <4aede7cc-13b9-5df6-cf50-891ac6779822@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4aede7cc-13b9-5df6-cf50-891ac6779822@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Jan 12, 2021 at 03:32:30PM +0200, Tomi Valkeinen wrote:
> On 04/01/2021 07:39, Laurent Pinchart wrote:
> > Add a new V4L2 subdev driver for the OmniVision OV10633 and OV10635
> > camera sensors. The work is based on the driver from the TI BSP, itself
> > based on original work by Phil Edworthy posted to the linux-media
> > mailing list ([1]). This version of the code is a large rewrite of many
> > parts.
> > 
> > [1] http://www.spinics.net/lists/linux-media/msg64347.html
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> 
> <snip>
> 
> > +static int ov1063x_remove(struct i2c_client *client)
> > +{
> > +	struct ov1063x_priv *priv = i2c_get_clientdata(client);
> 
> This should be
> 
> 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> 	struct ov1063x_priv *priv = to_ov1063x(sd);
> 
> Let me guess, you never tried as a module? ;)

I don't know what you're talking about, I load the driver as a module.
The trick is to never unload it ;-)

-- 
Regards,

Laurent Pinchart
