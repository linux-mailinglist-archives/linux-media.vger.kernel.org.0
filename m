Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D2E3A1BC5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 19:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFIRaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 13:30:25 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:34347 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhFIRaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 13:30:24 -0400
Received: by mail-wr1-f41.google.com with SMTP id q5so26392631wrm.1
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wskYStBmcNPDTfLKW+BNbupo93MWxUbiOgqVR0Uy7TY=;
        b=RCZIwzvEEPiiNaMlsrNb+FrtVr6RUFvlmtxJpoi6jgXIxNeVpnkM63fQoz8aSLJecW
         vQsSXynCwN5BYS30a0odBPMYTjneAUbtlmy7BwQ66dHjmHiqQJEucS1KrvcFZjjGepRk
         UGWSIfQjvyeh8KCviBAq/apMEK/vi7oKXqeI5XPyG1pvLjj5q/jnixm/gfXLUJoBKpkq
         eZcrfOl0MW/KhBCAeg9wH17zKhGhr6Fh7N/luSnbFeuFmJJc0tOUCSlFw5Wc6vK7+Bgh
         WPTGJoROAChZpn2k0P1GFUOpX1IipvHJETlIPtmdtQZWd1lSyc2EMU0phYhXfsa0Z+uy
         1GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wskYStBmcNPDTfLKW+BNbupo93MWxUbiOgqVR0Uy7TY=;
        b=P7yrdsTd9whkwqp4/SlrQT+rWu//ii39pjajvafTvmNdjqApGcz/FDT/iyDROMCJ38
         3MV2DrmT6foK6uiaUJw1CPM7XZCZb2lBJt2jGX5U/e5nwhMJ7BGKRvCe9Ri8dYMHjl5i
         O8SONYvZ6QJT4XGXKrytLWXlmx56z9OY95hdFfuJwKmIMedlZ9CjBhq/0jAdcRirVnTt
         9mbBn7Q/LxovC3m/QSwxSVM+BMnXMpr61ILQSSwnq1vJZwo9/rsRIBVLJ8Tg+9IUY0gD
         yBJ+zc5cyrKFx7PLiIl0/+Okv8fGzayg3M6CamK/bSWMQS71cIX1yNJByEayRGNlEYpd
         63Yw==
X-Gm-Message-State: AOAM532sWUAlmQ54EmuYGJEwWSDtXF6taN+ZtHXYVHpQLS4/W/arTkju
        xnQE4sn7yRm/shAb+2gDg1zGNOLbDl0SOyNa/ZNdbIFR+73Fqaqp
X-Google-Smtp-Source: ABdhPJxb8dpkLxRt/0SrRdoenBb8VWzRfdgquE7QUEDKlCSUZgjNl/yP1WUX+gPAJ8Jr+9f0CsUId7xTLbZEQJ+ZXCA=
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr888846wrc.273.1623259648922;
 Wed, 09 Jun 2021 10:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu> <19a143de-818d-4c21-94c1-f4ebf57e3802@jm0.eu>
 <35096323-4f28-6c04-2308-de9895c2751d@jm0.eu>
In-Reply-To: <35096323-4f28-6c04-2308-de9895c2751d@jm0.eu>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 9 Jun 2021 18:27:13 +0100
Message-ID: <CAPY8ntBEDFJi2zUN9nhwYvicn1kf926L63GzG2CfmM0=p33C3Q@mail.gmail.com>
Subject: Re: [BUG] tc358743: division by zero
To:     "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Cc:     matrandg@cisco.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Josua

