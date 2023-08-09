Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA2A775F19
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 14:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbjHIMcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 08:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjHIMcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 08:32:42 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CB91FCC
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 05:32:41 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so10066a12.0
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 05:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691584360; x=1692189160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wJF5qYZkkJRo48mYs8g8OpkvAWmV8+sSDDl+5AVElI=;
        b=0Bb5PUM/nxkxf82rEIh+gnC+nTOHYUcGLioXIH8eeN0rqpP3xf5AyoKhPSNM2nCpPm
         gaKH4kI2JS5eEdvWHuBDDQrHKcnUWlvb+qW730756OdLEyG9wp2Hv+dU0q5038ZDxkJT
         Jrh6SctkLYJv0EqLGGEXTcsmkAj1YmBd+RrM7jrdME30ESVqgMFSkc+DigogcPZZr45H
         kaqORLHFM6ldvUKVjnjd6TgI6M0qCzME5crt4epaFnHoH5DE7L+PgQ2ElGFQRy7b0Pmu
         mLeNyTz6fIaleIJQ+wE0XAtOjTengY60ZFFAtp8LVGrl0JiT795yJX2RbBJYpKQ1+Vfb
         rWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691584360; x=1692189160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wJF5qYZkkJRo48mYs8g8OpkvAWmV8+sSDDl+5AVElI=;
        b=DhmDlwvWdeNnYaE2ZEEW5aXXed2QWHZfY/b0nWywcNKi/Xq1r+OVgbv6mD6pj7USDs
         PjsAARPRZN08gHfK+JLPRG8GmIp8tLrCdknx23SpgtZpaUFAibiFkZXAKK8bz3zf058+
         uDVGwNXz26uAiKRHCJcku84ZacojjPc9O19yMlX95GU9m2tAHuQmTGnIBTbRI7DgSXiu
         N8JCQzBpWdYwqvxSfVut6bta/VKygbh1ijtUsjDTlo/EPyk50lqwfYxxRd+m+DLFY03J
         Bq+fAxGE1garinXtd8ul5wQHFYY95X79Sz7q1effAaEVHIIxqVxDYnB/RjJfqInfa4r/
         nq6Q==
X-Gm-Message-State: AOJu0YyjCprG2Jfte0WSVEnTsOOwMFbd5D4GpPB+WxY53zksXOA79RuB
        snkRtWrvkUvstGaNuSf6UZuyZjjl1sZh6VBRxhriHA==
X-Google-Smtp-Source: AGHT+IGg2aTQV7LuZlqTpRbsGBmgOpWhhOjCFBbYO3C+sZaWSV5YTkOzFSxYEKrdhuaC6T36lRAJXYG1tPoUsXrmB5U=
X-Received: by 2002:a50:d683:0:b0:522:cc9c:f5a4 with SMTP id
 r3-20020a50d683000000b00522cc9cf5a4mr82236edi.4.1691584359704; Wed, 09 Aug
 2023 05:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com> <20230426082923.132909-7-yunkec@google.com>
 <da90bdb2-45f4-2ffe-2d62-1190b43fccd5@xs4all.nl> <CANqU6Fds77JBjkq5epiL5iyEBgC-goVAXXfFGK_-fnZx04z8WQ@mail.gmail.com>
 <04a11648-fc00-bb29-774d-d1ba0f199872@xs4all.nl> <20230809101535.GA5737@pendragon.ideasonboard.com>
 <caefa8ad-7ae4-6ef0-e247-fcc5d49d6c54@xs4all.nl>
