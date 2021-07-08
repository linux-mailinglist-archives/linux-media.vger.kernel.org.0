Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1623C15CB
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 17:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhGHPVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 11:21:15 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:56342 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231876AbhGHPVO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Jul 2021 11:21:14 -0400
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Jul 2021 11:21:13 EDT
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 519C9FB03;
        Thu,  8 Jul 2021 17:13:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mJN1dqngT7YZ; Thu,  8 Jul 2021 17:13:15 +0200 (CEST)
Date:   Thu, 8 Jul 2021 17:13:13 +0200
From:   Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v6 5/5] arm64: defconfig: enable VIDEO_HI846
Message-ID: <YOcWCVSXfV+cKJ6H@qwark.sigxcpu.org>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
 <20210628101054.828579-6-martin.kepplinger@puri.sm>
 <20210708130003.GA3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708130003.GA3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
On Thu, Jul 08, 2021 at 04:00:04PM +0300, Sakari Ailus wrote:
> Hi Martin,
> 
> On Mon, Jun 28, 2021 at 12:10:54PM +0200, Martin Kepplinger wrote:
> > Build the driver for the Hi-846 camera by default on arm64 where it's
> > going to be used on at least the imx8mq-librem5 board.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index f423d08b9a71..bf27d9cfbdd5 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -666,6 +666,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
> >  CONFIG_VIDEO_QCOM_VENUS=m
> >  CONFIG_SDR_PLATFORM_DRIVERS=y
> >  CONFIG_VIDEO_RCAR_DRIF=m
> > +CONFIG_VIDEO_HI846=m
> >  CONFIG_VIDEO_IMX219=m
> >  CONFIG_VIDEO_OV5645=m
> >  CONFIG_VIDEO_QCOM_CAMSS=m
> 
> The same sensor may be or may not used on a given board (and certainly it's
> not specific to arm64). Is it desirable all arm64 systems compile this in
> by default?
> 
> There appear to be a other sensor drivers though.
> 
> Is there a defconfig for the librem5 board?

arm64 has a single defconfig, there are no board specific ones (and
afaik they're not wanted either) so I think enabling it as a module is
the only way.

Cheers,
 -- Guido

> 
> I wonder what others think.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
