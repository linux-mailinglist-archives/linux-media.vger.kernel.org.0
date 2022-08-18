Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E9B59910F
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 01:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243400AbiHRXNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 19:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345278AbiHRXNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 19:13:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB23B1E2;
        Thu, 18 Aug 2022 16:13:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 320838B;
        Fri, 19 Aug 2022 01:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660864415;
        bh=21e5R5aaJlyA5q9PxuN8lDbzHstO8NNr3Ieuasm51gk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RRYWTZNHPFS+p5joTS7mwa00F7w58eYQKeYoGAoun+ZMZthPvk4QY/pozUOYyz/ep
         Ji87GXAGxOXBZDbhb/pqL2MwjAIpPplc2whFSEpSbzrSwWhA0PzKRnUwHnSKiAlFJR
         pb04wysggHNgRcleI1JMwjE4Umb0t/n/8xB1j+3k=
Date:   Fri, 19 Aug 2022 02:13:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, dri-devel@lists.freedesktop.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, sakari.ailus@linux.intel.com,
        ribalda@chromium.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, sebastian.hesselbarth@gmail.com,
        jszhang@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Message-ID: <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
> On 8/18/22 14:06, Tomasz Figa wrote:
> > On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
> >>
> >> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> >>
> >> The most of detail has been written in the drm.

This patch still needs a description of the format, which should go to
Documentation/userspace-api/media/v4l/.

> >> Please notice that the tiled formats here request
> >> one more plane for storing the motion vector metadata.
> >> This buffer won't be compressed, so you can't append
> >> it to luma or chroma plane.
> > 
> > Does the motion vector buffer need to be exposed to userspace? Is the
> > decoder stateless (requires userspace to specify the reference frames)
> > or stateful (manages the entire decoding process internally)?
> 
> No, users don't need to access them at all. Just they need a different 
> dma-heap.
> 
> You would only get the stateful version of both encoder and decoder.

Shouldn't the motion vectors be stored in a separate V4L2 buffer,
submitted through a different queue then ?

> >> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> >> ---
> >>   drivers/media/v4l2-core/v4l2-common.c | 1 +
> >>   drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
> >>   include/uapi/linux/videodev2.h        | 2 ++
> >>   3 files changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >> index e0fbe6ba4b6c..f645278b3055 100644
> >> --- a/drivers/media/v4l2-core/v4l2-common.c
> >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >>                  { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>                  { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>                  { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
> >>          };
> >>          unsigned int i;
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >> index e6fd355a2e92..8f65964aff08 100644
> >> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >>                  case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
> >>                  case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
> >>                  case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
> >> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
> >> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
> >>                  default:
> >>                          if (fmt->description[0])
> >>                                  return;
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index 01e630f2ec78..7e928cb69e7c 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
> >>   #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
> >>   #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
> >>   #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> >> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
> >> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
> >>
> >>   /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
> >>   #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */

-- 
Regards,

Laurent Pinchart
