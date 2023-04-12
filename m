Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8FC56DF92E
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 16:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjDLO6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 10:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjDLO6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 10:58:06 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00A26A6B
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 07:57:58 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id c3so12724212pjg.1
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1681311478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOKR8Lz3kBZgqVb/OenB7evT3Akr/P4smMGFj0QIOY8=;
        b=gZvmIjIEHDpRGgNSyhQ86rTPD+s4DrasSAXS0wE4CxImy3hlC1GyTaX3hxe87HTAX8
         GWce9VJXYwEAst7g78JCbzm1FQu3ZpLHp7LmJaECJRb0pZXo5uaEU8IC2Okvj7RFBO4q
         9wHOifzkmuk+nF27ibKh7XbThNjfWtyENGJn1aotJlwh1NoshhYMzLyv36fefKLtSM9n
         NIvhkdhmGwG9qajhB1YJK662myTyO2g+9FVhNjFpT1ZIw34IdTrDCuC75g7E3IEh4h+J
         uvvVM3j2+uIlhH4+yPHC7PKtXi9YDa0TqGnqlc8KmL1Eazy81vrGTXQa6hr4kXES/GLP
         biXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681311478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOKR8Lz3kBZgqVb/OenB7evT3Akr/P4smMGFj0QIOY8=;
        b=ZMJGPXymhI3hfcP3YwApakLnmKx232TSNa+MMCxo9t6BU3Gx/T5+RwtytpGb1egYzg
         aN9Gr83iOJiCYLzg6kO9o6qOAEkjhXZKMZiyevx5KCVv4WObVcR0ZZxCBJZ0jesGNT9z
         p5QlH3y6hVh+5ar0C1s1Cp1A+njgYhriLROxz7zut9Dernb8vnAJNSbT7g7WwJYH1k7l
         7teXS2LpAmIm8VDc7xClXMrgl7WviChNwebXCa856JFFQjgSrJRd8CgchAULSt7XJnYN
         Ka3/qhylwY1H0+FTWOytawM3EcuNlvePNFnEZlClzSx8iQiCBN+qTvp+yx17DrN1jbOP
         uJGg==
X-Gm-Message-State: AAQBX9f12yPsbUf0AqwmjrRQMsbHshEEc2Ixdir6uyECfC78gpyjv/2q
        xafGaRQ2Gk5r9v7w//ePkdk54ol2Wyrto9w76Ed6CQ==
X-Google-Smtp-Source: AKy350ZYD4NP8Wfaf7X1KUVN//Ob7xD0plHgJWTtVpg6jEykpInoOJhi1zGs4U5cVd7hDRTQAlbAB90k5Pd68UX4I/M=
X-Received: by 2002:a17:90a:ae07:b0:246:7023:2ee6 with SMTP id
 t7-20020a17090aae0700b0024670232ee6mr2275329pjq.8.1681311477987; Wed, 12 Apr
 2023 07:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230406-feature-controls-lens-v1-0-543189a680de@wolfvision.net>
 <20230406-feature-controls-lens-v1-1-543189a680de@wolfvision.net>
 <CAPY8ntArOOqPQzvkJrQEyuVFfb6j8x6WODTMHOn1qHPU588mbQ@mail.gmail.com>
 <0f1baf5e-2ff6-e10b-5c3e-0a82c71d0ce6@wolfvision.net> <CAPY8ntAjBEFfeV6nnQs34Y22QM-irT13ALDv4ksP8AYK=jWsKg@mail.gmail.com>
 <3ab7bfc4-aaae-2e39-b420-40ad8d71dda4@wolfvision.net> <ZDaa+qhoZxZ5ymxL@kekkonen.localdomain>
 <8fe5c9c5-6eb0-86ae-9e5d-fbaa72be25fe@wolfvision.net> <ZDaemghP0HQSw3Fo@kekkonen.localdomain>
 <77d91964-de0a-8bd4-12d9-bc16110cfa7c@wolfvision.net> <ZDbChgZJHVaaX3/x@kekkonen.localdomain>
In-Reply-To: <ZDbChgZJHVaaX3/x@kekkonen.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 12 Apr 2023 15:57:41 +0100
Message-ID: <CAPY8ntCH7JGoKhF2igXUb1WKQgq+rppVjcqUds=oz-TOzL8uWg@mail.gmail.com>
Subject: Re: [libcamera-devel] [PATCH RFC 1/4] media: v4l2-ctrls: add lens
 group status controls for zoom and focus
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Michael Riesch <michael.riesch@wolfvision.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Riesch via B4 Relay 
        <devnull+michael.riesch.wolfvision.net@kernel.org>,
        linux-kernel@vger.kernel.org,
        Matthias Fend <Matthias.Fend@wolfvision.net>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, 12 Apr 2023 at 15:39, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Michael,
>
> On Wed, Apr 12, 2023 at 03:43:26PM +0200, Michael Riesch wrote:
> > Hi Sakari,
> >
> > On 4/12/23 14:05, Sakari Ailus wrote:
> > > Hi Michael,
> > >
> > > On Wed, Apr 12, 2023 at 01:57:36PM +0200, Michael Riesch wrote:
> > >> Hi Sakari,
> > >>
> > >> On 4/12/23 13:50, Sakari Ailus wrote:
> > >>> Hi Michael,
> > >>>
> > >>> On Wed, Apr 12, 2023 at 10:00:26AM +0200, Michael Riesch wrote:
> > >>>>  - Different controls: If moving = (V4L2_CID_FOCUS_ABSOLUTE == current),
> > >>>>    then what happens if the application performs a
> > >>>>    V4L2_CID_FOCUS_RELATIVE with -3? current should reach 39,
> > >>>>    V4L2_CID_FOCUS_ABSOLUTE is still at 42, the lens is still moving from
> > >>>>    the application's point of view.
> > >>>
> > >>> Would there be a reason to implement both of these controls in a single
> > >>> driver? AFAIU, the relative one should be used if there absolute value
> > >>> isn't known to the driver.
> > >>
> > >> Probably not, but on the other hand there is nothing the prevents a
> > >> driver developer from doing so, right? Point is that should there be a
> > >> driver which does implement both controls, we are in trouble AFAIU.
> > >
> > > I think the documentation should be improved in this regard.
> >
> > The documentation of which control exactly? And what items should be added?
>
> Both V4L2_CID_FOCUS_ABSOLUTE and V4L2_CID_FOCUS_RELATIVE. For the former,
> the sentence "Positive values set the focus closer to the camera, negative
> values towards infinity." doesn't make much sense in the context. For the
> latter, what I mentioned earlier, i.e. this should be only implemented if
> the absolute value isn't known. It's not a driver's job to do simple
> arithmetics for the user space.
>
> In fact, it appears that no driver is using V4L2_CID_FOCUS_RELATIVE at the
> moment. So we could as well deprecate it (or remove from documentation
> altogether).

Atomisp and ov5693 are using it, but only to manipulate the value
behind V4L2_CID_FOCUS_ABSOLUTE. I don't know why elixir.bootlin.com
isn't picking up those references.

https://github.com/torvalds/linux/blob/master/drivers/staging/media/atomisp/pci/atomisp_ioctl.c#L1766
https://github.com/torvalds/linux/blob/master/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c#L966

  Dave
