Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0706361369E
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 13:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiJaMlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 08:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiJaMlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 08:41:15 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169E2F58B
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 05:41:13 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 21so17259680edv.3
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdiANJE0ws6uQizNqL6WIvrjCdWtVkVZLgstNpYjryA=;
        b=W6ihpTAX5nMdEHzmPiE7ywSxpQAz7oJeJxy8wccE7fZuutDHxAbjjbkDlInue9UFkY
         y0g5ieiA1LKTQKUlCfX2W06H3WEKzArpJL9nbkeg0xaYva/RpQuE4xEwBmJxs7kk2H6d
         01YmLZfX4kmVVpGy4bVYMjIz0S05On49WO92fJZ93iwNasPB0U9O3bkA56kUkcbIM99o
         oa43A9VWqT4MuE6lZTqFi++QR5z2NKZMKxDYwyZiQzhHoh0e6J+jOoe8mSkx9deUJ2KA
         ASsXRM/MDD2upFxa79ORin/6EVEys9nsS/FePAZTHa7GuB+oMUWH9aqta/uMyVVaOCg0
         U2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdiANJE0ws6uQizNqL6WIvrjCdWtVkVZLgstNpYjryA=;
        b=g21+gMUXjcQxZywnomRijhAL7J5q/f+U6Gy2RjFJGTiQS8AGhARWs7e/c4UAFFFM52
         V0mkv5WNj+7cKCoQ6Qnt8IyRXwn6hsTu48EbLXAp8H606B58LPnC+bLEEpF5wvpWTjMi
         NRYYBuTeG/s8Fr2FDGoyjStx9OZnpPIcaHffxQ0hLNq7Jadh506NEWLQkfCaWZnKpLKh
         /19sDTuIm42WfUlzUu8fsqP198bemDOTrmyDDXXRJbejcS2/IUhKe/dWmxlgQqExomQk
         G6eP1LsFgBRvhvU4QeQ7YZLTuWvUE8AH4GbeVgCmp/pL/rRj2KmImojrSgQhKMV1FXbk
         Ovjg==
X-Gm-Message-State: ACrzQf3sukhmyjRgsZK4n+VjGsRfDQu//beABUoGWxukTiKHdPyFQsoZ
        VryT2RxGABYZz4iyeA1t09Ikp5DDBdeu3v/qpYv41g==
X-Google-Smtp-Source: AMsMyM59H6J4TStmeh+vkueoqgNhQYoTwB5vBgUDBsIE5ZhmmP9x8SzylbBk5/nsZ/qXLKf2bDhSYKWFleTErjdf/ts=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr13108742edb.86.1667220071638; Mon, 31
 Oct 2022 05:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntAO2UP669Ycfgz5sDfgSakgGCpy+JodQ=0kP3gLSSRDRw@mail.gmail.com>
 <ef887aa3-930b-4a35-8796-fee1a836538c@xs4all.nl>
In-Reply-To: <ef887aa3-930b-4a35-8796-fee1a836538c@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 31 Oct 2022 12:40:56 +0000
Message-ID: <CAPY8ntBwMUO-qbkxGYfegKum8=UJBpdMwCDutgKpS64_v5UHxA@mail.gmail.com>
Subject: Re: V4L2_SUBDEV_FL_HAS_EVENTS and (un)subscribe_event for subdevice drivers
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, 31 Oct 2022 at 12:36, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Dave,
>
> On 31/10/2022 13:27, Dave Stevenson wrote:
> > Hi Hans & Sakari
> >
> > A question raised from review of [1]:
> >
> > Is it correct that any subdevice driver that supports any controls
> > should advertise V4L2_SUBDEV_FL_HAS_EVENTS and have
> > subscribe_event/unsubscribe_event core_ops?
> >
> > I added that patch for ov9282 to resolve a v4l2-compliance failure:
> > fail: v4l2-test-controls.cpp(835): subscribe event for control 'User
> > Controls' failed
> > test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> > but it surprised Jacopo, and he has observed that many of the current
> > drivers with controls don't meet this requirement.
> >
> > I just wanted confirmation from those in the know.
>
> It should only be needed if V4L2_SUBDEV_FL_HAS_DEVNODE is also set in the
> subdev driver. If HAS_DEVNODE is set, and there are controls, then HAS_EVENTS
> must be set and you have to be able to (un)subscribe to events.
>
> Because the controls can be exposed to userspace via a v4l-subdevX device, and
> userspace has to be able to subscribe to control events so that it is
> notified when the control changes value.
>
> The compliance testing of v4l-subdev devices isn't that old, so a lot of older
> subdev drivers where never checked for compliance.

Thanks for the swift response - I'm glad I'm not going crazy then :-)

  Dave.

> Regards,
>
>         Hans
>
> >
> > Thanks
> >   Dave
> >
> > [1] https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-17-dave.stevenson@raspberrypi.com/
>
