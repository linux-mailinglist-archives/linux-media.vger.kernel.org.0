Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2925B588B83
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbiHCLr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 07:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiHCLr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 07:47:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7614F6350
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 04:47:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E81B8B;
        Wed,  3 Aug 2022 13:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659527241;
        bh=KNAeT00fmiirJRllw30E2Ql9nH7TwVPOq3cd02BWIRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GIo8/b4R7kYyDSrjSvULyQP9/u4RLSNWgYOqhPZtAaXyRZhXhV2Gh2TFqqIEO4eLW
         bVMZvbKIxt9FEno+Iqlx4A0E5eE6JC3pSRNe9w6mSWyPfdbnO76E7kHZs5ZXdHbIk1
         Np+NUKyKvDkXEwVmegp0mhCKf1BphZMHvf3/jkJM=
Date:   Wed, 3 Aug 2022 14:47:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>
Subject: Re: [PATCH] videodev2.h: drop V4L2_CAP_ASYNCIO
Message-ID: <YupgQ1npBDTFq1cj@pendragon.ideasonboard.com>
References: <d3361317-f975-5e01-6a2e-2415e07e7f16@xs4all.nl>
 <YupaiqH/uslLYNHS@pendragon.ideasonboard.com>
 <97f7618b-bd3e-3cf7-652c-0498ac4df270@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97f7618b-bd3e-3cf7-652c-0498ac4df270@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Aug 03, 2022 at 01:39:04PM +0200, Hans Verkuil wrote:
