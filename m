Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FA743F52D
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 05:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhJ2DH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 23:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhJ2DH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 23:07:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64806C061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 20:05:28 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id j21so10451199edt.11
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 20:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7FSNDJmPd4vyM97Mnw6dLb1KXTup6nbWgN+EwI6boI=;
        b=SI7K/zVrVDotdsjuDSB53fcoT5kZFPf4baTHHdeKytJN3tdYuklQhuIrEn529/Wj0v
         Mkq08S8AYKQG3QKOUt16fuiVdCYq6/n9Bso5f3TmWWY1i0j9oJSfSXoAQwhefcW/0KHB
         SG/xqhVGuv86jwM+23Ir8lQb7qT7x8qeTe7Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7FSNDJmPd4vyM97Mnw6dLb1KXTup6nbWgN+EwI6boI=;
        b=CFnIL8J5hW/qz+EWL/iuhta7i1uBlrT2BlI2f+s3WTcLAiza7vJrx80No35Wu/2Z6K
         i5x0FLAJEv6Hp5f9WGAZc9VEPS/VVy2o2RPDY4eP6O6IJjalswLjFAUkH3z0UPssaXE4
         JQa5Ui6sRp6fAaUWtqLO0gn+6xkCp56SEx0tj9hLWRpsX9qMHf4zzR9XJKD5U4WPk3Mb
         jz6xE3RMI6bIg4D0P3u1S/x6izRQu/yB865MxEqdsopq8bNzQgLVe1NBjt2RvNv8kxQR
         YuSquFrXTi4cBaoHBm9s2rMkQsoVU4Zlmr6f6Dqe+yMW5lo75e3d6YQiVjI17ODI3hne
         dVWA==
X-Gm-Message-State: AOAM5317YjMsDhKaJbZXCnVLZS30zFCEPxvEwGWah/TXhvRFyCqE7GY2
        dqKTsI+285NTbziA5mhNTRue08Gr/oFFvQ==
X-Google-Smtp-Source: ABdhPJxHSHp1W8rb/M1Tg+Caj6FAVFKGyd9gwbrl2xq4gAhdtDBUoQAjT5PE9k77TpZV07ivCC1/oQ==
X-Received: by 2002:a17:907:7f11:: with SMTP id qf17mr10155680ejc.437.1635476726664;
        Thu, 28 Oct 2021 20:05:26 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id q2sm2600105edh.44.2021.10.28.20.05.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 20:05:26 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so6664681wmz.2
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 20:05:25 -0700 (PDT)
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr16604049wmj.83.1635476725276;
 Thu, 28 Oct 2021 20:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com> <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <DM8PR11MB5653B7646DEFC3F481B98CEF99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YXMhJJJYZl+A6dU7@paasikivi.fi.intel.com> <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
 <DM8PR11MB5653F377D3FFB3F68723347C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5653F377D3FFB3F68723347C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 Oct 2021 12:05:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A9ofY4yDTxorrjGqdx9QnoWYXwssMe=6hi5qVEJPsbNA@mail.gmail.com>
