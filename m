Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97272586716
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 11:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbiHAJwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 05:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiHAJwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 05:52:21 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33793337A
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 02:52:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ss3so19285580ejc.11
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZAqumGKNwXF91ZXOgACEsdGClwf6mBEVt6dtVad95O8=;
        b=EC/C/QVVBUFtef+J7K34rEPiGLdh3lhcNYa2rNF2ojk49gj3uket3Vzn2c2Us+0Dfg
         QEo8lKOvnfoo8OtYddFYX8j+51rrGlRj9qwjHhrKVlFgW4gS8a35VJcDDo0JhOXzfwN9
         wtgyFj5+8Vig4R07fAcR9ondakL0H9Fu8WdRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAqumGKNwXF91ZXOgACEsdGClwf6mBEVt6dtVad95O8=;
        b=r3H19xr541PJU5WRQ2WeDW8GSxvFUYhsMNZh1ByBH2grD6xTtQ4M6X9qIuLcuGu4YH
         QcFYY4lL4vX3FW22LBVbrujyG1pZdoAhlNLEqtibLPBmfYQAtbItCOCtCxjosziIZ3YU
         gk3U+NaL3KUKSm7T+sKVngACFW+yUjnAPMVKsh0mYI6XjyW+5tfg4dfLTvDCQxQHLyk8
         Ijfm+GUgBEHvOxcAOUrm/fcw2J+o/goiO0QC8TlxILFbeDAJNNlusraZtpeiphlODgoT
         ZbCI396LXK7IannquQX+umQGHXBOmgQj4K4ocoSXJy971JMoghN7M3teegeSELlPLLJK
         fljQ==
X-Gm-Message-State: AJIora90eBinCcJDZ7U6iVIbF3uNujdYeLT9tx/LhqG5jExvFTHhKtB2
        MpAzMzytwQX4xUF5jU0pWVttffGmZ0o39Q==
X-Google-Smtp-Source: AGRyM1ugDF/c8RJSGYIaoG4txokdqVETMNFNqB99ylpdzy8aNgomeYpubBL65pwjHASuiEVlaRtyHA==
X-Received: by 2002:a17:906:cc11:b0:72b:458e:5d45 with SMTP id ml17-20020a170906cc1100b0072b458e5d45mr11833006ejb.589.1659347538961;
        Mon, 01 Aug 2022 02:52:18 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7dacd000000b0043cab10f702sm6653492eds.90.2022.08.01.02.52.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 02:52:18 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id f5so6519322eje.3
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 02:52:17 -0700 (PDT)
X-Received: by 2002:a17:906:ef8c:b0:72c:780c:6693 with SMTP id
 ze12-20020a170906ef8c00b0072c780c6693mr11790741ejb.196.1659347537594; Mon, 01
 Aug 2022 02:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMCNdRr8yvnaoKkguYxOeYC+pVj=LcbVzhHLQQmZ6bxuKQom8A@mail.gmail.com>
In-Reply-To: <CAMCNdRr8yvnaoKkguYxOeYC+pVj=LcbVzhHLQQmZ6bxuKQom8A@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 Aug 2022 11:52:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCvRdd6_LLudTkowdJwB8EKZEDitB29VJtfN0GoSuOLGRw@mail.gmail.com>
Message-ID: <CANiDSCvRdd6_LLudTkowdJwB8EKZEDitB29VJtfN0GoSuOLGRw@mail.gmail.com>
Subject: Re: uvcvideo driver support requests
To:     Bruce Liu <rainman59118@gmail.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bruce

The Webcam does not seem to be following the standard and at some
point the driver gives up:


[    6.906419] usb 3-7: Found UVC 1.50 device ACER HD User Facing (0408:4033)
[    6.935011] usb 3-7: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.
[    6.938200] uvcvideo 3-7:1.1: Failed to query (129) UVC probe
control : 26 (exp. 48).
[    6.938208] uvcvideo 3-7:1.1: Failed to initialize the device (-5).

Here you can see that the camera is identified as uvc1.5, which should
return 48 bytes for video_ctrl, but only returns 26, as in uvc1.0


If it works from windows maybe you should be able to record some
traces from windows so you can figure out how they are doing the
probing differently and add a quirk for it.

Regards!

On Sun, 26 Jun 2022 at 19:33, Bruce Liu <rainman59118@gmail.com> wrote:
>
> Hi,
>
>
> I'm on Arch with somehow new model of Acer Aspire 5, A515-57-52NZ to be percise.
>
>
> The webcam failed to work, while it does work under Windows 11 on the
> same box and the (I believe) same condition/setting.
>
>
> There is no hardware killer switch on this model, nor button switch,
> as far as I've checked in and out.
>
>
> $ uname -a
>
> Linux host 5.18.6-hardened1-1-hardened #1 SMP PREEMPT_DYNAMIC Wed, 22
> Jun 2022 19:50:53 +0000x86_64 GNU/Linux
>
>
> the attachment includes lsusb.log and partial dmesg.log
>
>
> hope they would be helpful for you to debug.
>
>
> Also, consider donation, is there direct method or should I just go to
> the Linux Foundation for this? Since somehow,
> https://www.ideasonboard.org/uvc/#introduction has no links to this
> issue?



-- 
Ricardo Ribalda
