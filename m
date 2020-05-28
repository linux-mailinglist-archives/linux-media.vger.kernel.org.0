Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DDB1E59E6
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 09:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgE1Hyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 03:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgE1Hyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 03:54:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC0CC05BD1E
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 00:54:40 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jeDN9-0001aP-8c; Thu, 28 May 2020 09:54:39 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jeDN8-0003Oh-HU; Thu, 28 May 2020 09:54:38 +0200
Date:   Thu, 28 May 2020 09:54:38 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCHv3 2/5] vidioc-g-parm.rst: update the VIDIOC_G/S_PARM
 documentation
Message-ID: <20200528075438.GC19211@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200526100932.2626420-3-hverkuil-cisco@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:51:57 up 98 days, 15:22, 110 users,  load average: 0.17, 0.15,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 12:09:29PM +0200, Hans Verkuil wrote:
> This documentation is very outdated. In particular, it is
> not obvious at all that this is used to change the framerate of
> sensors.
> 
> Fix it, and include references to the stateful encoder API where
> this works slightly different.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  .../userspace-api/media/v4l/vidioc-g-parm.rst | 51 ++++++++++++-------
>  1 file changed, 32 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
> index 42e9f6ee7a59..af3c5863bb87 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
[snip]
> @@ -113,14 +115,21 @@ union holding separate parameters for input and output devices.
>      * - struct :c:type:`v4l2_fract`
>        - ``timeperframe``
>        - This is the desired period between successive frames captured by
> -	the driver, in seconds. The field is intended to skip frames on
> -	the driver side, saving I/O bandwidth.
> +	the driver, in seconds.
> +    * - :cspan:`2`
> +
> +	This will configure the speed at which the video source (e.g. a sensor)
> +	generates video frames. If the speed is fixed, then the driver may
> +	choose to skip or repeat frames in order to achieve the requested
> +	frame rate.
> +
> +        For stateful encoders (see :ref:`encoder`) this represents the

Spaces instead of tab.

> +	frame interval that is typically embedded in the encoded video stream.
>  
>  	Applications store here the desired frame period, drivers return
> -	the actual frame period, which must be greater or equal to the
> -	nominal frame period determined by the current video standard
> -	(struct :c:type:`v4l2_standard` ``frameperiod``
> -	field). Changing the video standard (also implicitly by switching
> +	the actual frame period.
> +
> +	Changing the video standard (also implicitly by switching
>  	the video input) may reset this parameter to the nominal frame
>  	period. To reset manually applications can just set this field to
>  	zero.
> @@ -173,11 +182,15 @@ union holding separate parameters for input and output devices.
>  	:ref:`write() <func-write>` mode (in streaming mode timestamps
>  	can be used to throttle the output), saving I/O bandwidth.
>  
> +        For stateful encoders (see :ref:`encoder`) this represents the

Spaces instead of tab.

Michael

> +	frame interval that is typically embedded in the encoded video stream
> +	and it provides a hint to the encoder of the speed at which raw
> +	frames are queued up to the encoder.
> +
>  	Applications store here the desired frame period, drivers return
> -	the actual frame period, which must be greater or equal to the
> -	nominal frame period determined by the current video standard
> -	(struct :c:type:`v4l2_standard` ``frameperiod``
> -	field). Changing the video standard (also implicitly by switching
> +	the actual frame period.
> +
> +	Changing the video standard (also implicitly by switching
>  	the video output) may reset this parameter to the nominal frame
>  	period. To reset manually applications can just set this field to
>  	zero.
> @@ -216,8 +229,8 @@ union holding separate parameters for input and output devices.
>  
>      * - ``V4L2_CAP_TIMEPERFRAME``
>        - 0x1000
> -      - The frame skipping/repeating controlled by the ``timeperframe``
> -	field is supported.
> +      - The frame period can be modified by setting the ``timeperframe``
> +	field.
>  
>  
>  
> -- 
> 2.25.1
> 
> 
