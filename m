Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB2C4830B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbiACLqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:46:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiACLqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:46:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF7CCCC;
        Mon,  3 Jan 2022 12:46:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641210366;
        bh=JHzXOlhQ9AjgwYGM32oOxjhQNtGF8eif+zXtI4/iirw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H4J10M4+pHscaqjmy8AXxSKZwTkO1fPDDLb4Z4w5u5Hi4zimfzwfGrb4eGH/USZWN
         7BzdrOodzj6U1utTe/rcN2eRGKddgC191zBgFV7ZJiZjLFpGwzBCVEKczhPt9sKSxL
         aaeMb42468Wa8I2L2vCsBEk1v9CJcheOquvDdVH4=
Date:   Mon, 3 Jan 2022 13:46:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <YdLh+rw3/X3h1xOy@pendragon.ideasonboard.com>
References: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
 <20211206230717.5836-3-laurent.pinchart@ideasonboard.com>
 <2429f182-baea-1fd8-424c-9ad580e5904a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2429f182-baea-1fd8-424c-9ad580e5904a@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jan 03, 2022 at 11:38:18AM +0200, Tomi Valkeinen wrote:
> On 07/12/2021 01:07, Laurent Pinchart wrote:
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
> > Changes since v1:
> > 
> > - Drop unneeded debug message
> > - Fix MODULE_LICENSE
> > - Fix priv pointer retrieval in remove()
> > - Add more registers macros
> > - Fix PLL calculation
> > - Update to subdev state API
> > - Fix test pattern when starting streaming
> 
> Looks good to me:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Jfyi, I tested this on my FPDLink setup. I, of course, needed to add the 
> multiplexed streams and routing support, but aside that, there are two 
> things I needed:
> 
> - The pclk has to be 96MHz, so I just hardcoded it to 96MHz in the 
> ov1063x_pll_setup.

I'll have to rework the PLL setup as requested by Sakari, this should
then become easier as the link frequency will be specified in DT.

> - I commented out the writing of the three registers in 
> ov1063x_configure() under /* Sensor configuration */. If these are 
> enabled, 96MHz pclk doesn't work for me. I have no idea about this.

Lovely, more fun looming ahead :-)

-- 
Regards,

Laurent Pinchart
