Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F271E59F4
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 09:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgE1H6L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 03:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgE1H6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 03:58:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29219C05BD1E
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 00:58:11 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jeDQX-0002A3-QP; Thu, 28 May 2020 09:58:09 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jeDQX-0003Xf-GG; Thu, 28 May 2020 09:58:09 +0200
Date:   Thu, 28 May 2020 09:58:09 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCHv3 0/5] Stateful Encoding: final bits
Message-ID: <20200528075809.GD19211@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:54:43 up 98 days, 15:25, 110 users,  load average: 0.02, 0.09,
 0.12
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 12:09:27PM +0200, Hans Verkuil wrote:
> This series adds the encoder spec and updates the VIDIOC_G/S_PARM
> documentation.
> 
> This is a follow-up of the original "Stateful Encoding: final bits"
> series (1). 
> 
> The patches in that series that add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
> and V4L2_BUF_FLAG_TOO_SMALL have been dropped (the first is not necessary
> and the second can be skipped for now, see the irc discussion with
> Nicolas [3]).

Thanks for all the work.

Apart from two really small formatting issues the entire series is

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

Michael

> 
> The encoder spec has been updated since [2] with the following
> changes:
> 
> - Document the optional VIDIOC_ENUM_FRAMEINTERVALS ioctl.
> 
> - Document how to use VIDIOC_S_PARM:
> 
>   1) calling S_PARM for the OUTPUT queue sets both the raw frame interval
>      (this is a hint only) and the coded frame interval.
> 
>   2) calling S_PARM for the CAPTURE queue sets the coded frame interval
>      only. This is optional and can be used for off-line encoding. In
>      that case the OUTPUT frame interval can be used by the driver to
>      schedule multiple encoders.
>  
>   Ideally S_PARM for the OUTPUT queue would just provide a hint, but
>   existing encoder drivers all use S_PARM for the OUTPUT queue to
>   define the coded frame interval, and that can't be changed.
> 
> - Added a note that if a capture buffer is too small it will be
>   returned with V4L2_BUF_FLAG_ERROR and that more work has to be
>   done to properly support this corner case.
> 
> - Clarify in the 'Encoding' section that there are more reasons
>   why 'a buffer queued to OUTPUT may result in more than one buffer
>   produced on CAPTURE'.
> 
> Added in v3:
> 
> - Fix some minor typos.
> 
> - Make it more explicit that setting S_PARM(OUTPUT) also sets the
>   CAPTURE frame interval.
> 
> - Added a new V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag to indicate
>   that S_PARM(CAPTURE) can be set separately.
> 
> I think that with these changes this stateful encoder spec is ready
> to be merged.
> 
> Regards,
> 
> 	Hans
> 
> [1] https://lore.kernel.org/linux-media/20191119113457.57833-6-hverkuil-cisco@xs4all.nl/T/
> [2] https://www.mail-archive.com/linux-media@vger.kernel.org/msg149211.html
> [3] https://linuxtv.org/irc/irclogger_log/v4l?date=2020-05-19,Tue
> 
> Hans Verkuil (4):
>   vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
>   dev-decoder.rst: small fixes
>   videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
>   dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
> 
> Tomasz Figa (1):
>   media: docs-rst: Document memory-to-memory video encoder interface
> 
>  .../userspace-api/media/v4l/dev-decoder.rst   |   6 +-
>  .../userspace-api/media/v4l/dev-encoder.rst   | 729 ++++++++++++++++++
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>  .../media/v4l/vidioc-enum-fmt.rst             |  30 +-
>  .../userspace-api/media/v4l/vidioc-g-parm.rst |  51 +-
>  .../media/videodev2.h.rst.exceptions          |   1 +
>  include/uapi/linux/videodev2.h                |   1 +
>  10 files changed, 830 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> 
> -- 
> 2.25.1
> 
> 

-- 
Pengutronix e.K.                           | Michael Tretter             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
