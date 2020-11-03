Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9233E2A3EC7
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 09:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgKCITr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 03:19:47 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48361 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgKCITr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 03:19:47 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4AF341C000D;
        Tue,  3 Nov 2020 08:19:44 +0000 (UTC)
Date:   Tue, 3 Nov 2020 09:19:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hugues.fruchet@st.com,
        sam@elite-embedded.com, slongerbeam@gmail.com,
        linux-media@vger.kernel.org
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
Message-ID: <20201103081945.pihysjlqha2noz2m@uno.localdomain>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <1bc29f6f-20b1-245e-c346-9c57058b9a24@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bc29f6f-20b1-245e-c346-9c57058b9a24@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,
    thanks for testing

On Tue, Nov 03, 2020 at 09:19:17AM +0200, Tomi Valkeinen wrote:
> Hi Jacopo,
>
> On 29/10/2020 00:57, Jacopo Mondi wrote:
> > Hi Hugues Tomi and Sam
> >
> >    this small series collects Tomi's patch on adjusting htot which has been
> > floating around for some time with a rework of the clock tree based on
> > Hugues' and Sam's work on setting pclk_period. It also address the need to
> > suppport LINK_FREQUENCY control as pointed out by Hugues.
> >
> > I'm sort of happy with the result as I've removed quite some chrun and the clock
> > tree calculation is more linear. All modes work except full-resolution which a
> > bit annoys me, as I can't select it through s_fmt (to be honest I have not
> > investigated that in detail, that's why an RFC).
> >
> > Framerate is better than before, but still off for some combinations:
> > 640x480@30 gives me ~40 FPS, 1920x1080@15 gives me ~7.
> > The other combinations I've tested looks good.
> >
> > Can I have your opinion on these changes and if they help you with your
> > platforms?
> >
> > I've only been able to test YUYV, support for formats with != bpp will need
> > some work most probably, but that was like this before (although iirc Hugues
> > has captured JPEG, right ?)
> >
> > There's a bit more cleanup on top to be done (I've left TODOs around) and
> > probably the HBLANK calculation should be checked to see if it works with the
> > new htot values.
>
> Unfortunately the second patch seems to break capture on AM6 EVM + OV5640. The effect is pretty odd.
> The picture is very dark, with odd vertical lines, but it's still capturing something as I can see a
> correctly shaped shadow of my hand if I wave my hand over the sensor.

This saddens me quite a lot :( The current clock tree programming
procedure is horrid and it has been bugging me for 2 years now :(

Is capture broken in all modes, or have you tested a single one ?

>
>  Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