> On 03/08/2022 13:22, Laurent Pinchart wrote:
> > On Wed, Aug 03, 2022 at 12:04:02PM +0200, Hans Verkuil wrote:
> >> The V4L2_CAP_ASYNCIO capability was never implemented (and in fact
> >> it isn't clear what it is supposed to do in the first place).
> >>
> >> Drop it from the capabilities list. Keep it in videodev2.h defined
> >> to 0 with the other defines under ifndef __KERNEL__ for backwards
> >> compatibility.
> >>
> >> This will free up a capability bit for other future uses. And having
> >> an unused and undefined I/O method is just plain confusing.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  Documentation/userspace-api/media/v4l/async.rst          | 9 ---------
> >>  Documentation/userspace-api/media/v4l/dev-raw-vbi.rst    | 2 +-
> >>  Documentation/userspace-api/media/v4l/dev-sdr.rst        | 2 +-
> >>  Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst | 2 +-
> >>  Documentation/userspace-api/media/v4l/hist-v4l2.rst      | 2 +-
> >>  Documentation/userspace-api/media/v4l/io.rst             | 4 +---
> >>  .../userspace-api/media/v4l/vidioc-querycap.rst          | 3 ---
> >>  include/uapi/linux/videodev2.h                           | 2 +-
> >>  8 files changed, 6 insertions(+), 20 deletions(-)
> >>  delete mode 100644 Documentation/userspace-api/media/v4l/async.rst
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/async.rst b/Documentation/userspace-api/media/v4l/async.rst
> >> deleted file mode 100644
> >> index d6960ff5c382..000000000000
> >> --- a/Documentation/userspace-api/media/v4l/async.rst
> >> +++ /dev/null
> >> @@ -1,9 +0,0 @@
> >> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >> -
> >> -.. _async:
> >> -
> >> -****************
> >> -Asynchronous I/O
> >> -****************
> >> -
> >> -This method is not defined yet.
> >> diff --git a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> >> index 58f97c3a7792..2bec20d87928 100644
> >> --- a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> >> +++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> >> @@ -41,7 +41,7 @@ Devices supporting the raw VBI capturing or output API set the
> >>  in the ``capabilities`` field of struct
> >>  :c:type:`v4l2_capability` returned by the
> >>  :ref:`VIDIOC_QUERYCAP` ioctl. At least one of the
> >> -read/write, streaming or asynchronous I/O methods must be supported. VBI
> >> +read/write or streaming I/O methods must be supported. VBI
> >>  devices may or may not have a tuner or modulator.
> >>  
> >>  Supplemental Functions
> >> diff --git a/Documentation/userspace-api/media/v4l/dev-sdr.rst b/Documentation/userspace-api/media/v4l/dev-sdr.rst
> >> index 928884dfe09d..dfdeddbca41f 100644
> >> --- a/Documentation/userspace-api/media/v4l/dev-sdr.rst
> >> +++ b/Documentation/userspace-api/media/v4l/dev-sdr.rst
> >> @@ -34,7 +34,7 @@ Devices supporting the SDR transmitter interface set the
> >>  device has an Digital to Analog Converter (DAC), which is a mandatory
> >>  element for the SDR transmitter.
> >>  
> >> -At least one of the read/write, streaming or asynchronous I/O methods
> >> +At least one of the read/write or streaming I/O methods
> >>  must be supported.
> >>  
> >>  
> >> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> >> index 97ec2b115c71..44415822c7c5 100644
> >> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> >> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> >> @@ -36,7 +36,7 @@ Devices supporting the sliced VBI capturing or output API set the
> >>  respectively, in the ``capabilities`` field of struct
> >>  :c:type:`v4l2_capability` returned by the
> >>  :ref:`VIDIOC_QUERYCAP` ioctl. At least one of the
> >> -read/write, streaming or asynchronous :ref:`I/O methods <io>` must be
> >> +read/write or streaming :ref:`I/O methods <io>` must be
> >>  supported. Sliced VBI devices may have a tuner or modulator.
> >>  
> >>  Supplemental Functions
> >> diff --git a/Documentation/userspace-api/media/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
> >> index 28a2750d5c8c..dbc04374dc22 100644
> >> --- a/Documentation/userspace-api/media/v4l/hist-v4l2.rst
> >> +++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
> >> @@ -316,7 +316,7 @@ This unnamed version was finally merged into Linux 2.5.46.
> >>      There are new fields to identify the driver, a new RDS device
> >>      function ``V4L2_CAP_RDS_CAPTURE``, the ``V4L2_CAP_AUDIO`` flag
> >>      indicates if the device has any audio connectors, another I/O
> >> -    capability ``V4L2_CAP_ASYNCIO`` can be flagged. In response to these
> >> +    capability V4L2_CAP_ASYNCIO can be flagged. In response to these
> >>      changes the ``type`` field became a bit set and was merged into the
> >>      ``flags`` field. ``V4L2_FLAG_TUNER`` was renamed to
> >>      ``V4L2_CAP_TUNER``, ``V4L2_CAP_VIDEO_OVERLAY`` replaced
> >> diff --git a/Documentation/userspace-api/media/v4l/io.rst b/Documentation/userspace-api/media/v4l/io.rst
> >> index ce0cece6f35f..4b1964df9d73 100644
> >> --- a/Documentation/userspace-api/media/v4l/io.rst
> >> +++ b/Documentation/userspace-api/media/v4l/io.rst
> >> @@ -17,8 +17,7 @@ read or write will fail at any time.
> >>  
> >>  Other methods must be negotiated. To select the streaming I/O method
> >>  with memory mapped or user buffers applications call the
> >> -:ref:`VIDIOC_REQBUFS` ioctl. The asynchronous I/O
> >> -method is not defined yet.
> >> +:ref:`VIDIOC_REQBUFS` ioctl.
> >>  
> >>  Video overlay can be considered another I/O method, although the
> >>  application does not directly receive the image data. It is selected by
> >> @@ -46,6 +45,5 @@ The following sections describe the various I/O methods in more detail.
> >>      mmap
> >>      userp
> >>      dmabuf
> >> -    async
> >>      buffer
> >>      field-order
> >> diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> >> index 63e23f6f95ee..6c57b8428356 100644
> >> --- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> >> +++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> >> @@ -244,9 +244,6 @@ specification the ioctl returns an ``EINVAL`` error code.
> >>        - 0x01000000
> >>        - The device supports the :c:func:`read()` and/or
> >>  	:c:func:`write()` I/O methods.
> >> -    * - ``V4L2_CAP_ASYNCIO``
> >> -      - 0x02000000
> >> -      - The device supports the :ref:`asynchronous <async>` I/O methods.
> >>      * - ``V4L2_CAP_STREAMING``
> >>        - 0x04000000
> >>        - The device supports the :ref:`streaming <mmap>` I/O method.
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index 01e630f2ec78..1af12e5928aa 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -502,7 +502,6 @@ struct v4l2_capability {
> >>  #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
> >>  
> >>  #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
> >> -#define V4L2_CAP_ASYNCIO                0x02000000  /* async I/O */
> >>  #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
> >>  #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
> >>  
> >> @@ -2682,6 +2681,7 @@ struct v4l2_create_buffers {
> >>  #ifndef __KERNEL__
> >>  #define V4L2_PIX_FMT_HM12 V4L2_PIX_FMT_NV12_16L16
> >>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 V4L2_PIX_FMT_NV12_32L32
> >> +#define V4L2_CAP_ASYNCIO 0
> > 
> > I'm fine dropping V4L2_CAP_ASYNCIO, but this particular change doesn't
> > sound right. Applications that would do, for instance,
> > 
> > 	if (caps & V4L2_CAP_ASYNCIO) {
> > 		...
> > 	}
> > 
> > could now get a warning from the compiler that the condition is always
> > false.
> 
> Isn't that better than failing to compile?

Yes, but it's worse than compiling without warning :-) Especially for
projects that compile with -Werror by default.

> When it is used in applications it is typically used to log the caps:
> 
> 		if (vid_cap.capabilities & V4L2_CAP_ASYNCIO){
> 			printf("    Supports async i/o: Yes\n");
> 		} else {
> 			printf("    Supports async i/o: No\n");
> 		}
> 
> (https://gist.github.com/tugstugi/2627647, found with a quick google search).
> 
> Just dropping the cap altogether will cause all these applications to fail to
> compile, and I don't think that's the right thing to do.
> 
> I do think that a comment should be added in videodev2.h stating that that
> capability was never actually used and applications should remove support for
> it (or something along those lines). So if they see the warning, then they can
> look up in the header what they should do to fix it.
> 
> If you have a better suggestion, then I'm all ears :-)

We could keep it defined with its current value. The drawback is that it
will indeed not push applications to drop usage of V4L2_CAP_ASYNCIO if
they don't notice anything.

libcamera doesn't use that flag so I'm not too concerned personally :-)
v4l-utils should be fixed though, but it carries a copy of videodev2.h,
so it won't be directly affected.

> >>  #endif
> >>  
> >>  #endif /* _UAPI__LINUX_VIDEODEV2_H */

-- 
Regards,

Laurent Pinchart
