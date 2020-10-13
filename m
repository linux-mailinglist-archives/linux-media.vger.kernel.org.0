Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E172128CAF4
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 11:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391390AbgJMJ00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 05:26:26 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:46392 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730361AbgJMJ0Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 05:26:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602581183; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gZrUMhsQkmM0D6oopXDxQ+BEeflOr1RBQxf5m9kaaDI=;
 b=NJtPxXEa5qvCom53Qh63F09HKWiso0nhotBSorDqXtUPxGdTX/NDDt65bdCjCj0UIl+KOhdk
 IZyj5v+YwiRY+ZDqqlTP0jjuiPV++/HBQK+EDmKgTNuYAGG/I5DjieSI2wCo+PdwFUXB7jk6
 EGPjqeZUjJeDNeY3Hqpc7Hs10cM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f8572bff9168450ea6e1e85 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 09:26:23
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07AEDC433FE; Tue, 13 Oct 2020 09:26:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3804C433CB;
        Tue, 13 Oct 2020 09:26:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 13 Oct 2020 14:56:21 +0530
From:   vgarodia@codeaurora.org
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and
 G_SELECTION
In-Reply-To: <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
 <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
 <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
 <89783dd42e698593d30dc0f37b52cf73@codeaurora.org>
 <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
Message-ID: <9a107a2a4a167c2b36aa4fa6cb0f97ef@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2020-10-08 19:51, Tomasz Figa wrote:
> On Wed, Oct 7, 2020 at 9:33 PM <vgarodia@codeaurora.org> wrote:
>> 
>> Hi Tomasz,
>> 
>> On 2020-10-01 20:47, Tomasz Figa wrote:
>> > On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
>> > <stanimir.varbanov@linaro.org> wrote:
>> >>
>> >> Hi Tomasz,
>> >>
>> >> On 9/25/20 11:55 PM, Tomasz Figa wrote:
>> >> > Hi Dikshita, Stanimir,
>> >> >
>> >> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
>> >> > <dikshita@codeaurora.org> wrote:
>> >> >>
>> >> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> >> >>
>> >> >> - return correct width and height for G_SELECTION
>> >> >> - if requested rectangle wxh doesn't match with capture port wxh
>> >> >>   adjust the rectangle to supported wxh.
>> >> >>
>> >> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> >> >> ---
>> >> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
>> >> >>  1 file changed, 12 insertions(+), 8 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> >> >> index 7d2aaa8..a2cc12d 100644
>> >> >> --- a/drivers/media/platform/qcom/venus/venc.c
>> >> >> +++ b/drivers/media/platform/qcom/venus/venc.c
>> >> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> >> >>         switch (s->target) {
>> >> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
>> >> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
>> >> >> -               s->r.width = inst->width;
>> >> >> -               s->r.height = inst->height;
>> >> >> -               break;
>> >> >> -       case V4L2_SEL_TGT_CROP:
>> >> >>                 s->r.width = inst->out_width;
>> >> >>                 s->r.height = inst->out_height;
>> >> >>                 break;
>> >> >> +       case V4L2_SEL_TGT_CROP:
>> >> >> +               s->r.width = inst->width;
>> >> >> +               s->r.height = inst->height;
>> >> >> +               break;
>> >> >>         default:
>> >> >>                 return -EINVAL;
>> >> >>         }inter
>> >> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> >> >>
>> >> >>         switch (s->target) {
>> >> >>         case V4L2_SEL_TGT_CROP:
>> >> >> -               if (s->r.width != inst->out_width ||
>> >> >> -                   s->r.height != inst->out_height ||
>> >> >> -                   s->r.top != 0 || s->r.left != 0)
>> >> >> -                       return -EINVAL;
>> >> >> +               if (s->r.width != inst->width ||
>> >> >> +                   s->r.height != inst->height ||
>> >> >> +                   s->r.top != 0 || s->r.left != 0) {
>> >> >> +                       s->r.top = 0;
>> >> >> +                       s->r.left = 0;
>> >> >> +                       s->r.width = inst->width;
>> >> >> +                       s->r.height = inst->height;
>> >> >
>> >> > What's the point of exposing the selection API if no selection can
>> >> > actually be done?
>> >>
>> >> If someone can guarantee that dropping of s_selection will not break
>> >> userspace applications I'm fine with removing it.
>> >
>> > Indeed the specification could be made more clear about this. The
>> > visible rectangle configuration is described as optional, so I'd
>> > consider the capability to be optional as well.
>> >
>> > Of course it doesn't change the fact that something that is optional
>> > in the API may be mandatory for some specific integrations, like
>> > Chrome OS or Android.
>> >
>> >>
>> >> I implemented g/s_selection with the idea to add crop functionality
>> >> later because with current firmware interface it needs more work.
>> >
>> > I suggested one thing internally, but not sure if it was understood
>> > correctly:
>> >
>> > Most of the encoders only support partial cropping, with the rectangle
>> > limited to top = 0 and left = 0, in other words, only setting the
>> > visible width and height. This can be easily implemented on most of
>> > the hardware, even those that don't have dedicated cropping
>> > capability, by configuring the hardware as follows:
>> >
>> > stride = CAPTURE format width (or bytesperline)
>> > width = CROP width
>> > height = CROP height
>> 
>> Assuming the bitstream height and width would be configured with 
>> capture
>> plane
>> setting (s_fmt), configuring the crop as height/width would indicate 
>> to
>> venus
>> hardware as scaling. To distinguish scaling with crop, firmware needs 
>> to
>> be
>> configured separately indicating crop rectangle.
> 
> The V4L2 encoder API does _not_ configure the bitstream width and
> height currently. Scaling is not defined in the API at the moment. As
> per the spec [1], the CAPTURE width and height fields are
> ignored/read-only.
> 
> [1]
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization
> 
> Currently there are following parameters configured by the V4L2 API:
> 
> OUTPUT format width: the number of pixels per line of the input
> buffer, including any padding pixels, i.e. stride in pixels,
> OUTPUT format height: the total number of lines of the input buffer.
> including or not, any padding lines (for NV12 non-M format any padding
> lines must be included, as plane offsets are calculated based on
> this),
> CROP left, width: horizontal position of valid pixel data in the
> buffer; left is typically 0 and width can be less than OUTPUT format
> width,
> CROP top, height: vertical position of valid pixel data in the buffer:
> top is typically 0 and height can be less than OUTPUT format height,

I was trying to find if there is any way we can configure the encoder 
with
actual YUV size and the required CROP rectangle. Incase the S_FMT on 
CAPTURE
plane is ignored, will we ever be able to encode a bitstream with a 
desired
crop parameters different than YUV WxH, for ex. the bitstream WxH could 
be
320x192, whereas the CROP in SPS would suggest it to 320x180.
In my ex. the YUV is 320x192.

>> 
>> > I believe Android requires the hardware to support stride and AFAIK
>> > this hardware is also commonly used on Android, so perhaps it's
>> > possible to achieve the above without any firmware changes?
>> 
>> Yes, the hardware is used and also supported in android. The interface
>> to configure
>> crop rectangle to firmware is via extradata. This extradata info is
>> passed from v4l2
>> clients via a separate plane in v4l2 buffer. The extradata payload is
>> passed to
>> firmware as is and the firmware parses it to know if crop, roi, etc.
> 
> Okay, so do I get it correctly that without extradata, the firmware
> can only handle the case where width == stride?

Firmware can support for case when width different than stride, without 
any
additional interface requirement. Only when crop is different than YUV 
dimension,
it would need the additional interface.
Please confirm if the dimensions from S_SELECTION CROP could be set to 
firmware
as bitstream dimensions.

> If so, it sounds like this extradata should be generated by the driver
> internally based on the selection CROP rectangle. In fact, the driver
> already seems to have a definition of struct hfi_extradata_input_crop
> [2]. So perhaps it wouldn't require much effort to implement the crop
> properly?
IIRC, Stan has done some experiments around the same. Would let him 
share his
observations for this request.

> [2]
> https://elixir.bootlin.com/linux/v5.9-rc8/source/drivers/media/platform/qcom/venus/hfi_helper.h#L817
> 
> Best regards,
> Tomasz
