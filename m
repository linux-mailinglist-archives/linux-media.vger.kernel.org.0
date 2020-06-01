Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1151EA3FF
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 14:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgFAMhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 08:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727983AbgFAMhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 08:37:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB587C061A0E;
        Mon,  1 Jun 2020 05:37:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C925304;
        Mon,  1 Jun 2020 14:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591015040;
        bh=oHa+01cZUbHFTHWDvd9ezAEuDyQWSSM5aS2DS4SQadE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L+Q/ukkbBhQCw0sLrkRlYVeERNSo+/TsBBCsL/1Vd36huQeJvwOYo9ngZWcXiRa/s
         AnQo7kOuT++wSVMLwQBFzQJj8yEG7KTA9ov83C9ih6jjfHZpVKa7FzNPjR9ux2M/x6
         MRzFtC3vB7UH8M7ejeEpS/vYuY/Yi2TgazPkwzwA=
Date:   Mon, 1 Jun 2020 15:37:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com,
        dafna Hirschfeld <dafna3@gmail.com>
Subject: Re: [PATCH] vimc: debayer: Add support for ARGB format
Message-ID: <20200601123705.GE5886@pendragon.ideasonboard.com>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
 <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
 <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 01, 2020 at 05:46:26PM +0530, Kaaira Gupta wrote:
> On Fri, May 29, 2020 at 05:43:57PM +0200, Dafna Hirschfeld wrote:
> > Hi,
> > Thanks for the patch
> > 
> > I don't know how real devices handle ARGB formats,
> > I wonder if it should be the part of the debayer.
> 
> Hi! qcam tries to support BA24 as it is one of the formats that vimc
> lists as its supported formats wih --list-formats. Shouldn't BA24 be
> possible to capture with vimc?
> 
> If yes, which entity should support it, if not debayer? Should there be
> a separate conversion entity, or should we keep the support in debayer
> itself for efficiency issues?

At the hardware level, the de-bayering block usually produces RGB with 8
or more bits per colour components (so 3xn, 24 bits for 8-bit depths).
The conversion to 32-bit ARGB usually happens at the DMA engine level,
in the formatter right in front of the DMA engine. Ideally the vimc
pipeline should expose the same.

From a performance point of view, it makes little sense to process the
image in vimc through multiple steps. I think it would be best to
generate the final image directly at the output of the pipeline.

> > On 28.05.20 20:57, Kaaira Gupta wrote:
> > > Running qcam for pixelformat 0x34324142 showed that vimc debayer does
> > > not support it. Hence, add the support for Alpha (255).
> > 
> > I would change the commit log to:
> > 
> > Add support for V4L2_PIX_FMT_RGB24 format in the debayer
> > and set the alpha channel to constant 255.
> > 
> > > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > > ---
> > >   .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
> > >   1 file changed, 18 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > > index c3f6fef34f68..f34148717a40 100644
> > > --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> > > +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > > @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
> > >   	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > >   	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > >   	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> > > +	MEDIA_BUS_FMT_ARGB8888_1X32
> > >   };
> > >   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
> > > @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
> > >   	unsigned int i, index;
> > >   	vpix = vimc_pix_map_by_code(vdeb->src_code);
> > > -	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> > > -	for (i = 0; i < 3; i++) {
> > > -		switch (vpix->pixelformat) {
> > > -		case V4L2_PIX_FMT_RGB24:
> > > -			vdeb->src_frame[index + i] = rgb[i];
> > > -			break;
> > > -		case V4L2_PIX_FMT_BGR24:
> > > -			vdeb->src_frame[index + i] = rgb[2 - i];
> > > -			break;
> > > +
> > > +	if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
> > > +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
> > > +		vdeb->src_frame[index] = 255;
> > > +		for (i = 0; i < 3; i++)
> > > +			vdeb->src_frame[index + i + 1] = rgb[i];
> > > +	} else {
> > > +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> > > +		for (i = 0; i < 3; i++) {
> > > +			switch (vpix->pixelformat) {
> > > +			case V4L2_PIX_FMT_RGB24:
> > > +				vdeb->src_frame[index + i] = rgb[i];
> > > +				break;
> > > +			case V4L2_PIX_FMT_BGR24:
> > > +				vdeb->src_frame[index + i] = rgb[2 - i];
> > > +				break;
> > > +			}
> > >   		}
> > >   	}
> > >   }

-- 
Regards,

Laurent Pinchart
