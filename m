Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A969B399206
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 19:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhFBR7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 13:59:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBR7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 13:59:44 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE81AD97;
        Wed,  2 Jun 2021 19:57:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622656679;
        bh=j5Dto5uF6GSs+WOklTsW00y8nQqle4dGp7ECq4A6QHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PG7YMTpI+ungokDfiRoie5c19S7Y0col6BJU4wH8TzxuUfV41QBb+kcrJrjzdo1hU
         6Qx/WN9u9v2SU2qNzNbQkljQfYvQcvdOWI23DQGCXJqOccqbk4A6Jq1kLt1oGcwkfD
         pwfNrpPvpVso7mIzfq6rI9aSNqYwOEu4qJHIpiLk=
Date:   Wed, 2 Jun 2021 20:57:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     pavel@ucw.cz, krzysztof.kozlowski@canonical.com,
        mchehab@kernel.org, paul.kocialkowski@bootlin.com, robh@kernel.org,
        shawnx.tu@intel.com, devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: i2c: add driver for the SK Hynix Hi-846 8M
 pixel camera
Message-ID: <YLfGm0TD4m3fXEao@pendragon.ideasonboard.com>
References: <20210531120737.168496-1-martin.kepplinger@puri.sm>
 <20210531120737.168496-4-martin.kepplinger@puri.sm>
 <YLV7+tuTZbr3boTw@pendragon.ideasonboard.com>
 <84292af283a5a37289940478a25402631018c973.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84292af283a5a37289940478a25402631018c973.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Wed, Jun 02, 2021 at 02:00:11PM +0200, Martin Kepplinger wrote:
> Am Dienstag, dem 01.06.2021 um 03:14 +0300 schrieb Laurent Pinchart:
> > On Mon, May 31, 2021 at 02:07:35PM +0200, Martin Kepplinger wrote:
> > > The SK Hynix Hi-846 is a 1/4" 8M Pixel CMOS Image Sensor. It supports
> > > usual features like I2C control, CSI-2 for frame data, digital/analog
> > > gain control or test patterns.
> > > 
> > > This driver supports the 640x480, 1280x720 and 1632x1224 resolution
> > > modes. It supports runtime PM in order not to draw any unnecessary
> > > power.
> > > 
> > > The part is also called YACG4D0C9SHC and a datasheet can be found at
> > > https://product.skhynix.com/products/cis/cis.go
> > > 
> > > The large sets of partly undocumented register values are for example
> > > found when searching for the hi846_mipi_raw_Sensor.c Android driver.
> > 
> > A common story, unfortunately :-S
> > 
> > I've done an initial review, I'll likely have more comments on v4, but
> > you should have quite a few things to address already :-)
> > 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > ---
> > >  MAINTAINERS                |    6 +
> > >  drivers/media/i2c/Kconfig  |   13 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/hi846.c  | 2138 ++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 2158 insertions(+)
> > >  create mode 100644 drivers/media/i2c/hi846.c

[snip]

> Thank you, Laurent for that wonderful review. It made me rework/fix the
> power supply interface + sequencing in the driver (and even better
> understand how it's supplied on my board).
> 
> I want to take all your review into account for a next revision, except
> for the additional bits for the register definitions, that should
> encode the length, if that's ok. We can choose whether to write 1 or 2
> bytes at a given address and it just looks nice and simple to me as it
> is.

I won't push strongly, but in my experience it's error-prone, as it's
easy to select the incorrect number of bytes. That's what led me to
create this mechanism to bundle register addresses and sizes, it has
simplified my life when writing drivers. I think it should actually be
turned into a helper, possibly provided by regmap.

-- 
Regards,

Laurent Pinchart
