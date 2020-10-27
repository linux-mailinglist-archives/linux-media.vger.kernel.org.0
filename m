Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683BD29B7C3
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 17:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901143AbgJ0PQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 11:16:24 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:34157 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1795123AbgJ0PPJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 11:15:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603811707; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+ni+ElZ51+9o/U34MtcSHE2jVx8HQk6AVrf43/D6LZU=;
 b=kb1heP3pWuPxmEbNCSqMjB+NWWIKfQ6T32phRzEwvUqzSKWvQpRcR5xanRIL6RZa5Vc4S3iy
 k9o+LFqYmh9QJ/5OUrvnasvNqjx9axDKxasOxgKWjPqa+ZUILnxeS9NhhbUQXxwzkkynz031
 ratPLt63YAwUpxNSbVWyRwcauDI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f98368200143fe65274950c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 15:02:26
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE8C8C38531; Tue, 27 Oct 2020 15:02:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2AFBC4479E;
        Tue, 27 Oct 2020 15:02:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Oct 2020 20:32:20 +0530
From:   vgarodia@codeaurora.org
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and
 G_SELECTION
In-Reply-To: <CAAFQd5AnA-fm0kNxcGkgsMxWTBvQgyccc9YZL80Estmq_jL+eg@mail.gmail.com>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
 <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
 <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
 <89783dd42e698593d30dc0f37b52cf73@codeaurora.org>
 <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
 <9a107a2a4a167c2b36aa4fa6cb0f97ef@codeaurora.org>
 <20201013133924.GA1596704@chromium.org>
 <e22edcb77ed83154baba158f1748d6a7@codeaurora.org>
 <CAAFQd5AnA-fm0kNxcGkgsMxWTBvQgyccc9YZL80Estmq_jL+eg@mail.gmail.com>
