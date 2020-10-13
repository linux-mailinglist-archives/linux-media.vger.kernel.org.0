Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8141428CF46
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 15:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgJMNjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 09:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbgJMNja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 09:39:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5B6C0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:39:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n18so24111474wrs.5
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YE+Pkjd1aqCOgEoLbL9OUDes7Lyh5XLGNL8Cy1hP+9I=;
        b=TegkcnBBwDxXRzXom1dBoIKVoE+9z/icOeXEWcpTKkg8OiAHCFf2ooYv6HdhUpZKuU
         uCChNZS7kzoyzGh+flh42SpWzLICr6BST2DtkQLHk9qW9MEXsLmY8WJTKDr4zUxgd/ge
         43FT9WtGSbaY2jscMTIgqQO5OWCTGHDt4214A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YE+Pkjd1aqCOgEoLbL9OUDes7Lyh5XLGNL8Cy1hP+9I=;
        b=juNW51sUTJuW7kgaczuuO/wnDufCiFfweAxsdjXbcD2qtShELUhaFP6X9XeA9oK/fn
         1/jFEhTq962rx41TEldcDBpxbC8z5JUcslHFfiZVg1rj41nKS4LogOS5MQOlSI91wenC
         pBNfC0tNfRes8nPLeLbyPxxVmDLvk3dR9xeivbKXJiR+hLQW//ASiNa4rdgeH3LDW2IJ
         Vz6LxMgOE7MPsPS/0tuYLf0WGj7WEb9OkHybtqPJ1Dsup8FdbqQK7n7GWuOEIYbF/Ff4
         qcbCS98pvitx7lo+5z9KotAO+HkJGbUkCPziFMI5iyZ1ZPtuNbUE1QCw4Q1yUggRDw6V
         jXWg==
X-Gm-Message-State: AOAM530SQJsoA+HoPRJ9k7TJX1CEdzHemA7WfB3R0tfNg7ERSf8aaZ68
        o0AdvnMk2faiRsr165d7cZzLvA==
X-Google-Smtp-Source: ABdhPJxLmBvQPYBchRtu6JM5KuEvDJj35Ja9j/aG4DS7yQJxn15MbnwAPMmvhkQtudG0mpoXd60V8w==
X-Received: by 2002:adf:e741:: with SMTP id c1mr24936112wrn.16.1602596367164;
        Tue, 13 Oct 2020 06:39:27 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id o63sm8414177wmo.2.2020.10.13.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:39:26 -0700 (PDT)
Date:   Tue, 13 Oct 2020 13:39:24 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     vgarodia@codeaurora.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and
 G_SELECTION
Message-ID: <20201013133924.GA1596704@chromium.org>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
 <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
 <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
 <89783dd42e698593d30dc0f37b52cf73@codeaurora.org>
 <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
 <9a107a2a4a167c2b36aa4fa6cb0f97ef@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a107a2a4a167c2b36aa4fa6cb0f97ef@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vikash,

