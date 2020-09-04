Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3C625D686
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 12:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgIDKke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 06:40:34 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:38157 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729957AbgIDKkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 06:40:31 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7269C1C000D;
        Fri,  4 Sep 2020 10:40:27 +0000 (UTC)
Date:   Fri, 4 Sep 2020 12:44:14 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/3] media: i2c: ov5640: Enable data pins on poweron
 for DVP mode
Message-ID: <20200904104414.ilqc2qhustefiwdx@uno.localdomain>
References: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200813171337.5540-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200901221052.GC32646@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200901221052.GC32646@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar, Sakari,

On Wed, Sep 02, 2020 at 01:10:53AM +0300, Sakari Ailus wrote:
> Hi Prabhakar,
>
> My apologies for the late reply.
>
> On Thu, Aug 13, 2020 at 06:13:35PM +0100, Lad Prabhakar wrote:
> > During testing this sensor on iW-RainboW-G21D-Qseven platform in 8-bit DVP
> > mode with rcar-vin bridge noticed the capture worked fine for the first run
> > (with yavta), but for subsequent runs the bridge driver waited for the
> > frame to be captured. Debugging further noticed the data lines were
> > enabled/disabled in stream on/off callback and dumping the register
> > contents 0x3017/0x3018 in ov5640_set_stream_dvp() reported the correct
> > values, but yet frame capturing failed.
> >
> > To get around this issue the following actions are performed for
> > parallel mode (DVP):
> > 1: Keeps the sensor in software power down mode and is woken up only in
> >    ov5640_set_stream_dvp() callback.
>
> I'd suppose with s_power, the main driver would power the device off
> when it's not streaming.
>
> > 2: Enables data lines in s_power callback
> > 3: Configures HVP lines in s_power callback instead of configuring
> >    everytime in ov5640_set_stream_dvp().
> > 4: Disables MIPI interface.
>
> Could you split this into two (or even more) patches so that the first
> refactors the receiver setup and another one changes how it actually works?
> That way this would be quite a bit easier to review.
>
> While some of the above seem entirely reasonable, the changes are vast and
> testing should be done on different boards to make sure things won't break.
> That said, this depends on others who have the hardware.

I left it as a comment during review of v2, but now more formally:

For CSI-2 capture operations:
Tested-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>
> --
> Kind regards,
>
> Sakari Ailus