In-Reply-To: <caefa8ad-7ae4-6ef0-e247-fcc5d49d6c54@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Wed, 9 Aug 2023 21:32:28 +0900
Message-ID: <CANqU6FeRUkDr0ssAbXVBBgPzxThCEU0H5yCGOVda_3P5s3nb9A@mail.gmail.com>
Subject: Re: [PATCH v11 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 9, 2023 at 7:59=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> On 8/9/23 12:15, Laurent Pinchart wrote:
> > Hello,
> >
> > On Wed, Aug 09, 2023 at 10:36:16AM +0200, Hans Verkuil wrote:
> >> On 8/9/23 09:34, Yunke Cao wrote:
> >>> On Wed, Aug 9, 2023 at 4:05=E2=80=AFPM Hans Verkuil wrote:
> >>>> On 26/04/2023 10:29, Yunke Cao wrote:
> >>>>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>>>
> >>>>> Add the capability of retrieving the min and max values of a
> >>>>> compound control.
> >>>>>
> >>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>>>> ---
> >>>>> Changelog since v10:
> >>>>> - No change.
> >>>>> Changelog since v9:
> >>>>> - No change.
> >>>>> Changelog since v8:
> >>>>> - Return ENODATA when min/max is not implemented. Document this beh=
avior.
> >>>>> - Created a shared helper function __v4l2_ctrl_type_op_init that ta=
kes "which"
> >>>>>   as a parameter. Call it in def, min and max operations.
> >>>>> Changelog since v7:
> >>>>> - Document that the definition of the min/max are provided by compo=
und controls
> >>>>>   are defined in control documentation.
> >>>>> - Return error, instead of zeroed memory for v4l2_ctrl_ptr_create(N=
ULL).
> >>>>>
> >>>>> git am from https://lore.kernel.org/all/20191119113457.57833-3-hver=
kuil-cisco@xs4all.nl/
> >>>>> - Fixed some merge conflits.
> >>>>> - Fixed the build error in drivers/media/platform/qcom/venus.
> >>>>>
> >>>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
> >>>>>  .../media/videodev2.h.rst.exceptions          |   2 +
> >>>>>  drivers/media/i2c/imx214.c                    |   5 +-
> >>>>>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
> >>>>>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +++++--
> >>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 156 ++++++++++++++=
+---
> >>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> >>>>>  include/media/v4l2-ctrls.h                    |  34 +++-
> >>>>>  include/uapi/linux/videodev2.h                |   2 +
> >>>>>  9 files changed, 236 insertions(+), 44 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctr=
ls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>> index 927ef397f1ce..1cc21ee229aa 100644
> >>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>> @@ -304,14 +304,21 @@ still cause this situation.
> >>>>>        - Which value of the control to get/set/try.
> >>>>>      * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the cur=
rent value of
> >>>>>       the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the defa=
ult
> >>>>> +     value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return=
 the minimum
> >>>>> +     value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return=
 the maximum
> >>>>>       value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indi=
cates that
> >>>>>       these controls have to be retrieved from a request or tried/s=
et for
> >>>>>       a request. In the latter case the ``request_fd`` field contai=
ns the
> >>>>>       file descriptor of the request that should be used. If the de=
vice
> >>>>>       does not support requests, then ``EACCES`` will be returned.
> >>>>>
> >>>>> -     When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can =
only
> >>>>> -     get the default value of the control, you cannot set or try i=
t.
> >>>>> +     When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN=
_VAL``
> >>>>> +     or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get=
 the
> >>>>> +     default/minimum/maximum value of the control, you cannot set =
or try it.
> >>>>> +     The definition of minimum/maximum values for compound types a=
re provided by
> >>>>> +     the control documentation. If the control documentation does =
not
> >>>>> +     document the meaning of minimum/maximum value, then it is not=
 supported.
> >>>>> +     Querying its minmimum/maximum value will result in -ENODATA.
> >>>>
> >>>> typo: minmimum -> minimum
> >>>>
> >>>> That last line is a bit ambiguous, I suggest this:
> >>>>
> >>>> If  ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` are =
not supported,
> >>>> then querying the minimum or maximum value will result in -ENODATA.
> >>>
> >>> This sounds clearer indeed! I will change it in the next version.
> >>
> >> Thinking some more about this, I believe it would be better to add a f=
lag
> >> indicating WHICH_MIN/MAX support. I never like relying on an error to
> >> discover a feature. You still need this error, but in addition we need=
 a new
> >> flag:
> >>
> >> #define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
> >>
> >> that is set for any control that supports this.
> >
> > I think the intent here was to indicate that drivers must return
> > -ENODATA for V4L2_CTRL_WHICH_MIN_VAL and V4L2_CTRL_WHICH_MAX_VAL if the
> > control's documentation doesn't specify the meaning of minimum and
> > maximum for a control. A flag to indicate support for this new API is
> > likely a good idea, but the documentation here should still clearly
> > indicate that only controls that have defined minimum and maximum
> > concepts in the API documentation can implement this API.
>
> This flag is specific to the control ID: so if set, then you can get
> the min/max value using V4L2_CTRL_WHICH_MIN/MAX_VAL for that control ID.
>
> This flag must be set for any control that uses the s64 minimum/maximum
> fields in struct v4l2_ext_query_ctrl, and for any compound control that
> has explicit support for MIN/MAX_VAL (the UVC rectangle control in this
> case).

> any control that uses the s64 minimum/maximum fields
Noob question: does this include all the non-compound controls?
Are drivers responsible for setting this flag for these controls?

Best,
Yunke

>
> Regards,
>
>         Hans
>
>
