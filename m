Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF40EB437
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 16:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbfJaPt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 11:49:28 -0400
Received: from retiisi.org.uk ([95.216.213.190]:35032 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726664AbfJaPt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 11:49:28 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id AE154634C87;
        Thu, 31 Oct 2019 17:48:34 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iQCgb-0001mv-Nb; Thu, 31 Oct 2019 17:48:33 +0200
Date:   Thu, 31 Oct 2019 17:48:33 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 0/2] Add IMX296 CMOS image sensor support
Message-ID: <20191031154833.GM6253@valkosipuli.retiisi.org.uk>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191031131644.GA8917@pendragon.ideasonboard.com>
 <20191031132352.GA24273@mani>
 <20191031132801.GC5018@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031132801.GC5018@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mani, Laurent,

On Thu, Oct 31, 2019 at 03:28:01PM +0200, Laurent Pinchart wrote:
> Hi Mani,
> 
> On Thu, Oct 31, 2019 at 06:53:52PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Oct 31, 2019 at 03:16:44PM +0200, Laurent Pinchart wrote:
> > > On Wed, Oct 30, 2019 at 03:19:00PM +0530, Manivannan Sadhasivam wrote:
> > > > Hello,
> > > > 
> > > > This patchset adds support for IMX296 CMOS image sensor from Sony.
> > > > Sensor can be programmed through I2C and 4-wire interface but the
> > > > current driver only supports I2C interface. The sensor is
> > > > capable of outputting frames in CSI2 format (1 Lane). In the case
> > > > of sensor resolution, driver only supports 1440x1088 at 30 FPS.
> > > > 
> > > > The driver has been validated using Framos IMX296 module interfaced to
> > > > 96Boards Dragonboard410c.
> > > 
> > > I've just been made aware of your work. I also worked on an IMX296
> > > sensor driver in parallel, which I will post to the list. My driver
> > > doesn't hardcode the resolution but computes register values at runtime,
> > > so I wonder if it could be a better option. I'll post it now.
> > 
> > I'm fine with it. The reason the driver is simple in the first place is, that's
> > how my usual workflow is. Start small and build it big ;-)
> > 
> > Anyway, I'm happy if your driver gets in.
> 
> My driver sometimes has trouble finding the sensor at probe time, so
> I'll study and try your code too. It could be a problem specific to my
> platform (I'm testing on a custom i.MX7 board).

Based on this discussion I'll mark the second patch of the set obsolete in
Patchwork.

Laurent: please see my comments on the driver as well.

-- 
Kind regards,

Sakari Ailus
