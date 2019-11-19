Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD88102914
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 17:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfKSQPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 11:15:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42771 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfKSQPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 11:15:02 -0500
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1iX69d-0005vF-BY; Tue, 19 Nov 2019 17:15:01 +0100
Date:   Tue, 19 Nov 2019 17:15:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 0/5] Stateful Encoding: final bits
Message-ID: <20191119171500.44006786@litschi.hi.pengutronix.de>
In-Reply-To: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
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

Hi Hans,

On Tue, 19 Nov 2019 12:34:52 +0100, Hans Verkuil wrote:
> This series adds support for fractions in the control framework,
> and a way to obtain the min and max values of compound controls
> such as v4l2_fract.
> 
> Next it adds the V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to
> set the framerate for the encoder.
> 
> The next patch adds support for the V4L2_BUF_FLAG_TOO_SMALL flag
> to signal that the capture buffer was too small.
> 
> The final patch adds the encoder spec (unchanged from v3).
> 
> Michael, can you add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
> to your encoder driver? Let me know if something isn't working.

Thanks. Add will add the control and send patches.

> I need to add a test control for this to vivid as well and add support
> for this to v4l2-ctl, that's on my TODO list.
> 
> Open questions:
> 
> 1) Existing encoder drivers use S_PARM to signal the frameperiod,
> but as discussed in Lyon this should be the rate at which frames are
> submitted for encoding, which can be different from
> V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE. But given the current use-cases
> I was wondering if calling S_PARM should set the ENC_FRAME_RATE
> control as well, and you would need to explicitly set the control
> after S_PARM if the two are not the same. This would mean that
> existing applications that don't know about the control can keep working.

I am slightly confused, because I thought that S_PARM and
V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE should be used exactly the other way
around, but it makes sense to use S_PARM for configuring the frame rate
for producing frames in the hardware.

For encoding live the rate at which frames are submitted to the encoder
is the same as the framerate of the produced stream. They only differ
for use cases where we want to encode faster or slower than the
playback rate of the resulting stream. I guess assuming that they are
by default the same and only adapt the control if necessary should be
fine.

Michael

> 
> 2) I do believe that we need a RELEASE/DEL/DESTROY_BUFS ioctl in
> order to do proper handling of the V4L2_BUF_FLAG_TOO_SMALL case.
> I am inclined to postpone adding this flag until we have that ioctl.
> We can still merge the stateful encoder spec if we mention that that
> is work in progress.
> 
> Regards,
> 
> 	Hans
> 
> Hans Verkuil (4):
>   v4l2-ctrls: add support for v4l2_fract types
>   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
>   v4l2-controls.h: add V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
>   videodev2.h: add V4L2_BUF_FLAG_TOO_SMALL flag
> 
> Tomasz Figa (1):
>   media: docs-rst: Document memory-to-memory video encoder interface
> 
>  Documentation/media/uapi/v4l/buffer.rst       |   9 +
>  Documentation/media/uapi/v4l/dev-encoder.rst  | 608 ++++++++++++++++++
>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        |   8 +
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   5 +
>  Documentation/media/uapi/v4l/v4l2.rst         |   2 +
>  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |  51 +-
>  .../media/uapi/v4l/vidioc-g-ext-ctrls.rst     |  15 +-
>  .../media/uapi/v4l/vidioc-queryctrl.rst       |   6 +
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  .../media/common/videobuf2/videobuf2-core.c   |  12 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +
>  drivers/media/i2c/imx214.c                    |   4 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 222 ++++++-
>  include/media/v4l2-ctrls.h                    |  72 ++-
>  include/media/videobuf2-core.h                |   4 +
>  include/uapi/linux/v4l2-controls.h            |   1 +
>  include/uapi/linux/videodev2.h                |   6 +
>  18 files changed, 980 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
> 