On Wed, 9 Jun 2021 at 18:08, Ing. Josua Mayer <josua.mayer@jm0.eu> wrote:
>
> Hello again,
>
> I added debug prints to tc358743_probe_of and
> tc358743_num_csi_lanes_needed, tracking the values of pll_prd and pll_fbd.
>
> I believe the bug is caused by probe returning early when it encounters
> an unsupported datarate of more than 1gbps per lane, which skips the
> code that would initialize pll_fbd.
> Hence later in tc358743_num_csi_lanes_needed, pll_fbd is zero - leading
> to divide by zero.
>
> The interesting parts of dmesg leading to this conclusion:
> [   16.393072] imx6_mipi_csi2: module is from the staging directory, the
> quality is unknown, you have been warned.
> [   16.891557] tc358743 0-000f: initialized pll_prd = 4
> [   16.896618] tc358743 0-000f: unsupported bps per lane: 1188000000 bps
> # pll_prd has been initialized, but pll_fbd has not
> [   17.203559] tc358743 0-000f: pll_prd = 4
> [   17.207588] tc358743 0-000f: pll_fbd = 0
> # using pll_fbd value 0
> [   17.211539] Division by zero in kernel.
> [   17.215415] CPU: 1 PID: 208 Comm: systemd-udevd Tainted: G        WC
>   E     5.10.0-7-armmp #1 Debian 5.10.40-2
> [   17.225418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   17.231947] Backtrace:
> [   17.234417] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>]
> (show_stack+0x20/0x24)
> [   17.247662] [<c0cf2374>] (show_stack) from [<c0cf74c4>]
> (dump_stack+0xc8/0xdc)
> [   17.254892] [<c0cf73fc>] (dump_stack) from [<c0cf216c>]
> (__div0+0x24/0x28)
> [   17.267442] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
> [   17.273844] [<bf4cea34>] (tc358743_num_csi_lanes_needed [tc358743])
> from [<bf4cec3c>] (tc358743_set_csi+0x1c/0x2f8 [tc358743])
> [   17.290929] [<bf4cec20>] (tc358743_set_csi [tc358743]) from
> [<bf4ccaac>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
> [   17.307430] [<bf4cc9a8>] (tc358743_s_dv_timings [tc358743]) from
> [<bf4ce384>] (tc358743_probe+0x93c/0xfec [tc358743])
> [   17.323757] [<bf4cda48>] (tc358743_probe [tc358743]) from
> [<c0a3ace4>] (i2c_device_probe+0x100/0x2e0)
>
> I don't really know where this condition should be checked for, or
> avoided. Hopefully though this gives somebody else enough information to
> find a solution.

In both the
    default:
        dev_err(dev, "unsupported refclk rate: %u Hz\n",
            state->pdata.refclk_hz);
        goto disable_clk;
and
   if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
        dev_err(dev, "unsupported bps per lane: %u bps\n", bps_pr_lane);
        goto disable_clk;
    }
cases, you want a
   ret = -EINVAL;
or similar before the goto disable_clk;

Most of the other cases are doing a ret = <some function call> and
checking ret. That's not the case with these validation checks, so it
is aborting but has left ret at the value from the previous call
(which succeeded).

Hope that helps. If it works then a patch would be welcome.

  Dave

