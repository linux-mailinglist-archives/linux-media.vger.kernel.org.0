Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2AB2CDCB9
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 18:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731196AbgLCRvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 12:51:05 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:42143 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbgLCRvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 12:51:05 -0500
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AA69110000A;
        Thu,  3 Dec 2020 17:50:20 +0000 (UTC)
Date:   Thu, 3 Dec 2020 18:50:27 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: media: Document BCM283x CSI2/CCP2
 receiver
Message-ID: <20201203175027.e46qw4ildmaew6dz@uno.localdomain>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-3-jacopo@jmondi.org>
 <20201202212031.GY4351@valkosipuli.retiisi.org.uk>
 <20201203164417.y3vrabzjhalhahmh@uno.localdomain>
 <20201203172519.GG4351@valkosipuli.retiisi.org.uk>
 <20201203173733.wmdjr2cpii3ab75s@uno.localdomain>
 <20201203174102.GH4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201203174102.GH4351@valkosipuli.retiisi.org.uk>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Dec 03, 2020 at 07:41:02PM +0200, Sakari Ailus wrote:

[snip]

> >
> > Ah! maximum: 8. I was about to reply to Rob's video-interfaces
> > conversion and this might need to be pointed out.
> > I was also about to ask it it's an issue if the bindings validation
> > does not catch arrays as: [1, 3] as the constraint of being
> > monotonically increasing values is expressed in words only. I guess
> > it's fine, the alternative syntax is awful:
> >
> >             anyOf:
> >               - items:
> >                 - const: 1
> >                 - const: 2
> >               - items:
> >                 - const: 1
> >                 - const: 2
> >                 - const: 3
> >                 - const: 4
>
> The v4l2-fwnode framework doesn't do that, what it does check for, though,

I meant the dt-validation :)

> is that the same lane isn't used in more than a single position. After that
> it's up to the driver to make use of the configuration provided. If the
> driver doesn't support lane reordering, then it just ignores that
> information (well, devices where lane allocation to PHYs isn't static need
> some more than this).
>
> --
> Regards,
>
> Sakari Ailus
