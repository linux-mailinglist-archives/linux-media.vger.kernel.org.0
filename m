Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E533910A267
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbfKZQoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:44:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36994 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728097AbfKZQoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:44:38 -0500
Received: from pendragon.ideasonboard.com (fs96f9c64d.tkyc509.ap.nuro.jp [150.249.198.77])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA884554;
        Tue, 26 Nov 2019 17:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574786673;
        bh=Kvt83AGl9xEeC9Pd3kFYCbFDU8OaSJA+dvQQRh0eRmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RRXKAIxN7CAH6vvbU8+Mgr1tdwPoXB6d9sKWfVaRq2K0FTSe4n2qlsDc285ggaOvF
         ZNL1YplgegFk8Aw2QVo6CG6Ndd7a3+RYMpcSMh1Gtl70aLj+CDpGPN9Y0JrIxMdsGP
         Pmh4jxiGcy+E+DNqKhZsqFRRKbiakCNIVthq8ZjE=
Date:   Tue, 26 Nov 2019 18:44:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [RFC] How to report the supported camera sensor resolutions (was
 "[libcamera-devel] [PATCH] libcamera: v4l2_subdevice: use G_FORMAT if
 ENUM_FRAME_SIZE isn't implemented")
Message-ID: <20191126164422.GB5177@pendragon.ideasonboard.com>
References: <20191025133208.22637-1-andrey.konovalov@linaro.org>
 <20191109105008.zezdel3b2ivv4uwd@uno.localdomain>
 <863c5bd8-2110-b753-b43f-bf885f403a9b@linaro.org>
 <CAPY8ntCPJQdBzATpDRJcLyMH7bV56gO-WZjvmX2eGQ0NnJZBVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCPJQdBzATpDRJcLyMH7bV56gO-WZjvmX2eGQ0NnJZBVA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

CC'ing the linux-media mailing list

On Wed, Nov 13, 2019 at 10:59:16AM +0000, Dave Stevenson wrote:
> On Tue, 12 Nov 2019 at 20:22, Andrey Konovalov wrote:
> > On 09.11.2019 13:50, Jacopo Mondi wrote:
> >> On Fri, Oct 25, 2019 at 04:32:08PM +0300, Andrey Konovalov wrote:
> >>> Many camera sensor drivers support only one frame size, and don't
> >>> implement VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl. And libcamera fails
> >
> > The key point here is VIDIOC_SUBDEV_ENUM_FRAME_SIZE support (see below)
> >
> >> Is this true ? A single frame size?
> > Well, not quite
> >
> >> Do you see this often ?
> >
> > I do see this as one of the cameras I currently use is ov5647, and the mainline driver for it supports 640x480 only :)
> > (and this might explain why it doesn't implement VIDIOC_SUBDEV_ENUM_FRAME_SIZE).
> 
> Somehow I guessed it might be ov5647, aka Raspberry Pi v1.3 camera module.
> VGA raw8 only, even though the sensor is 5MPix and supports raw 10.
> 
> Then again that driver needs a bit of love as the mainline driver
> doesn't support the set_fmt or get_fmt in the pad ops either - I've
> got a patch to add those on the downstream Pi kernel which ought to be
> upstreamed [1].
> Register sets are available for other resolutions, so it'd be nice to extend it.
> 
> So I'll agree with Andrey's point that there are some drivers that
> don't currently support VIDIOC_SUBDEV_ENUM_FRAME_SIZE, but also with
> Jacopo that drivers really ought to implement a minimum set of subdev
> functions. The list of exactly which functions ought to be documented,
> and probably includes VIDIOC_SUBDEV_ENUM_FRAME_SIZE.
> I asked the question over mandatory subdev ops on linux-media a couple
> of years back [2]. I had a response from Sakari on the subject, but no
> conclusions.

I think we really should address the problem on the kernel side first
and decide whether VIDIOC_SUBDEV_ENUM_FRAME_SIZE should be mandatory. If
it should, we should fix the kernel side, and we could possibly do so
quite simply with a default implementation of the ioctl that would just
return a single size when the subdev driver doesn't implement the
corresponding operation. How exactly this should be done remains to be
investigated, one option is to default to get_fmt within the kernel,
another option would be to store the single size somewhere in the
v4l2_subdev structure. Other options may be possible.

If we decide that the ioctl shouldn't be mandatory, libcamera should
then default to a different way of querying the sensor capabilities.
This patch (or the new version proposed below) is one option, another
one would be to set a 1x1 TRY format and use what the driver returns.
Here again other option may be possible.

Please see below for additional comments.

> [1] https://github.com/raspberrypi/linux/commit/031525b8e40f342f7842bc69f18bc613d659b0fc
> [2] https://www.spinics.net/lists/linux-media/msg115550.html
> 
> > But there are quite a few sensor drivers which don't support VIDIOC_SUBDEV_ENUM_FRAME_SIZE even though they support several
> > frame sizes.
> > I put them into two groups:
> >
> > 1) Have a small set of fixed sizes:
> >    drivers/media/i2c/ov5647.c (only have 640x480) - 5MP
> >    drivers/media/i2c/imx274.c (3 fixed frame sizes)
> >    drivers/media/i2c/noon010pc30.c (3 fixed frame sizes)
> >    drivers/media/i2c/sr030pc30.c (3 fixed resolutions - 640x480 plus 320x240 and 160x120 (x2 and x4 subsampling))
> >    drivers/media/i2c/tc358743.c (HDMI to CSI-2 bridge; has [set|get]_fmt, but the resolution is "fixed" to what it is getting
> >      from HDMI if I get it correct)
> >
> > 2) Use cropping to set any resolution matching the limits and the restrictions
> > (e.g. height and width might have to be even numbers):
> >    drivers/media/i2c/mt9m001.c (any frame size from 48x32 to 1280x1024 with 2 pixels step) - 1.3 MP
> >    drivers/media/i2c/mt9m111.c (quite similar to the one above) - 1.3 MP
> >    drivers/media/i2c/mt9t112.c (similar to the one above) - 2MP
> >    drivers/media/i2c/mt9v011.c (uses cropping to fit to the resolution requested; doesn't use selection API)
> >    drivers/media/i2c/ov2640.c (uses cropping to set a set of standard resolutions; has get_selection, but not set_selection)
> >    drivers/media/i2c/ov6650.c (uses selection API to crop the image to fit the requested resolution;
> >                             support half scale (QCIF) and full scale (CIF))
> >    drivers/media/i2c/ov7640.c (empty v4l2_subdev_ops)
> >    drivers/media/i2c/ov772x.c (similar to ov2640.c)
> >    drivers/media/i2c/ov9640.c (has a set of 7 standard resolutions; has get_selection, but not set_selection) - 1.3 MP
> >    drivers/media/i2c/rj54n1cb0c.c (uses cropping, and selection API)
> >    drivers/media/i2c/s5k4ecgx.c (4 fixed "preview" - up to 720x480 - resolutions) - 5MP
> >    drivers/media/i2c/s5k6a3.c (?)
> >    drivers/media/i2c/vs6624.c (supports quite a few resolutions) - 1.3 MP
> >
> >>> to enumerate such cameras as it doesn't get the list of resolutions
> >>> the sensor driver supports.
> >
> > - here. libcamera ignores cameras which don't implement VIDIOC_SUBDEV_ENUM_FRAME_SIZE.
> > And there are quite a few of such sensors.
> >
> >>> Fix this by using VIDIOC_SUBDEV_G_FORMAT
> >>> to get the size of the sensor's active format when the ENUM_FRAME_SIZE
> >>> ioctl isn't implemented by the sensor driver.
> >>>
> >>
> >> As a general note, personally, I would prefer drivers to implement the
> >> proper ioctls, and I think we should not provide incentives to work
> >> this around. But if this fixes a real issue with several drivers I
> >> think we could consider this. What do others think here?
> >
> > Again, my real issue is that libcamera uses VIDIOC_SUBDEV_ENUM_FRAME_SIZE to get the list
> > of the resolutions supported by sensor. If sensor responds to this ioctl with -ENOTTY,
> > libcamera creates an empty list of supported resolutions for this sensor and refuses to use it.
> > Here is the call sequence to "enumerate all media bus codes and frame sizes supported by the
> > subdevice on a pad":
> > V4L2Subdevice::formats() -> V4L2Subdevice::enumPadSizes() -> ioctl(VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &sizeEnum))
> >
> > I am not sure if implementing VIDIOC_SUBDEV_ENUM_FRAME_SIZE is a must for every camera sensor;
> > maybe the most from the 2) group above don't really need it.
> > But then it would be good for all the camera sensors to be recognized by libcamera - whether
> > they implement VIDIOC_SUBDEV_ENUM_FRAME_SIZE or not, correct?
> >
> > On a different matter:
> >
> > My current feeling about VIDIOC_SUBDEV_ENUM_FRAME_SIZE is that it might be useful to distinguish
> > between:
> > 1) the resolutions which use the full area of the sensor, have the same field of view, but
> > differ in pixel density (use binning, or subsampling),
> > and 2) the lower resolutions obtained by cropping when only a part of the sensor is used.
> > In this sense e.g. mt9t112.c supports single frame size of 2048x1536, and can use cropping to
> > provide any resolution below 2048x1536.
> >
> > In other words, VIDIOC_SUBDEV_ENUM_FRAME_SIZE could list maximum resolutions the sensor supports
> > (like "16:9 Hi Res", "4:3 Hi Res", "16:9 Low Res", etc - with the same field of view for the same
> > aspect ratio regardless of Hi or Low Res). Versus a (kind of continuous) range of resolutions
> > implemented by cropping which is rather a "digital zoom" in my understanding.

