Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473201C2744
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 19:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgEBRd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 13:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726400AbgEBRd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 13:33:26 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274E8C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 10:33:26 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id a7so1489576pju.2
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1XaspgymkE2P5OymSarARMF5I40eH1zSX6hIpRvtsLs=;
        b=iwRClnLn9e0e1eRqRJR9/mVrpCFiHQDY1FGwpsoTyPAdIAjdKdTvitmJTz1/ATifpd
         hvi+FSJ81Rhb/YM6y3j3/fm21E3KJyzMdirYmvJs7CLEF5N+STzx5wbDXMQJOQ9TKA0J
         I6eIiGr3keebWiYnWnfK/+8btjrMMyJuOvVR8rfDaRH4xOsk6nTuQg9DtRGMoSI5N76R
         hyWp3m7udQN7rFc14wo2M/L4wrws9uu2d726ma1t+Lzzkaf7x5EiFbTMcteMmzZkfazE
         fMe8iGFQHTXI8zsTwGNpnM8kTf3RwxYHoz4bXO0f5H49MRCCi9XPIl4K1m8AytAdVmu0
         a8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1XaspgymkE2P5OymSarARMF5I40eH1zSX6hIpRvtsLs=;
        b=cmHrbBNhudwbkiNpB5kYnn8XCD/vIpyXhel1KCn4pcGUZ0xCY29l7hURy4iWC0vJRT
         g5s7oc8Ixyya495vbzZYhZ2hg2GupMauOpFtj9F0lox2jXtkUt5zOYEtxRl87rc0asuL
         eo2EIAkcpcEgQtIMxp5Yjju5cjsIBxTqOnuwR32KGrPTeUqe1eFEoMY366fN5XvYWe1g
         MfnVmVmT1ubOd4wMc/vQXD7GEenZgLcCdBEGXM1E0ijjsiJ6TP0w9bJt3oVN8f+mDRUm
         +QqmB18411JXwp6+ZCZfpn2Nc03ozqO8YejAO5dfkTApprBkmspquEZnQtAR4MiBphAt
         /Ouw==
X-Gm-Message-State: AGi0PuY07rFOEUl3Pfn9u/s4sOMFWfVRcwnp1/QBrbbATHpxUyDHe0p8
        mOfgx5sIFeW5NmrDvCC6a0vo9A7jyiMy+uiK7jM=
X-Google-Smtp-Source: APiQypINWdsFhw1ySkEasf6pDkNHckQMBKTtTt8QTBPQGmZh/SHW1hMnESLBrclJvhiYmyPLfQYyQ5tZQ/98AFoxNNw=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr6763943pjb.143.1588440805297;
 Sat, 02 May 2020 10:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com> <20200502190414.7ede79b6@coco.lan>
In-Reply-To: <20200502190414.7ede79b6@coco.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 2 May 2020 20:33:14 +0300
Message-ID: <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Sat, 2 May 2020 19:08:36 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>
> > I follow your attempts to enable that driver (I, myself, spent a lot
> > of time to an attempt of getting this driver in a shape). However, I
> > guess you started from a wrong side. Even with access to internal tree
> > for Android firmware we didn't manage to find a proper one to whatever
> > has been published in drivers/staging. So, to get it done, one should
> > first to find a *working* Android for the certain device. Without that
> > it will be a journey of wasted time and big disappointment.
>
> I found a driver that is probably working:
>         https://github.com/intel-aero/meta-intel-aero.git
>
> It is for an Intel Mobile Aero AUV platform. I suspect that his one
> should likely work.

So, have anybody tried to build and get a picture (raw is very good
start for it) out of that sources and respective firmware?

> > My achievements end with no getting IRQ from the driver (and I was
> > experimenting on MRD-7 CRB).
> >
> > P.S. I also have some (semi-) debug patches I can share.
> > Perhaps they will give some more ideas.
>
> Anything you can share will be welcomed.

https://paste.debian.net/1144410/

No SoB from me (despite patches have them).

> > Btw, based on this discussion I think that
> > it can be power issues with sensors that possible affect IRQ
> > generation inside SiliconHive vector processor.
>
> Yeah, the current issue sounds simple to solve, but I need to understand
> how an ACPI-based device would be calling regulator_register(). Using
> regulators with ACPI is new to me. I suspect that this should be done
> by ./arch/x86/platform/intel-mid, with of course doesn't have the needed
> bits for this board. Also, there is a dummy regulator driver for atomisp
> based boards (drivers/platform/x86/intel_atomisp2_pm.c). This one could
> be causing some issues too.
>
> The atomisp driver uses regulator_get() to turn on the sensors.

It should use PMIC to get them.

> In order for regulator_get() to work, regulator_dev_lookup() should
> be capable of finding a regulator either via DT or via the
> regulator_map_list.
>
> The contents of the regulator_map_list should visible on a configfs
> node (/sys/kernel/debug/regulator/supply_map).
>
> Yet, those aren't visible (probably because the ACPI data was written
> for Windows). So, the atomisp code should very likely call
> regulator_register() for the regulators with the atomisp driver
> need, in order to setup the regulator list.
>
>
> > In IPU3 the dedicated
> > PMIC is used for camera devices, and I have no idea of the design for
> > old ones.
>
> I have here a Dell notebook with IPU3 on it (marketed for MS windows):
>
>         ipu3_imgu: module is from the staging directory, the quality is unknown, you have been warned.
>         ipu3-imgu 0000:00:05.0: enabling device (0000 -> 0002)
>         ipu3-imgu 0000:00:05.0: device 0x1919 (rev: 0x1)
>         ipu3-imgu 0000:00:05.0: physical base address 0x00000000ec000000, 4194304 bytes
>         ipu3-imgu 0000:00:05.0: loaded firmware version irci_irci_ecr-master_20161208_0213_20170112_1500, 17 binaries, 1212984 bytes
>         ipu3-cio2 0000:00:14.3: enabling device (0000 -> 0002)
>         ipu3-cio2 0000:00:14.3: device 0x9d32 (rev: 0x1)
>
> This command:
>
>         # cat /sys/kernel/debug/regulator/supply_map
>
> Returns nothing. So, it seems that the very same issue may also be
> happening on IPU3-based laptops that won't have BIOSes designed to
> work on Linux.

Because you have to have an OpRegion in ACPI for the camera PMIC (see
this driver
https://elixir.bootlin.com/linux/latest/source/drivers/acpi/pmic/tps68470_pmic.c).

AFAIU ISPv2 uses the generic Atom PMIC (see other drivers in the above
mentioned folder).

-- 
With Best Regards,
Andy Shevchenko
