Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837FC4654F6
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 19:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239894AbhLASTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 13:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbhLASS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 13:18:59 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15E7C06175D
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 10:14:59 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 0802E1F45E67
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638382498; bh=YnpACkoUDcAU+tBV9Qz7IZVRCCIaCMA+VnOuOsFhC8E=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=PBSRohQ7Te8dKf7+IuCW0TO4TZqsW9SGxR4wCR2L5y9FG70nUM3keUixmxCoCg8hu
         3mupcM1VZ3YFd8Sg3+vUDeD6453R8HX9HHH0SJSBvsZFDFT8Di6qgqYw1nED4hBA+l
         1hmCmWK2aAmb1ZWTHJ+01TLDiUo7QeG+s1+CAqfk6JmeGXf9BDHWJtZ2ibkwFmpzZr
         uMoF0lSrAoYF8oxLSfHn1nCJgdZ2bm+p1kgJ3OrsXfLrm8tc2CPKKNXZu6IuzjLH2p
         H5QDsbdlB6rYtIPlPckkQnUij1ZyTzgQvLSQrLOkJcr4DVfW7hSv9csq13Tp+n7bBg
         SBfhzVWC4+6vA==
Message-ID: <1fe2d411ad7e2b4a9a23d7064a4be43aec5c2f24.camel@collabora.com>
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Date:   Wed, 01 Dec 2021 13:14:45 -0500
In-Reply-To: <d3f7ad1e-4ace-c6e7-db05-9afd92a5e2ef@collabora.com>
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
         <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
         <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
         <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com>
         <88434c9b-a682-7da5-ce3b-adec28b89471@collabora.com>
         <YZupE2zKojGCKuTT@pendragon.ideasonboard.com>
         <d3f7ad1e-4ace-c6e7-db05-9afd92a5e2ef@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 01 décembre 2021 à 09:03 +0200, Dafna Hirschfeld a écrit :
> 
> On 22.11.21 16:28, Laurent Pinchart wrote:
> > Hi Dafna,
> > 
> > On Mon, Nov 22, 2021 at 04:21:25PM +0200, Dafna Hirschfeld wrote:
> > > On 22.11.21 14:29, Laurent Pinchart wrote:
> > > > On Mon, Nov 22, 2021 at 01:20:47PM +0200, Dafna Hirschfeld wrote:
> > > > > On 20.11.21 14:34, Laurent Pinchart wrote:
> > > > > > On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
> > > > > > > When trying to stream on both mainpatch and selfpatch
> > > > > > > with grey format, I get an iommu page fault.
> > > > > > > The fault is on the address at the end of the buffer,
> > > > > > > so it seems that the device is somehow wrongly
> > > > > > > configured and thinks there is another plane.
> > > > > > 
> > > > > > Could we try to fix that instead ? There are IR sensors for which the
> > > > > > GREY format is useful.
> > > > > 
> > > > > Hi, the doc is not very useful so I can try doing a bit trial and error.
> > > > > I see that there are several greyscale formats: [1]
> > > > > which make me think that maybe the device support one of the other greyscale formats.
> > > > > Do you know if some formats are more likely than other?
> > > > 
> > > > GREY seems the most likely (useful for IR sensors for instance, after
> > > > ISP processing). Formats with a higher bpp would require processing of
> > > > more than 8bpp through the ISP pipeline, I don't know if that's
> > > > supported.
> 
> I tried all kind of things but was not able to stream greyscale.
> When ISP processing works it outputs YUV 422 format and then the resizer
> is used to change the format to YUV 420 if wanted.
> I tried to chance the scale to YUV 400 (grey) or change the mainpath/selfpath
> configuration but still had that iommu page fault errors.
> 
> Interestingly when I bypass the iommu and dma allocation is direct
> the streaming works and even the output frames seems okayish greyscale format
> but that might be by accident.

Just a guess, but its possible they use a short cut to gray scale, and write to
NV12 buffers. planar YUV 420 are somewhat compatible with grayscale, so that's
always a possible cheat.

> 
> > > > 
> > > > Formats with a higher bpp (both greyscale and bayer formats) are also
> > > > useful to capture raw images (before ISP processing). Is that something
> > > > the hardware and driver support ?
> > > 
> > > hi, yes the variations of V4L2_PIX_FMT_Sxxxx10, V4L2_PIX_FMT_Sxxxx12
> > > are supported on mainpath.
> > 
> > That's nice. Does it bypass the whole ISP then ? Is it possible to
> > capture raw frames on the main path and processed frames on the self
> > path at the same time, or are we restricted to raw only when we capture
> > raw frames ?
> 
> I think we are restricted to raw only when we capture raw frames.
> The doc describe the isp_ctl register that set the isp output to either raw or yuv.
> It seems not to be possible to send raw to mainpath and yuv to selfpath.
> 
> Thanks,
> Dafna
> 
> > 
> > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html
> > > > > 
> > > > > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > > > > ---
> > > > > > >     .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
> > > > > > >     1 file changed, 15 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > > > index 768987d5f2dd..7f78f361dd5e 100644
> > > > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > > > @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> > > > > > >     		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > > > > > >     		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > >     	},
> > > > > > > -	/* yuv400 */
> > > > > > > -	{
> > > > > > > -		.fourcc = V4L2_PIX_FMT_GREY,
> > > > > > > -		.uv_swap = 0,
> > > > > > > -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > > > > > > -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > -	},
> > > > > > >     	/* yuv420 */
> > > > > > >     	{
> > > > > > >     		.fourcc = V4L2_PIX_FMT_NV21,
> > > > > > > @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> > > > > > >     		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> > > > > > >     		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > >     	},
> > > > > > > -	/* yuv400 */
> > > > > > > -	{
> > > > > > > -		.fourcc = V4L2_PIX_FMT_GREY,
> > > > > > > -		.uv_swap = 0,
> > > > > > > -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> > > > > > > -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> > > > > > > -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > -	},
> > > > > > >     	/* rgb */
> > > > > > >     	{
> > > > > > >     		.fourcc = V4L2_PIX_FMT_XBGR32,
> > 
> 