VIDIOC_SUBDEV_ENUM_FRAME_SIZE has been implemented to mimic the related
VIDIOC_ENUM_FRAME_SIZE, which was itself specified to support UVC
devices that expose a set of resolutions without exposing explicing
cropping or scaling. I'd go as far as saying that it was a bit of a
historical mistake for sensors, as we really want drivers that support
explicit binning, skipping and cropping instead of a limited set of
hardcoded resolutions. Of course the majority of sensor drivers just
have a hardcoded list of register settings corresponding to one or a few
modes, and that's what we have to live with :-(

A sensor driver that supports explicit binning/skipping and cropping
should in my opinion report its full size, either through
VIDIOC_SUBDEV_ENUM_FRAME_SIZE (if we decice that the ioctl should be
mandatory), or through the selection API (I think Jacopo has posted a
patch not too long ago to clarify the selection rectangles in that
respect). Cropping and binning/skipping should then be applied on top.
For sensor drivers that support a fixed list of modes,
VIDIOC_SUBDEV_ENUM_FRAME_SIZE should be mandatory.

There's an additional question of how sensors should report their
skipping/binning capabilities. Some sensor drivers currently do so
through VIDIOC_SUBDEV_ENUM_FRAME_SIZE by reporting all the sizes
resulting from skipping/binning the full frame, with cropping being
applied separately. We could decide this is a good API and generalize
it, or pick a different approach.

