Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90AE16DF6C5
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 15:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjDLNPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 09:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjDLNPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 09:15:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C939E7D92
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 06:14:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B0BE75B;
        Wed, 12 Apr 2023 15:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681305209;
        bh=nWyYwUZl1VGRNabSRnZlJsBsl3HWSiDt1aFuE6cpMZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AdG9wA1VvQpC5iDs2T9UI8CZh1qTP3p7tjaCXDLnn837y/hVdq9nw8V5jyUvCdUME
         0RGG8o9CwsfB4ovya56DMJtzm8dScDY2wJ2EVYpY7wnkrx1gmotNIu+OoO/SNU8rCN
         IwazTmZ8DPqtZrcQJlKvDk2JxqPNuk9UuJwCYQZ8=
Date:   Wed, 12 Apr 2023 16:13:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] media: imx: imx7-media-csi: Set pixfmt field, width,
 height & sizeimage
Message-ID: <20230412131341.GA30436@pendragon.ideasonboard.com>
References: <20230406135637.257580-1-alexander.stein@ew.tq-group.com>
 <20230407022214.GE31272@pendragon.ideasonboard.com>
 <1934107.PYKUYFuaPT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1934107.PYKUYFuaPT@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Tue, Apr 11, 2023 at 09:38:38AM +0200, Alexander Stein wrote:
