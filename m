Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D23296785
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 01:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373230AbgJVXIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 19:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373228AbgJVXIw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 19:08:52 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA77C0613CE
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 16:08:52 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id dn5so3411379edb.10
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uWSV54B/OKBo4pW8L/Me40CYC2u6/kw5r3V8Ega2+lk=;
        b=i5JeO8x/xEltuPI7T1halh5uUdO2NDp/hxZnOlQv9tH/Cem4ogw+XRB090nUdyYUQb
         EY/TMyXiIAQG712S5/l5DgiR5gK8jzyPEuDwdDCEw74OIEShnow46jrzv/PjoyH+mG4P
         tHssejz+LXi9GIDvmCptUTHBDxrmwOL8UKjKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWSV54B/OKBo4pW8L/Me40CYC2u6/kw5r3V8Ega2+lk=;
        b=Nk8EIDnCG9jQBm3D8Qx0KMA3S0GsdWxKEI7IakQLLFqMQVcwXHrdQEvWlXkuluzrF6
         nsA0kA8tpJPEZyIWVjlQE+CM8dg/Gy3RTIY5077dZzQfsvg4wKuUlXFUj5B+Ms51eKZm
         yIjb3RzhOLuCva2tp9uHbNlB8l7pZDlBcWIkekSYidK9tx0XHth/IhIxO5JRYF5qru3Y
         aN4Sqj32AIfsKuUjhHKGo8cIzJDzuJQveUG4ptpB3DttcLcHzQ3L4ypiP8OHhAvkShlb
         cufne8Ul74Es+X/K7PDXKOFbvV5j8laCyvrPU3vIWesFGfJ37/zCHmRScU7KGslHhleE
         Fh+Q==
X-Gm-Message-State: AOAM533LtYYIGlzAN/LvKaalUcUCG8lNaNUteXajOK5TmalJLE6xztxy
        +Pjk3CYlHku7C/4WsOOg5LJbDzrUpnBMIg==
X-Google-Smtp-Source: ABdhPJzUnjdsspQLAZ0jqfI7Ro9ysEn+PYPhMWAJeqxkFrOnbGvVO6Fk5PkTpAumTsuJAxBAkBZhjA==
X-Received: by 2002:a05:6402:1201:: with SMTP id c1mr686884edw.210.1603408130305;
        Thu, 22 Oct 2020 16:08:50 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id bq8sm1629092ejb.53.2020.10.22.16.08.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 16:08:49 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id i1so5710174wro.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 16:08:48 -0700 (PDT)
X-Received: by 2002:adf:82e5:: with SMTP id 92mr4749388wrc.192.1603408127948;
 Thu, 22 Oct 2020 16:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
 <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org> <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
 <89783dd42e698593d30dc0f37b52cf73@codeaurora.org> <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
 <9a107a2a4a167c2b36aa4fa6cb0f97ef@codeaurora.org> <20201013133924.GA1596704@chromium.org>
 <e22edcb77ed83154baba158f1748d6a7@codeaurora.org>