> > If a sensor has the resolution of e.g. 640x480, the driver and the sensor support both 2x binning and
> > cropping, and the application requests the resolution of 320x240 - how the sensor driver could deduce
> > if the application asks to turn the binning on, or to use the 1/4 of the sensor area (both cases are
> > valid, but are different requests)?

If userspace issues a set_fmt(320x240), the sensor should use binning.
If userspace issues a set_fmt(640x480) and a set_selection(160,120,
320x240) then the sensor should crop to a 320x240 rectangle in the
center of the field of view without binning.

> >>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> >>> ---
> >>>   src/libcamera/v4l2_subdevice.cpp | 20 +++++++++++++++++++-
> >>>   1 file changed, 19 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/src/libcamera/v4l2_subdevice.cpp b/src/libcamera/v4l2_subdevice.cpp
> >>> index f2bcd7f..fac7586 100644
> >>> --- a/src/libcamera/v4l2_subdevice.cpp
> >>> +++ b/src/libcamera/v4l2_subdevice.cpp
> >>> @@ -317,7 +317,25 @@ std::vector<SizeRange> V4L2Subdevice::enumPadSizes(unsigned int pad,
> >>>                                 sizeEnum.max_width, sizeEnum.max_height);
> >>>      }
> >>>
> >>> -    if (ret < 0 && ret != -EINVAL && ret != -ENOTTY) {
> >>> +    if (ret == -ENOTTY) {
> >>> +            struct v4l2_subdev_format format = {};
> >>> +
> >>> +            LOG(V4L2, Debug)
> >>> +                    << "VIDIOC_SUBDEV_ENUM_FRAME_SIZE not implemented "
> >>> +                    << "- trying VIDIOC_SUBDEV_G_FMT";
> >>> +            format.pad = pad;
> >>> +            format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >>> +
> >>> +            ret = ioctl(VIDIOC_SUBDEV_G_FMT, &format);
> >>> +            if (ret == 0) {
> >>> +                    sizes.emplace_back(format.format.width,
> >>> +                                       format.format.height,
> >>> +                                       format.format.width,
> >>> +                                       format.format.height);
> >>
> >> However, I don't think this works... ENUM_FRAME_SIZE has a .code field
> >> in struct v4l2_subdev_frame_size_enum, and enumerates sizes for that
> >> specific mbus code. As you can see the 'sizes' vector this operations
> >> returns is associated with said mbus code in the caller's 'formats'
> >> map.
> >>
> >> G_FMT returns the current format regardless of the mbus code, so if we
> >> want to work around faulty drivers using this approach, I would do
> >> that in the caller, and adjust the 'formats' map, not only the here
> >> enumerated sizes.
> >
> > Good point!
> > I'll try something like that in v2 of this patch:
> >
> > -----8<-----
> > --- a/src/libcamera/v4l2_subdevice.cpp
> > +++ b/src/libcamera/v4l2_subdevice.cpp
> > @@ -166,8 +166,13 @@ ImageFormats V4L2Subdevice::formats(unsigned int pad)
> >
> >          for (unsigned int code : enumPadCodes(pad)) {
> >                  std::vector<SizeRange> sizes = enumPadSizes(pad, code);
> > -               if (sizes.empty())
> > -                       return {};
> > +               if (sizes.empty()) {
> > +                       /* try S_FMT(which = V4L2_SUBDEV_FORMAT_TRY,
> > +                        *           format.width and format.height big enough,
> > +                        *           format.code = code)
> > +                        * if it succeeds, add the returned data to sizes
> > +                        * else return {}; */
> > +               }
> >
> >                  if (formats.addFormat(code, sizes)) {
> > -----8<-----
> >
> >>> +            }
> >>> +    }
> >>> +
> >>> +    if (ret < 0 && ret != -EINVAL) {
> >>>              LOG(V4L2, Error)
> >>>                      << "Unable to enumerate sizes on pad " << pad
> >>>                      << ": " << strerror(-ret);

-- 
Regards,

Laurent Pinchart
