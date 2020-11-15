Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DFB2B31C2
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 02:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgKOBMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 20:12:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45744 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKOBMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 20:12:41 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D82461F47E3B
Message-ID: <d02ad9d102ffa5c1840aff595aed3af56363532f.camel@collabora.com>
Subject: Re: [PATCH v2 3/9] media: Rename stateful codec control macros
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Sat, 14 Nov 2020 22:12:25 -0300
In-Reply-To: <5b563695-bb40-8309-042b-10c6910d773c@xs4all.nl>
References: <20201113215121.505173-1-ezequiel@collabora.com>
         <20201113215121.505173-4-ezequiel@collabora.com>
         <5b563695-bb40-8309-042b-10c6910d773c@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2020-11-14 at 13:53 +0100, Hans Verkuil wrote:
> On 13/11/2020 22:51, Ezequiel Garcia wrote:
> > For historical reasons, stateful codec controls are named
> > as {}_MPEG_{}. While we can't at this point sanely
> > change all control IDs (such as V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER),
> > we can least change the more meaningful macros such as classes
> > macros.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
> >  .../media/v4l/ext-ctrls-codec.rst             |   4 +-
> >  .../media/v4l/extended-controls.rst           |   8 +-
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
> >  drivers/media/common/cx2341x.c                |   4 +-
> >  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
> >  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |   4 +-
> >  include/media/fwht-ctrls.h                    |   2 +-
> >  include/media/h264-ctrls.h                    |  16 +-
> >  include/media/hevc-ctrls.h                    |  10 +-
> >  include/media/mpeg2-ctrls.h                   |   4 +-
> >  include/media/vp8-ctrls.h                     |   2 +-
> >  include/uapi/linux/v4l2-controls.h            | 409 +++++++++---------
> >  14 files changed, 242 insertions(+), 233 deletions(-)
> > 
> 
> <snip>
> 
> > @@ -1177,4 +1177,13 @@ enum v4l2_detect_md_mode {
> >  #define V4L2_CID_DETECT_MD_THRESHOLD_GRID	(V4L2_CID_DETECT_CLASS_BASE + 3)
> >  #define V4L2_CID_DETECT_MD_REGION_GRID		(V4L2_CID_DETECT_CLASS_BASE + 4)
> >  
> > +/* MPEG-compression definitions kept for backwards compatibility */
> > +#ifndef __KERNEL__
> > +#define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> > +#define V4L2_CID_MPEG_CLASS             (V4L2_CTRL_CLASS_MPEG | 1)
> > +#define V4L2_CID_MPEG_BASE              (V4L2_CTRL_CLASS_MPEG | 0x900)
> > +#define V4L2_CID_MPEG_CX2341X_BASE	(V4L2_CTRL_CLASS_MPEG | 0x1000)
> > +#define V4L2_CID_MPEG_MFC51_BASE	(V4L2_CTRL_CLASS_MPEG | 0x1100)
> 
> Don't copy the offset value here, just keep this as a straight aliases, e.g.:
> 
> #define V4L2_CID_MPEG_MFC51_BASE	V4L2_CID_CODEC_MFC51_BASE
> 
> It's safer that way.
> 

Yes, indeed.

Thanks,
Ezequiel

