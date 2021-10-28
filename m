Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1300643E2B8
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 15:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhJ1Nza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 09:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhJ1NzX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 09:55:23 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8A9C079787
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:52:33 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w1so6289307edd.0
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IYoelbM+7VNNxRTzZtfEcFbbNy/jYAUU6ige7AnPX70=;
        b=cbu24eLRRCqmVieHAavM/v6UC4Gkj69GNvWrzzIwlRBib7LNe7evsfDZ3166IAgJ2l
         CwKv97zHaf13cZco0cuRWDo1m8tr5AOJ26ElGr9I+x5hlueAbUSRqak41E+0b9byknUR
         sOA9E9leFAPkYgXqI4hkJh3l0C5S2fufRc4oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IYoelbM+7VNNxRTzZtfEcFbbNy/jYAUU6ige7AnPX70=;
        b=3MlYMm1orYN3JwXZPi1Jr784DEX1mJFrda8De4V1ocbnhtYcMD8s9pSoevqRityyh+
         0FedAZcPRFJlpz/j98jp21OGDcm9GBVZQyrCbbsG1p5UBI1ypgsbQ9dIJjY6co367+f4
         FCKe/+zcwI3WQeXoRzOloeuVfG+FmDkuZwGXL+miSPvJLr4c4PdeokP9HAF7Il0E4Sh2
         mxTL7bLo1rhbdh0REn226uUgho7JX9M/MeXSeBroCbYfra4sU1zskxmokQwBQTtam4rw
         +gmHJe1DdLy4vnlycbJ7lQk26Qzhk9r6Yquhw8dBi1mEJyRILrg9fAnrgPeEfSSi1DtW
         90Kg==
X-Gm-Message-State: AOAM532DmIPn8Lh+awOgyT4Mbwg8ppqhlT9vgFiHb7a2zrfW+k/4/IMC
        ORnYBI2da9WmYWYAO1x+LVUQAsgp5AQWVA==
X-Google-Smtp-Source: ABdhPJwkNAvMPSX72pqtwobRiPXWW1vVu7CIfKqlvfc9V2BgqyDAJmCG+id4i/xcPQuzaNmGS3d7rQ==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr6325309edj.95.1635429151415;
        Thu, 28 Oct 2021 06:52:31 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id m10sm1711632edi.72.2021.10.28.06.52.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 06:52:30 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso9461205wmd.3
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:52:30 -0700 (PDT)
X-Received: by 2002:a05:600c:19d0:: with SMTP id u16mr4626700wmq.154.1635429149893;
 Thu, 28 Oct 2021 06:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com> <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <DM8PR11MB5653B7646DEFC3F481B98CEF99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YXMhJJJYZl+A6dU7@paasikivi.fi.intel.com>
In-Reply-To: <YXMhJJJYZl+A6dU7@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 28 Oct 2021 22:52:17 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
Message-ID: <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 23, 2021 at 5:38 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Bingbu,
>
> On Tue, Oct 19, 2021 at 03:58:41PM +0000, Cao, Bingbu wrote:
> > > -----Original Message-----
> > > From: Cao, Bingbu
> > > Sent: Tuesday, October 19, 2021 11:30 PM
> > > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > Subject: RE: [PATCH v3] media: imx258: add vblank control to support more
> > > frame rate range
> > >
> > > Sakari,
> > >
> > > ________________________
> > > BRs,
> > > Bingbu Cao
> > >
> > > > -----Original Message-----
> > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Sent: Tuesday, October 19, 2021 8:52 PM
> > > > To: Cao, Bingbu <bingbu.cao@intel.com>
> > > > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > > Subject: Re: [PATCH v3] media: imx258: add vblank control to support
> > > > more frame rate range
> > > >
> > > > Hi Bingbu,
> > > >
> > > > On Mon, Oct 18, 2021 at 11:26:16AM +0800, Bingbu Cao wrote:
> > > > > Current imx258 driver enable the automatic frame length tracking
> > > > > control by default and did not support VBLANK change, it's always
> > > > working at 30fps.
> > > > > However, in reality we need a wider frame rate range from 15 to 30.
> > > > > This patch disable the automatic frame length tracking control and
> > > > > enable the v4l2 VBLANK control to allow user changing frame rate per
> > > > requirement.
> > > > >
> > > > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
> > > > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > > > > index 81cdf37216ca..2c787af7074d 100644
> > > > > --- a/drivers/media/i2c/imx258.c
> > > > > +++ b/drivers/media/i2c/imx258.c
> > > > > @@ -29,6 +29,7 @@
> > > > >  #define IMX258_VTS_MAX                 0xffff
> > > > >
> > > > >  /*Frame Length Line*/
> > > > > +#define IMX258_REG_FLL                 0x0340
> > > > >  #define IMX258_FLL_MIN                 0x08a6
> > > > >  #define IMX258_FLL_MAX                 0xffff
> > > > >  #define IMX258_FLL_STEP                        1
> > > > > @@ -241,7 +242,7 @@ static const struct imx258_reg
> > > > > mode_4208x3118_regs[]
> > > > = {
> > > > >         { 0x034D, 0x70 },
> > > > >         { 0x034E, 0x0C },
> > > > >         { 0x034F, 0x30 },
> > > > > -       { 0x0350, 0x01 },
> > > > > +       { 0x0350, 0x00 }, /* no frame length automatic tracking control */
> > > > >         { 0x0202, 0x0C },
> > > > >         { 0x0203, 0x46 },
> > > > >         { 0x0204, 0x00 },
> > > > > @@ -360,7 +361,7 @@ static const struct imx258_reg
> > > > > mode_2104_1560_regs[]
> > > > = {
> > > > >         { 0x034D, 0x38 },
> > > > >         { 0x034E, 0x06 },
> > > > >         { 0x034F, 0x18 },
> > > > > -       { 0x0350, 0x01 },
> > > > > +       { 0x0350, 0x00 }, /* no frame length automatic tracking control */
> > > > >         { 0x0202, 0x06 },
> > > > >         { 0x0203, 0x2E },
> > > > >         { 0x0204, 0x00 },
> > > > > @@ -479,7 +480,7 @@ static const struct imx258_reg
> > > > > mode_1048_780_regs[]
> > > > = {
> > > > >         { 0x034D, 0x18 },
> > > > >         { 0x034E, 0x03 },
> > > > >         { 0x034F, 0x0C },
> > > > > -       { 0x0350, 0x01 },
> > > > > +       { 0x0350, 0x00 }, /* no frame length automatic tracking control */
> > > >
> > > > Why is automatic frame length control disabled?
> > >
> > > My understanding:
> > > If automatic frame length control enabled, the frame length is changed
> > > automatically when COARSE_INTEGRATE_TIME + 10 > FRAME_LENGTH_LINES, it
> > > may not meet the requirement - less integrate time with more frame length.
> > > we need control the vertical blank to do that.
> > >
> >
> > If frame length automatic tracking control enabled, the CORSE_INTEGRATE_TIME
> > could be larger than FRAME_LENGTH_LINES.
>
> Both are controlled by the driver. The driver is generally responsible for
> ensuring the exposure time stays within the limits for a given frame
> length.
>
> Unless this sensor does something weird, all you get by disabling this is
> undefined behaviour instead of increased frame length when the exposure
> time + margin exceeds frame length. This could mean broken frames.
>
> Of course, it takes a driver bug to arrive into this situation.

I'd argue that enabling the automatic control would make it much more
difficult to spot the driver bug in this case and so it would be more
desirable to keep it disabled as in this patch.

Best regards,
Tomasz