Message-ID: <CAAFQd5A9ofY4yDTxorrjGqdx9QnoWYXwssMe=6hi5qVEJPsbNA@mail.gmail.com>
Subject: Re: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 11:18 AM Cao, Bingbu <bingbu.cao@intel.com> wrote:
>
> Sakari and Tomasz,
>
> Thanks for your review.
>
> ________________________
> BRs,
> Bingbu Cao
>
> > -----Original Message-----
> > From: Tomasz Figa <tfiga@chromium.org>
> > Sent: Thursday, October 28, 2021 9:52 PM
> > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Cao, Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org;
> > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > Subject: Re: [PATCH v3] media: imx258: add vblank control to support
> > more frame rate range
> >
> > On Sat, Oct 23, 2021 at 5:38 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Bingbu,
> > >
> > > On Tue, Oct 19, 2021 at 03:58:41PM +0000, Cao, Bingbu wrote:
> > > > > -----Original Message-----
> > > > > From: Cao, Bingbu
> > > > > Sent: Tuesday, October 19, 2021 11:30 PM
> > > > > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > > > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > > > Subject: RE: [PATCH v3] media: imx258: add vblank control to
> > > > > support more frame rate range
> > > > >
> > > > > Sakari,
> > > > >
> > > > > ________________________
> > > > > BRs,
> > > > > Bingbu Cao
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > Sent: Tuesday, October 19, 2021 8:52 PM
> > > > > > To: Cao, Bingbu <bingbu.cao@intel.com>
> > > > > > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > > > > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > > > > Subject: Re: [PATCH v3] media: imx258: add vblank control to
> > > > > > support more frame rate range
> > > > > >
> > > > > > Hi Bingbu,
> > > > > >
> > > > > > On Mon, Oct 18, 2021 at 11:26:16AM +0800, Bingbu Cao wrote:
> > > > > > > Current imx258 driver enable the automatic frame length
> > > > > > > tracking control by default and did not support VBLANK change,
> > > > > > > it's always
> > > > > > working at 30fps.
> > > > > > > However, in reality we need a wider frame rate range from 15
> > to 30.
> > > > > > > This patch disable the automatic frame length tracking control
> > > > > > > and enable the v4l2 VBLANK control to allow user changing
> > > > > > > frame rate per
> > > > > > requirement.
> > > > > > >
> > > > > > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
> > > > > > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/imx258.c
> > > > > > > b/drivers/media/i2c/imx258.c index 81cdf37216ca..2c787af7074d
> > > > > > > 100644
> > > > > > > --- a/drivers/media/i2c/imx258.c
> > > > > > > +++ b/drivers/media/i2c/imx258.c
> > > > > > > @@ -29,6 +29,7 @@
> > > > > > >  #define IMX258_VTS_MAX                 0xffff
> > > > > > >
> > > > > > >  /*Frame Length Line*/
> > > > > > > +#define IMX258_REG_FLL                 0x0340
> > > > > > >  #define IMX258_FLL_MIN                 0x08a6
> > > > > > >  #define IMX258_FLL_MAX                 0xffff
> > > > > > >  #define IMX258_FLL_STEP                        1
> > > > > > > @@ -241,7 +242,7 @@ static const struct imx258_reg
> > > > > > > mode_4208x3118_regs[]
> > > > > > = {
> > > > > > >         { 0x034D, 0x70 },
> > > > > > >         { 0x034E, 0x0C },
> > > > > > >         { 0x034F, 0x30 },
> > > > > > > -       { 0x0350, 0x01 },
> > > > > > > +       { 0x0350, 0x00 }, /* no frame length automatic
> > > > > > > + tracking control */
> > > > > > >         { 0x0202, 0x0C },
> > > > > > >         { 0x0203, 0x46 },
> > > > > > >         { 0x0204, 0x00 },
> > > > > > > @@ -360,7 +361,7 @@ static const struct imx258_reg
> > > > > > > mode_2104_1560_regs[]
> > > > > > = {
> > > > > > >         { 0x034D, 0x38 },
> > > > > > >         { 0x034E, 0x06 },
> > > > > > >         { 0x034F, 0x18 },
> > > > > > > -       { 0x0350, 0x01 },
> > > > > > > +       { 0x0350, 0x00 }, /* no frame length automatic
> > > > > > > + tracking control */
> > > > > > >         { 0x0202, 0x06 },
> > > > > > >         { 0x0203, 0x2E },
> > > > > > >         { 0x0204, 0x00 },
> > > > > > > @@ -479,7 +480,7 @@ static const struct imx258_reg
> > > > > > > mode_1048_780_regs[]
> > > > > > = {
> > > > > > >         { 0x034D, 0x18 },
> > > > > > >         { 0x034E, 0x03 },
> > > > > > >         { 0x034F, 0x0C },
> > > > > > > -       { 0x0350, 0x01 },
> > > > > > > +       { 0x0350, 0x00 }, /* no frame length automatic
> > > > > > > + tracking control */
> > > > > >
> > > > > > Why is automatic frame length control disabled?
> > > > >
> > > > > My understanding:
> > > > > If automatic frame length control enabled, the frame length is
> > > > > changed automatically when COARSE_INTEGRATE_TIME + 10 >
> > > > > FRAME_LENGTH_LINES, it may not meet the requirement - less
> > integrate time with more frame length.
> > > > > we need control the vertical blank to do that.
> > > > >
> > > >
> > > > If frame length automatic tracking control enabled, the
> > > > CORSE_INTEGRATE_TIME could be larger than FRAME_LENGTH_LINES.
> > >
> > > Both are controlled by the driver. The driver is generally responsible
> > > for ensuring the exposure time stays within the limits for a given
> > > frame length.
> > >
> > > Unless this sensor does something weird, all you get by disabling this
> > > is undefined behaviour instead of increased frame length when the
> > > exposure time + margin exceeds frame length. This could mean broken
> > frames.
> > >
> > > Of course, it takes a driver bug to arrive into this situation.
> >
> > I'd argue that enabling the automatic control would make it much more
> > difficult to spot the driver bug in this case and so it would be more
> > desirable to keep it disabled as in this patch.
>
> You are right, I will remove the change in next version.

Sorry, remove what change? My comment agrees with this patch that
keeps the function disabled.

Best regards,
Tomasz
