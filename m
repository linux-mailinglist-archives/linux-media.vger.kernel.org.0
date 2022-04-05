Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7514F3E15
	for <lists+linux-media@lfdr.de>; Tue,  5 Apr 2022 22:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238101AbiDENxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 09:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384317AbiDEM1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 08:27:20 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8DA99
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 04:38:13 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id f18so9483129edc.5
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6JLpVcxofI6oB2gdwY+slL4oSMNj7C+1tF77lvvNOuY=;
        b=IEuB3qg6Z4b4CSzr0a1/gMyvwj6CyUEQxTDm9y/dbw/ecuH8TRakvtaYROS84gV/7x
         fS2pPba7duPKICWesPTYJKg58hHdOY7Rh/iz8S91SjP7BcRCxPiFGL7512GwG6ix0L2K
         vhg1t2JOY7n3pG1Sjs7kLNHXS0i1OQd7zPLpjWRFJUm2ygHgsGu/A+HGuKogi40Sz7ci
         G2YrEU4UwtrFEMlppqyCPr2la9c3B9G1Lm90Uh42NW8cUJ+tfBXLEv2jl0oQE7SjOjGg
         8jgadj0Ln6IunmP7TpRcHsreTGW5zjTr0KSAHain1N90P94NGF+Z7al3cs5Vv2pQSBEe
         ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6JLpVcxofI6oB2gdwY+slL4oSMNj7C+1tF77lvvNOuY=;
        b=Sp9ty5NXLY6SEzro8yZznkQh+EOjwXpIdCk73yLt8BM/flvq3U7AjvHEimWU6L3+C8
         p+PQZwi4KgPm4Kx35hpFtArUGGE0Rj0wL8k6SJa6YzyRifjvpO3UXOH9S7HZEIpY5klv
         cRKl8Md1Vn8DOVLafnl53GSZxDjYynDyrbojUawhogCIwHHQH/KcuMNcl2+7vrgPNHNp
         it570/m6XEgcSPCjqbUwA2i3oSJlWOLntJBe7AtY+tNA2smMmEdAou0wuqR15Xivlzhb
         gDPDFoDWJNOHXRaHC9BpvN7si5bGVazQ+Iet82jkaR4EIUsddVkYjXNfAZ42ZLIafF0Y
         8DvA==
X-Gm-Message-State: AOAM533NMM9WbHbhDxZmh32+YWHQa8AvCn/Q8myJ1DqM0g4HHxN+bMyd
        1WAPijuG1++nxowJ9lwIa5Y1CicEW1GfarF2RxDIHpGM4zU=
X-Google-Smtp-Source: ABdhPJyYa65ieZLpENjeCWFh+CV/SZgHg8buAM1K//ARtELPlmczqToPzBuKhzcg2ezt2lD/UvQxEOl7PZjErdwzGXg=
X-Received: by 2002:aa7:c307:0:b0:41c:d381:d60e with SMTP id
 l7-20020aa7c307000000b0041cd381d60emr3131453edq.184.1649158692135; Tue, 05
 Apr 2022 04:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com>
In-Reply-To: <CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 5 Apr 2022 12:37:56 +0100
Message-ID: <CAPY8ntD6GZJ0oCDe1fQ8Pf+X+nY3nB0RcrAX-JxTiO0QiTUVPg@mail.gmail.com>
Subject: Re: Using the Selection API with image sensors for arbitrary cropping
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Mar 2022 at 17:47, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi All
>
> I'm trying to tally the selection API documentation for image sensors
> with implementing it in practice, specifically over arbitrary cropping
> on the sensor.
>
> I've had a downstream PR for IMX219 that adds support for the
> selection API to allow arbitrary cropping and selection of binning
> mode [1].
>
> The docs for "Writing camera sensor drivers" [2] lists the two options
> as either freely configurable via multiple subdevices, or register
> based. It doesn't apparently cover just cropping (there is no scaler
> on IMX219), but there is the IMX274 driver that implements setting the
> sensor cropping via the selection API [3].
>
> The current IMX219 register-based modes are
> - 3280x2464 up to 15fps
> - 1920x1080 up to 30fps as a crop of the 3280x2464 mode
> - 1640x1232 up to 40fps, 2x2 binned
> - 640x480 up to 200fps, "special" 2x2 binning and cropped.
>
> The main issue is that implementing the selection API reduces the
> number of modes that can be selected directly via set_fmt to the base
> 3280x2464 and 1640x1232. Surely that constitutes a regression as use
> cases that did work now don't, and therefore it is not acceptable.
> 3280x2464 can't run at 30fps, therefore we can't easily get a 1080p30
> source without additional knowledge of modes and crop settings.
>
> So how should the selection API be implemented without introducing regressions?
> Is it permitted to enumerate the extra modes as before and have them
> update the crop rectangle? The docs [4] say not:
> "Drivers shall set the active crop rectangle to the default when the
> driver is first loaded, but not later."
> which leaves a bit of a quandry.
>
> If we do drop the existing modes it just pushes the problem of which
> modes to select onto the client. Most likely you end up with an
> extended sensor specific helper in libcamera with a list of modes and
> the framerates that each can achieve, pretty much identical to the
> list of modes in the kernel at present.
> Any other clients are forced to jump through similar hoops (unlikely
> to happen), or we rename it to Video 4 Libcamera 2 ;-)
>
> Making that shift also means that selecting the special binning mode
> has to be done via some other heuristics. AIUI it's optimised for high
> frame rates so that's possible (but not nice).
>
> Guidance sought please.

A gentle ping on this.

At present I'm going to ignore the spec and allow setting the format
to update the crop. That way we retain the modes and avoid regression,
but allow those who wish to set an arbitrary selection to do so.

  Dave

> Thanks
>   Dave
>
> [1] https://github.com/raspberrypi/linux/pull/4935
> [2] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#frame-size
> [3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx274.c
> [4] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/selection-api-configuration.html#configuration-of-video-capture