In-Reply-To: <e22edcb77ed83154baba158f1748d6a7@codeaurora.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 23 Oct 2020 01:08:37 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AnA-fm0kNxcGkgsMxWTBvQgyccc9YZL80Estmq_jL+eg@mail.gmail.com>
Message-ID: <CAAFQd5AnA-fm0kNxcGkgsMxWTBvQgyccc9YZL80Estmq_jL+eg@mail.gmail.com>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and G_SELECTION
To:     Vikash Garodia <vgarodia@codeaurora.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 6:37 AM <vgarodia@codeaurora.org> wrote:
>
> Hi Tomasz,
>
> On 2020-10-13 19:09, Tomasz Figa wrote:
> > Hi Vikash,
> >
> > On Tue, Oct 13, 2020 at 02:56:21PM +0530, vgarodia@codeaurora.org
> > wrote:
> >>
> >> On 2020-10-08 19:51, Tomasz Figa wrote:
> >> > On Wed, Oct 7, 2020 at 9:33 PM <vgarodia@codeaurora.org> wrote:
> >> > >
> >> > > Hi Tomasz,
> >> > >
> >> > > On 2020-10-01 20:47, Tomasz Figa wrote:
> >> > > > On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
> >> > > > <stanimir.varbanov@linaro.org> wrote:
> >> > > >>
> >> > > >> Hi Tomasz,
> >> > > >>
> >> > > >> On 9/25/20 11:55 PM, Tomasz Figa wrote:
> >> > > >> > Hi Dikshita, Stanimir,
> >> > > >> >
> >> > > >> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
> >> > > >> > <dikshita@codeaurora.org> wrote:
> >> > > >> >>
> >> > > >> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> > > >> >>
> >> > > >> >> - return correct width and height for G_SELECTION
> >> > > >> >> - if requested rectangle wxh doesn't match with capture port wxh
> >> > > >> >>   adjust the rectangle to supported wxh.
> >> > > >> >>
> >> > > >> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> >> > > >> >> ---
> >> > > >> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
> >> > > >> >>  1 file changed, 12 insertions(+), 8 deletions(-)
> >> > > >> >>
> >> > > >> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> >> > > >> >> index 7d2aaa8..a2cc12d 100644
> >> > > >> >> --- a/drivers/media/platform/qcom/venus/venc.c
> >> > > >> >> +++ b/drivers/media/platform/qcom/venus/venc.c
> >> > > >> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> >> > > >> >>         switch (s->target) {
> >> > > >> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
> >> > > >> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
> >> > > >> >> -               s->r.width = inst->width;
> >> > > >> >> -               s->r.height = inst->height;
> >> > > >> >> -               break;
> >> > > >> >> -       case V4L2_SEL_TGT_CROP:
> >> > > >> >>                 s->r.width = inst->out_width;
> >> > > >> >>                 s->r.height = inst->out_height;
> >> > > >> >>                 break;
> >> > > >> >> +       case V4L2_SEL_TGT_CROP:
> >> > > >> >> +               s->r.width = inst->width;
> >> > > >> >> +               s->r.height = inst->height;
> >> > > >> >> +               break;
> >> > > >> >>         default:
> >> > > >> >>                 return -EINVAL;
> >> > > >> >>         }inter
> >> > > >> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> >> > > >> >>
> >> > > >> >>         switch (s->target) {
> >> > > >> >>         case V4L2_SEL_TGT_CROP:
> >> > > >> >> -               if (s->r.width != inst->out_width ||
> >> > > >> >> -                   s->r.height != inst->out_height ||
> >> > > >> >> -                   s->r.top != 0 || s->r.left != 0)
> >> > > >> >> -                       return -EINVAL;
> >> > > >> >> +               if (s->r.width != inst->width ||
> >> > > >> >> +                   s->r.height != inst->height ||
> >> > > >> >> +                   s->r.top != 0 || s->r.left != 0) {
> >> > > >> >> +                       s->r.top = 0;
> >> > > >> >> +                       s->r.left = 0;
> >> > > >> >> +                       s->r.width = inst->width;
> >> > > >> >> +                       s->r.height = inst->height;
> >> > > >> >
> >> > > >> > What's the point of exposing the selection API if no selection can
> >> > > >> > actually be done?
> >> > > >>
> >> > > >> If someone can guarantee that dropping of s_selection will not break
> >> > > >> userspace applications I'm fine with removing it.
> >> > > >
> >> > > > Indeed the specification could be made more clear about this. The
> >> > > > visible rectangle configuration is described as optional, so I'd
> >> > > > consider the capability to be optional as well.
> >> > > >
> >> > > > Of course it doesn't change the fact that something that is optional
> >> > > > in the API may be mandatory for some specific integrations, like
> >> > > > Chrome OS or Android.
> >> > > >
> >> > > >>
> >> > > >> I implemented g/s_selection with the idea to add crop functionality
> >> > > >> later because with current firmware interface it needs more work.
> >> > > >
> >> > > > I suggested one thing internally, but not sure if it was understood
> >> > > > correctly:
> >> > > >
> >> > > > Most of the encoders only support partial cropping, with the rectangle
> >> > > > limited to top = 0 and left = 0, in other words, only setting the
> >> > > > visible width and height. This can be easily implemented on most of
> >> > > > the hardware, even those that don't have dedicated cropping
> >> > > > capability, by configuring the hardware as follows:
> >> > > >
> >> > > > stride = CAPTURE format width (or bytesperline)
> >> > > > width = CROP width
> >> > > > height = CROP height
> >> > >
> >> > > Assuming the bitstream height and width would be configured with
> >> > > capture
> >> > > plane
> >> > > setting (s_fmt), configuring the crop as height/width would indicate
> >> > > to
> >> > > venus
> >> > > hardware as scaling. To distinguish scaling with crop, firmware
> >> > > needs to
> >> > > be
> >> > > configured separately indicating crop rectangle.
> >> >
> >> > The V4L2 encoder API does _not_ configure the bitstream width and
> >> > height currently. Scaling is not defined in the API at the moment. As
> >> > per the spec [1], the CAPTURE width and height fields are
> >> > ignored/read-only.
> >> >
> >> > [1]
> >> > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization
> >> >
> >> > Currently there are following parameters configured by the V4L2 API:
> >> >
> >> > OUTPUT format width: the number of pixels per line of the input
> >> > buffer, including any padding pixels, i.e. stride in pixels,
> >> > OUTPUT format height: the total number of lines of the input buffer.
> >> > including or not, any padding lines (for NV12 non-M format any padding
> >> > lines must be included, as plane offsets are calculated based on
> >> > this),
> >> > CROP left, width: horizontal position of valid pixel data in the
> >> > buffer; left is typically 0 and width can be less than OUTPUT format
> >> > width,
> >> > CROP top, height: vertical position of valid pixel data in the buffer:
> >> > top is typically 0 and height can be less than OUTPUT format height,
> >>
> >> I was trying to find if there is any way we can configure the encoder
> >> with
> >> actual YUV size and the required CROP rectangle. Incase the S_FMT on
> >> CAPTURE
> >> plane is ignored, will we ever be able to encode a bitstream with a
> >> desired
> >> crop parameters different than YUV WxH, for ex. the bitstream WxH
> >> could be
> >> 320x192, whereas the CROP in SPS would suggest it to 320x180.
> >> In my ex. the YUV is 320x192.
> >>
> >
> > Crop in SPS should be exactly what is set in the selection CROP
> > rectangle. Bitstream WxH (i.e. the number of macroblocks) is entirely
> > at
> > the discretion of the encoder.
> >
> >> > >
> >> > > > I believe Android requires the hardware to support stride and AFAIK
> >> > > > this hardware is also commonly used on Android, so perhaps it's
> >> > > > possible to achieve the above without any firmware changes?
> >> > >
> >> > > Yes, the hardware is used and also supported in android. The interface
> >> > > to configure
> >> > > crop rectangle to firmware is via extradata. This extradata info is
> >> > > passed from v4l2
> >> > > clients via a separate plane in v4l2 buffer. The extradata payload is
> >> > > passed to
> >> > > firmware as is and the firmware parses it to know if crop, roi, etc.
> >> >
> >> > Okay, so do I get it correctly that without extradata, the firmware
> >> > can only handle the case where width == stride?
> >>
> >> Firmware can support for case when width different than stride,
> >> without any
> >> additional interface requirement. Only when crop is different than YUV
> >> dimension,
> >> it would need the additional interface.
> >
> > Sorry, what is the relation between width/stride and YUV dimension? To
> > me "width" is the number of meaningful pixels in the line of the YUV
> > source frame and "stride" is the total number of bytes of the full YUV
> > line including padding.
> >
> >> Please confirm if the dimensions from S_SELECTION CROP could be set to
> >> firmware
> >> as bitstream dimensions.
> >>
> >
> > Selection CROP rectangle should be set as the SPS crop.
> >
> > Imagine the following example:
> >
> >  |<- stride                                   ->|
> >  |<- width                          ->|         |
> >  +------------------------------------+---------+----
> >  |                                    |         | ^ ^
> >  | meaningful                         |  line   | | |
> >  | pixels                             | padding |
> >  |                                    |         |   b
> >  |                                    |         |   u
> >  |                                    |         |   f
> >  |                                    |         |   f
> >  |                                    |         |   e
> >  |                                    |         | h r
> >  |                                    |         | e
> >  |                                    |         | i h
> >  |                                    |         | g e
> >  |                                    |         | h i
> >  |                                    |         | t g
> >  |                                    |         |   h
> >  |                                    |         | | t
> >  |                                    |         | V
> >  +------------------------------------+---------+-- |
> >  | plane padding                                |   v
> >  +----------------------------------------------+----
> >
> > The encoder cares only about encoding the meaningful frame data that
> > occupies
> > the top-left-most width x height pixels. Since it needs to produce full
> > macroblocks, the input might need to be rounded up to full macroblock
> > dimensions, typically:
> >
> > coded_width = ALIGN(width, 16)
> > coded_height = ALIGN(height, 16)
> >
> > The resulting bitstream would have the resolution of coded_width x
> > coded_height, however since it only contains width x height of
> > meaningful pixels, the crop information (in SPS for H.264) would be
> > equal to width x height.
> >
> > Now in V4L2,
> >
> > - width is given by selection CROP rectangle width,
> > - height is given by selection CROP rectangle height,
> > - stride is given by OUTPUT format width,
> > - buffer height is given by OUTPUT format height.
> >
> > Hopefully this explains it well now.
>
> I am experimenting more on this by setting the stride to Venus during
> s_fmt on
> OUTPUT plane format. And setting the bitstream dimensions to firmware
> from the
> CROP selection. There are below limitations in this approach w.r.t Venus
> hardware
> 1. Stride would work for linear YUVs (NV12). For compressed (UBWC) YUV,
> fixed stride
> have few hardware limitations.
> 2. Stride and CROP can work when the left and top are [0,0]. At the
> moment, there
> isn't an interface to specify the start offset to firmware.

Thanks for the investigation. In the meantime I also studied the venus
driver more closely and I noticed that actually it already supports
what you described above and does it in a way that is against the
specification.

It expects that the userspace sets width and height to the CAPTURE
queue and uses it as the visible resolution for the encoded stream.
The way mandated by the specification is to ignore CAPTURE width and
height and take these values from the selection CROP rectangle
instead.

Would you be able to work on modifying the driver to follow the compliant way?

>
> Also, do we think, we should make S_SELECTION as mandatory in the
> initialization
> sequence ? It would work without S_SELECTION as well, but the encoded
> bitstream
> would have dimensions as the aligned ones (strides) as set in S_FMT
> (OUTPUT plane).

The meaning of something being mandatory in V4L2 is a bit fuzzy,
because V4L2 is expected to always retain valid state. In case of
selection, the CROP_DEFAULT rectangle is defined to be the full frame
size and it could work in many cases. For example, it's not uncommon
for desktop Linux applications to manage the source buffers the
opposite way - first negotiate the format with the encoder and
allocate buffers and only then produce the contents appropriately to
match the encoded stream.

Best regards,
Tomasz

>
> >> > If so, it sounds like this extradata should be generated by the driver
> >> > internally based on the selection CROP rectangle. In fact, the driver
> >> > already seems to have a definition of struct hfi_extradata_input_crop
> >> > [2]. So perhaps it wouldn't require much effort to implement the crop
> >> > properly?
> >> IIRC, Stan has done some experiments around the same. Would let him
> >> share
> >> his
> >> observations for this request.
> >
> > I think I'm a bit confused now, because I read in your message now that
> > extradata is not required to handle stride. Let's make sure that we're
> > on the same page first before starting to research the extradata topic.
> >
> > Best regards,
> > Tomasz
> >
> >>
> >> > [2]
> >> > https://elixir.bootlin.com/linux/v5.9-rc8/source/drivers/media/platform/qcom/venus/hfi_helper.h#L817
> >> >
> >> > Best regards,
> >> > Tomasz
