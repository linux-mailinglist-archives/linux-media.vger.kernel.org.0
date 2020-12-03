Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DA62CDCC9
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 18:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731486AbgLCRwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 12:52:34 -0500
Received: from retiisi.eu ([95.216.213.190]:44012 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731012AbgLCRwc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 12:52:32 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 37451634C24;
        Thu,  3 Dec 2020 19:50:35 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kkskV-0003FO-L5; Thu, 03 Dec 2020 19:50:35 +0200
Date:   Thu, 3 Dec 2020 19:50:35 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: media: Document BCM283x CSI2/CCP2
 receiver
Message-ID: <20201203175035.GI4351@valkosipuli.retiisi.org.uk>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-3-jacopo@jmondi.org>
 <20201202212031.GY4351@valkosipuli.retiisi.org.uk>
 <20201203164417.y3vrabzjhalhahmh@uno.localdomain>
 <20201203172519.GG4351@valkosipuli.retiisi.org.uk>
 <20201203173733.wmdjr2cpii3ab75s@uno.localdomain>
 <20201203174102.GH4351@valkosipuli.retiisi.org.uk>
 <20201203175027.e46qw4ildmaew6dz@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203175027.e46qw4ildmaew6dz@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 03, 2020 at 06:50:27PM +0100, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Thu, Dec 03, 2020 at 07:41:02PM +0200, Sakari Ailus wrote:
> 
> [snip]
> 
> > >
> > > Ah! maximum: 8. I was about to reply to Rob's video-interfaces
> > > conversion and this might need to be pointed out.
> > > I was also about to ask it it's an issue if the bindings validation
> > > does not catch arrays as: [1, 3] as the constraint of being
> > > monotonically increasing values is expressed in words only. I guess
> > > it's fine, the alternative syntax is awful:
> > >
> > >             anyOf:
> > >               - items:
> > >                 - const: 1
> > >                 - const: 2
> > >               - items:
> > >                 - const: 1
> > >                 - const: 2
> > >                 - const: 3
> > >                 - const: 4
> >
> > The v4l2-fwnode framework doesn't do that, what it does check for, though,
> 
> I meant the dt-validation :)

I think it'd be very nice to have that check there, too. :-)

-- 
Sakari Ailus
