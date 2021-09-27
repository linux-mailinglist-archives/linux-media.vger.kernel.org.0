Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEECD41958D
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 15:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhI0N6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 09:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234674AbhI0N6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 09:58:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900FDC061575
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 06:56:52 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so659598wmq.1
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ddKsygl4rYD1iSMOY5R8LGpDXW7t/c1SBtpuguzfrBQ=;
        b=DurDLsfYVm/V9WqmXJOQmzjgt4POwiDmi89wZ1PH1s9svbujCRvZ04LyBz+Kowj1CZ
         AuFJRba0gu8VZBRrTyO/QEBIEoEVmaeGjOM0Z6Yu4rgDKfMNianoy24bCxhZgCB+O9Bm
         VPZsa85BpwqLB62OiBxcmpyYRGJXXsgnpfBsCFyrtyxFkTCxTLJKdvKgiBzpR7dXJn6S
         /rGr9sqCh6djcC9KTQPgRqnfaj2wp2n3g3kZJgg7X2T/IUUaPqm8QcmMpduvNJU7yPYU
         gDCfMiEACm0k1sInPhr3kDpS/adDar3qLzM8r1mn0HRWGEGm5w6XWm/qFB65rP5B4R2+
         OW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ddKsygl4rYD1iSMOY5R8LGpDXW7t/c1SBtpuguzfrBQ=;
        b=Jg5otn2lqSUa+bM1FuxaKQcCWKwfdgSX9XL36pMch+jnIj0Yd/+WcHjSV3W180ki8U
         TlTwcRMxs3n0HlvR6fGdO5hQ3nQdK6uCSh2XKJxXA+QBzMlAATTcXZpUU5om23A9WzV4
         JFcm/nrKtjd/wcWC8tutPebmXAiktmzwLBtMgS7YesxBXZES5MAwYM9Warvhjh4gmWac
         wqJcg2cP9D1Rl6EgMi8LHFrhWS7PxnyfG2ThURBHgVqtKOs+5vhuPUWdKYVuyAShY0Sy
         pih0/LUfFv7Dp6jmjJLN3c4uisPcm/cOppLG7pf/+kaIkRpMGZdn6689eoC82lFf+3gl
         pPsA==
X-Gm-Message-State: AOAM5337qlzRJ2Ut0d/fippWYj9c8SyN5uB2AJj96RkpZtH/k6Z5oUht
        X/mu7d0oQVSQuXatfqCQ5M0SYF2x2hVRFmYNzwUTGg==
X-Google-Smtp-Source: ABdhPJyCWyIpKeMUQc7jQ+ZOqHBIFt6+K80YoGkM6Ipc4i/7kY8wRNbc07rHYD9ih7XKNRtSTFQEnXo5IhQk/lJ3Isg=
X-Received: by 2002:a1c:9a07:: with SMTP id c7mr6545432wme.106.1632751011112;
 Mon, 27 Sep 2021 06:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
 <CAPY8ntB-7g5FigO9rNV4YGWCeHUWkO4v1kp96mW-icGwT-rk9w@mail.gmail.com>
 <a5e73b514299e17008f9e4a233553283ec7a88c9.camel@tq-group.com>
 <CAPY8ntBBxsUgGeFQJO_N1pAgg20bRxJW=t=_ZOhfWp0=MA9uBQ@mail.gmail.com> <4748e83d608727a240b817375fec459649ec02cb.camel@tq-group.com>
