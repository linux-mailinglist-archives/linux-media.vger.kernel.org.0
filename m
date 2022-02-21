Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF55E4BE8C0
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355236AbiBUKm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 05:42:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355210AbiBUKkL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 05:40:11 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C7FFE8
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 02:02:10 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id q17so28294915edd.4
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=87MgiKMEjofEVclsG1LJkunQMU/rcU1Ij90lMQ4nmGM=;
        b=EyTOXm+6kLZrURGRLFDscvBqNusXqLDzx/+DnnbcFO28H2MtDbnwJensazoO32Qi5S
         V737xBXB+5VZofUGW9ZAlgpYiwSNuhvXGiVMI9VGO467n0ChBBPBU24I+Lt0Q6xM/qWQ
         tZfchd8emXSUi4JA5ryYX4rGdLRlKYK/cq0Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=87MgiKMEjofEVclsG1LJkunQMU/rcU1Ij90lMQ4nmGM=;
        b=DLe/Oi3oHUyrZN29KT96wXYi3pJySx0HZxC3paEbFNxXPM7udgXrR5LqOygFibdAgU
         2M+JHgPuWEOgpLDolkv3GNz5Bdirdkk8oyrjvcdvXdCxjfk8dfoAEMOyntUnk0eTC1TH
         WHL9aXXYEzZmsJOvzSMBcNXA2Gj0tbq1Z79/HUtiWCPuUgD9As9z9Ub5mUdwjNW0YjC7
         GPaIIccHZLnmbMHnd/TVDqUK1vBS8c+2t6JaazAoJdpoV/KqofLU9q4UTFgoEMspiHs4
         dGDeBWNH1olkari6AwV54Svn66oMXBNZacWrn00NHJlTubIfklc5VjWPl6trWgsTMZpD
         TRtQ==
X-Gm-Message-State: AOAM533COsgs8qTBr/pVXnuNQdYoSOnCr2qO17dibF3Y0WOghgMZ987Q
        y456TDxIEwMKyGjZU+5uH1zrhLzmyLiInw==
X-Google-Smtp-Source: ABdhPJyxK2vGN3b98N3Niag+d0AEYXhF1v3UDxVCGc1R1x5LQnEFLHrQjG6A3javetF5/Bockyh+nA==
X-Received: by 2002:a05:6402:5194:b0:409:97ec:3bdc with SMTP id q20-20020a056402519400b0040997ec3bdcmr20762636edd.314.1645437729121;
        Mon, 21 Feb 2022 02:02:09 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id hs25sm5001744ejc.172.2022.02.21.02.02.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 02:02:08 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id m3so22196417eda.10
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 02:02:08 -0800 (PST)
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id
 x1-20020aa7cd81000000b00410d64eaa31mr20476916edv.167.1645437728253; Mon, 21
 Feb 2022 02:02:08 -0800 (PST)
MIME-Version: 1.0
References: <33efe80e-9667-ffd0-49cc-541ebd9ff586@freezy.cz>
In-Reply-To: <33efe80e-9667-ffd0-49cc-541ebd9ff586@freezy.cz>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 21 Feb 2022 11:01:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCvGbKkMGObSr1Wp_8YzSgLCusQG0m-24CgmOe3X6tFCuw@mail.gmail.com>
Message-ID: <CANiDSCvGbKkMGObSr1Wp_8YzSgLCusQG0m-24CgmOe3X6tFCuw@mail.gmail.com>
Subject: Re: hikvision ds-u12 webcam problem
To:     Freezy <freezy@freezy.cz>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_SBL_A autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Freezy

These are definitely not normal:

[67751.358425] usb 1-8.1: 3:1: cannot get freq at ep 0x89
[67757.849828] usb 1-8.1: 3:1: cannot set freq 16000 to ep 0x89
[67762.966807] usb 1-8.1: 3:0: usb_set_interface failed (-110)

Can you try using a powered usb hub? Just to make sure that there is a
difference?

Also share the whole dmesg, with and without the quirk

Thanks!

On Sun, 20 Feb 2022 at 10:13, Freezy <freezy@freezy.cz> wrote:
>
> hi, i bought this webcam
> https://www.hikvision.com/en/products/Turbo-HD-Products/Turbo-HD-Cameras/webcam-series/ds-u12/
> and after connecting, camera does not work at all, is needed to rmmod
> uvcvideo and then modprobe uvcvideo quirks=0x100 trace=1, after this
> camera works sometimes ..  mostly is needed to do rmmod and modprobe few
> times and then camera works, probably some bug in driver or udev? btw
> tested on windows 10 and camera works fine ..
>
> attached files: dmesg.log (related dmesg messages), lsusb.log (lsusb
> info about webcam) and system.log (info about system, v4l-utils and
> uvcvideo module)
>
> thanks for your help, Dave



-- 
Ricardo Ribalda
