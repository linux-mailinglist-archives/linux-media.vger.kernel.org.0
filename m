Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064FA42D82A
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhJNL2q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 14 Oct 2021 07:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhJNL2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:28:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7046C06174E
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 04:26:40 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maysW-0004lM-9W; Thu, 14 Oct 2021 13:26:28 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maysU-0003kx-LL; Thu, 14 Oct 2021 13:26:26 +0200
Message-ID: <1d8878e86b862ae8d551b6796e86c4fb1eb5d671.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Round line size to 4 bytes
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Date:   Thu, 14 Oct 2021 13:26:26 +0200
In-Reply-To: <20211013112636.6963344d.dorota.czaplejewicz@puri.sm>
References: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
         <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
         <20211013112636.6963344d.dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dorota,

On Wed, 2021-10-13 at 11:26 +0200, Dorota Czaplejewicz wrote:
> On Fri, 08 Oct 2021 14:19:41 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:
[...]
> > I wonder: if you use 4-byte aligned width and odd height, does the CSI
> > write over the end of the buffer?
> 
> I tested this case, and found a glitch which suggests the last 4 bytes are ignored:
> 
> https://source.puri.sm/Librem5/linux-next/uploads/cfb59e3832431aaa3a69549455502568/image.png

Thank you for testing, so it appears that at least without FBUF_STRIDE
the only requirement is that the whole image size must be a multiple of
8 bytes.

> That would be taken care of rounding up towards a number decided at runtime, like:
> 
> divisor = 8 >> (mbus->height % 2);

Which would then cause the CSI to write past the end of the buffer?

I'd rather make sure that either the number of lines is even or the
width is a multiple of 8 bytes.

> > > Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> > > ---
> > > 
> > > Hello,
> > > 
> > > my previous patch identified something that was not a problem,
> > > so I'm sending a different one.
> > > 
> > > This has been tested on the Librem 5.
> > > 
> > > Cheers,
> > > Dorota
> > > 
> > >  drivers/staging/media/imx/imx-media-utils.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> > > index 5128915a5d6f..a303003929e3 100644
> > > --- a/drivers/staging/media/imx/imx-media-utils.c
> > > +++ b/drivers/staging/media/imx/imx-media-utils.c
> > > @@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> > >  	}
> > >  
> > >  	/* Round up width for minimum burst size */
> > > -	width = round_up(mbus->width, 8);
> > > +	width = round_up(mbus->width, 4);
> > >  
> > >  	/* Round up stride for IDMAC line start address alignment */
> > >  	if (cc->planar)
> > >  		stride = round_up(width, 16);
> > >  	else
> > > -		stride = round_up((width * cc->bpp) >> 3, 8);
> > > +		stride = round_up((width * cc->bpp) >> 3, 4);  
> > 
> > Second, even if this works fine on the i.MX7/8M CSI, the alignment is
> > still required for the i.MX5/6 IPU, for which this code and the comments
> > were written. So we need a way to differentiate the two cases here.
> > 
> > regards
> > Philipp
> 
> How best to go about this? I can see in the file imx-media-capture.c
> that there the video device lives in struct capture_priv.vdev.vfd.
> Would that be the right place to query about the underlying hardware?
> 
> Then the following functions would gain a new "small_divisor" parameter:
> - imx_media_mbus_fmt_to_pix_fmt (a GPL symbol)
> - imx_media_mbus_fmt_to_ipu_image (a GPL symbol)
> - __capture_try_fmt

That sounds like it would work around the current code when it (at least
part of imx_media_mbus_fmt_to_pix_fmt()) should be split between i.MX5/6
and i.MX7/8 implementations. For example rounding up the stride is not
useful on i.MX7/8, it just doesn't currently hurt because imx7-media-csi 
is not using bytesperline to set up FBUF_STRIDE. And certainly the
comments don't apply.

imx_media_mbus_fmt_to_ipu_image() is unused and should probably be
dropped, same as imx_media_ipu_image_to_mbus_fmt().

> Those would have to extract the device type from struct capture_priv:
> - __capture_legacy_try_fmt
> - capture_try_fmt_vid_cap
> - capture_s_fmt_vid_cap
> - capture_init_format

Maybe imx_media_mbus_fmt_to_pix_fmt should be moved into imx-media-
capture.c be passed struct capture_priv to avoid duplicating the device
type check?

imx_media_capture_device_init() could gain a new parameter (or maybe
replace legacy_api) to set the device type.

regards
Philipp
