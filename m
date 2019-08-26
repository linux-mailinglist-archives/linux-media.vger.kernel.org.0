Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34199DA0E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 01:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfHZXjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 19:39:00 -0400
Received: from mx4.ucr.edu ([138.23.248.66]:37068 "EHLO mx4.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbfHZXjA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 19:39:00 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Aug 2019 19:38:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1566862740; x=1598398740;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=kM9Cua1Vg8/QCuVf7JXsyJ3DROfw4JpvuudbKKgV8nw=;
  b=IffHnrWApT/hxDC31WTMb6mJLR2sXVsB4RgtKWzd7wrp45iTL7a+ter9
   EnQ8umTfksA8IFBVKB/vOJ4ulwwwDw8NzaXzjVir1Ls6hWLykrtIt2o53
   bnAfwylD6gRU9ifAzfo59G3GnuDbh7UQ2fG4p77jaG2MbdNebonMC7vCw
   Zdt/YRnFJdw8RvycPPHlNZQ8bLKPjwQLn2JBoNkGrc6JadFDyeNPm7zbu
   ejP/KqfqYj8nKKvYz31WGDwI6D9cXn0XwuS/VrrP8fWMtNlDqLeHP+EjT
   14/516ZkvxulS59I1bzM61GppM4Ly0osD2UQPCX8UMc12fSg0WEPbmSJK
   w==;
IronPort-SDR: MlESjoOtyCu8UXzDfX+Ev1+XrGkuPNhxF475hCUbd8HnOE0D/EOQ19u9a4vnLzF90/IQ1P2cHu
 wxHjQU40jf0QULUq8XCOzO6VutF+G9xLjciiGUKhPYv4SNDER4IWkX9MmxofbHXpFn9KN+O28F
 w19I5w51SpYyo4XGpZvpGOx0gaNYuLeiFcOEOEvoAiU16n8Da+QrANzFfIWf3TkFWO4J6ITf1X
 jmZ5IByNCZuwYYPGUclm9XIRHSkZCP3oMyNfusHKHW/JCYm9f+vjxCBYhiIOlJ8M67dqYDYVU2
 m9o=
IronPort-PHdr: =?us-ascii?q?9a23=3A6Npp0xJLSfdjMC2eytmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgRLf/xwZ3uMQTl6Ol3ixeRBMOHsqgC0reL+Pq8EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCejbb9oMRm7rQXcusYIjYZtN6081g?=
 =?us-ascii?q?bHrnxUdupM2GhmP0iTnxHy5sex+J5s7SFdsO8/+sBDTKv3Yb02QaRXAzo6PW?=
 =?us-ascii?q?814tbrtQTYQguU+nQcSGQWnQFWDAXD8Rr3Q43+sir+tup6xSmaIcj7Rq06VD?=
 =?us-ascii?q?i+86tmTgLjhTwZPDAl7m7Yls1wjLpaoB2/oRx/35XUa5yROPZnY6/RYc8WSW?=
 =?us-ascii?q?9HU81MVSJOH5m8YpMAAOoPP+lWr4fzqVgToxWgGQahH//vxiNSi3PqwaE2z+?=
 =?us-ascii?q?YsHAfb1wIgBdIOt3HUoc33O6cTUOG1zLTIzTLeZPxV2Tfy8onIeQ0mrPCMXL?=
 =?us-ascii?q?NwcdDeyUgzGw/ZgFidspHlMC+P1ugXrWeU8vdgWPuphmU6qA9xuiCiytkwho?=
 =?us-ascii?q?TNnI4YyVDJ+T9kzIs0J9C0Ukx2bcKiHZBNrS+VLZF2TdknQ2xwvSY6zaAJto?=
 =?us-ascii?q?CjcSgRzZQn2wbfa/uac4iU+h7jVPieITN/hH99fbKwnRey8Uy5xu34WMm4zU?=
 =?us-ascii?q?9GriRHn9XQrHwN2BvT6s+ISvt54EitwyqA1wfW6u1cIEA0k7TUK4I5z7Iuip?=
 =?us-ascii?q?YetV7PEyz2lUnskaObd0cp9vKq5uj7ernmo4WTN45wigHwKKQuncm/DPw4Mw?=
 =?us-ascii?q?kPX2iU4+W82KH/8UD3W7hKk+E5krPDvJ/EOMsbu7a1AxVJ3YY79xa/EzCm3c?=
 =?us-ascii?q?wcnXkGKlJFZR2Gg5HsO17QPf/4DO2wjk+ykDdk2f/GJKftApbTIXjZlrfuY7?=
 =?us-ascii?q?J951RbyAopwtAMr65TX5EIJum7ZELrt8HZCldtMxK52eX6CdFVxphCUGaLRK?=
 =?us-ascii?q?mdZvD8q1iNs9MuMemRY8cnuD/8Y6w09f7njCdhwncAdrPv0JcKPiPrVs96Kl?=
 =?us-ascii?q?mUNCK/yuwKFn0H609nFLTn?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G3CwA3a2RdgEanVdFlHgEGBwaBZ4J?=
 =?us-ascii?q?ARYEFKoQhg0qLPoIPgjKRQIFkhTsBCAEBAQ4bFAEBgQSDOwKCaCM4EwIKAQE?=
 =?us-ascii?q?FAQEBAQEGBAEBAhABAQkNCQgnhTYMgjopAYFLXz4BAQEDEhEEUhALCwMKAgI?=
 =?us-ascii?q?fBwICIhIBBQEcBhMIGoMBggoFniKBAzyLJH8zg3eEaAEIDIFJEnooi3KCF4N?=
 =?us-ascii?q?uNT6CSIUHglgEgS4BAQGUP5V5AQYCAYIMFIZqhTSIJRuCMm2GQ45tLYQFnWq?=
 =?us-ascii?q?ECw8hgUaBejMaJX8GZ4FOCYJxhgSIKSIwj1QBAQ?=
X-IPAS-Result: =?us-ascii?q?A2G3CwA3a2RdgEanVdFlHgEGBwaBZ4JARYEFKoQhg0qLP?=
 =?us-ascii?q?oIPgjKRQIFkhTsBCAEBAQ4bFAEBgQSDOwKCaCM4EwIKAQEFAQEBAQEGBAEBA?=
 =?us-ascii?q?hABAQkNCQgnhTYMgjopAYFLXz4BAQEDEhEEUhALCwMKAgIfBwICIhIBBQEcB?=
 =?us-ascii?q?hMIGoMBggoFniKBAzyLJH8zg3eEaAEIDIFJEnooi3KCF4NuNT6CSIUHglgEg?=
 =?us-ascii?q?S4BAQGUP5V5AQYCAYIMFIZqhTSIJRuCMm2GQ45tLYQFnWqECw8hgUaBejMaJ?=
 =?us-ascii?q?X8GZ4FOCYJxhgSIKSIwj1QBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; 
   d="scan'208";a="73198251"
Received: from mail-lf1-f70.google.com ([209.85.167.70])
  by smtpmx4.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 16:31:50 -0700
Received: by mail-lf1-f70.google.com with SMTP id z24so1218166lfb.15
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 16:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zHZ68SOgALOLBcJLTVPjnAnpRGohAVYDLu1/pi6HRkU=;
        b=ZB09cFCshu3OsnUMq9UQpdQrSAH6tk0nbphxjRDvIR8csUdxxWGGq1VnpZUf2gWWjE
         7t+5zF7diwVqThhCXsABicHcARTV7g2NeAPUKWCxCM1+VRQuyYPs4PoO1llNP7HU0Kqb
         T3+lFpizWOw95dKKTvbJRAPoUiIQLsX3AVaVH/h3GxxwdTSmevqCxEGr/eqOatLD4wJR
         1oE8A5lFg3Pa3ek41j3+vctC4OuOP9cblMHLCrJnJ6wgROGnS+uBReBGQ06HOJBEo6wp
         Q6zl7A3o6gu61LHdiQCqUn1sNvP8rX+NCqoywDZl0sfypuD86okrn+362IiYyExCP39p
         MOiQ==
X-Gm-Message-State: APjAAAVZv/P/Sdq9otp115eo8tyUQyouh/QTXhtXXWCPtJCW2A95zLAN
        a95MMBh150x5nSdPgsejpNuzUYgEQTbbSlP3DNcuINuT0qGbPppj9LEXQnt2Ys+tWAuEPmlabVQ
        3uYozAgs9d2z3GfZ+9m4f7aOBKTCrZvDQ9ohjuIa/
X-Received: by 2002:a2e:b4db:: with SMTP id r27mr12031855ljm.110.1566862308239;
        Mon, 26 Aug 2019 16:31:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtlZX5KlXDKRKPnANcKQ/U2/n2wfoad1fT5Hyfe4LOP+/aJ0H31gi+jf5y1wvH7QxB72GTcBA94U0zxO8nkX8=
X-Received: by 2002:a2e:b4db:: with SMTP id r27mr12031844ljm.110.1566862307961;
 Mon, 26 Aug 2019 16:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190821210931.9621-1-yzhai003@ucr.edu> <afa0a08e-30ff-7958-fb09-3e3d58d47f0e@xs4all.nl>
In-Reply-To: <afa0a08e-30ff-7958-fb09-3e3d58d47f0e@xs4all.nl>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Mon, 26 Aug 2019 16:32:17 -0700
Message-ID: <CABvMjLT8F+a7X6e8T-UHWGT751MyiXsXn_6artQjNzhQgFCYPQ@mail.gmail.com>
Subject: Re: [PATCH] [media] pvrusb2: qctrl.flag will be uninitlaized if
 cx2341x_ctrl_query() returns error code
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Chengyu Song <csong@cs.ucr.edu>, Zhiyun Qian <zhiyunq@cs.ucr.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the correction, let me send a new patch then.

On Mon, Aug 26, 2019 at 5:09 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 8/21/19 11:09 PM, Yizhuo wrote:
> > Inside function ctrl_cx2341x_getv4lflags(), qctrl.flag
> > will be uninitlaized if cx2341x_ctrl_query() returns -EINVAL.
> > However, it will be used in the later if statement, which is
> > potentially unsafe.
> >
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > ---
> >  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > index ad5b25b89699..1fa05971316a 100644
> > --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > @@ -793,6 +793,7 @@ static unsigned int ctrl_cx2341x_getv4lflags(struct pvr2_ctrl *cptr)
> >       struct v4l2_queryctrl qctrl;
> >       struct pvr2_ctl_info *info;
> >       qctrl.id = cptr->info->v4l_id;
> > +     memset(&qctr, 0, sizeof(qctrl))
>
> Please compile test your patches! This doesn't compile due to a typo
> (qctr -> qctrl).
>
> Also, this would overwrite qctrl.id with 0, not what you want.
>
> Instead, just do:
>
>         struct v4l2_queryctrl qctrl = {};
>
> to initialize the struct with all 0.
>
> Regards,
>
>         Hans
>
> >       cx2341x_ctrl_query(&cptr->hdw->enc_ctl_state,&qctrl);
> >       /* Strip out the const so we can adjust a function pointer.  It's
> >          OK to do this here because we know this is a dynamically created
> >
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
