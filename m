Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47960286857
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 21:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgJGTdV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 15:33:21 -0400
Received: from z5.mailgun.us ([104.130.96.5]:12226 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728270AbgJGTdV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 15:33:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602099200; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fRcWPobA2wPZBFDePlMJ/eyWKggBDekfCZ/qz5wXYKc=;
 b=CVvolVrTFyQv7wvB5dF9GnpOEIsIvp4iMJ6SdKq2imKZBfJpzOR3DsW3q8u+wDspLMh95fPJ
 O+ws4he/PkTtKuHrqC4FnVY2rlie7DZc7uVN22NRxPOFyNK1/yOnTZjYFuApUpBVWYj66IYY
 lyHTrScW+2/svbuDJR91eq2tIbA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f7e17ffbfed2afaa6d13e96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Oct 2020 19:33:19
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D65B5C433F1; Wed,  7 Oct 2020 19:33:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B04A9C433CA;
        Wed,  7 Oct 2020 19:33:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Oct 2020 01:03:13 +0530
From:   vgarodia@codeaurora.org
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and
 G_SELECTION
In-Reply-To: <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
 <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
 <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
Message-ID: <89783dd42e698593d30dc0f37b52cf73@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2020-10-01 20:47, Tomasz Figa wrote:
> On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>> 
>> Hi Tomasz,
>> 
>> On 9/25/20 11:55 PM, Tomasz Figa wrote:
>> > Hi Dikshita, Stanimir,
>> >
>> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
>> > <dikshita@codeaurora.org> wrote:
>> >>
>> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> >>
>> >> - return correct width and height for G_SELECTION
>> >> - if requested rectangle wxh doesn't match with capture port wxh
>> >>   adjust the rectangle to supported wxh.
>> >>
>> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> >> ---
>> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
>> >>  1 file changed, 12 insertions(+), 8 deletions(-)
>> >>
>> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> >> index 7d2aaa8..a2cc12d 100644
>> >> --- a/drivers/media/platform/qcom/venus/venc.c
>> >> +++ b/drivers/media/platform/qcom/venus/venc.c
>> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> >>         switch (s->target) {
>> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
>> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
>> >> -               s->r.width = inst->width;
>> >> -               s->r.height = inst->height;
>> >> -               break;
>> >> -       case V4L2_SEL_TGT_CROP:
>> >>                 s->r.width = inst->out_width;
>> >>                 s->r.height = inst->out_height;
>> >>                 break;
>> >> +       case V4L2_SEL_TGT_CROP:
>> >> +               s->r.width = inst->width;
>> >> +               s->r.height = inst->height;
>> >> +               break;
>> >>         default:
>> >>                 return -EINVAL;
>> >>         }inter
>> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> >>
>> >>         switch (s->target) {
>> >>         case V4L2_SEL_TGT_CROP:
>> >> -               if (s->r.width != inst->out_width ||
>> >> -                   s->r.height != inst->out_height ||
>> >> -                   s->r.top != 0 || s->r.left != 0)
>> >> -                       return -EINVAL;
>> >> +               if (s->r.width != inst->width ||
>> >> +                   s->r.height != inst->height ||
>> >> +                   s->r.top != 0 || s->r.left != 0) {
>> >> +                       s->r.top = 0;
>> >> +                       s->r.left = 0;
>> >> +                       s->r.width = inst->width;
>> >> +                       s->r.height = inst->height;
>> >
>> > What's the point of exposing the selection API if no selection can
>> > actually be done?
>> 
>> If someone can guarantee that dropping of s_selection will not break
>> userspace applications I'm fine with removing it.
> 
> Indeed the specification could be made more clear about this. The
> visible rectangle configuration is described as optional, so I'd
> consider the capability to be optional as well.
> 
> Of course it doesn't change the fact that something that is optional
> in the API may be mandatory for some specific integrations, like
> Chrome OS or Android.
> 
>> 
>> I implemented g/s_selection with the idea to add crop functionality
>> later because with current firmware interface it needs more work.
> 
> I suggested one thing internally, but not sure if it was understood 
> correctly:
> 
> Most of the encoders only support partial cropping, with the rectangle
> limited to top = 0 and left = 0, in other words, only setting the
> visible width and height. This can be easily implemented on most of
> the hardware, even those that don't have dedicated cropping
> capability, by configuring the hardware as follows:
> 
> stride = CAPTURE format width (or bytesperline)
> width = CROP width
> height = CROP height

Assuming the bitstream height and width would be configured with capture 
plane
setting (s_fmt), configuring the crop as height/width would indicate to 
venus
hardware as scaling. To distinguish scaling with crop, firmware needs to 
be
configured separately indicating crop rectangle.

> I believe Android requires the hardware to support stride and AFAIK
> this hardware is also commonly used on Android, so perhaps it's
> possible to achieve the above without any firmware changes?

Yes, the hardware is used and also supported in android. The interface 
to configure
crop rectangle to firmware is via extradata. This extradata info is 
passed from v4l2
clients via a separate plane in v4l2 buffer. The extradata payload is 
passed to
firmware as is and the firmware parses it to know if crop, roi, etc.

> Best regards,
> Tomasz
