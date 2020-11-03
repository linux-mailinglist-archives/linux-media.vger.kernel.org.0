Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B272A4345
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 11:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgKCKhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 05:37:55 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:45409 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728536AbgKCKhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 05:37:51 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3E802100009;
        Tue,  3 Nov 2020 10:37:47 +0000 (UTC)
Date:   Tue, 3 Nov 2020 11:37:49 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hugues.fruchet@st.com,
        sam@elite-embedded.com, slongerbeam@gmail.com,
        linux-media@vger.kernel.org
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
Message-ID: <20201103103749.hawwasaob7u3djky@uno.localdomain>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <1bc29f6f-20b1-245e-c346-9c57058b9a24@ti.com>
 <20201103081945.pihysjlqha2noz2m@uno.localdomain>
 <1123502e-f82f-182d-cf44-899fe54392f8@ti.com>
 <20201103084544.ocgt33at7tkaumxv@uno.localdomain>
 <82ccf16d-b9d1-ad95-07cd-442d7696a0bb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82ccf16d-b9d1-ad95-07cd-442d7696a0bb@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Nov 03, 2020 at 11:31:06AM +0200, Tomi Valkeinen wrote:
> On 03/11/2020 10:45, Jacopo Mondi wrote:
>
> >> I tested 640x480, 720x480, 720x576.
> >>
> >> I have only this sensor to test the CSI RX on AM6 EVM, so I would not be surprised if there are
> >> issues in the CSI RX driver (too). But this is super frustrating to debug, as the sensor is a badly
> >> documented black box, and I don't have means to probe the CSI lines...
> >
> > I see.. I'm sure you noticed, but as you mentioned the 'second patch'
> > I'll point it out anyway: the series has to be applied in full, as the
> > last patch adds support for reporting the link frequency, that has
> > been re-calculated by patch 2/3. On imx6 and on Hugues' platforms
> > adjusting the receiver's link frequency based on what's reported makes a
> > difference.
>
> Yes, I first tried with all three, then tested one by one, and the second one started failing.
>

Ok, thanks for the clarification.

> drivers/media/platform/ti-vpe/cal-camerarx.c doesn't use V4L2_CID_LINK_FREQ (it uses
> V4L2_CID_PIXEL_RATE), though, so why would the third patch matter? Or do you mean that
> V4L2_CID_LINK_FREQ must be used to get ov5640 work? Aren't pixel rate and link freq directly linked?

Oh I see. As I read in the driver the PIXEL_RATE control gets only
updated when the frame interval is changed. It should be probably
updated when the mode changes as well. Although, it would be fairly
easy to deduct the pixel rate from the link frequency in the receiver.

>
>  Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
