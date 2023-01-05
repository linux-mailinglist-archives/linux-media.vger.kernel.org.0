Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D12965E7C8
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 10:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjAEJ2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 04:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbjAEJ2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 04:28:02 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF91551E0
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 01:28:01 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id 18so12706357pfx.7
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mdiV0jRWKJenJkDbCBfskhhsBWiHSIZnH62DOKLrpqA=;
        b=oULLtRgURbmSi2vgstCuA8WHpMEPNqQjt8CygUejiZ+10yr+sn/Vam7JJqcXpaysCO
         T7TK15Yb/U4x4WTS6z3iJNITfpOjPXMWj1hVP1gO+3yVKAuF1vsj+gG6ju78dqhYn6dn
         hNTrDq/etj9h5v0sgIFdGSc9cgyi7zsZXkPxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdiV0jRWKJenJkDbCBfskhhsBWiHSIZnH62DOKLrpqA=;
        b=H1zaW/zndUgJyHa4UkxdA/4ZeXKIBdVkqC8bHbZJdQUTaxcHyWQpi7LYfxJs2PCADf
         EjN9ZqhMHTELSIy85RyspmRui+QuqiYHS2J+jFg84GRfgyptrP55BYHGghy5olVoLjBg
         PyR2udjrg4jIjPbukYb3S4xj4bKj+BIdzH4xmE5fw6O8Gppnq8g9h9zDCS7N1z/2PyLd
         K/r1SLPc/9IhX5BdAHZyCS0cxQ87GGbc9K8iAvHsOFCpPp1e82w1AgZvuYPJGt35U+to
         EYx0rct/rdKr1d3aRbrUFJW7LO1T+fQrzsv0V1ayf3IHUKtqE+tZnZq+mNp6ZOZWyeYj
         Xsrg==
X-Gm-Message-State: AFqh2koWMFDPE1l0jk5UVji2RTuauuCTSyW9DCYD7vKblq9fArP/+GA2
        cPJWYwtRO70/Csxm4m0GLq32UC2EoQrn5/Nh+Us=
X-Google-Smtp-Source: AMrXdXtCBSUbKHKUgCHAHPR9+hirFJOE4s/Bu3i8RDT2rBurbxvehs6O55RHBjTDrg+z2dLL1isvyA==
X-Received: by 2002:a05:6a00:24c9:b0:57f:7bb4:8fce with SMTP id d9-20020a056a0024c900b0057f7bb48fcemr60583614pfv.32.1672910880603;
        Thu, 05 Jan 2023 01:28:00 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id e187-20020a621ec4000000b00576489088c7sm24019998pfe.37.2023.01.05.01.27.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 01:28:00 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so1485957pjq.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 01:27:59 -0800 (PST)
X-Received: by 2002:a17:902:a984:b0:189:d081:1ebb with SMTP id
 bh4-20020a170902a98400b00189d0811ebbmr2410226plb.130.1672910879127; Thu, 05
 Jan 2023 01:27:59 -0800 (PST)
MIME-Version: 1.0
References: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
 <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
 <Y7Z69HKvkFAunqQd@pendragon.ideasonboard.com> <5da0eeca-70d6-9933-8408-36b20bbc0d56@kernel.org>
In-Reply-To: <5da0eeca-70d6-9933-8408-36b20bbc0d56@kernel.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 5 Jan 2023 10:27:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCt7opKhNoiOEpN-x09hXtY+YEf=i=kvWQCg7b-T5U=6vg@mail.gmail.com>
Message-ID: <CANiDSCt7opKhNoiOEpN-x09hXtY+YEf=i=kvWQCg7b-T5U=6vg@mail.gmail.com>
Subject: Re: EasyCAP (534d:0021) not offering native 720x576
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiri

On Thu, 5 Jan 2023 at 09:29, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 05. 01. 23, 8:23, Laurent Pinchart wrote:
> > On Wed, Jan 04, 2023 at 02:12:44PM +0100, Ricardo Ribalda wrote:
> >> Hi Jiri
> >>
> >>
> >>
> >> I think that /dev/video3 belongs to your notebook webcam, not to the EasyCAP.
> >
> > That looks correct.
>
> Yes, you are right -- only 2 devices (4+5) are created. I don't know why
> I thought there are 3.
>
> >> 720x480 I believe is the NTSC resolution.
>
> Ah, that makes sense. Which leads me to: sometimes, the picture distorts
> after I start playing the video. It's skewed and halves of the picture
> switched [1]. I assume the driver expects NTSC@720x480, but the device
> sends PAL@720x576, actually. Sometimes, there are also color strips.
>
> [1] https://hci.fi.muni.cz/~xslaby/n/skew.jpg
>
> > Can you try starting the
> >> VHS, *before* you connect the grabber to the USB? Maybe that way the
> >> device realises that it should be working in PAL not in NTSC.
> >
> > Good idea. The device advertises a maximum resolution of 720x480 in the
> > UVC descriptors it exposes to the host, so there's nothing the driver
> > can really do to obtain 720x576.
>
> That doesn't help. Maybe it would sound foolish (I don't know the
> internals), but would it make sense to re-read UVC parameters on each
> device start in open? Only as a debug aid to see if they change.

UVC is weird. The parameters are part of the USB descriptor, and the
only way to change those is to re-enumerate.

Some HDMI receivers simulate a usb disconnect every time the
resolution of the source changes... If the hdmi signal is not very
good imaging the party :)

>
> > If plugging an active PAL source to the device before plugging it to the
> > USB port doesn't help, another option for investigation is to capture
> > USB traffic under Windows to check what happens there.
>
> OK, I can try it. I have win10 virt machine set up. So that should be
> easy using usbmon. Except I don't know how to read the mon dumps. I
> should start at Documentation/usb/usbmon.rst, I believe.

TL/DR:
modprobe usbmon
sudo wireshark; select the usbmonX device where your device is attached

Good luck ;)

>
> thanks,
> --
> js
> suse labs
>


-- 
Ricardo Ribalda
