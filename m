Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7372B36EC26
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239032AbhD2OLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:11:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53254 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbhD2OLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:11:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A262145F;
        Thu, 29 Apr 2021 16:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619705424;
        bh=BRIcmu0jwebXwo+uZXpaeAASjNeP5VTEJ3famTbIawg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fd/zcWQfJlkpUxHnacy5syGlLrA0ZrpR7aok48HSH4SEsHoju8RgxiHL8GxcBOKMi
         UI3jePWdkiDWmfzmfCft+z+7iz0vTKAxE7tdPB/wr1pFoLI4SGd9sf4QnOfERe+UDp
         CzGcBhePuIo39HgMsFnCuGU6EfU3+Z54P/4SdkG4=
Date:   Thu, 29 Apr 2021 17:10:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 11/24] media: entity: Skip link validation for pads to
 which there is no route to
Message-ID: <YIq+Sni7nd5sY/VB@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
 <YHx1E3AWm2mzD4Gs@pendragon.ideasonboard.com>
 <20210420114153.GM3@paasikivi.fi.intel.com>
 <a6b24f1b-5e59-4622-de53-f2ae4beee6c6@ideasonboard.com>
 <20210429120612.GW3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210429120612.GW3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Apr 29, 2021 at 03:06:12PM +0300, Sakari Ailus wrote:
> On Fri, Apr 23, 2021 at 03:37:03PM +0300, Tomi Valkeinen wrote:
> > On 20/04/2021 14:41, Sakari Ailus wrote:
> > > On Sun, Apr 18, 2021 at 09:06:11PM +0300, Laurent Pinchart wrote:
> > > > Hi Tomi and Sakari,
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > There's an extra "to" in the subject line.
> > > > 
> > > > On Thu, Apr 15, 2021 at 04:04:37PM +0300, Tomi Valkeinen wrote:
> > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > 
> > > > > Links are validated along the pipeline which is about to start streaming.
> > > > > Not all the pads in entities that are traversed along that pipeline are
> > > > > part of the pipeline, however. Skip the link validation for such pads,
> > > > > and while at there rename "other_pad" to "local_pad" to convey the fact
> > > > > the route to be checked is internal to the entity.
> > > > 
> > > > Both "pad" and "local_pad" are local. I would have kept the "other_pad"
> > > 
> > > The pad that in the remote entity is not local. The other one could be
> > > called remote_pad though.
> > 
> > I'm not sure what you mean here. Aren't both pad and local_pad pads of a
> > single entity here? If so, I think Laurent's comment makes sense, and
> > other_pad is a better name.
> 
> I guess you could argue for either. I'm fine dropping the patch.

I think the patch is good, it's just the extra rename that puzzled me.

-- 
Regards,

Laurent Pinchart
