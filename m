Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FD1242252
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 00:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgHKWHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 18:07:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37304 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgHKWHJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 18:07:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 39D71299137
Message-ID: <e46251bfd3a93a699a572286da1d5adb13ae2e9e.camel@collabora.com>
Subject: Re: [PATCH v2 03/14] media: uapi: h264: Split prediction weight
 parameters
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Tue, 11 Aug 2020 19:06:57 -0300
In-Reply-To: <3175824.PBOCjEjZKB@jernej-laptop>
References: <20200806151310.98624-1-ezequiel@collabora.com>
         <2153096.Em8KjNIPHG@jernej-laptop>
         <1684df93a76cbd5e5f5435d876cf7fb88681b2ab.camel@collabora.com>
         <3175824.PBOCjEjZKB@jernej-laptop>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas, Jernej and everyone :)

> > > > > > > > +     {
> > > > > > > > +             .cfg = {
> > > > > > > > +                     .id     =
> > > > > > > > V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS,
> > > > > > > > +             },
> > > > > > > > +             .codec          = CEDRUS_CODEC_H264,
> > > > > > > > +             .required       = true,
> > > > > > > 
> > > > > > > This should probably be false if this control is to be optional as
> > > > > > > implied
> > > > > > > by the commit message.
> > > > > > 
> > > > > > Well, the control is optional if the driver implements it as
> > > > > > optional,
> > > > > > which Cedrus isn't currently doing :-)
> > > > > 
> > > > > Why do you think so? Prediction weights are filled only when they are
> > > > > needed:https://elixir.bootlin.com/linux/latest/source/drivers/staging/
> > > > > medi
> > > > > a/ sunxi/cedrus/cedrus_h264.c#L370
> > > > 
> > > > Right, but that should be changed to be really optional.
> > > > How does the driver reject/fail the request if the table is NULL?
> > > 
> > > It's my understanding that pointer to this table can't be NULL. NULL would
> > > mean that there is no control with that ID registered in the driver.
> > 
> > Hm, I'm starting to think you are right. So, does this mean
> > the default quantization matrix here is bogus?
> > 
> >         if (quantization && quantization->load_intra_quantiser_matrix)
> >                 matrix = quantization->intra_quantiser_matrix;
> >         else
> >                 matrix = intra_quantization_matrix_default;
> 
> No, not really. Userspace can set load_intra_quantiser_matrix flag to false.
> 

The above made me revisit the current H264 semantics
for the picture scaling matrix.

As you can see, we currently have V4L2_H264_PPS_FLAG_PIC_SCALING_MATRIX_PRESENT,
which we were expecting to match 1:1 the H264 PPS syntax element
"pic_scaling_matrix_present_flag".

However, after a bit of reflection and discussion with Nicolas, I believe
it's not appropriate to have this flag as a 1:1 match with the PPS syntax element.

A H264 scaling matrix can be first specified by the SPS and then modified
by the PPS. We can expect the modification process to be solved by userspace.
All we need in the uAPI is a flag that indicates
if V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX should be used or not.

(As Jernej already pointed out, a initialized control shall never be NULL,
so we want to flag if the control should be used or not) [1].

Applications are expected to fill V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX
if a scaling matrix needs to be passed, which is the case is:

sps->scaling_matrix_present_flag || pps->pic_scaling_matrix_present_flag

So that is the meaning of the flag we want. [2]

Moreover, Baseline, Main and Extended profiles are specified to have
neither SPS scaling_matrix_present_flag nor PPS pic_scaling_matrix_present_flag
syntax elements, so it makes sense to allow applications _not_ setting
V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX in a request.

On the uAPI side, the only change needed is:

-#define V4L2_H264_PPS_FLAG_PIC_SCALING_MATRIX_PRESENT                  0x0080
+#define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT                      0x0080

(just to avoid confusing the flag with the syntax element)

Together with proper documentation to clarify what the flag is.

Drivers can use this flag as (rkvdec as an example):

-       /* always use the matrix sent from userspace */
-       WRITE_PPS(1, SCALING_LIST_ENABLE_FLAG);
-
+       WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT),
+                 SCALING_LIST_ENABLE_FLAG);

Which also means the scaling matrix control is optional and won't be programmed
to the hardware when the not present. [3]

Thanks!
Ezequiel

[1] We may also check if a control is part of a request or not,
but that seems more complex and more obscure than just checking a flag.

[2] In theory, the uAPI could also have semantics to flag
seq_scaling_list_present_flag[i] and pic_scaling_list_present_flag[i],
for each scaling list. I think this makes things overly complicated.

[3] We could add Flat_4x4_16 and Flat_8x8_16 in the kernel,
but all the drivers we support, have a flag for scaling-matrix-not-present,
so there's no need.