In-Reply-To: <4748e83d608727a240b817375fec459649ec02cb.camel@tq-group.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 27 Sep 2021 14:56:36 +0100
Message-ID: <CAPY8ntBHPq8skJ9Dgz2ENsP8vv58nQuOgWooguYi5qZYHcwnYw@mail.gmail.com>
Subject: Re: (EXT) Re: (EXT) Re: Sony IMX290 link frequency
To:     "Stein, Alexander" <Alexander.Stein@tq-group.com>
Cc:     "mani@kernel.org" <mani@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 23 Sept 2021 at 14:44, Stein, Alexander
<Alexander.Stein@tq-group.com> wrote:
>
> Hello Dave,
>
> On Tue, 21 Sept 2021 at 11:41 +0100, Dave Stevenson:
> > Whilst the spec is restricted, there are a few introductions that
> > give
> > a basic understanding, eg [1]
>
> Thanks, this helped a bit.
>
> > Clock lanes and data lanes may do slightly different things. It is
> > not
> > uncommon for the clock lane to remain in HS mode at all times, but
> > the
> > data lanes will almost always drop to LP-11. Device tree has a
> > clock-noncontinuous property to denote that the clock lane drops to
> > LP, which maps to the V4L2 flag V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.
> > There is no mention in the datasheet as to whether IMX290/327
> > produces
> > a continuous clock signal or not, and I can't say that I've checked.
> > Some receivers can get confused if the clock is continuous and they
> > miss the initial state change from LP to HS.
>
> Who drives the clock lane? The sensor or the host processor? If it is
> the sensor how do you support several sensors on the same bus?

The sensor.
With MIPI D-PHY a source (CSI2 or DSI) will always have one clock lane
and one or more data lanes.
Some SoC's allow you to reconfigure how lanes are used, but I've never
known a way to combine multiple sensors into a single CSI-2 receiver.

> > > > > > > I assume now that my current problem regarding settle time is
> > > somewhere
> else. I can currently only assume the escape clock is not correct,
> > > but
> there is pretty much no documentation at all on that topic.
> >
> > What platform are you working with?
>
> I'm working on an i.MX8QM based board. A public RM is available since
> several days [1]. The MIPI-CSI subsystem chapters are a bit lacking.
> Also I am aware that the ISI does some strange things with CSI input,
> see also [1], but that is a different issue.
>
> As far as I understand different documents, the escape clock is used
> during LP-11 and shall be from 10 to 20 MHz.
> The device tree configures some clock to 72MHz [2], but I do not know
> what's happening internally.
>
> I used the same approach for calculating the settle time as [3]. But I
> have to use a value slightly below the maximum rather than the average

I don't know the details of iMX8.
For BCM283x we supply an LP clock of 100MHz, and indeed that clocks
the block state machine for handling LP state transitions. LP mode is
relatively low speed in comparison to that - typically 10-20MHz if
memory serves correctly.

I vaguely remember one of the SoCs being very fussy about when the
sensor is left at LP-11. Looking at history, that appears to be
Renesas, but may apply to iMX8.
The IMX290 datasheet implies that the sensor will exit ULPS (LP-00)
state 20usecs after XCLR goes high, and remain in LP-11 standby mode
is cancelled (the clock lane then enters HS mode).

  Dave

> > There are registers in the IMX290/327 which configure the MIPI
> > timings
> > - 0x3445-0x3455. The values do differ based on the link frequency,
> > but
> > checking our driver to the datasheet they appear to be all correct.
>
> Agreed.
>
> [1] https://www.nxp.com/docs/en/reference-manual/IMX8QMRM.pdf
> [2]
> https://yhbt.net/lore/all/20200226151431.GY5379@paasikivi.fi.intel.com/T/
>
> [3]
> https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot=
/dts/freescale/imx8-ss-img.dtsi?h=3Dlf-5.10.y#n516
>
> [4]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/staging/media/imx/imx8mq-mipi-csi2.c#n343
>
> --
> Mit freundlichen Gr=C3=BC=C3=9Fen
>
> i.A. Alexander Stein
> Entwicklung Standort
> Chemnitz
> Tel. +49 371 433151-0, Fax +49 371 433151-22
> Zwickauer Stra=C3=9Fe
> 173, 09116 Chemnitz
> mailto: Alexander.Stein@tq-group.com
>
> TQ-Systems GmbH
> M=C3=BChlstra=C3=9Fe 2, Gut Delling, 82229 Seefeld
> Amtsgericht M=C3=BCnchen, HRB 105018
> Sitz der Gesellschaft: Seefeld
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> www.tq-group.com