> Yours sincerely
> Josua Mayer
>
>
> Am 09.06.21 um 17:08 schrieb Ing. Josua Mayer:
> > and I forgot about the promised dts :( .. I am realyl sorry for spamming
> > your mailbox like this ...
> >
> > Am 09.06.21 um 17:07 schrieb Ing. Josua Mayer:
> >> Dear Maintainers,
> >>
> >> During my attempts at capturing HDMI via the csi-2 port on i.MX6
> >> HummingBoard, I triggered a division by zero in
> >> tc358743_num_csi_lanes_needed!
> >> I am running Debian testing, with linux 5.10.40 - built from debian
> >> sources with the tc358743 driver enabled:
> >> Linux sr-imx6 5.10.0-7-armmp #1 SMP Debian 5.10.40-2 (2021-05-29)
> >> armv7l GNU/Linux
> >>
> >> The crash is triggered from userspace as I execute:
> >> media-ctl -l "'tc358743 0-000f':0->'imx6-mipi-csi2':0[1]"
> >> media-ctl -l "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
> >> media-ctl -l "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
> >> media-ctl -l "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"
> >> v4l2-ctl -d /dev/v4l-subdev7 --set-edid=file=tc358743-edid.hex && sleep 1
> >> v4l2-ctl -d /dev/v4l-subdev7 --set-dv-bt-timings query && sleep 1
> >>
> >> [   60.985439] Division by zero in kernel.
> >> [   60.989333] CPU: 1 PID: 395 Comm: v4l2-ctl Tainted: G        WC  E
> >>   5.10.0-7-armmp #1 Debian 5.10.40-2
> >> [   60.998904] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> >> [   61.005438] Backtrace:
> >> [   61.007911] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>]
> >> (show_stack+0x20/0x24)
> >> [   61.015489]  r7:00000018 r6:600b0013 r5:00000000 r4:c14cdc90
> >> [   61.021162] [<c0cf2374>] (show_stack) from [<c0cf74c4>]
> >> (dump_stack+0xc8/0xdc)
> >> [   61.028394] [<c0cf73fc>] (dump_stack) from [<c0cf216c>]
> >> (__div0+0x24/0x28)
> >> [   61.035276]  r7:00000018 r6:034bc000 r5:c1f67890 r4:4f1a0000
> >> [   61.040951] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
> >> [   61.047336] [<bf412000>] (tc358743_num_csi_lanes_needed [tc358743])
> >> from [<bf412a44>] (tc358743_set_csi+0x1c/0x3f0 [tc358743])
> >> [   61.058734]  r9:00000000 r8:c2b8b400 r7:c1f67a59 r6:bf419380
> >> r5:c1f679e8 r4:c1f67890
> >> [   61.066495] [<bf412a28>] (tc358743_set_csi [tc358743]) from
> >> [<bf413f64>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
> >> [   61.077283]  r7:c1f67a59 r6:bf419380 r5:c1f679e8 r4:c1f67890
> >> [   61.082961] [<bf413e60>] (tc358743_s_dv_timings [tc358743]) from
> >> [<c0a79fd4>] (subdev_do_ioctl+0x430/0xd0c)
> >> [   61.092708]  r7:c1f67890 r6:c2ea0780 r5:c2d91c00 r4:c0845657
> >> [   61.098376] [<c0a79ba4>] (subdev_do_ioctl) from [<c0a7a934>]
> >> (subdev_do_ioctl_lock+0x84/0xb4)
> >> [   61.106909]  r10:c2d91c00 r9:bea08dec r8:c0845657 r7:00000000
> >> r6:c2d91c00 r5:c2ea0780
> >> [   61.114741]  r4:c2e35000
> >> [   61.117294] [<c0a7a8b0>] (subdev_do_ioctl_lock) from [<c0a6c4b4>]
> >> (video_usercopy+0x190/0x674)
> >> [   61.125913]  r9:bea08dec r8:c2d91c00 r7:bea08dec r6:c0845657
> >> r5:00000000 r4:c0845657
> >> [   61.133668] [<c0a6c324>] (video_usercopy) from [<c0a79254>]
> >> (subdev_ioctl+0x20/0x24)
> >> [   61.141419]  r10:c30372a8 r9:00000003 r8:c2ea0780 r7:bea08dec
> >> r6:c2ea0780 r5:00000000
> >> [   61.149251]  r4:c0a79234
> >> [   61.151797] [<c0a79234>] (subdev_ioctl) from [<c0a64920>]
> >> (v4l2_ioctl+0x4c/0x60)
> >> [   61.159207] [<c0a648d4>] (v4l2_ioctl) from [<c05a90ac>]
> >> (sys_ioctl+0x130/0xa74)
> >> [   61.166520]  r5:00000000 r4:c0845657
> >> [   61.170107] [<c05a8f7c>] (sys_ioctl) from [<c03000c0>]
> >> (ret_fast_syscall+0x0/0x54)
> >> [   61.177681] Exception stack(0xc48adfa8 to 0xc48adff0)
> >> [   61.182742] dfa0:                   005023a4 004dad3c 00000003
> >> c0845657 bea08dec 00000000
> >> [   61.190927] dfc0: 005023a4 004dad3c 00000003 00000036 0050c808
> >> bea09494 bea08fa0 00000000
> >> [   61.199109] dfe0: 00500df8 bea08d2c 004a635d b6cde418
> >> [   61.204169]  r10:00000036 r9:c48ac000 r8:c03002c4 r7:00000036
> >> r6:00000003 r5:004dad3c
> >> [   61.212000]  r4:005023a4
> >>
> >> I am attaching the device-tree changes as a file for reference. Any
> >> ideas what is happening here?
> >>
> >> I can see 2 divisions:
> >> 1. pdata->refclk_hz / pdata->pll_prd
> >> 2. DIV_ROUND_UP(bps, bps_pr_lane)
> >>
> >> 1. should never be 0, since it is initialized during probe and then
> >> never changed
> >>
> >> 2. see how the divisor can be 0
> >> pdata->refclk_hz / pdata->pll_prd is the inversion of how pll_prd is
> >> calculated, and should equal to 6MHz from probe.
> >> pll_fbd is also set in probe: pll_fbd = bps_pr_lane / refclk_hz * pll_prd
> >> As I have specified a link-frequency of 594MHz, that produces:
> >> bps_pr_lane = 2 * 594MHz
> >> pll_fbd = 2 * 594MHz / 27MHz * (27MHz / 6MHz) = 2 * 594MHz / 6MHz = 198
> >>
> >> Apparently from initialization, the division by zero can not occur :(
> >> (unless I made a mistake here).
> >>
> >> Thank you for reading this far!
> >> Yours sincerely
> >> Josua Mayer
