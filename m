Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9765E661F92
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 09:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjAIIAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 03:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjAIIAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 03:00:21 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9705DF69
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 00:00:20 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d3so8641518plr.10
        for <linux-media@vger.kernel.org>; Mon, 09 Jan 2023 00:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zmhcxNaRnQQKtMm2TlZPM5SowqQQNbrEERfl0vYmv/Y=;
        b=Gs3JLFSsQjnVMB/EEA6DyWqJUEN05ySJlGn2TKtw593bItMi5PJ9Pd+2OdvWjYjfFc
         ANcTC5MTtpkEa8J9nEJTv7+pRjEdN3EB/mP5MsNqFYmnnkCShXR91A18pO8WwQKjiXSi
         I3IlekvyhkHGTx4XRJiTc7zXbY6m1lRtCImuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmhcxNaRnQQKtMm2TlZPM5SowqQQNbrEERfl0vYmv/Y=;
        b=Sk12vj+KPeByL5rT7tYkixEzqXGutGM2rJD9R/hpN8h46DRSXri7lBMtjpTa7bkluH
         3ww7YrxZ87XtzfJgamFjiPBc+gI62AF5Y2UdXpdc6o0BDwxzrYWW6dytWNiFaTUMmIQz
         u2Tw4ZW+qW28+pU29bzRSj8EynnRj/l2LPdsYnL9HpttisDFjdRZ1D4ZVqVJTnyOrwgz
         AgaiK2ZrzWHjt+azIEle1XoDN96GOV1hjxm3/84sYURrTQ7LxwA5D75F5ObxX4nW20r+
         nH/F8Xsek7F/6xK9VvwlcICsyH/0Rj/NfmpqNnrVDs7gQAPo6A1FfckagGOhAU1lH1LL
         NoQg==
X-Gm-Message-State: AFqh2ko3o8b8EZ2SdiEeIDCkYBlbzfpuj453D/UCOFgw051wq2lfBn3w
        7ULbHABaDyz+qpnOVA5bpSSM5MwOv5ySk3sE
X-Google-Smtp-Source: AMrXdXuiRpXV4GCCowQ4HF3rnUAbkmxyl4fT2lJy5j5N/3jM4cA72nhPOPdrN063MUsCgC32jGO7Tw==
X-Received: by 2002:a17:902:c10c:b0:192:a8e0:2612 with SMTP id 12-20020a170902c10c00b00192a8e02612mr36924206pli.47.1673251219931;
        Mon, 09 Jan 2023 00:00:19 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id ij30-20020a170902ab5e00b00192721d4f2dsm5439172plb.82.2023.01.09.00.00.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:00:19 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id fz16-20020a17090b025000b002269d6c2d83so10783299pjb.0
        for <linux-media@vger.kernel.org>; Mon, 09 Jan 2023 00:00:19 -0800 (PST)
X-Received: by 2002:a17:90a:cf02:b0:219:33a1:d05f with SMTP id
 h2-20020a17090acf0200b0021933a1d05fmr4965305pju.116.1673251218598; Mon, 09
 Jan 2023 00:00:18 -0800 (PST)
MIME-Version: 1.0
References: <aa3024a6-55d1-a749-d266-97d7df029516@grapevine.com.au>
In-Reply-To: <aa3024a6-55d1-a749-d266-97d7df029516@grapevine.com.au>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 9 Jan 2023 09:00:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCtU2R2Vp_pToOKw7_=U7AtAVqinnCHzTToMPwjWxhFpMA@mail.gmail.com>
Message-ID: <CANiDSCtU2R2Vp_pToOKw7_=U7AtAVqinnCHzTToMPwjWxhFpMA@mail.gmail.com>
Subject: Re: ASUS inbuild camera fails to activate - Chicony USB2.0 HD UVC
 WebCam - chip-ID: 04f2:b40a
To:     Steve <stephen-r@grapevine.com.au>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve

Could you try with yavta:

yavta -c /dev/video0


and send back the dmesg and output of yavta?

Thanks!

On Sun, 8 Jan 2023 at 14:08, Steve <stephen-r@grapevine.com.au> wrote:
>
> G'day,
>
> I am trying to get the inbuilt webcam in a 2013/14 ASUS i7 F550L laptop
> to function.
>
> When a try use one of a number of applications to activate the camera,
> the activation light displays briefly (fraction of a second) and then
> the application reports a problem with the camera.
>
> I have tried the following applications: guvcview, vokoscreebNG, and Skype.
>
> I have tried a number of the Quirk values with uvcvideo. No luck with
> any of them.
>
> inxi --usb -xxx  gives the following details about the webcam:
>
> Device-2: 2-5:27 info: Chicony USB2.0 HD UVC WebCam type: Video
>      driver: uvcvideo interfaces: 2 rev: 2.0 speed: 480 Mb/s power: 500mA
>      chip-ID: 04f2:b40a class-ID: 0e02 serial: 0x0001
>
> I have attached the uvcvideo module trace and lsub output.
>
> Any help with this issue would be much appreciated.
>
> thanks,
>
> kind regards
>
> Steve



-- 
Ricardo Ribalda
