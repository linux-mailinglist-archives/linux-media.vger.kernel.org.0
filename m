Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D007718A00
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 14:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfEIMsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 08:48:30 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46067 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfEIMsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 08:48:30 -0400
X-Originating-IP: 90.88.28.253
Received: from aptenodytes (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr [90.88.28.253])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4775320010;
        Thu,  9 May 2019 12:48:28 +0000 (UTC)
Message-ID: <0cef8bf19e401529750e76d24ef634c543eefe1b.camel@bootlin.com>
Subject: Re: Support for 2D engines/blitters in V4L2 and DRM
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        linux-media@vger.kernel.org
Date:   Thu, 09 May 2019 14:48:11 +0200
In-Reply-To: <5CD3EFEE.5732.6BF8A27D@Frantisek.Rysanek.post.cz>
References: <0df3d4b5178d8a37b67b275e0771741c6c268de3.camel@bootlin.com>
        , <20190506112835.6d4ecf29@eldfell.localdomain>
        , <6ffb32e804a27557ca49216c4d8f117837c78f4e.camel@bootlin.com>
         <5CD3EFEE.5732.6BF8A27D@Frantisek.Rysanek.post.cz>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey,

On Thu, 2019-05-09 at 11:16 +0200, Frantisek Rysanek wrote:
> Dear gentlemen,
> 
> I've noticed your debate - the topic is something simple enough for 
> me to superficially grasp and "blitting in the DRI/drmfb" is 
> something I've been wondering about for a while.
> Thanks for sharing your insight.
> 
> What actually prompted me to respond is this:
> vaguely in the context of your debate, this is what Google has 
> revealed to my casual query on the topic:
> 
> https://www.phoronix.com/scan.php?page=news_item&px=Intel-Mesa-Blitter
> -RIP
> 
> It's not a blow at the heart of the hypothetical "blitting API in 
> DRI", but given the market share of Intel, it does look like a splash 
> of cold water in the broader context, or does it?

Not really actually. I agree that mesa is not the right place to handle
2D blitters, so it makes sense to kick them out of it :)

As for DRI2, it seems that the interface is pretty much deprecated with
Wayland and I think everyone wants to go towards that, so I don't plan
on any DRI2 integration at this stage. This would typically be used in
a Xorg DDX anyway (not by applications), so DRI2 wouldn't even be
necessary,

Note that DRI2 and DRM are two very distinct things and I'm only
interested in the DRM side sofar.

> If the "DRI blitting API" should go forward, could the Intel DRI 
> driver in the kernel maybe take inspiration from MESA's approach?

The idea would be that the Intel DRM driver stays supported by mesa for
the 3D rendering part and by DRM/KMS for the display part. If the
hardware has fixed-pipeline 2D blocks, then these can be integrated
with the new API I'm interested in bringing up, which would be a third
distinct thing.

> I know I know - Intel may be strongish in the desktop and general x86 
> market, but apart from the Nvidia vs. AMD wars, Linux actually runs 
> on a number of non-x86 embedded SoCs that have a plethora of small 
> proprietary GPU's, the CPU horsepower and RAM bandwidth may be scarce 
> (though not as a rule), X11 is not mandatory and HW blitting may 
> actually matter...

It sure does, indeed! The situation you are describing for non-x86 is
exactly the problem I want to help tackle with this :)

Cheers and thanks for your interest,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

