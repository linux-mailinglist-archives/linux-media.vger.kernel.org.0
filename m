Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137A065375E
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 21:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbiLUUKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 15:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiLUUJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 15:09:55 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30B02714B
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 12:09:50 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3499298pje.5
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 12:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pw0+wBstiHP2EE4rzaziK0FTUgpzsqYfOov5TXlNIvw=;
        b=ISsl0RH0nYZPzByNA1e9RVKnAvZa2N6c/MZMZin7O8c9ny7e9nPFgrIV+k2jIwp6fe
         DPNxWyMYWdk5+fFtq54FF2kdCzhvowmTxPwxmXs1i0t3lphZubtUcyn+kWTsAdCBcbin
         oWmmGRZfwJu9Js94IczNPEyS56vurwvaxs3rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw0+wBstiHP2EE4rzaziK0FTUgpzsqYfOov5TXlNIvw=;
        b=wLIXXpVUvkrkS5y29AB42mnseqFy3z5L/ymjL0wM1rUfYYoBXjZjmxFrcbEL2+d2SJ
         9mQxKoiCGjYDlV/uEA3GGpjY80KtJf4CjotKCNV4H+cet2V2x/6unOZ/tVQDtyfguBr7
         tKkXKnN89s+2Ih/q9I6U+Jdi8xcYjl9IExEaxDNfeYowdYh5K8HI9PI6o2PcWFQHETQl
         nG17IYAs2EHvZY+L+ZgQmcIsrjcfV5XOcoCmqOvS80iHO0J16AaeZGaOHZkOQqivNPcb
         iPezi0OhaNuSaM1LBYfelJg/pZvlPeVISeZhV8rk/b6tGkfowYhONeMPAT8A+pwf6/+K
         /dKA==
X-Gm-Message-State: AFqh2krswztkNHEMhLX2aReEFgecKQrmHuix/tRocA+8sY/7UDMPWQFw
        GKwa3FTyJzLLJLLP15/lSUlRziz49xJNxFtWyuk=
X-Google-Smtp-Source: AMrXdXt0DF8DqgOR2rGlR8i9i3yf6qEn8l4ULa05DQhjjUqgYJkrIOpqkLlD5AokphhKG4WPZzLY5g==
X-Received: by 2002:a05:6a20:158b:b0:af:7b32:4deb with SMTP id h11-20020a056a20158b00b000af7b324debmr5440912pzj.4.1671653389956;
        Wed, 21 Dec 2022 12:09:49 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id x19-20020a17090300d300b00177f4ef7970sm11859819plc.11.2022.12.21.12.09.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 12:09:49 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id n3so11444461pfq.10
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 12:09:49 -0800 (PST)
X-Received: by 2002:a62:5e44:0:b0:576:af2d:4c4d with SMTP id
 s65-20020a625e44000000b00576af2d4c4dmr225947pfb.69.1671653388799; Wed, 21 Dec
 2022 12:09:48 -0800 (PST)
MIME-Version: 1.0
References: <CA+DpmqZ1fh=MqEn-G6wb_6yELuPWVTROG2ReUDPJGAAOn7FN9Q@mail.gmail.com>
In-Reply-To: <CA+DpmqZ1fh=MqEn-G6wb_6yELuPWVTROG2ReUDPJGAAOn7FN9Q@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Dec 2022 21:09:37 +0100
X-Gmail-Original-Message-ID: <CANiDSCuoL4-L4zXPFRS88NpmYMdbbP2QNi90U9LkpS90_unb1w@mail.gmail.com>
Message-ID: <CANiDSCuoL4-L4zXPFRS88NpmYMdbbP2QNi90U9LkpS90_unb1w@mail.gmail.com>
Subject: Re: ucv camera fix : tester offering :-)
To:     Giuliano Lotta <giuliano.lotta@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Giuliano

Usually it is better to ask at the linux-media mailing list
https://www.linuxtv.org/lists.php. there is better chance to get an
answer and your question will get better chances to get be answered.

On Wed, 21 Dec 2022 at 15:14, Giuliano Lotta <giuliano.lotta@gmail.com> wrote:
>
> Hi Laurent,
>
> I'm using using an ubuntu Ubuntu 22.04.1 LTS on 5.15.0-56-generic
>
> with an Acer Nitro 5 AN517-55 with Quanta ACER HD User Facing', USB 0408:4035.
>
> Currently the camera is not working under linux. The camera works perfectly on Windows 11 dual boot.
>
> The camera is reported to have problems on other linux versions: https://linux-hardware.org/?id=usb:0408-4035
>
> My console commands report similar info to other users: https://unix.stackexchange.com/questions/723504/integrated-camera-not-detected-working-on-acer-nitro-5-an515-58
>
> I see also that there is a proposed fix at https://patchwork.kernel.org/project/linux-media/patch/20220617235610.321917-9-ribalda@chromium.org/


If your error in dmesg is simiar

[    4.629731] uvcvideo 3-6:1.1: Failed to query (129) UVC probe
control : 26 (exp. 48).

I am afraid that my patch won't help you much. My patch fixes the way
a control can be configured.

Can you copy your whole dmesg when you get an error. Also the output
of lsusb -v -d 0408:4035

Thanks!

>
>
> Installed linux-source but uvc_driver.c I found in the directory tree of Ubuntu is different from both :
>
> - https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_driver.c
>
> - https://patchwork.kernel.org/project/linux-media/patch/20220617235610.321917-9-ribalda@chromium.org/
>
>
> I would like to test your patch and see if the solution can be submitted to Ubuntu for the next fix release.
>
> -Could you give me some instructions on how to proceed ?
>
> -Should I compile a new whole kernel or just a mod?
>
> -Where can I find the source to which your fix applies (seems to apply to something different from Ubuntu and torvald versions) ? Will it be compatible with the current Ubuntu version?
>
> - May I ask for some instructions on how to proceed with testing your fix ?
>
>
> BR
>
> Giuliano
>
>
>


-- 
Ricardo Ribalda
