Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2C8FDB3
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfHPIW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:22:57 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43549 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfHPIW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:22:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id h13so4412478edq.10
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i3AfjnrX1TsxUuCuxq1yim9PxWzEM4H7LTzfAMErJB4=;
        b=bP5n3bWm2Uf7bBxDQNBoULoyXFPB0YAwyzH6T5JmE2+5KUZDn4Nm9TbFG2foM7TCCm
         tWhYVllZJc2ZXs4dZuEJgY/ufDlsCSbH8Vn1chg/pAORNk4wcrvhWExo56HV7DVZbPc8
         ixsv4r3SBdJ8h6IZCktuXK69VfEJDv8daXGtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i3AfjnrX1TsxUuCuxq1yim9PxWzEM4H7LTzfAMErJB4=;
        b=mYJAh68k/Gbq+hfqtxj2+qbc9sPgU5pYCneMp2JGt06lPtkJKd9RpHyKK9H9hF4qvH
         /c/Ecv4sC/VgVI4bH1st5A+scUo58h5MpNpkqbzXy3EJ0b/kArm4/t/JcEnajq5AASsA
         PDTzVu/R9KyZIaX9pOPsIVVdeFlgEGvflsOWW+2lMTvNCuDgZJZd73cEJLkXjHAAAzME
         Wz+b0RXxlPigj51YcsU4dCcl167ZJ/J74YdFE2J4BW86vcL8fmidOAyCDSYe8Y/AL6QG
         Rd9EopxPV2RcsL53Lt+TjMErjVyuklnDy9zWrrfaC/M9mCkENPTbneY0kEDig2xm/6xy
         KKVw==
X-Gm-Message-State: APjAAAWhHsHobG7RmS/zY4Uukk8C8hvQPzfftKmCHWFvSHDROe/AeKyO
        sIHIE1LO3F8axw9pg3myDRA0TYvPRaCGsw==
X-Google-Smtp-Source: APXvYqw5i0ckq0ZAz2RGxtSdc3091DucqccAjiNLcNc60yozqQayu5rspa2TLDF5uoT0GgSCQb6Asw==
X-Received: by 2002:a17:906:5e50:: with SMTP id b16mr8201826eju.254.1565943774362;
        Fri, 16 Aug 2019 01:22:54 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id x10sm980954edd.73.2019.08.16.01.22.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 01:22:53 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id l2so3370800wmg.0
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 01:22:53 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr6331188wml.64.1565943773196;
 Fri, 16 Aug 2019 01:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl> <8f49d24c-9074-a988-2ba4-23f4cd2e6fcb@xs4all.nl>
In-Reply-To: <8f49d24c-9074-a988-2ba4-23f4cd2e6fcb@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 16 Aug 2019 17:22:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5APVAkFHA6Pk7zGhn5rSZ=4vTS3PW2VxE+_+krr2RL34Q@mail.gmail.com>
Message-ID: <CAAFQd5APVAkFHA6Pk7zGhn5rSZ=4vTS3PW2VxE+_+krr2RL34Q@mail.gmail.com>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 16, 2019 at 5:10 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 8/16/19 10:06 AM, Hans Verkuil wrote:
> > Rather then discussing topics for a meeting under the subject 'Lisbon'
> > let's start a new thread referring to the right place :-)
> >
> > I will try to organize a room, either during the ELCE or (if that doesn't
> > work) perhaps on the Thursday afterwards. If that's going to be a problem
> > for someone, please let me know.
> >
> > I do need to know how many people I can expect. I have the following
> > confirmed attendees (and please reply if you are not listed!):
> >
> > Alexandre Courbot <acourbot@chromium.org>
> > Tomasz Figa <tfiga@chromium.org>
> > Jacopo Mondi <jacopo@jmondi.org>
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Hans Verkuil <hverkuil@xs4all.nl>
> >
> > I know there were more who mentioned on irc that they would attend,
> > but it is easier to keep track if I have it in an email.
> >
> > Topics posted under the previous thread:
> >
> > Tomasz:
> >
> > I would want to discuss various v4l2_buffer improvements, e.g.
> > - DMA-buf import with plane offsets,
> > - unifying the buffer structs for M and non-M formats,
> > - ability to import different FDs with offsets for non-M formats if the
> > layout matches driver expectations, etc.
> >
> > Besides that, I would be interested in the general idea on handling
> > complex cameras in the Linux kernel in spite of the remaining V4L2
> > limitations, e.g.
> > - combinatorial explosion of /dev/video nodes,
> > - significant ioctl overhead,
> > - huge amount of historical legacy making the driver and userspace
> > implementations overly difficult and prone to repetitive mistakes,
> > - the above also limiting the flexibility of the API - formats, frame
> > rates, etc. set using distinct APIs, not covered by Request API, with
> > non-failure "negotiation hell", etc.
> > - lack of fences, etc.
>
> Tomasz, I am not sure if this is suitable for a media summit: my feeling
> is that this is much more suitable for a three day brainstorming session.
>
> My 'roadmap' was to get the codec support sorted first, then start working
> on this.

I mostly dumped the topics I had in my head, leaving out the codecs as
the obvious thing that people are already planning to talk about.

That said, there's been more interest in having proper Linux drivers
for camera capture IFs and ISPs and also a lot of feedback about the
issues I listed above. I'm afraid that if we don't start looking into
them early enough, we're going to end up in the same state as with
codecs where we're few years too late or even in the worst case just
the interest fading away. :(

I guess we could try to organize a separate session on another day for
this, though. +Sakari Ailus who might be also interested in this.

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >
> > Jacopo:
> >
> > Apart from discussing libcamera and hope we could kickstart a review of
> > its API, I would like to re-start discussing multiplexed stream support,
> > but that would require Sakari to be there, something I'm not certain
> > about. Sakari?
> >
> > Alexandre:
> >
> > If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> > codecs, in particular m2m codec helpers and finalize the specification
> > in general.
> >
> > Regards,
> >
> >       Hans
> >
>
