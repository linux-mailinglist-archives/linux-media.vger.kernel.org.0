Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF894DCCE1
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 18:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236864AbiCQRtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 13:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237121AbiCQRtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 13:49:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3096721C056
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 10:47:21 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bi12so12348504ejb.3
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=t84kKey6q9c30GJfdMOQiMBmiwH5qhCjtQRjgI8B4W4=;
        b=IEFHehIWj07FfKoA2zr2Jb7tw4Qvjic4zuiFDxNMexn6Uitbm5H0Jmiy3rvte0L4Bg
         Mlraokic0slMZ+xT1AjRoHgWjEpYdw0VjiPfzfY8ldjOnilRKOXsKsy1W7MJFyP6dkrH
         8LfQWYapEu3vmhgMl4cQe+0M7rtaLyVLUkj9OHOz3BEWbBdWtZ9smE6cOMBmufOpifty
         xRi9sx1WiiokAynPZuTSOhS7Idzd9LY1KiSfusfqmt9OsSUJYmNfo2qKXxT2LeoIf8Fg
         pcPLvvU/6lYJtOuuYoHnJaHbu16QZIJPH9vRuyYR9RvT0EI3ihBoAkxt4hZm293t1Hh1
         5ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=t84kKey6q9c30GJfdMOQiMBmiwH5qhCjtQRjgI8B4W4=;
        b=5Snd/j8scmsxLamRUlPOYVABQ9PFwqBxtSZUenCPdIZSEt8xg/RbgpURGgu6TmbZ1y
         RKprH9aaWYIhlVg3/HdmeWcVLxsQSC9QAI6uCJ5Jrfuk5575HpB732ohAciSwG9T4L4o
         Vr2L8pAF3NG98847VfJSKRme986FFbQhLrdwsS1uEvYZH/soGnC5daZcaGBgv0uiIx7+
         d8cx3hhNwKavHxQqyW0Hi3e8ni9tajbZJ6y0ppRTpDsOZzos2KeiYYEmdCWYxocUhZUt
         rMH/6r/3Z46NMX3XlZzgGyhquNOMskD0x5ockPRQm0Di8LCDMtjakiGMLi8QBDVRpKn7
         2trg==
X-Gm-Message-State: AOAM5301xKtvm6C4HTnOoxGymxeMSugcLuhOdBpaHKWPJ19UvutEHiwf
        QO5ng6XhExaoHvf7fdBLrba0hpAgrDX62r0UBIcwGIJJ97YjBg==
X-Google-Smtp-Source: ABdhPJyH92j/aLbOSrdG3dH30aOlaIBsmwDJRqXEuCLsMexiTBfaZTw6jUMfTKUjkGwKWUq7SQKI/O0fsJjBuH6sZ0w=
X-Received: by 2002:a17:907:2d89:b0:6db:b83d:f93 with SMTP id
 gt9-20020a1709072d8900b006dbb83d0f93mr5481267ejc.742.1647539239420; Thu, 17
 Mar 2022 10:47:19 -0700 (PDT)
MIME-Version: 1.0
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 17 Mar 2022 17:47:03 +0000
Message-ID: <CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com>
Subject: Using the Selection API with image sensors for arbitrary cropping
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

Hi All

I'm trying to tally the selection API documentation for image sensors
with implementing it in practice, specifically over arbitrary cropping
on the sensor.

I've had a downstream PR for IMX219 that adds support for the
selection API to allow arbitrary cropping and selection of binning
mode [1].

The docs for "Writing camera sensor drivers" [2] lists the two options
as either freely configurable via multiple subdevices, or register
based. It doesn't apparently cover just cropping (there is no scaler
on IMX219), but there is the IMX274 driver that implements setting the
sensor cropping via the selection API [3].

The current IMX219 register-based modes are
- 3280x2464 up to 15fps
- 1920x1080 up to 30fps as a crop of the 3280x2464 mode
- 1640x1232 up to 40fps, 2x2 binned
- 640x480 up to 200fps, "special" 2x2 binning and cropped.

The main issue is that implementing the selection API reduces the
number of modes that can be selected directly via set_fmt to the base
3280x2464 and 1640x1232. Surely that constitutes a regression as use
cases that did work now don't, and therefore it is not acceptable.
3280x2464 can't run at 30fps, therefore we can't easily get a 1080p30
source without additional knowledge of modes and crop settings.

So how should the selection API be implemented without introducing regressions?
Is it permitted to enumerate the extra modes as before and have them
update the crop rectangle? The docs [4] say not:
"Drivers shall set the active crop rectangle to the default when the
driver is first loaded, but not later."
which leaves a bit of a quandry.

If we do drop the existing modes it just pushes the problem of which
modes to select onto the client. Most likely you end up with an
extended sensor specific helper in libcamera with a list of modes and
the framerates that each can achieve, pretty much identical to the
list of modes in the kernel at present.
Any other clients are forced to jump through similar hoops (unlikely
to happen), or we rename it to Video 4 Libcamera 2 ;-)

Making that shift also means that selecting the special binning mode
has to be done via some other heuristics. AIUI it's optimised for high
frame rates so that's possible (but not nice).

Guidance sought please.

Thanks
  Dave

[1] https://github.com/raspberrypi/linux/pull/4935
[2] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#frame-size
[3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx274.c
[4] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/selection-api-configuration.html#configuration-of-video-capture
