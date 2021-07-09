Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37083C1FD7
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 09:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbhGIHJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 03:09:22 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:57254 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230121AbhGIHJW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Jul 2021 03:09:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 27E96FB03;
        Fri,  9 Jul 2021 09:06:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KuFWLnCZi7rJ; Fri,  9 Jul 2021 09:06:34 +0200 (CEST)
Date:   Fri, 9 Jul 2021 09:06:33 +0200
From:   Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v6 5/5] arm64: defconfig: enable VIDEO_HI846
Message-ID: <YOf1eZto5C8owA0Z@qwark.sigxcpu.org>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
 <20210628101054.828579-6-martin.kepplinger@puri.sm>
 <20210708130003.GA3@valkosipuli.retiisi.eu>
 <YOcWCVSXfV+cKJ6H@qwark.sigxcpu.org>
 <YOcbCBEToGGHizYI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOcbCBEToGGHizYI@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Thu, Jul 08, 2021 at 06:34:32PM +0300, Laurent Pinchart wrote:
> Hi Guido,
> 
> On Thu, Jul 08, 2021 at 05:13:13PM +0200, Guido Günther wrote:
> > On Thu, Jul 08, 2021 at 04:00:04PM +0300, Sakari Ailus wrote:
> > > On Mon, Jun 28, 2021 at 12:10:54PM +0200, Martin Kepplinger wrote:
> > > > Build the driver for the Hi-846 camera by default on arm64 where it's
> > > > going to be used on at least the imx8mq-librem5 board.
> > > > 
> > > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > > ---
> > > >  arch/arm64/configs/defconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index f423d08b9a71..bf27d9cfbdd5 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -666,6 +666,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
> > > >  CONFIG_VIDEO_QCOM_VENUS=m
> > > >  CONFIG_SDR_PLATFORM_DRIVERS=y
> > > >  CONFIG_VIDEO_RCAR_DRIF=m
> > > > +CONFIG_VIDEO_HI846=m
> > > >  CONFIG_VIDEO_IMX219=m
> > > >  CONFIG_VIDEO_OV5645=m
> > > >  CONFIG_VIDEO_QCOM_CAMSS=m
> > > 
> > > The same sensor may be or may not used on a given board (and certainly it's
> > > not specific to arm64). Is it desirable all arm64 systems compile this in
> > > by default?
> > > 
> > > There appear to be a other sensor drivers though.
> > > 
> > > Is there a defconfig for the librem5 board?
> > 
> > arm64 has a single defconfig, there are no board specific ones (and
> > afaik they're not wanted either) so I think enabling it as a module is
> > the only way.
> 
> Do sensor drivers qualify for defconfig support though ? If they do,
> they should all be enabled.

I don't know. The Librem 5 / Librem 5 Devkit bits went in via Shawn's
tree where the "here's a imx based board that uses this driver" was
sufficient to get it enabled (preferably as module) so it can work out
of the box.

Cheers,
 -- Guido

> 
> > > I wonder what others think.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
