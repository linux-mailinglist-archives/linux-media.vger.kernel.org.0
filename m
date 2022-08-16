Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29EF59634D
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 21:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237204AbiHPTll (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 15:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbiHPTlj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 15:41:39 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA2286889
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 12:41:38 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id gk3so20807415ejb.8
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 12:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=SyeqGw0nngnNJCR1WwWI13FtGCXgGuXLth8v0KzfWY8=;
        b=JXuzvD4yEhrluCAtWN7YSiZ0wDfz6SslQxouAjYPA3mok9T0119yOIoLuiHncTpgLQ
         BRxzBVj2QW/G+n/Hk1cO8uDnh443hBTZX/FMv6lPJ+67ZgEmpT9oRzrgooMEFb8a3hTl
         LRwH16FId9E7f+7Hj0LZn2HVKqL+C+0H8BHIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=SyeqGw0nngnNJCR1WwWI13FtGCXgGuXLth8v0KzfWY8=;
        b=E6T8xHbPjpjKnltbvhf3bxYTpvx3MU4BJTu12deqHnvgG2a8yOq8gtFrtFr4n/BsA2
         pKWnK7CknRRxEi/EmjZrFmXiVGbgXEx4jfp4BUYhE3O9Vsp/rY+/Xr83fRGjKs/sjOhl
         MFEwPEosDjJ1ctBdORRPUcnAGZ6zZbDMVVvzUh7JCs/yDp0jJ/bj3Hgugl/7eJfwlN6r
         fD6s0mwGrSefGpk5ySS1z3WYT1A7BCdfvIEsaF4/+eygMJh9x2du70kBnY8oRlMefWax
         lBrzE/DXwrNwspHy6xZs93lJ3F2+sY1RkFhdxm6Ks8ei9sVqVMMJKokf646NtGQszUfb
         er1A==
X-Gm-Message-State: ACgBeo1SehDdAJayfQyxK4HjBwAd3lXERznvabiNQD2A6sLVYLARyqUt
        Vn5tH9IW2rnTT3arIr3Lr0IQnyh95lqDSA==
X-Google-Smtp-Source: AA6agR5h49RWfan5miq3iXReajT3ASycNH6w/JjDADUregjMdm49f9kfZlQXfKW+BDPNQzcPm5xFkQ==
X-Received: by 2002:a17:907:75dc:b0:730:9c68:9a2e with SMTP id jl28-20020a17090775dc00b007309c689a2emr14996591ejc.22.1660678896493;
        Tue, 16 Aug 2022 12:41:36 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id g17-20020a50ee11000000b00442b388c743sm8978988eds.14.2022.08.16.12.41.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 12:41:36 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id tl27so20841659ejc.1
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 12:41:36 -0700 (PDT)
X-Received: by 2002:a17:907:2ccd:b0:731:53bc:6a6b with SMTP id
 hg13-20020a1709072ccd00b0073153bc6a6bmr14402142ejc.40.1660678895757; Tue, 16
 Aug 2022 12:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <8bd3b659-5e1c-4985-ceac-7b9956f2158f@neuf.fr> <CANiDSCvYLv_SX1nCS9s2TWbCQS54JL1kXcfLqE60LiGW+YsZDg@mail.gmail.com>
 <ed649780-bab6-bb7d-5ca1-cc6680c38702@neuf.fr> <CANiDSCsDc-MFpZ9fN_T+VuU9F6Cp6xUCEaoZmmmOJhUcvANJiw@mail.gmail.com>
 <4268c301-6f42-6345-1a8d-f670f53b0c5c@neuf.fr>
In-Reply-To: <4268c301-6f42-6345-1a8d-f670f53b0c5c@neuf.fr>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 16 Aug 2022 21:41:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCvgSf2JZoEZ1hxReJPrQkb8BmSdes8AnjKK_8u=F3R91g@mail.gmail.com>
Message-ID: <CANiDSCvgSf2JZoEZ1hxReJPrQkb8BmSdes8AnjKK_8u=F3R91g@mail.gmail.com>
Subject: Re: Adding a new UVC Device
To:     Bertrand COEZ <coez.bertrand@neuf.fr>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

So it seems like there is a camera working. What makes you think that
it does not work?

Can you try to run

ls -la /dev/video*
v4l2-ctl --all -d /dev/video0
yavta -c /dev/video0

Regards!

On Tue, 16 Aug 2022 at 20:57, Bertrand COEZ <coez.bertrand@neuf.fr> wrote:
>
> cat /sys/class/video4linux/video*/name :
> HD Webcam: HD Webcam
> HD Webcam: HD Webcam
>
> for dmesg, are there any particular lines you are looking for ? or do
> you prefer that I send you the whole stdout ?
>
> On 16/08/2022 18:07, Ricardo Ribalda wrote:
> > Hi
> >
> > This seems correct to me:
> >     bFunctionClass         14 Video
> >         bFunctionSubClass       3 Video Interface Collection
> >         bFunctionProtocol       0
> >
> > It should be matched by the driver.
> >
> > Can you share the output of `dmesg` just after starting the computer?
> > Also the output of
> >
> > cat /sys/class/video4linux/video*/name
> >
> >
> > Thanks!



-- 
Ricardo Ribalda
