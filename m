Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A8B24FEC1
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 15:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgHXNXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 09:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgHXNXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 09:23:36 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACC3C061573
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 06:23:36 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so11219903ejz.0
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GhI8sJ5/z0UIz6/L8QhZBRZ4UponYyx7yrZK5KkagFA=;
        b=AWEwr9bgof2pKHRgXnO7fA7HYqsHVDia676fVG8Zvmq4j1krxXt3hSzQqcgUM2IchO
         KZwlaD0yTyDfNAXAwxhBjlbc1kB2jUApJ45GxvGR5G6AXfFPE+EDsRIYH9m78xXr9jsK
         tKUkdTlxPPswKBRLN5x/2xGqVoo+JYJopoRIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GhI8sJ5/z0UIz6/L8QhZBRZ4UponYyx7yrZK5KkagFA=;
        b=ejWkmZNyHp7W75yFGcswMii2XrC4hEXDk/ZWoMmu3VweZBQvCKdfdYJjiG9J/3OFwt
         2z9WzCxEnaSGtheTqLQRlDHllHj2RSnyhoEegMF5kLT1nxW8vGUjzCLFmGD08sG/GnCE
         KQuFyWzr9xqBeMzen1zBxAVANbEszGGEEqNEPuYLgVItL7xmazE+xkWLA+BAiCcm+WHr
         N6B4ODZavlO7wLs7yfqkMxLu1MNunjmvoClsmul25BtOC++7tGcZ1FsHyod8A9+JakYH
         fgMIqKeYmgpFuVwFImRGc9xdEbHimY5wLjAc0Lnca1orEU1F3ANW5qadU0u/k1N4fuBb
         ejOg==
X-Gm-Message-State: AOAM533y/hh9I5zzd5J3OVTAbUPYFZwVD5kqXd/5Z8UYCquohpTHIsUI
        1QFaqsY5xHhhR2G0e0caafVLlivfpmN/hA==
X-Google-Smtp-Source: ABdhPJxqwIRSr3dWgXOH7vnN/UY5HOd6rlco29n9fd1J+sLLUy4P9Pg93nN8VT8Lj0qbT+dPCbwl1A==
X-Received: by 2002:a17:906:fcad:: with SMTP id qw13mr5760965ejb.389.1598275414054;
        Mon, 24 Aug 2020 06:23:34 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id u8sm5460265ejn.82.2020.08.24.06.23.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 06:23:33 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id a15so8662738wrh.10
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 06:23:33 -0700 (PDT)
X-Received: by 2002:a5d:638c:: with SMTP id p12mr5720466wru.17.1598275412832;
 Mon, 24 Aug 2020 06:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
 <caac1db9-412c-bb92-9670-dbef35d09374@linux.intel.com> <20200824090030.GD24582@paasikivi.fi.intel.com>
In-Reply-To: <20200824090030.GD24582@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 24 Aug 2020 15:23:21 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CPk7OPM75dC+xWMwUSpuZfrwwfhR6L=639ZQr7=akzjw@mail.gmail.com>
Message-ID: <CAAFQd5CPk7OPM75dC+xWMwUSpuZfrwwfhR6L=639ZQr7=akzjw@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov5675: correct the maximum exposure value
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        shawnx.tu@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>,
        hongju.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 11:00 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Bingbu,
>
> On Mon, Aug 24, 2020 at 11:13:40AM +0800, Bingbu Cao wrote:
> >
> >
> > On 8/22/20 11:03 PM, Tomasz Figa wrote:
> > > Hi Bingbu,
> > >
> > > On Fri, Aug 21, 2020 at 10:00 AM Bingbu Cao <bingbu.cao@intel.com> wrote:
> > >>
> > >> The unit of exposure value is different from other OmniVision sensors,
> > >> driver will divide by 2 before set register, the exposure range exposed
> > >> by v4l2 ctrl to user should be same as others, so the calculation for
> > >> the maximum exposure value in current driver need be fixed.
> > >>
> > >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > >> ---
> > >>  drivers/media/i2c/ov5675.c | 15 ++++++++++-----
> > >>  1 file changed, 10 insertions(+), 5 deletions(-)
> > >>
> > >
> > > Thanks for the patch! Please see my comments inline.
> > >
> > >> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> > >> index 8537cc4ca108..9540ce8918f0 100644
> > >> --- a/drivers/media/i2c/ov5675.c
> > >> +++ b/drivers/media/i2c/ov5675.c
> > >> @@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
> > >>         /* Propagate change of current control to all related controls */
> > >>         if (ctrl->id == V4L2_CID_VBLANK) {
> > >>                 /* Update max exposure while meeting expected vblanking */
> > >> -               exposure_max = (ov5675->cur_mode->height + ctrl->val -
> > >> -                              OV5675_EXPOSURE_MAX_MARGIN) / 2;
> > >> +               exposure_max = ov5675->cur_mode->height + ctrl->val -
> > >> +                       OV5675_EXPOSURE_MAX_MARGIN;
> > >>                 __v4l2_ctrl_modify_range(ov5675->exposure,
> > >>                                          ov5675->exposure->minimum,
> > >>                                          exposure_max, ov5675->exposure->step,
> > >> @@ -689,7 +689,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
> > >>                 break;
> > >>
> > >>         case V4L2_CID_EXPOSURE:
> > >> -               /* 3 least significant bits of expsoure are fractional part */
> > >> +               /* 4 least significant bits of expsoure are fractional part
> > >
> > > exposure
> > >
> > >> +                * val = val << 4
> > >> +                * for ov5675, the unit of exposure is differnt from other
> > >
> > > different
> > >
> > >> +                * OmniVision sensors, its exposure value is twice of the
> > >> +                * register value, the exposure should be divided by 2 before
> > >> +                * set register, e.g. val << 3.
> > >> +                */
> > >>                 ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
> > >>                                        OV5675_REG_VALUE_24BIT, ctrl->val << 3);
> > >
> > > How about turning this code into (ctrl->val << 4) / 2 ? It will be
> > > compiled into exactly the same code, but will be obvious that we are
> > > handling two different factors in the computation.
> > >
> > > Another question: Since the V4L2_CID_EXPOSURE control is not specified
> > > to be in a particular unit and hardware supports fractional exposures,
> > > why not expose the exposure exactly as it is in the register?
> > My understanding is that the exposure calculation in userspace is commonly based
> > on the unit of exposure - line, as some sensor did not support fractional
> > exposures, so the common calculation only care the integral part. For ov5675, it
> > is different from others, its register value unit is 2lines instead of lines.
> >
> > Sakari, do you have some idea?
>
> I've already sent v2 in a pull request to Mauro. So if changes are needed
> still, please send them on top of v2.
>
> Line is commonly used for devices that natively use it (vast majority of
> raw Bayer camera sensors). So if possible, I'd use the same here. I.e. with
> two line granularity, the exposure value could be in lines and the step
> would be 2.

The sensor unit seems to be 1/8 of a line, so by exposing it from the
driver as an integer in the unit of lines, we end up losing some
precision. I'm not sure how relevant it is for image quality, though.

Best regards,
Tomasz