On Tue, Oct 13, 2020 at 02:56:21PM +0530, vgarodia@codeaurora.org wrote:
> 
> On 2020-10-08 19:51, Tomasz Figa wrote:
> > On Wed, Oct 7, 2020 at 9:33 PM <vgarodia@codeaurora.org> wrote:
> > > 
> > > Hi Tomasz,
> > > 
> > > On 2020-10-01 20:47, Tomasz Figa wrote:
> > > > On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
> > > > <stanimir.varbanov@linaro.org> wrote:
> > > >>
> > > >> Hi Tomasz,
> > > >>
> > > >> On 9/25/20 11:55 PM, Tomasz Figa wrote:
> > > >> > Hi Dikshita, Stanimir,
> > > >> >
> > > >> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
> > > >> > <dikshita@codeaurora.org> wrote:
> > > >> >>
> > > >> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > > >> >>
> > > >> >> - return correct width and height for G_SELECTION
> > > >> >> - if requested rectangle wxh doesn't match with capture port wxh
> > > >> >>   adjust the rectangle to supported wxh.
> > > >> >>
> > > >> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> > > >> >> ---
> > > >> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
> > > >> >>  1 file changed, 12 insertions(+), 8 deletions(-)
> > > >> >>
> > > >> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> > > >> >> index 7d2aaa8..a2cc12d 100644
> > > >> >> --- a/drivers/media/platform/qcom/venus/venc.c
> > > >> >> +++ b/drivers/media/platform/qcom/venus/venc.c
> > > >> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> > > >> >>         switch (s->target) {
> > > >> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
> > > >> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
> > > >> >> -               s->r.width = inst->width;
> > > >> >> -               s->r.height = inst->height;
> > > >> >> -               break;
> > > >> >> -       case V4L2_SEL_TGT_CROP:
> > > >> >>                 s->r.width = inst->out_width;
> > > >> >>                 s->r.height = inst->out_height;
> > > >> >>                 break;
> > > >> >> +       case V4L2_SEL_TGT_CROP:
> > > >> >> +               s->r.width = inst->width;
> > > >> >> +               s->r.height = inst->height;
> > > >> >> +               break;
> > > >> >>         default:
> > > >> >>                 return -EINVAL;
> > > >> >>         }inter
> > > >> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> > > >> >>
> > > >> >>         switch (s->target) {
> > > >> >>         case V4L2_SEL_TGT_CROP:
> > > >> >> -               if (s->r.width != inst->out_width ||
> > > >> >> -                   s->r.height != inst->out_height ||
> > > >> >> -                   s->r.top != 0 || s->r.left != 0)
> > > >> >> -                       return -EINVAL;
> > > >> >> +               if (s->r.width != inst->width ||
> > > >> >> +                   s->r.height != inst->height ||
> > > >> >> +                   s->r.top != 0 || s->r.left != 0) {
> > > >> >> +                       s->r.top = 0;
> > > >> >> +                       s->r.left = 0;
> > > >> >> +                       s->r.width = inst->width;
> > > >> >> +                       s->r.height = inst->height;
> > > >> >
> > > >> > What's the point of exposing the selection API if no selection can
> > > >> > actually be done?
> > > >>
> > > >> If someone can guarantee that dropping of s_selection will not break
> > > >> userspace applications I'm fine with removing it.
> > > >
> > > > Indeed the specification could be made more clear about this. The
> > > > visible rectangle configuration is described as optional, so I'd
> > > > consider the capability to be optional as well.
> > > >
> > > > Of course it doesn't change the fact that something that is optional
> > > > in the API may be mandatory for some specific integrations, like
> > > > Chrome OS or Android.
> > > >
> > > >>
> > > >> I implemented g/s_selection with the idea to add crop functionality
> > > >> later because with current firmware interface it needs more work.
> > > >
> > > > I suggested one thing internally, but not sure if it was understood
> > > > correctly:
> > > >
> > > > Most of the encoders only support partial cropping, with the rectangle
> > > > limited to top = 0 and left = 0, in other words, only setting the
> > > > visible width and height. This can be easily implemented on most of
> > > > the hardware, even those that don't have dedicated cropping
> > > > capability, by configuring the hardware as follows:
> > > >
> > > > stride = CAPTURE format width (or bytesperline)
> > > > width = CROP width
> > > > height = CROP height
> > > 
> > > Assuming the bitstream height and width would be configured with
> > > capture
> > > plane
> > > setting (s_fmt), configuring the crop as height/width would indicate
> > > to
> > > venus
> > > hardware as scaling. To distinguish scaling with crop, firmware
> > > needs to
> > > be
> > > configured separately indicating crop rectangle.
> > 
> > The V4L2 encoder API does _not_ configure the bitstream width and
> > height currently. Scaling is not defined in the API at the moment. As
> > per the spec [1], the CAPTURE width and height fields are
> > ignored/read-only.
> > 
> > [1]
> > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization
> > 
> > Currently there are following parameters configured by the V4L2 API:
> > 
> > OUTPUT format width: the number of pixels per line of the input
> > buffer, including any padding pixels, i.e. stride in pixels,
> > OUTPUT format height: the total number of lines of the input buffer.
> > including or not, any padding lines (for NV12 non-M format any padding
> > lines must be included, as plane offsets are calculated based on
> > this),
> > CROP left, width: horizontal position of valid pixel data in the
> > buffer; left is typically 0 and width can be less than OUTPUT format
> > width,
> > CROP top, height: vertical position of valid pixel data in the buffer:
> > top is typically 0 and height can be less than OUTPUT format height,
> 
> I was trying to find if there is any way we can configure the encoder with
> actual YUV size and the required CROP rectangle. Incase the S_FMT on CAPTURE
> plane is ignored, will we ever be able to encode a bitstream with a desired
> crop parameters different than YUV WxH, for ex. the bitstream WxH could be
> 320x192, whereas the CROP in SPS would suggest it to 320x180.
> In my ex. the YUV is 320x192.
> 

Crop in SPS should be exactly what is set in the selection CROP
rectangle. Bitstream WxH (i.e. the number of macroblocks) is entirely at
the discretion of the encoder.

> > > 
> > > > I believe Android requires the hardware to support stride and AFAIK
> > > > this hardware is also commonly used on Android, so perhaps it's
> > > > possible to achieve the above without any firmware changes?
> > > 
> > > Yes, the hardware is used and also supported in android. The interface
> > > to configure
> > > crop rectangle to firmware is via extradata. This extradata info is
> > > passed from v4l2
> > > clients via a separate plane in v4l2 buffer. The extradata payload is
> > > passed to
> > > firmware as is and the firmware parses it to know if crop, roi, etc.
> > 
> > Okay, so do I get it correctly that without extradata, the firmware
> > can only handle the case where width == stride?
> 
> Firmware can support for case when width different than stride, without any
> additional interface requirement. Only when crop is different than YUV
> dimension,
> it would need the additional interface.

Sorry, what is the relation between width/stride and YUV dimension? To
me "width" is the number of meaningful pixels in the line of the YUV
source frame and "stride" is the total number of bytes of the full YUV
line including padding.

> Please confirm if the dimensions from S_SELECTION CROP could be set to
> firmware
> as bitstream dimensions.
> 

Selection CROP rectangle should be set as the SPS crop.

Imagine the following example:

 |<- stride                                   ->|
 |<- width                          ->|         |
 +------------------------------------+---------+----
 |                                    |         | ^ ^
 | meaningful                         |  line   | | |
 | pixels                             | padding |
 |                                    |         |   b
 |                                    |         |   u
 |                                    |         |   f
 |                                    |         |   f
 |                                    |         |   e
 |                                    |         | h r
 |                                    |         | e  
 |                                    |         | i h
 |                                    |         | g e
 |                                    |         | h i
 |                                    |         | t g
 |                                    |         |   h
 |                                    |         | | t
 |                                    |         | V 
 +------------------------------------+---------+-- |
 | plane padding                                |   v
 +----------------------------------------------+----

The encoder cares only about encoding the meaningful frame data that occupies
the top-left-most width x height pixels. Since it needs to produce full
macroblocks, the input might need to be rounded up to full macroblock
dimensions, typically:

coded_width = ALIGN(width, 16)
coded_height = ALIGN(height, 16)

The resulting bitstream would have the resolution of coded_width x
coded_height, however since it only contains width x height of
meaningful pixels, the crop information (in SPS for H.264) would be
equal to width x height.

Now in V4L2,

- width is given by selection CROP rectangle width,
- height is given by selection CROP rectangle height,
- stride is given by OUTPUT format width,
- buffer height is given by OUTPUT format height.

Hopefully this explains it well now.

> > If so, it sounds like this extradata should be generated by the driver
> > internally based on the selection CROP rectangle. In fact, the driver
> > already seems to have a definition of struct hfi_extradata_input_crop
> > [2]. So perhaps it wouldn't require much effort to implement the crop
> > properly?
> IIRC, Stan has done some experiments around the same. Would let him share
> his
> observations for this request.

I think I'm a bit confused now, because I read in your message now that
extradata is not required to handle stride. Let's make sure that we're
on the same page first before starting to research the extradata topic.

Best regards,
Tomasz

> 
> > [2]
> > https://elixir.bootlin.com/linux/v5.9-rc8/source/drivers/media/platform/qcom/venus/hfi_helper.h#L817
> > 
> > Best regards,
> > Tomasz
