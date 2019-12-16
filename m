Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2EA1211A1
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 18:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfLPRVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 12:21:05 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49473 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfLPRVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 12:21:05 -0500
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1igu3K-0004Ur-8q; Mon, 16 Dec 2019 18:21:02 +0100
Date:   Mon, 16 Dec 2019 18:21:01 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
Cc:     "linux-arm@lists.infradead.org" <linux-arm@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: Re: [i.MX6][CODA] certain resolutions are not working in YUYV
 format
Message-ID: <20191216182101.3676c280@litschi.hi.pengutronix.de>
In-Reply-To: <c79be4d41e414ae5b50ba1e26544b6c2@skidata.com>
References: <c79be4d41e414ae5b50ba1e26544b6c2@skidata.com>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, 13 Dec 2019 12:02:25 +0000, Benjamin Bara - SKIDATA wrote:
> we are currently facing a problem with the i.MX6DL and MPEG4-2 encoded videos.
> The decoder seem to fail to decode videos of certain resolutions (video output becomes green).
> For the latest test run, we used Linux kernel 5.4.2 and GStreamer version 1.16.1.
> 
> When hunting the problem down, it seems like the problem is related to the YUY2 (= YUYV) output format.
> Unfortunately, gst always takes YUY2 as the default format for the v4l2mpeg4dec sink pad and 
> forcing a different format does not work (video becomes even more green).
> 
> We saw commit d40e98c13b3e7cb1aa16e9c14f35db3c8c3dd033, which added YUYV if VDOA is used,
> but could not find anything related in the i.MX 6Dual/6Quad VPU API Linux Reference Manual except:
> "One pixel value of a component occupies one byte and the frame data is in YCbCr 4:2:0 format 
> for H.264, H.264 and MPEG-4 codecs." [sic] (Rev. L3.0.35_1.1.0, 01/2013)

The VDOA is documented in the "i.MX 6Dual/6Quad Applications Processor
Reference Manual" because it is not part of the VPU IP core, but an
i.MX-specific adapter between the VPU and the IPU. It is managed by the
coda driver to provide a better abstraction to user space.

If you use a different format other than YUYV (or disable the VDOA
using the disable_vdoa module parameter), you bypass the VDOA and
directly get whatever the VPU is producing.

> 
> For debug purposes, we changed the dst_formats of the decoder driver to only support YUV420 (= I420).
> All tested resolutions are working with this setup.

Not sure if I understand correctly. Did you remove all other formats
except for YUV420 from the driver? Once you did that, all resolutions
are decoded correctly? What happens if you force the driver to produce
NV12 as destination format?

The height of the working resolutions seems to be a multiple of 16,
which is the macroblock size. Thus, there might be a problem with the
cropping the destination frames. Do you see the problems only with
videos that are encoded by the CODA or also with other mpeg4 encoded
videos?

Michael

> 
> Does anyone else face similar issues?
> 
> Please just drop me a mail if we should perform further debug actions or provide further debug output.
> 
> BR,
> Benjamin
> 
> 
> *gst-launch pipeline to reproduce the error:*
> gst-launch-1.0 -v videotestsrc ! video/x-raw,width=480,height=270 ! v4l2mpeg4enc output-io-mode=4 ! \
> 	v4l2mpeg4dec ! xvimagesink
> 
> *failing gst-launch pipeline to force the I420 format:*
> gst-launch-1.0 -v videotestsrc ! video/x-raw,width=480,height=270 ! v4l2mpeg4enc output-io-mode=4 ! \
> 	v4l2mpeg4dec ! video/x-raw,format=I420 ! xvimagesink
> 
> *some other failing resolutions:*
> - 320x200
> - 400x270
> - 400x300
> - 480x250
> - 480x270
> - 480x500
> - 640x200
> - 800x600
> 
> *working resolutions:*
> - 320x240
> - 1024x576
> - ...
> 
> *resulting dmesg output:*
> [ 6159.838070] coda 2040000.vpu: CODA_COMMAND_SEQ_INIT failed, error code = 0x1
> [ 6159.895636] coda 2040000.vpu: errors in 504 macroblocks
> [ 6159.900877] coda 2040000.vpu: decoded frame index out of range: 0
> [ 6160.963450] coda 2040000.vpu: CODA PIC_RUN timeout
> [ 6162.003422] coda 2040000.vpu: CODA PIC_RUN timeout
> 
> *verbose output of failing gst-launch pipeline (GST_DEBUG=1):*
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> /GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0.GstPad:src: caps = video/x-raw, format=(string)I420, width=(int)480, height=(int)270, framerate=(fraction)30/1, multiview-mode=(string)mono, interlace-mode=(string)progressive, colorimetry=(string)bt601, pixel-aspect-ratio=(fraction)1/1
> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)I420, width=(int)480, height=(int)270, framerate=(fraction)30/1, multiview-mode=(string)mono, interlace-mode=(string)progressive, colorimetry=(string)bt601, pixel-aspect-ratio=(fraction)1/1
> /GstPipeline:pipeline0/v4l2mpeg4enc:v4l2mpeg4enc0.GstPad:src: caps = video/mpeg, mpegversion=(int)4, systemstream=(boolean)false, profile=(string)simple, level=(string)5, width=(int)480, height=(int)270, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)30/1, interlace-mode=(string)progressive, colorimetry=(string)bt601, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono
> /GstPipeline:pipeline0/v4l2mpeg4dec:v4l2mpeg4dec0.GstPad:sink: caps = video/mpeg, mpegversion=(int)4, systemstream=(boolean)false, profile=(string)simple, level=(string)5, width=(int)480, height=(int)270, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)30/1, interlace-mode=(string)progressive, colorimetry=(string)bt601, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono
> Redistribute latency...
> /GstPipeline:pipeline0/v4l2mpeg4enc:v4l2mpeg4enc0.GstPad:sink: caps = video/x-raw, format=(string)I420, width=(int)480, height=(int)270, framerate=(fraction)30/1, multiview-mode=(string)mono, interlace-mode=(string)progressive, colorimetry=(string)bt601, pixel-aspect-ratio=(fraction)1/1
> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)I420, width=(int)480, height=(int)270, framerate=(fraction)30/1, multiview-mode=(string)mono, interlace-mode=(string)progressive, colorimetry=(string)bt601, pixel-aspect-ratio=(fraction)1/1
> /GstPipeline:pipeline0/v4l2mpeg4dec:v4l2mpeg4dec0.GstPad:src: caps = video/x-raw, format=(string)YUY2, width=(int)480, height=(int)270, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)jpeg, colorimetry=(string)bt601, framerate=(fraction)30/1
> /GstPipeline:pipeline0/GstXvImageSink:xvimagesink0.GstPad:sink: caps = video/x-raw, format=(string)YUY2, width=(int)480, height=(int)270, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)jpeg, colorimetry=(string)bt601, framerate=(fraction)30/1
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> 
> 
