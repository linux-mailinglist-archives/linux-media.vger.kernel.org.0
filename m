Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2C52CD52D
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 13:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387922AbgLCMI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 07:08:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:37502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727845AbgLCMI2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 07:08:28 -0500
Date:   Thu, 3 Dec 2020 13:07:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606997266;
        bh=8Ir5V28DgmdFdEzE4gzj8CANt2YcALqsoTejwYqc+8Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=p5OvQmtJXwRB+yfSsKTIchgr1nDKzN+pKQqy7tONLGon81DVGHDL0an7Q260QYWFP
         0bqa1XxC8mpVfnbmb5ZHT9qbmBNOgxkU4OsvGv1aH9Dw2LCvBi8FiIq9MaVTdhCzq2
         hLsCqW68VjsuXcHbsPoBdZ3z7GhxOt6T1PmFjoDm7tzhA+HZUHYr0HlPGFnBjU1gkd
         CaIVgc9q3BfQdllGLcdkBw2mXnOOFqqxHdki9EQwoIfgorwCmSTaP4DCzoXR0A38Tl
         mjrE49Ioc2DKgwxH6eZ8nNj3Wg1Q9JmB9Gk/d++VA/EHQIr7yMkWxoptGeZ6VKgBtf
         qjEdc4Ad49jOw==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 5/6] vidioc-g-ext-ctrls.rst: add missing 'struct' before
 the types
Message-ID: <20201203130743.1a6a62ca@coco.lan>
In-Reply-To: <66240aa3-1916-dd7d-83bc-367dc8675c40@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
        <20201126132717.1216907-6-hverkuil-cisco@xs4all.nl>
        <20201203114928.2e21964b@coco.lan>
        <66240aa3-1916-dd7d-83bc-367dc8675c40@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Dec 2020 11:52:29 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 03/12/2020 11:49, Mauro Carvalho Chehab wrote:
> > Em Thu, 26 Nov 2020 14:27:16 +0100
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
> >   
> >> Add 'struct' to clarify that these are pointers to structs.  
> > 
> > This patch is actually wrong :-)
> > 
> > It is incompatible with Sphinx 3.
> >   
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 14 +++++++-------
> >>  1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >> index 726d6a97325f..5b1fc62ade0d 100644
> >> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >> @@ -180,31 +180,31 @@ still cause this situation.
> >>        - ``p_u32``
> >>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
> >>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
> >> -    * - :c:type:`v4l2_area` *
> >> +    * - struct :c:type:`v4l2_area` *  
> > 
> > 
> > See, with Sphinx 3, :c:type: can only be used for typedefs and defines.
> > 
> > The right markup for struct is:
> > 
> > 	:c:struct:
> > 
> > Actually, due to automarkup.py extension, I would just rename them to:
> > 
> > 	struct foo
> > 
> > And let the automarkup code to use the right markup, as it will ensure
> > that the proper dialect will be used, no matter what Sphinx version 
> > will be used to produce the docs.
> > 
> > So, I'll drop this patch from the series. I'll propose a new one
> > instead, after testing with multiple versions of Sphinx.  
> 
> 'git grep struct.*:c:type Documentation' shows a lot of those incorrect
> markups. Perhaps make a media-wide patch to fix this? Otherwise people
> will just keep copy-and-pasting the same incorrect markup.

Hmm... looking at Documentation/sphinx/parse-headers.pl, it seems
that the logic is not declaring structs using a Sphinx3 compatible
format, but, instead, using :c:type: everywhere.

So, I guess I'll just merge those two patches as-is, and then
work on a media-wide patchset.

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Regards,
> > Mauro
> > 
> > 
> >   
> >>        - ``p_area``
> >>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_AREA``.
> >> -    * - :c:type:`v4l2_ctrl_h264_sps` *
> >> +    * - struct :c:type:`v4l2_ctrl_h264_sps` *
> >>        - ``p_h264_sps``
> >>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_H264_SPS``.
> >> -    * - :c:type:`v4l2_ctrl_h264_pps` *
> >> +    * - struct :c:type:`v4l2_ctrl_h264_pps` *
> >>        - ``p_h264_pps``
> >>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_pps`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_H264_PPS``.
> >> -    * - :c:type:`v4l2_ctrl_h264_scaling_matrix` *
> >> +    * - struct :c:type:`v4l2_ctrl_h264_scaling_matrix` *
> >>        - ``p_h264_scaling_matrix``
> >>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_scaling_matrix`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_H264_SCALING_MATRIX``.
> >> -    * - :c:type:`v4l2_ctrl_h264_pred_weights` *
> >> +    * - struct :c:type:`v4l2_ctrl_h264_pred_weights` *
> >>        - ``p_h264_pred_weights``
> >>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_pred_weights`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_H264_PRED_WEIGHTS``.
> >> -    * - :c:type:`v4l2_ctrl_h264_slice_params` *
> >> +    * - struct :c:type:`v4l2_ctrl_h264_slice_params` *
> >>        - ``p_h264_slice_params``
> >>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_slice_params`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_H264_SLICE_PARAMS``.
> >> -    * - :c:type:`v4l2_ctrl_h264_decode_params` *
> >> +    * - struct :c:type:`v4l2_ctrl_h264_decode_params` *
> >>        - ``p_h264_decode_params``
> >>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_decode_params`. Valid if this control is
> >>          of type ``V4L2_CTRL_TYPE_H264_DECODE_PARAMS``.  
> > 
> > 
> > 
> > Thanks,
> > Mauro
> >   
> 



Thanks,
Mauro
