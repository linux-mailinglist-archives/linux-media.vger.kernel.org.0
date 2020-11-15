Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1F92B3185
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 01:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgKOACO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 19:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKOACO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 19:02:14 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B952C0613D1;
        Sat, 14 Nov 2020 16:02:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E51EE1F47E41
Message-ID: <fe46772874203350c13675843cf8e7d380ef6ecd.camel@collabora.com>
Subject: Re: [PATCH v2 0/9] Stateless H.264 de-staging
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Sat, 14 Nov 2020 21:02:00 -0300
In-Reply-To: <73f46141-7fb5-925c-b9db-7af608d0dfd4@xs4all.nl>
References: <20201113215121.505173-1-ezequiel@collabora.com>
         <73f46141-7fb5-925c-b9db-7af608d0dfd4@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the quick review.

On Sat, 2020-11-14 at 13:58 +0100, Hans Verkuil wrote:
> On 13/11/2020 22:51, Ezequiel Garcia wrote:
> > Now that H.264 stateless controls are solid, we can get it
> > out of staging.
> > 
> > Following some guidelines from Hans, this series creates a
> > new stateless control class for the stable codec controls to land.
> > 
> > While here, I'm including a patch from Jonas adding profiles
> > and levels to Rkvdec, and also made a similar fix for Cedrus.
> > 
> > This series was tested on a i.MX8MQ EVK board, using GStreamer:
> > 
> > https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/h264_stable_uapi
> > 
> > In case someone wants to give this a test.
> > 
> > Note that v4l2-compliance isn't passing, as the Hantro driver
> > doesn't set legal default values for the H264 SPS, PPS, etc
> > controls.
> > 
> > That's something we should fix, although it's since it's just
> > meant to please v4l2-compliance, we could also argue that these
> > controls shouldn't be expected to have any default value.
> 

Looking into more detail, v4l2-compliance was failing due to
checks in std_validate_compound for VP8 controls.

H264 controls are not currently validated (but sounds like
we'll want to, from below discussion).

> This really needs to be fixed. I've ignored this issue since the API
> was in staging and still changing, but when we move it out of staging,
> then this issue should be tackled.
> 

Sure.

> It should likely be done in std_init_compound() in v4l2-ctrls.c.
> 

Yes, MPEG2 controls are already initialized over there.

>   
> It is probably a good idea to also verify std_validate_compound(), making
> sure that everything there is still valid and up to date.
> 

Indeed. I'm actually more concerned about std_validate_compound,
which should do some parameter sanitization. Thanks for catching this.
 
> And std_log() should be taught about these new controls. For compound
> controls I would just log the type name, e.g. "H264_SPS" and not the
> values of these compound controls.
> 

I guess this makes some sense, if only for consistency.

Is there any other reason to have this? The codec drivers are not
implementing VIDIOC_LOG_STATUS. If we were to use v4l2_ctrl_log_status,
we'd only get something like this:

   v4l2-ctrls: hantro-vpu 38300000.video-codec: H264 Sequence Parameter Set: H264_SPS
   v4l2-ctrls: hantro-vpu 38300000.video-codec: H264 Picture Parameter Set: H264_PPS
   ...
   v4l2-ctrls: hantro-vpu 38300000.video-codec: H264 Decode Mode: Frame-Based
   v4l2-ctrls: hantro-vpu 38300000.video-codec: H264 Start Code: Annex B Start Code
   v4l2-ctrls: hantro-vpu 38300000.video-codec: H264 Profile: Main

Also...

Another thing I missed is here is driver destaging. I would really want to start
getting the drivers out of staging as well. Can we have some
VIDEO_V4L2_UNSTABLE_STATELESS option in media/staging, so we can
use that in drivers?

This way, we would not offer the staging controls and pixel formats
unless the user explicitly enables that option.

The core could also print a warning when the option is enabled,
and controls are first created.

So we'd move cedrus, hantro and rkvdec out of staging on this series
as well, supporting H264 only, by default.
 
Thanks!
Ezequiel 

> Regards,
> 
> 	Hans
> 
> > Thanks,
> > Ezequiel
> > 
> > v2:
> >   * Split destage changes in several patches so it's easier to review.
> >   * Added missing changes to drivers/media/v4l2-core/v4l2-ctrls.c.
> >   * Renamed V4L2_CID_CODEC_CX2341X_ and V4L2_CID_MPEG_MFC51_
> >   * Moved the compatibility macros for MPEG to the end of the header.
> > 
> > Ezequiel Garcia (8):
> >   media: cedrus: h264: Support profile and level controls
> >   media: Rename stateful codec control macros
> >   media: Clean stateless control includes
> >   media: controls: Add the stateless codec control class
> >   media: uapi: Move parsed H264 pixel format out of staging
> >   media: uapi: Move the H264 stateless control types out of staging
> >   media: uapi: move H264 stateless controls out of staging
> >   media: docs: Move the H264 stateless codec uAPI
> > 
> > Jonas Karlman (1):
> >   media: rkvdec: h264: Support profile and level controls
> > 
> >  .../userspace-api/media/v4l/common.rst        |   1 +
> >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
> >  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
> >  .../media/v4l/ext-ctrls-codec.rst             | 696 +---------------
> >  .../media/v4l/extended-controls.rst           |   8 +-
> >  .../media/v4l/pixfmt-compressed.rst           |  14 +-
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
> >  drivers/media/common/cx2341x.c                |   4 +-
> >  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
> >  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  45 +-
> >  drivers/staging/media/hantro/hantro_drv.c     |  26 +-
> >  drivers/staging/media/hantro/hantro_h264.c    |   8 +-
> >  drivers/staging/media/hantro/hantro_hw.h      |   4 +-
> >  drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
> >  drivers/staging/media/rkvdec/rkvdec.c         |  39 +-
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   |  45 +-
> >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
> >  include/media/fwht-ctrls.h                    |   2 +-
> >  include/media/h264-ctrls.h                    |  27 +-
> >  include/media/hevc-ctrls.h                    |  10 +-
> >  include/media/mpeg2-ctrls.h                   |   4 +-
> >  include/media/v4l2-ctrls.h                    |   1 -
> >  include/media/v4l2-h264.h                     |   2 +-
> >  include/media/vp8-ctrls.h                     |   2 +-
> >  include/uapi/linux/v4l2-controls.h            | 788 +++++++++++++-----
> >  include/uapi/linux/videodev2.h                |   8 +
> >  27 files changed, 1422 insertions(+), 1018 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> > 


