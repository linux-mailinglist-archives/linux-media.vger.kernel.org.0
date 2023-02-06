Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E8168C22C
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 16:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjBFPt7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 10:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjBFPts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 10:49:48 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902BB59EF
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 07:49:30 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id v26so5319443vsk.8
        for <linux-media@vger.kernel.org>; Mon, 06 Feb 2023 07:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2G21nUe2Pc+kXBE66nwyv3o9RYUcgdmfhu1nz1czlF8=;
        b=LmZbku3ckvok8br5EvbZ8SIPp3FoJ6V6FnNvZPzw2bs2MA4+Q4rSDQaxBI79iN7BkK
         3o4ivwfz337gmaOyGywHaV2imbbhH04TPWprwHdVVkUhIeKMqyyMky/pfi6BAjnTVlPm
         9eek5ZYDcg5lrf+OJH7A6mncjOh89nHqs9+NsfuTuHniWroKW9/+rJOCVYMl6myjdqa6
         zm5tbdoAwiUpVx+8vEPdpZf803T2t1IduSvnmNcFe6du3EiJtrWwiBGEI6O1Y2bKHcL6
         35HWhLmTie9ERPfklp6jae0QAxlmbEK/KF5cAXBpj4asB1cIBn9fwyJwphQsLFY+TC0z
         dX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2G21nUe2Pc+kXBE66nwyv3o9RYUcgdmfhu1nz1czlF8=;
        b=ki84idWubJ7GTV2F+guv8Ozw5giSgDfVnHcQ5LXR7zsMQ14AU5LBXp1aR9Y8slOW6m
         ua2wo6tH0X2KWfyQL/D3OBikPOANZHFPAXuyRmwzvfCk1bLalrjqWqUyu9Ui5AGmJS18
         jNnAm/QO6FOwUDpNryZnaZ3P4j4FGJhgGcvMNCqoH1Z070aUpjWMQqekgaBryRmCQ6T3
         DZLb0mCnZNSyfViB930X9kGVB8mrTvjtU9FUndITvvTrPQh+/BCueDXhn86uFSwqy3Op
         AMg2bDaMdcpP5+LTCyUqN97w4Z1OqqFIB7gDl2MlA0CQUQdXvllekZwmM1jXg3DLCpEm
         vuLg==
X-Gm-Message-State: AO0yUKVTtIWyVEYwQH87WNGgX5AZMiipEQ64AjKvSSnlH97bLv7SNADQ
        c++yvY3upAB/8Rm4NHQvdv7k17D2BamboIyFwkpvcA==
X-Google-Smtp-Source: AK7set9mctxUp4fr0RSFM4Yp7Hqo4Ek6rCZ8oHPlaTTZuFPVc5P5w0zeBbAnkb5cwPPixrhEDP7alaIHmzmussaPpfU=
X-Received: by 2002:a05:6102:6c6:b0:3f8:26c3:2f10 with SMTP id
 m6-20020a05610206c600b003f826c32f10mr37338vsg.23.1675698569683; Mon, 06 Feb
 2023 07:49:29 -0800 (PST)
MIME-Version: 1.0
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com> <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
In-Reply-To: <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 6 Feb 2023 15:49:14 +0000
Message-ID: <CAPY8ntBC13b08wfFEV6wvbJWukMug_6mZ6H=c5dZOT5kdzstXw@mail.gmail.com>
Subject: Re: Capture image from imx219 sensor on i.MX8MM
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder

On Mon, 6 Feb 2023 at 15:41, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Laurent,
>
> On 06.02.23 16:31, Laurent Pinchart wrote:
> > Hi Frieder,
> >
> > On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote:
> >> Hi,
> >>
> >> I'm trying to get a camera stream on our i.MX8MM board up and running
> >> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.
> >>
> >> I basically copied the devicetree setup from Tim's overlay at
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.
> >>
> >> With all the drivers enabled the devices (imx219, imx7-media-csi,
> >> imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
> >> /dev/media0.
> >>
> >> For the v4l subdevices I would expect to see one for the sensor and one
> >> for the CSI bridge. But only the latter is there (see below).
> >>
> >> Is this correct? Am I missing something? How can I setup/enable the
> >> pipeline/stream?
> >
> > Your expectations are correct, but the result isn't. You should see the
> > camera sensor in the media graph. Has the imx219 been probed by the
> > driver ? Did probe succeed ?
>
> Yes, the imx219_probe() works just fine and returns with code 0. I also
> see v4l2_async_register_subdev_sensor() and the underlying code being
> called.
>
> So I really don't understand why I'm missing the sensor subdev. Any
> ideas how to continue debugging?

It'd be worth checking
/sys/kernel/debug/v4l2-async/pending_async_subdevices to see if the
v4l2_async framework is waiting on any (sub)devices.

  Dave