> Am Freitag, 7. April 2023, 04:22:14 CEST schrieb Laurent Pinchart:
> > On Thu, Apr 06, 2023 at 03:56:37PM +0200, Alexander Stein wrote:
> > > Fixes the following v4l2-comliance errors for VIDIOC_TRY_FMT:
> > > * !pix.width || !pix.height
> > > * !pix.sizeimage
> > > * pix.field == V4L2_FIELD_ANY
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > This patch is based on [1] and fixes the last v4l2-compliance errors and
> > > a 'WARN_ON(!plane_sizes[i])' in vb2_core_reqbufs().
> > > My platform: TQMa8MQML (imx8mm) + imx327lqr.
> > > 
> > > The v4l2-compliance output:
> > > --8<--
> > > v4l2-compliance 1.24.1-5010, 64 bits, 64-bit time_t
> > > v4l2-compliance SHA: 8799081b1436 2023-02-24 17:03:58
> > > 
> > > Compliance test for imx-capture device /dev/video0:
> > > 
> > > Driver Info:
> > >         Driver name      : imx-capture
> > >         Card type        : imx-capture
> > >         Bus info         : platform:32e20000.csi
> > >         Driver version   : 6.3.0
> > >         Capabilities     : 0xa4200001
> > >         
> > >                 Video Capture
> > >                 I/O MC
> > >                 Streaming
> > >                 Extended Pix Format
> > >                 Device Capabilities
> > >         
> > >         Device Caps      : 0x24200001
> > >         
> > >                 Video Capture
> > >                 I/O MC
> > >                 Streaming
> > >                 Extended Pix Format
> > > 
> > > Media Driver Info:
> > >         Driver name      : imx7-csi
> > >         Model            : imx-media
> > >         Serial           :
> > >         Bus info         : platform:32e20000.csi
> > >         Media version    : 6.3.0
> > >         Hardware revision: 0x00000000 (0)
> > >         Driver version   : 6.3.0
> > > 
> > > Interface Info:
> > >         ID               : 0x03000006
> > >         Type             : V4L Video
> > > 
> > > Entity Info:
> > >         ID               : 0x00000004 (4)
> > >         Name             : csi capture
> > >         Function         : V4L2 I/O
> > >         Pad 0x01000005   : 0: Sink
> > >         
> > >           Link 0x02000008: from remote pad 0x1000003 of entity 'csi'
> > >           (Video Interface Bridge): Data, Enabled, Immutable> 
> > > Required ioctls:
> > >         test MC information (see 'Media Driver Info' above): OK
> > >         test VIDIOC_QUERYCAP: OK
> > >         test invalid ioctls: OK
> > > 
> > > Allow for multiple opens:
> > >         test second /dev/video0 open: OK
> > >         test VIDIOC_QUERYCAP: OK
> > >         test VIDIOC_G/S_PRIORITY: OK
> > >         test for unlimited opens: OK
> > > 
> > > Debug ioctls:
> > >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > 
> > > Input ioctls:
> > >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > >         test VIDIOC_G/S/ENUMINPUT: OK
> > >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > >         Inputs: 1 Audio Inputs: 0 Tuners: 0
> > > 
> > > Output ioctls:
> > >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > 
> > > Input/Output configuration ioctls:
> > >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > > 
> > > Control ioctls (Input 0):
> > >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > >         test VIDIOC_QUERYCTRL: OK (Not Supported)
> > >         test VIDIOC_G/S_CTRL: OK (Not Supported)
> > >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > >         Standard Controls: 0 Private Controls: 0
> > > 
> > > Format ioctls (Input 0):
> > >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > >         test VIDIOC_G/S_PARM: OK (Not Supported)
> > >         test VIDIOC_G_FBUF: OK (Not Supported)
> > >         test VIDIOC_G_FMT: OK
> > >         
> > >                 fail: v4l2-test-formats.cpp(468): !pix.width ||
> > >                 !pix.height
> > >         
> > >         test VIDIOC_TRY_FMT: FAIL
> > >         
> > >                 fail: v4l2-test-formats.cpp(468): !pix.width ||
> > >                 !pix.height
> > >         
> > >         test VIDIOC_S_FMT: FAIL
> > >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > >         test Cropping: OK (Not Supported)
> > >         
> > >                 fail: v4l2-test-formats.cpp(1726): !sel_padded.r.width ||
> > >                 !sel_padded.r.height fail: v4l2-test-formats.cpp(1778):
> > >                 testBasicCompose(node, V4L2_BUF_TYPE_VIDEO_CAPTURE)>         
> > >         test Composing: FAIL
> > >         test Scaling: OK
> > > 
> > > Codec ioctls (Input 0):
> > >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > 
> > > Buffer ioctls (Input 0):
> > >                 fail: v4l2-test-buffers.cpp(607): q.reqbufs(node, 1)
> > >         
> > >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
> > >         
> > >                 fail: v4l2-test-buffers.cpp(783): VIDIOC_EXPBUF is
> > >                 supported, but the V4L2_MEMORY_MMAP support is missing or
> > >                 malfunctioning. fail: v4l2-test-buffers.cpp(784):
> > >                 VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP
> > >                 support is missing, probably due to earlier failing
> > >                 format tests.>         
> > >         test VIDIOC_EXPBUF: OK (Not Supported)
> > >         test Requests: OK (Not Supported)
> > > 
> > > Total for imx-capture device /dev/video0: 46, Succeeded: 42, Failed: 4,
> > > Warnings: 0 --8<--
> > > 
> > > Best regards,
> > > Alexander
> > > 
> > > [1]
> > > https://lore.kernel.org/all/20230321072707.678039-1-alexander.stein@ew.tq
> > > -group.com/> 
> > >  drivers/media/platform/nxp/imx7-media-csi.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > > 389d7d88b341..1888559a6531 100644
> > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > @@ -1147,6 +1147,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > > *pixfmt,> 
> > >  {
> > >  
> > >  	struct v4l2_mbus_framefmt fmt_src;
> > >  	const struct imx7_csi_pixfmt *cc;
> > > 
> > > +	unsigned int walign;
> > > 
> > >  	/*
> > >  	
> > >  	 * Find the pixel format, default to the first supported format if 
> not
> > > 
> > > @@ -1175,6 +1176,17 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > > *pixfmt,> 
> > >  	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> > >  	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
> > > 
> > > +	if (cc->bpp == 8)
> > > +		walign = 8;
> > > +	else
> > > +		walign = 4;
> > > +
> > > +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff / (cc->bpp / 8), 
> walign,
> > > +			      &pixfmt->height, 1, 0xffff, 1, 0);
> > > +
> > > +	pixfmt->sizeimage = (cc->bpp * pixfmt->width * pixfmt->height) /
> > > BITS_PER_BYTE;
> > 
> > No need for parentheses, and I'd wrap the line. Or replace BITS_PER_BYTE
> > with 8:
> > 
> > 	pixfmt->sizeimage = pixfmt->width * pixfmt->height * cc->bpp / 8;
> > 
> > which I think is as readable.
> 
> Fine with me. Will change that.
> 
> > You also need to handle bytesperline.
> 
> I originally had a patch for that as well. But with some debugging output I 
> noticed this already has the correct value. But maybe this was just 
> coincidence and it actually needs to be set as well.
> 
> > I'd go one step further, and get rid of imx7_csi_mbus_fmt_to_pix_fmt().
> > This is historical, there's no need to convert between mbus and pixel
> > formats anymore.
> 
> Okay, but that is an additional change.

It could be, but it can also be done now, and have the side effect of
fixing the V4L2 compliance failures :-)

> > > +	pixfmt->field = V4L2_FIELD_NONE;
> > 
> > This should probably be moved to a separate patch. Interlaced format
> > handling is broken, there's no IDMAC on i.MX7. The code comes from
> > shared helpers with i.MX6 before the driver got destaged.
> 
> The motivation for this patch came from the v4l2-compliance errors, so I 
> grouped setting missing properties into a single patch. It's not so much about 
> interlaced format, but an uninitialized pixfmt->field, so I would prefer 
> keeping them in a single patch.

I understand, but fixing V4L2 compliance failures doesn't mean that
everything should be done in a single patch. Silencing the failure
related to the field without actually fixing field handling is a
compliance test workaround, I don't like that much. Let's address the
root cause, not the symptoms.

> > > +
> > > 
> > >  	if (compose) {
> > >  	
> > >  		compose->width = fmt_src.width;
> > >  		compose->height = fmt_src.height;

-- 
Regards,

Laurent Pinchart
