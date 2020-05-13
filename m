Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B83A1D1D98
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 20:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389724AbgEMSgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 14:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732218AbgEMSgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 14:36:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48810C061A0C
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 11:36:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id 50so663232wrc.11
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z/8q16N2i78bBPV29hR+UTZSlN+2Q8MrLj6ZWAwTDUg=;
        b=t7CutcdwlZByoVvrqbyed/3qfwutIR34JACsnxWrevfe9bsHCXD8MlQT+g/1PSbz7D
         wrxgflN58bcVpXZcK5HuzK5cs8nMiOVEkjQxTPlnjVjoPAlFJwtnKEw30VmfOktBAI5u
         7hg21UpdZn6TTH7j1e/zOl7bAxerhNfkFb4IThjKq5R0Jmhut9/ClFagELfApqMRJIxp
         Qgy07asvXTPPrVF6v6MnhP3OqTZBbhjptp8yso8fJbYiSQZsDwotKuVaS4Cl1EVdemHU
         7qLYwgwN6ywXGpWVTLLCMHFYJ9ma/VdumExq7z2astw6jDvofxpX4pAhNPCnuWvTvPg1
         Rt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z/8q16N2i78bBPV29hR+UTZSlN+2Q8MrLj6ZWAwTDUg=;
        b=IJoXQnXqdXwn97Ph1cMlevfJi8v7QKe7ie8NItua3YQwQncf/Vw8uRadqjxXT8jE/P
         Hxy3XzUHNjB73kbUry+JGAOoeJ9w+DQnNB8u5U4v/F0O0jtU/g6zmkPPD5yda9YmpMHy
         GbImZhPDaQi8OaLXESYGDZykVQUx1qnzPyyehYuZVpdCWcogcWu6dyne4+SpY2RmU5zU
         1MksupCt4v0ePBlclFEg+9oYG5Kfny4ARPSvaant1WMje2tX6Q++cmiRGS2ltLFcT868
         pTXF1Hv4ranTRxV9sXsAvfPnp6b/xPaAEfYQvtqH4fkmODKStjaXSj1Ztj96xpq0e65j
         mtSg==
X-Gm-Message-State: AOAM531am5CjQ2iUHkPxO77JnaZd35StPW6V+tsvGjWT9Wd1Ph+E7Hg5
        nZw/UX1iPlLTL7vcpuQfXWo=
X-Google-Smtp-Source: ABdhPJyJEEg7FNtWg58viTzZQ3EtreBcEYf+PvOo8BioJsn3Ww3KE0QVlZf1Rdj9sXZ0ZB/6xlz5hQ==
X-Received: by 2002:adf:fb08:: with SMTP id c8mr688833wrr.421.1589394993991;
        Wed, 13 May 2020 11:36:33 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id f5sm432138wrp.70.2020.05.13.11.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 11:36:33 -0700 (PDT)
Date:   Wed, 13 May 2020 20:36:31 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200513203631.6fbe7503@ASUS>
In-Reply-To: <CAHp75VcSCd5PGhdchK+Yn_7HVvr7pJPK_9pORzwBhPzd2=MGFw@mail.gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200502190414.7ede79b6@coco.lan>
        <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
        <20200512122056.6ae3580f@coco.lan>
        <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
        <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com>
        <20200512165644.6609098b@coco.lan>
        <CAHp75VcSCd5PGhdchK+Yn_7HVvr7pJPK_9pORzwBhPzd2=MGFw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 May 2020 19:01:22 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, May 12, 2020 at 5:56 PM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> > Em Tue, 12 May 2020 14:21:49 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > > On Tue, May 12, 2020 at 2:12 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, May 12, 2020 at 1:21 PM Mauro Carvalho Chehab
> > > > <mchehab@kernel.org> wrote:
> > > > > Em Sat, 2 May 2020 20:33:14 +0300
> > > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > > > > > On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > > > > > Em Sat, 2 May 2020 19:08:36 +0300
> > > > > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > >
> > > ...
> > >
> > > > Btw, https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=65608aa8d34ea274600ab2cf6f0cf54ee86d8fd1
> > > > is incorrect approach. Look closer what PCI does in case when
> > > > pcim_enable_device() has been called.
> > >
> > > This has resource leaks
> > > https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=88b03de5d705f5f46a896dbd21ef9472030bb8d3
> > >
> > > Easier just to acpi_handle_info(ACPI_HANDLE(...), ...);
> > >
> > > We don't enumerate them w/o ACPI IIRC.
> >
> > Well, at least while in staging, it would be good to know more details
> > about the probing issues on different hardware that people might be
> > testing it.
> >
> > avoiding to use a get_device() here is not possible, because the
> > prints will use the adev to return some info we may need:
> >
> >         ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=CAM1, HID=OVTI2680
> 
> Why do you need get_device()? Are you expecting device may have gone?
> acpi_handle_*() / dev_*() are not enough?
> 
> > This, together with the DMI product ID on this message:
> >
> >         atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T101HA
> >
> > may help to avoid users to run acpixtract/iasl/dmidecode when adding
> > new entries to the dmi match tables. Not 100%, since BIOSes may
> > still use different names for the sensor data.
> 
> > Trying to open a video devnode returns error and produce those logs:
> >
> >         [ 3262.961623] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE output
> >         [ 3262.971350] sh_css_hrt_system_is_idle() 44: warning: SP not idle
> >         [ 3262.971364] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
> >         [ 3262.971712] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is not empty
> >         [ 3262.972079] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is not empty
> >         [ 3262.972188] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
> >         [ 3262.974982] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: error in iunit interrupt. status reg=0xffffffff
> 
> In my case when I tried with 2015-04 / 2015-05 firmware for ISP2400 I
> got to no crashes, but no IRQs, presumably due to absence of PMIC
> integration.
> 

Do you have the 2015-04 / 2015-05 firmware still available? I would
like to try them as well. 

-- 
with kind regards,
Patrik