Message-ID: <7fa64996aea3b7733329cbf41ba4bfc1@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-23 04:38, Tomasz Figa wrote:
> On Thu, Oct 22, 2020 at 6:37 AM <vgarodia@codeaurora.org> wrote:
>> 
>> Hi Tomasz,
>> 
>> On 2020-10-13 19:09, Tomasz Figa wrote:
>> > Hi Vikash,
>> >
>> > On Tue, Oct 13, 2020 at 02:56:21PM +0530, vgarodia@codeaurora.org
>> > wrote:
>> >>
>> >> On 2020-10-08 19:51, Tomasz Figa wrote:
>> >> > On Wed, Oct 7, 2020 at 9:33 PM <vgarodia@codeaurora.org> wrote:
>> >> > >
>> >> > > Hi Tomasz,
>> >> > >
>> >> > > On 2020-10-01 20:47, Tomasz Figa wrote:
>> >> > > > On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
>> >> > > > <stanimir.varbanov@linaro.org> wrote:
>> >> > > >>
>> >> > > >> Hi Tomasz,
>> >> > > >>
>> >> > > >> On 9/25/20 11:55 PM, Tomasz Figa wrote:
>> >> > > >> > Hi Dikshita, Stanimir,
>> >> > > >> >
>> >> > > >> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
>> >> > > >> > <dikshita@codeaurora.org> wrote:
>> >> > > >> >>
>> >> > > >> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> >> > > >> >>
>> >> > > >> >> - return correct width and height for G_SELECTION
>> >> > > >> >> - if requested rectangle wxh doesn't match with capture port wxh
>> >> > > >> >>   adjust the rectangle to supported wxh.
>> >> > > >> >>
>> >> > > >> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> >> > > >> >> ---
>> >> > > >> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
>> >> > > >> >>  1 file changed, 12 insertions(+), 8 deletions(-)
>> >> > > >> >>
>> >> > > >> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> >> > > >> >> index 7d2aaa8..a2cc12d 100644
>> >> > > >> >> --- a/drivers/media/platform/qcom/venus/venc.c
>> >> > > >> >> +++ b/drivers/media/platform/qcom/venus/venc.c
>> >> > > >> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> >> > > >> >>         switch (s->target) {
>> >> > > >> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
>> >> > > >> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
>> >> > > >> >> -               s->r.width = inst->width;
>> >> > > >> >> -               s->r.height = inst->height;
>> >> > > >> >> -               break;
>> >> > > >> >> -       case V4L2_SEL_TGT_CROP:
>> >> > > >> >>                 s->r.width = inst->out_width;
>> >> > > >> >>                 s->r.height = inst->out_height;
>> >> > > >> >>                 break;
>> >> > > >> >> +       case V4L2_SEL_TGT_CROP:
>> >> > > >> >> +               s->r.width = inst->width;
>> >> > > >> >> +               s->r.height = inst->height;
>> >> > > >> >> +               break;
>> >> > > >> >>         default:
>> >> > > >> >>                 return -EINVAL;
>> >> > > >> >>         }inter
>> >> > > >> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> >> > > >> >>
>> >> > > >> >>         switch (s->target) {
>> >> > > >> >>         case V4L2_SEL_TGT_CROP:
>> >> > > >> >> -               if (s->r.width != inst->out_width ||
>> >> > > >> >> -                   s->r.height != inst->out_height ||
>> >> > > >> >> -                   s->r.top != 0 || s->r.left != 0)
>> >> > > >> >> -                       return -EINVAL;
>> >> > > >> >> +               if (s->r.width != inst->width ||
>> >> > > >> >> +                   s->r.height != inst->height ||
>> >> > > >> >> +                   s->r.top != 0 || s->r.left != 0) {
>> >> > > >> >> +                       s->r.top = 0;
>> >> > > >> >> +                       s->r.left = 0;
>> >> > > >> >> +                       s->r.width = inst->width;
>> >> > > >> >> +                       s->r.height = inst->height;
>> >> > > >> >
>> >> > > >> > What's the point of exposing the selection API if no selection can
>> >> > > >> > actually be done?
>> >> > > >>
>> >> > > >> If someone can guarantee that dropping of s_selection will not break
>> >> > > >> userspace applications I'm fine with removing it.
>> >> > > >
>> >> > > > Indeed the specification could be made more clear about this. The
>> >> > > > visible rectangle configuration is described as optional, so I'd
>> >> > > > consider the capability to be optional as well.
>> >> > > >
>> >> > > > Of course it doesn't change the fact that something that is optional
>> >> > > > in the API may be mandatory for some specific integrations, like
>> >> > > > Chrome OS or Android.
>> >> > > >
>> >> > > >>
>> >> > > >> I implemented g/s_selection with the idea to add crop functionality
>> >> > > >> later because with current firmware interface it needs more work.
>> >> > > >
>> >> > > > I suggested one thing internally, but not sure if it was understood
>> >> > > > correctly:
>> >> > > >
>> >> > > > Most of the encoders only support partial cropping, with the rectangle
>> >> > > > limited to top = 0 and left = 0, in other words, only setting the
>> >> > > > visible width and height. This can be easily implemented on most of
>> >> > > > the hardware, even those that don't have dedicated cropping
>> >> > > > capability, by configuring the hardware as follows:
>> >> > > >
>> >> > > > stride = CAPTURE format width (or bytesperline)
>> >> > > > width = CROP width
>> >> > > > height = CROP height
>> >> > >
>> >> > > Assuming the bitstream height and width would be configured with
>> >> > > capture
>> >> > > plane
>> >> > > setting (s_fmt), configuring the crop as height/width would indicate
>> >> > > to
>> >> > > venus
>> >> > > hardware as scaling. To distinguish scaling with crop, firmware
>> >> > > needs to
>> >> > > be
>> >> > > configured separately indicating crop rectangle.
>> >> >
>> >> > The V4L2 encoder API does _not_ configure the bitstream width and
>> >> > height currently. Scaling is not defined in the API at the moment. As
>> >> > per the spec [1], the CAPTURE width and height fields are
>> >> > ignored/read-only.
>> >> >
>> >> > [1]
>> >> > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization
>> >> >
>> >> > Currently there are following parameters configured by the V4L2 API:
>> >> >
>> >> > OUTPUT format width: the number of pixels per line of the input
>> >> > buffer, including any padding pixels, i.e. stride in pixels,
>> >> > OUTPUT format height: the total number of lines of the input buffer.
>> >> > including or not, any padding lines (for NV12 non-M format any padding
>> >> > lines must be included, as plane offsets are calculated based on
>> >> > this),
>> >> > CROP left, width: horizontal position of valid pixel data in the
>> >> > buffer; left is typically 0 and width can be less than OUTPUT format
>> >> > width,
>> >> > CROP top, height: vertical position of valid pixel data in the buffer:
>> >> > top is typically 0 and height can be less than OUTPUT format height,
>> >>
>> >> I was trying to find if there is any way we can configure the encoder
>> >> with
>> >> actual YUV size and the required CROP rectangle. Incase the S_FMT on
>> >> CAPTURE
>> >> plane is ignored, will we ever be able to encode a bitstream with a
>> >> desired
>> >> crop parameters different than YUV WxH, for ex. the bitstream WxH
>> >> could be
>> >> 320x192, whereas the CROP in SPS would suggest it to 320x180.
>> >> In my ex. the YUV is 320x192.
>> >>
>> >
>> > Crop in SPS should be exactly what is set in the selection CROP
>> > rectangle. Bitstream WxH (i.e. the number of macroblocks) is entirely
>> > at
>> > the discretion of the encoder.
>> >
>> >> > >
>> >> > > > I believe Android requires the hardware to support stride and AFAIK
>> >> > > > this hardware is also commonly used on Android, so perhaps it's
>> >> > > > possible to achieve the above without any firmware changes?
>> >> > >
>> >> > > Yes, the hardware is used and also supported in android. The interface
>> >> > > to configure
>> >> > > crop rectangle to firmware is via extradata. This extradata info is
>> >> > > passed from v4l2
>> >> > > clients via a separate plane in v4l2 buffer. The extradata payload is
>> >> > > passed to
>> >> > > firmware as is and the firmware parses it to know if crop, roi, etc.
>> >> >
>> >> > Okay, so do I get it correctly that without extradata, the firmware
>> >> > can only handle the case where width == stride?
>> >>
>> >> Firmware can support for case when width different than stride,
>> >> without any
>> >> additional interface requirement. Only when crop is different than YUV
>> >> dimension,
>> >> it would need the additional interface.
>> >
>> > Sorry, what is the relation between width/stride and YUV dimension? To
>> > me "width" is the number of meaningful pixels in the line of the YUV
>> > source frame and "stride" is the total number of bytes of the full YUV
>> > line including padding.
>> >
>> >> Please confirm if the dimensions from S_SELECTION CROP could be set to
>> >> firmware
>> >> as bitstream dimensions.
>> >>
>> >
>> > Selection CROP rectangle should be set as the SPS crop.
>> >
>> > Imagine the following example:
>> >
>> >  |<- stride                                   ->|
>> >  |<- width                          ->|         |
>> >  +------------------------------------+---------+----
>> >  |                                    |         | ^ ^
>> >  | meaningful                         |  line   | | |
>> >  | pixels                             | padding |
>> >  |                                    |         |   b
>> >  |                                    |         |   u
>> >  |                                    |         |   f
>> >  |                                    |         |   f
>> >  |                                    |         |   e
>> >  |                                    |         | h r
>> >  |                                    |         | e
>> >  |                                    |         | i h
>> >  |                                    |         | g e
>> >  |                                    |         | h i
>> >  |                                    |         | t g
>> >  |                                    |         |   h
>> >  |                                    |         | | t
>> >  |                                    |         | V
>> >  +------------------------------------+---------+-- |
>> >  | plane padding                                |   v
>> >  +----------------------------------------------+----
>> >
>> > The encoder cares only about encoding the meaningful frame data that
>> > occupies
>> > the top-left-most width x height pixels. Since it needs to produce full
>> > macroblocks, the input might need to be rounded up to full macroblock
>> > dimensions, typically:
>> >
>> > coded_width = ALIGN(width, 16)
>> > coded_height = ALIGN(height, 16)
>> >
>> > The resulting bitstream would have the resolution of coded_width x
>> > coded_height, however since it only contains width x height of
>> > meaningful pixels, the crop information (in SPS for H.264) would be
>> > equal to width x height.
>> >
>> > Now in V4L2,
>> >
>> > - width is given by selection CROP rectangle width,
>> > - height is given by selection CROP rectangle height,
>> > - stride is given by OUTPUT format width,
>> > - buffer height is given by OUTPUT format height.
>> >
>> > Hopefully this explains it well now.
>> 
>> I am experimenting more on this by setting the stride to Venus during
>> s_fmt on
>> OUTPUT plane format. And setting the bitstream dimensions to firmware
>> from the
>> CROP selection. There are below limitations in this approach w.r.t 
>> Venus
>> hardware
>> 1. Stride would work for linear YUVs (NV12). For compressed (UBWC) 
>> YUV,
>> fixed stride
>> have few hardware limitations.
>> 2. Stride and CROP can work when the left and top are [0,0]. At the
>> moment, there
>> isn't an interface to specify the start offset to firmware.
> 
> Thanks for the investigation. In the meantime I also studied the venus
> driver more closely and I noticed that actually it already supports
> what you described above and does it in a way that is against the
> specification.
> 
> It expects that the userspace sets width and height to the CAPTURE
> queue and uses it as the visible resolution for the encoded stream.
> The way mandated by the specification is to ignore CAPTURE width and
> height and take these values from the selection CROP rectangle
> instead.
> 
> Would you be able to work on modifying the driver to follow the 
> compliant way?

We have experimented more with the sequence as per compliance and made 
the stride
changes in video firmware. Results are good. The patch would be updated 
shortly
with dependency on an updated video firmware version.

>> 
>> Also, do we think, we should make S_SELECTION as mandatory in the
>> initialization
>> sequence ? It would work without S_SELECTION as well, but the encoded
>> bitstream
>> would have dimensions as the aligned ones (strides) as set in S_FMT
>> (OUTPUT plane).
> 
> The meaning of something being mandatory in V4L2 is a bit fuzzy,
> because V4L2 is expected to always retain valid state. In case of
> selection, the CROP_DEFAULT rectangle is defined to be the full frame
> size and it could work in many cases. For example, it's not uncommon
> for desktop Linux applications to manage the source buffers the
> opposite way - first negotiate the format with the encoder and
> allocate buffers and only then produce the contents appropriately to
> match the encoded stream.

Ok. In that case, the content itself would be the desired encoded 
bitstream.

But still, the input YUV buffer can have a large dimension considering
alignment requirement from other hardware which produces that YUV. So in 
that
cases, we might still need the client to set CROP as the desired encoded
stream. For ex. video hardware have YUV alignment as 128 bytes aligned, 
whereas
camera hardware producing that YUV can share a buffer with 512 bytes 
alignment.

> Best regards,
> Tomasz
> 
>> 
>> >> > If so, it sounds like this extradata should be generated by the driver
>> >> > internally based on the selection CROP rectangle. In fact, the driver
>> >> > already seems to have a definition of struct hfi_extradata_input_crop
>> >> > [2]. So perhaps it wouldn't require much effort to implement the crop
>> >> > properly?
>> >> IIRC, Stan has done some experiments around the same. Would let him
>> >> share
>> >> his
>> >> observations for this request.
>> >
>> > I think I'm a bit confused now, because I read in your message now that
>> > extradata is not required to handle stride. Let's make sure that we're
>> > on the same page first before starting to research the extradata topic.
>> >
>> > Best regards,
>> > Tomasz
>> >
>> >>
>> >> > [2]
>> >> > https://elixir.bootlin.com/linux/v5.9-rc8/source/drivers/media/platform/qcom/venus/hfi_helper.h#L817
>> >> >
>> >> > Best regards,
>> >> > Tomasz

Thanks,
Vikash
