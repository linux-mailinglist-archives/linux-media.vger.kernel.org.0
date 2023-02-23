Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9817E6A06C6
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 11:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbjBWKzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 05:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjBWKy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 05:54:58 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F1952DC1
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 02:54:37 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d7so5930940pfu.4
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+u5xMcW4Y2qj7hU/yc7EVZ6q+PSRWjd2qMgYmQ68mA=;
        b=Vqpl6GEDKWLrDiSa4lHIVaPMXIPVvbdvz7WpQ7WUtFG/WgbKoH0TVXJlGIr3w+cvIB
         JPkVKocc9ourApdVdilJ8YbEbUnyIecqbNSoDRXjCvTrMiXeCR6tHQxtPu7oJAbQQT0I
         lkbnKcXxYRWP7oiPpuq6vAtfPpJ7fou65WTc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+u5xMcW4Y2qj7hU/yc7EVZ6q+PSRWjd2qMgYmQ68mA=;
        b=QvhFO7WwUy+7nVDMxByNXm59ZGZEK+CU3QBH7Svwo/sNlzr4kHNpvMFUXXKzsxA+Xx
         1tjfu2cC4SqJBT0pl83bfcZ3ZTHT10aWZv+VRclwB9smQacYM3ChbXpSC6vIgB/pdX1j
         9Ucd098RBoijYTYGk7YkND00K9jqkp/btnxzhC/a5sHXNqpJilwxnTQKi73TsVO7P6/m
         bOo19HfwPgg4Lc1163Ax3wMa8bdhbBFN/FoeKQ5lfovNRUNZOp79B02orWOR+2/gijdu
         uFkJWd8NFtsb0vxRec9CqQZr6ew0xn0Y4DPLukVWc6/H3Oicz5dpHMmEz5HxXazfD1Jc
         928A==
X-Gm-Message-State: AO0yUKV7FbE1Nx6zEE677FyMUQPzVzpSNep8pfKidfyQX5nY6w7kNUxj
        greiOesNeDsO6Jeb/6BGAXTD0AxGanuVnm9d
X-Google-Smtp-Source: AK7set8WCiX0S30gut3q3jOVQjtTfGSggBHsl/1D/OJQXYbPLpuVgfAGy6Lu54/h6Dulza/oZScp1A==
X-Received: by 2002:aa7:9d1c:0:b0:5db:ba06:1825 with SMTP id k28-20020aa79d1c000000b005dbba061825mr1880885pfp.3.1677149673614;
        Thu, 23 Feb 2023 02:54:33 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id 10-20020aa7914a000000b0058bacd6c4e8sm1221310pfi.207.2023.02.23.02.54.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:54:33 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id l15so13466314pls.1
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 02:54:32 -0800 (PST)
X-Received: by 2002:a17:903:2402:b0:19c:9999:e922 with SMTP id
 e2-20020a170903240200b0019c9999e922mr1194063plo.5.1677149672172; Thu, 23 Feb
 2023 02:54:32 -0800 (PST)
MIME-Version: 1.0
References: <83f9ba3c-18bb-e0cd-e5ac-7c3281f2b5f8@willerding.net>
In-Reply-To: <83f9ba3c-18bb-e0cd-e5ac-7c3281f2b5f8@willerding.net>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 23 Feb 2023 11:54:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCvNua4iuisDyp2E-7EZfwDCgx-2hyTK3rmB7HOUB=bszg@mail.gmail.com>
Message-ID: <CANiDSCvNua4iuisDyp2E-7EZfwDCgx-2hyTK3rmB7HOUB=bszg@mail.gmail.com>
Subject: Re: UVC device not yet supported
To:     Lutz <lutz@willerding.net>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lutz

Can you try:
ls -la /dev/video*
and then
v4l2-ctl --all -d /dev/videoX
for all the /dev/video devices that you found?

Thanks!

On Thu, 23 Feb 2023 at 10:34, Lutz <lutz@willerding.net> wrote:
>
> Hi,
>
> just got a Endoskop camera from pearl, very cheap device (12,99=E2=82=AC)=
 and
> connected it to a debian 11.
>
> I'm trying to get a picture or stream from this camera, an came across
> this page:
>
> https://www.ideasonboard.org/uvc/
>
> There is a section you'd like to be notified if a UVC device is not
> listed there.
>
> So this is my motivation to email you :)
>
>
> Device is recogniced and listed in lsusb:
>
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 008: ID 04cf:8819 Myson Century, Inc. USB 2.0 SD/MMC Reade=
r
> ---> Bus 001 Device 009: ID 1908:2311 GEMBIRD Generic UVC 1.00 camera
> [AppoTech AX2311]  <---
> Bus 001 Device 006: ID 05e3:0608 Genesys Logic, Inc. Hub
> Bus 001 Device 004: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controll=
er
> Bus 001 Device 007: ID 046d:c326 Logitech, Inc. Washable Keyboard K310
> Bus 001 Device 005: ID 0557:8021 ATEN International Co., Ltd Hub
> Bus 001 Device 003: ID 0409:005a NEC Corp. HighSpeed Hub
> Bus 001 Device 002: ID 041e:4083 Creative Technology, Ltd Live! Cam
> Socialize [VF0640]
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>
> but no usable video device is created - at least i can not get a picture
> from it.
>
> The Creative Live! Cam does create a stream. I think this problem could
> be solvable by some udev rules?
>
> there is also a hw-probe for my machine:
>
> https://linux-hardware.org/?probe=3D4f19f71811
>
> tia for any hints
>
> lutz willerding
>
>


--=20
Ricardo Ribalda
