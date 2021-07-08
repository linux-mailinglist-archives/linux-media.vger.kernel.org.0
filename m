Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CEE3C1613
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 17:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhGHPiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 11:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhGHPiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 11:38:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A25FC061574;
        Thu,  8 Jul 2021 08:35:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE8C6E7;
        Thu,  8 Jul 2021 17:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625758516;
        bh=lOmALG0jk8RYjnY4adsYErJuURf+RDznyPMxzd4bb1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S+muCAkgJA/b0w+idZS7KSahEarx51z33dYV/lit22D6HYQJqSO/Y2sYUL0zk0cH1
         cO0fGTWNAeNUM8asITNmKjY4n+Upyzn77WXmbCNZtluPrqqxkHinKBE05nGx/808I9
         tjSYv8hhL+83u9+EgtDUOHzwCbdp+JvNkqiXCUEA=
Date:   Thu, 8 Jul 2021 18:34:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v6 5/5] arm64: defconfig: enable VIDEO_HI846
Message-ID: <YOcbCBEToGGHizYI@pendragon.ideasonboard.com>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
 <20210628101054.828579-6-martin.kepplinger@puri.sm>
 <20210708130003.GA3@valkosipuli.retiisi.eu>
 <YOcWCVSXfV+cKJ6H@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOcWCVSXfV+cKJ6H@qwark.sigxcpu.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guido,

On Thu, Jul 08, 2021 at 05:13:13PM +0200, Guido Günther wrote:
> On Thu, Jul 08, 2021 at 04:00:04PM +0300, Sakari Ailus wrote:
> > On Mon, Jun 28, 2021 at 12:10:54PM +0200, Martin Kepplinger wrote:
> > > Build the driver for the Hi-846 camera by default on arm64 where it's
> > > going to be used on at least the imx8mq-librem5 board.
> > > 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index f423d08b9a71..bf27d9cfbdd5 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -666,6 +666,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
> > >  CONFIG_VIDEO_QCOM_VENUS=m
> > >  CONFIG_SDR_PLATFORM_DRIVERS=y
> > >  CONFIG_VIDEO_RCAR_DRIF=m
> > > +CONFIG_VIDEO_HI846=m
> > >  CONFIG_VIDEO_IMX219=m
> > >  CONFIG_VIDEO_OV5645=m
> > >  CONFIG_VIDEO_QCOM_CAMSS=m
> > 
> > The same sensor may be or may not used on a given board (and certainly it's
> > not specific to arm64). Is it desirable all arm64 systems compile this in
> > by default?
> > 
> > There appear to be a other sensor drivers though.
> > 
> > Is there a defconfig for the librem5 board?
> 
> arm64 has a single defconfig, there are no board specific ones (and
> afaik they're not wanted either) so I think enabling it as a module is
> the only way.

Do sensor drivers qualify for defconfig support though ? If they do,
they should all be enabled.

> > I wonder what others think.

-- 
Regards,

Laurent Pinchart
