Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0802566B8D7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 09:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjAPIMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 03:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbjAPIMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 03:12:06 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFAC65AC
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 00:12:05 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so33116532pjk.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 00:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=svK8sNfAt+CcG9dxerrXV/d83fJtHYoUCeN+JdYuUsI=;
        b=ZF1MERoF1+pmbMV08oqcTGgay89UjTc22aiLItFLScH4TiiWguSZjR5bI2Pj3BCvUj
         +fyIq9GqmkSiklHxvvAdXRE/+3kZo9tBLoGVxP4sWygw6avrinOcRiQhiO5BJ2W0uMLh
         yPyLnLLkXP814s5hrHU8380JgTC3G20vlvFHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svK8sNfAt+CcG9dxerrXV/d83fJtHYoUCeN+JdYuUsI=;
        b=diftw95voKrTsIzlD92DEeHsCVT7yktpZEp+eytt3YcwNnHjPDTd7tBAN223bamDy3
         mzCSMy1tUksGZPh1DQxWm1HJcb4HC8gnjZCWZw/CYjNoXogHCvplyZ+yj91VV/Txn6+T
         2Zf+sXZ9TDq8YAtMTnPamRkSjq3bsdpI2hQPV+aYuqrmi1WSlFVji+IHtGG0t1jLRqzB
         zIXYvQIP69wGf3pzoCegKPkLdAL5FhZnYYBZI2AuCrTWRUbHPGuNgOXRc2mRa4zBdRs+
         zZASoxbJCHKgOOpAuH3p2+ITJN08cVrZRJVxkJx0MXnCc9ooj+bzEf7OvEezKw0SdoRi
         SyzQ==
X-Gm-Message-State: AFqh2krowzAgp8nIfemROUfGFICjK7D+jYDBiDwEqUVLfJED+HxHMbOD
        0W0k27Ks9jJLUSaneVpn79B7wIg1J2igwGTJ
X-Google-Smtp-Source: AMrXdXvxPO0+eCpLGHYvSIDwAnNJGbCQ6TOsyjwEVh31srADas+vQzTA+gC7EA9l6ouHTvlVoRgzAQ==
X-Received: by 2002:a17:90a:e387:b0:227:1ef2:1db7 with SMTP id b7-20020a17090ae38700b002271ef21db7mr26435256pjz.9.1673856724126;
        Mon, 16 Jan 2023 00:12:04 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id b2-20020a655782000000b0047915d582ccsm15359298pgr.20.2023.01.16.00.12.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:12:03 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so33116471pjk.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 00:12:03 -0800 (PST)
X-Received: by 2002:a17:902:d588:b0:194:621a:3ee9 with SMTP id
 k8-20020a170902d58800b00194621a3ee9mr736827plh.124.1673856722666; Mon, 16 Jan
 2023 00:12:02 -0800 (PST)
MIME-Version: 1.0
References: <CA+DpmqZ1fh=MqEn-G6wb_6yELuPWVTROG2ReUDPJGAAOn7FN9Q@mail.gmail.com>
 <CANiDSCuoL4-L4zXPFRS88NpmYMdbbP2QNi90U9LkpS90_unb1w@mail.gmail.com>
 <Y689FvF1zULBkSHs@pendragon.ideasonboard.com> <CA+DpmqZ=v1TwfhnjpaT6ip9L4UnVuE-Cx2cJo0hDNybNhKwu4g@mail.gmail.com>
 <Y7LS4MMcSX/tO5EN@pendragon.ideasonboard.com> <CA+Dpmqax3M5=a=uPEorx=o2_kaKt_Aj7iXaXHreyjWFLscr+Ng@mail.gmail.com>
 <CA+DpmqYNK=zLPPRjsqWF-3TgdPHq97tFBGamizrdN1i3xHwAtQ@mail.gmail.com>
 <CA+DpmqaVAh8SHhML+4t_MuV4fmZ1HeCaZ9i9B58TRUqpJ2k9VQ@mail.gmail.com>
 <Y71KO4ZEwYVSYuvm@pendragon.ideasonboard.com> <CA+Dpmqba0Lo0wpEQYFbd9SUrBGspn44UDn_jqGyJTpf1oYhttg@mail.gmail.com>
 <Y8RmahoMiyoRVNkJ@pendragon.ideasonboard.com>
In-Reply-To: <Y8RmahoMiyoRVNkJ@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 09:11:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCsnqnfhG2We1d44ckM0PUioNskKC5YGTqw4podteLNWLg@mail.gmail.com>
Message-ID: <CANiDSCsnqnfhG2We1d44ckM0PUioNskKC5YGTqw4podteLNWLg@mail.gmail.com>
Subject: Re: ucv camera fix : tester offering :-)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Giuliano Lotta <giuliano.lotta@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sun, 15 Jan 2023 at 21:47, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Giuliano,
>
> (CC'ing linux-media and Ricardo)
>
> On Tue, Jan 10, 2023 at 02:11:54PM +0100, Giuliano Lotta wrote:
> > UPDATE:
> > after resuming the nobebook, the system crashed with the following message:
> >
> > usb 3-6: Failed to query (SET_CUR) UVC control 4 on unit 1: -32 (exp. 4)
> > uvcvideo 3-6:1.0: reset_resume error -5
> >
> > WHERE / HOW may I find other useful information to debug the problem ?
>
> That doesn't seem like a crash, but it's not nice. Does the webcam stop
> functioning after that ?
>
> Ricardo, the device is a
>
> Bus 003 Device 003: ID 0408:4035 Quanta Computer, Inc. ACER HD User Facing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x0408 Quanta Computer, Inc.
>   idProduct          0x4035
>   bcdDevice            0.04
>   iManufacturer           1 Quanta
>   iProduct                2 ACER HD User Facing
>   iSerial                 3 01.00.00
>   bNumConfigurations      1
>
> Does it ring a bell ?

I could not find anything with 4035 on the ChromeOS componnet database.

Quanta uses different ISPs on their modules, so it is not
straightforward to figure out the ISP vendor :(




>
> > Il giorno mar 10 gen 2023 alle ore 12:21 Laurent Pinchart ha scritto:
> > > On Tue, Jan 10, 2023 at 07:57:21AM +0100, Giuliano Lotta wrote:
> > > > Hi Laurent,
> > > > I just realized that the VIDOE has NO AUDIO....
> > > >
> > > > Trying a webcam test site like : https://it.webcamtests.com/
> > > > it says that the webcam does not have a microphone.
> > > >
> > > > Any idea on how to solve this problem ?
> > >
> > > Well, your webcam does not have a microphone :-) It's integrated in a
> > > laptop, so audio is handled through your laptop audio device.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
