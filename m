Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7453A1CFA03
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 18:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgELQBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 12:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgELQBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 12:01:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CD9C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 09:01:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 18so6555517pfv.8
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXq4AJE3bn2sZXNfFmjK+niwUa5xFw7NRdNgqh+RZq0=;
        b=Wi3FPWjSd3VRqyuHXIdYYwygsRYYf80CdQ7it523Wl5ll5g0S9lU8nGRQqlT3PTHiy
         LTpd7LqXhi/M6M7+giRMCTybzAK49iqwa9joYSZfc9hvVmwQhb46SCGWLm3fW0g3gjTq
         g8eMWop0tj8voLC5FDhaWR+8LoLoXDkSwYX7eSidllDGwaIh3uxa3fPwu5uzrspH52Is
         QgVtbS2C/wdIv1z9kU7VgvYXEC/UmpNXr5GUUtFvDcGB+amBUBW/Cs3KkCmUbO1vZSEt
         qyBuVf6Nvmj9WS7J5n1Yy9Z2Dx1kJhr8JtGbME6MoYFbrBVqxgPjLxdIdVDky/eFWdaH
         8NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXq4AJE3bn2sZXNfFmjK+niwUa5xFw7NRdNgqh+RZq0=;
        b=idHAv8ngYFKA74bJ3iUwbGf7U2BXTe/itSTQr23mzASLVkkxB4I8EDFWbjb7mT1Ybz
         BJN7DI6/fjKpaWcXCaSFk59lG/z0ns98DTedX7j01Ja5/Ltl21jC0J2XEgtdYAFHb1OJ
         WxyKGLbPvpT+c2LwCHsWaPX2tZInAhSlJkQZzpjPmOp3qPQvfWc2tqO4tAuqJe1MrQdt
         EFbO/JuPylzNngxjnAuGPpSRT2dRBcTtrIKS7f5VduKTr4uo+Agf+qPK6JqsEtaQj4rk
         qCY/c32OEBUMQCQobL8tgb2eN0OK/S+8DjPvnenr4PL6oGJj+kDty0BHq0UaI4EYwSTO
         ECFA==
X-Gm-Message-State: AGi0PuYTGzu5p/2jX58gpdH3PRph3MjWCzWMOTrldLSyPXnuKWVQWNZf
        tWgKShlwhXZFT8oEKEy1xKdMU92qR90zSVxh+dQ=
X-Google-Smtp-Source: APiQypJTOTcZjBv1GPnspNQ5HHZ5clsgFUMHxlTgvUlns2YGZemhBXMyOz5lxqUulknwBTBbfh+lGMpftOMgr8kCQTw=
X-Received: by 2002:a62:f908:: with SMTP id o8mr21275939pfh.170.1589299288817;
 Tue, 12 May 2020 09:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
 <20200502190414.7ede79b6@coco.lan> <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
 <20200512122056.6ae3580f@coco.lan> <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
 <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com> <20200512165644.6609098b@coco.lan>
In-Reply-To: <20200512165644.6609098b@coco.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 May 2020 19:01:22 +0300
Message-ID: <CAHp75VcSCd5PGhdchK+Yn_7HVvr7pJPK_9pORzwBhPzd2=MGFw@mail.gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 5:56 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Tue, 12 May 2020 14:21:49 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > On Tue, May 12, 2020 at 2:12 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, May 12, 2020 at 1:21 PM Mauro Carvalho Chehab
> > > <mchehab@kernel.org> wrote:
> > > > Em Sat, 2 May 2020 20:33:14 +0300
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > > > > On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > > > > Em Sat, 2 May 2020 19:08:36 +0300
> > > > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> >
> > ...
> >
> > > Btw, https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=65608aa8d34ea274600ab2cf6f0cf54ee86d8fd1
> > > is incorrect approach. Look closer what PCI does in case when
> > > pcim_enable_device() has been called.
> >
> > This has resource leaks
> > https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=88b03de5d705f5f46a896dbd21ef9472030bb8d3
> >
> > Easier just to acpi_handle_info(ACPI_HANDLE(...), ...);
> >
> > We don't enumerate them w/o ACPI IIRC.
>
> Well, at least while in staging, it would be good to know more details
> about the probing issues on different hardware that people might be
> testing it.
>
> avoiding to use a get_device() here is not possible, because the
> prints will use the adev to return some info we may need:
>
>         ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=CAM1, HID=OVTI2680

Why do you need get_device()? Are you expecting device may have gone?
acpi_handle_*() / dev_*() are not enough?

> This, together with the DMI product ID on this message:
>
>         atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T101HA
>
> may help to avoid users to run acpixtract/iasl/dmidecode when adding
> new entries to the dmi match tables. Not 100%, since BIOSes may
> still use different names for the sensor data.

> Trying to open a video devnode returns error and produce those logs:
>
>         [ 3262.961623] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE output
>         [ 3262.971350] sh_css_hrt_system_is_idle() 44: warning: SP not idle
>         [ 3262.971364] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
>         [ 3262.971712] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is not empty
>         [ 3262.972079] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is not empty
>         [ 3262.972188] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
>         [ 3262.974982] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: error in iunit interrupt. status reg=0xffffffff

In my case when I tried with 2015-04 / 2015-05 firmware for ISP2400 I
got to no crashes, but no IRQs, presumably due to absence of PMIC
integration.

-- 
With Best Regards,
Andy Shevchenko
