Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431D8256A34
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 22:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgH2UsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 16:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgH2UsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 16:48:18 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB47C061573
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2020 13:48:18 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s19so3582002eju.6
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2020 13:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Vvr6ZUjhgyw5kHafQNuZGnJ4lI+Fn9bgnUR28A3r3M=;
        b=W7OaSxvRUxcCqQkntXsYJEcKWJFToT/gm7xjmY9Wpy0cKjmg76cvIDhDbbHc7fOY4W
         P8T8+iZpSksWUM1de+UdmmG/ecserLFbYNCUy/9cSwSoJzAP1bPIOuOErm5oJzL5gIhR
         SshO8g0EnFmLU1btIHGjHxHJ602ytlwySz56Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Vvr6ZUjhgyw5kHafQNuZGnJ4lI+Fn9bgnUR28A3r3M=;
        b=eenUsgfihtVFdMxkXFn6uPaUK3biF03YVw5i/x0ueuvQFMj+hHocCe5SJj8dDMNlzq
         Qj7UuMA2Vd/KeaDtKuXvRNneKf6qkyu8QrBb1LpnP2Hh+4RO0uk4YS4YhE2rdngStANs
         jvAkkX7LlC2xLTmpLSAYXgAkE1MpgxmdacKu+51xN+tVGqK34adjj0rSef23mtJcN/O8
         jBDdUv9xUKpH2XBZnMg3E9Be7DiYprpSkOyA7AbMovnL2j9tuKtQ4BCWiS//9HF/a7Td
         QuOkY0U1JDFpZy9qh4jSUK1jO8WYTgbOqOHIWWHhxI1MIjDjDHCQI/UEIQ9oAoPh7Zay
         ZCMQ==
X-Gm-Message-State: AOAM531L+F6CZtlU3rQ3J/gWb2gCzFX2DNDgy/uOX5hL16RDpE2rpBWr
        xa92PO2Swnnpa/dfwb4xbsbMESNMsubAPQ==
X-Google-Smtp-Source: ABdhPJzCVSojL1qH2/o+SrdFfAFthCcvSahf2WL+2i5FVGfA5CtDbUdsqoEX0HE+YurrfB5PnubhUA==
X-Received: by 2002:a17:906:660b:: with SMTP id b11mr5239193ejp.509.1598734096604;
        Sat, 29 Aug 2020 13:48:16 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id g90sm3101966edd.64.2020.08.29.13.48.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2020 13:48:15 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id y3so2332453wrl.4
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2020 13:48:14 -0700 (PDT)
X-Received: by 2002:adf:ec45:: with SMTP id w5mr4820215wrn.415.1598734094270;
 Sat, 29 Aug 2020 13:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-8-dafna.hirschfeld@collabora.com> <71b4742a-8f47-2709-010f-b2037cfab5fd@collabora.com>
 <1ba8d739-8d18-0284-ab37-c0d73f549ab7@collabora.com>
In-Reply-To: <1ba8d739-8d18-0284-ab37-c0d73f549ab7@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 29 Aug 2020 22:48:02 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CGHgaPkscq+Xz9BDRTRgH1Bsj1Zr97nCspioc3CXS_Sw@mail.gmail.com>
Message-ID: <CAAFQd5CGHgaPkscq+Xz9BDRTRgH1Bsj1Zr97nCspioc3CXS_Sw@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] media: staging: rkisp1: rsz: enumerate the
 formats on the src pad according to the capture
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Sat, Aug 29, 2020 at 7:53 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> Am 04.08.20 um 01:50 schrieb Helen Koike:
> > Hi Dafna,
> >
> > On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
> >> Currently the resizer outputs the same media bus format
> >> as the input. This is wrong since the resizer is also used
> >> to downscale YUV formats. This patch changes the enumeration
> >> of the supported formats. The supported formats on the sink pad
> >> should be taken from the isp entity and the supported formats on
> >> the source pad should be taken from the capture entity.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 41 ++++++++++++-------
> >>   1 file changed, 26 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> index 066d22096a7d..4e87c6f3f732 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> @@ -433,24 +433,35 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
> >>   {
> >>      struct rkisp1_resizer *rsz =
> >>              container_of(sd, struct rkisp1_resizer, sd);
> >> -    struct v4l2_subdev_pad_config dummy_cfg;
> >> -    u32 pad = code->pad;
> >>      int ret;
> >>
> >> -    if (rsz->id == RKISP1_SELFPATH) {
> >> -            if (code->index > 0)
> >> -                    return -EINVAL;
> >> -            code->code = MEDIA_BUS_FMT_YUYV8_2X8;
> >> -            return 0;
> >> +    /* supported mbus codes on the sink pad are the same as isp src pad */
> >> +    if (code->pad == RKISP1_RSZ_PAD_SINK) {
> >> +            struct v4l2_subdev_pad_config dummy_cfg;
> >> +            u32 pad = code->pad;
> >> +
> >> +            /*
> >> +             * the sp capture doesn't support bayer formats so the sp resizer
> >> +             * supports only yuv422
> >> +             */
> >> +            if (rsz->id == RKISP1_SELFPATH) {
> >> +                    if (code->index > 0)
> >> +                            return -EINVAL;
> >> +                    code->code = MEDIA_BUS_FMT_YUYV8_2X8;
> >> +                    return 0;
> >> +            }
> >> +            code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
> >> +            ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
> >> +                                   &dummy_cfg, code);
> >> +
> >> +            /* restore pad */
> >> +            code->pad = pad;
> >> +    } else {
> >> +            /* supported mbus codes on the src are the same as in the capture */
> >> +            struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
> >> +
> >> +            ret = rkisp1_cap_enum_mbus_codes(cap, code);
> >>      }
> >> -
> >> -    /* supported mbus codes are the same in isp video src pad */
> >> -    code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
> >> -    ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
> >> -                           &dummy_cfg, code);
> >> -
> >> -    /* restore pad */
> >> -    code->pad = pad;
> >>      return ret;
> >>   }
> >>
> >>
> >
> > I think you can reduce indentation by doing:
> >
> >       /* supported mbus codes on the src are the same as in the capture */
> >       if (code->pad == RKISP1_RSZ_PAD_SRC)
> >               return kisp1_cap_enum_mbus_codes(
> >                       &rsz->rkisp1->capture_devs[rsz->id], code);
> >
> >       // ... rest of the code for sink pad without an else statement
>
> I think it will make the code a bit less clear, since one should note that there is a return statement inside the first 'if'
> and conclude that the rest is the 'else' case. With 'if-else' it is more clear what code run under which condition.

I guess it might be a bit subjective, but it is a common kernel coding
pattern and usually preferred over if/else blocks. It allows quickly
pruning various edge cases and leaving the rest (and usually most
complex part) of the function easier to follow, because of more
visible assumptions. After all, one usually reads a function from the
top to bottom.

Best regards,
Tomasz
