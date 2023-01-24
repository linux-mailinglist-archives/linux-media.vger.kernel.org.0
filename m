Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56C4679AB7
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 14:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbjAXNzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 08:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234652AbjAXNzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 08:55:24 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A6148A14
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 05:54:12 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4c24993965eso218194597b3.12
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=594y8lkKpUDCKjZZ5WBtT1plfEYX1f1JqMN6GjNmzSs=;
        b=JMxsUxKEcXhbaei6ynI2uWu7FOAHX9VHfVQTELRPYTnB7YwZRFdJfoUIpQxdB+6U5a
         +t2AcmGOf4Lz+ozPtsJeJWAAAC3ddJivcrTALiAS2PaBHy1DlPPzVj6DcAMh1bkplI/6
         UySkSAP3JzzJ0qr/tQ0Dp3t/bHVaKt+VfSmJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=594y8lkKpUDCKjZZ5WBtT1plfEYX1f1JqMN6GjNmzSs=;
        b=bR0o7TGQgNEXzsspXocNsFB9HPiOA5VczsDBPmU7WqcgCaxFi1F1Rnz3KfVAnoD9mb
         37Frv68jOiQdNjvmY+38ePlnkBGFtxFivIwUjl/2xY5x+HFx4eRg3V5DaLNU8mVnguWd
         KKWCKdr4Pm9M4MT961ro5KOiPj/kHsfdVPmHgqHFSGWFV90keS05RFTz7X3+Nw8MKgTd
         acbnh+haTBQtCKz9FRhOuYxiNmW7IGHlt7GP5+hTsjz9MwRb9CSf8HuD3JxcTR+aYVO2
         UTLokfjADEwDho/UxNw0vrWDHyuy3802gMPc5z/Tihc1UXlZoOwID9m/FTKTIFnX5rWk
         ahwA==
X-Gm-Message-State: AFqh2ko55AUZZjC0klNKKwcYEnnKgu4PDLAic9iDvPyjSjeiyeiSkdhG
        8iDQvFF6Sdtqa6zhnT+ZY++Q4tINF3bwj12GKoM=
X-Google-Smtp-Source: AMrXdXsJbw3cJRlZV8EQjAM7X/ntTbBxKkc/D/k0ZgeZtAO1zLjRc/jtjDHYT0Mx2SyKN/CBYvoXOA==
X-Received: by 2002:a05:6a21:3996:b0:b8:610f:cd43 with SMTP id ad22-20020a056a21399600b000b8610fcd43mr28937969pzc.35.1674567918515;
        Tue, 24 Jan 2023 05:45:18 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id x4-20020a17090a970400b0022bb223ffe9sm1552314pjo.36.2023.01.24.05.45.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 05:45:17 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id g68so11298325pgc.11
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 05:45:17 -0800 (PST)
X-Received: by 2002:a05:6a00:70b:b0:58d:c1cb:3ab3 with SMTP id
 11-20020a056a00070b00b0058dc1cb3ab3mr3019017pfl.64.1674567917021; Tue, 24 Jan
 2023 05:45:17 -0800 (PST)
MIME-Version: 1.0
References: <WsQQ4mh3klG4vKAgDvNOGrHWdvb9ccX-Es7Wyfji70EYVrDSXUShby4WQIS0JidVVP0wsuXZASImrGHvrAvYKE4G0jWzP5RwTK5q47Cs60o=@proton.me>
In-Reply-To: <WsQQ4mh3klG4vKAgDvNOGrHWdvb9ccX-Es7Wyfji70EYVrDSXUShby4WQIS0JidVVP0wsuXZASImrGHvrAvYKE4G0jWzP5RwTK5q47Cs60o=@proton.me>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 24 Jan 2023 14:45:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCvtmLkdasaL+CYLXwQ-8f1L341S0nXKhhfx2jFfyW2-Jw@mail.gmail.com>
Message-ID: <CANiDSCvtmLkdasaL+CYLXwQ-8f1L341S0nXKhhfx2jFfyW2-Jw@mail.gmail.com>
Subject: Re: Logitech C920 problems
To:     Timo Poikola <viisumi@proton.me>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Timo

On Sun, 22 Jan 2023 at 02:26, Timo Poikola <viisumi@proton.me> wrote:
>
>
> Dear developers
> In yesterday I bought a brand new Logitech C920 Pro HD.
>
> When I connect the cable to computer, dmesg says:
> [242265.046786] usb 1-4: new high-speed USB device number 6 using xhci_hcd
> [242265.213671] usb 1-4: New USB device found, idVendor=046d, idProduct=08e5, bcdDevice= 0.0c
> [242265.213677] usb 1-4: New USB device strings: Mfr=0, Product=2, SerialNumber=0
> [242265.213679] usb 1-4: Product: HD Pro Webcam C920
> [242265.245010] uvcvideo: Found UVC 1.00 device HD Pro Webcam C920 (046d:08e5)
> [242265.254084] uvcvideo: Failed to set UVC probe control : -32 (exp. 26).

This -32 and the next "current rate" makes me believe that there is an
issue with the usb port. Can you try that camera on a different
device?
I am pretty sure that we have reports of C920 correctly working.

Regards!

> [242265.255834] input: HD Pro Webcam C920 as /devices/pci0000:00/0000:00:08.1/0000:04:00.3/usb1/1-4/1-4:1.0/input/input23
> [242265.422887] usb 1-4: current rate 16000 is different from the runtime rate 24000
> [242265.439969] usb 1-4: current rate 16000 is different from the runtime rate 32000
> [242265.895165] usb 1-4: current rate 16000 is different from the runtime rate 32000
> [242266.184183] usb 1-4: current rate 16000 is different from the runtime rate 32000
> [242266.472103] usb 1-4: current rate 16000 is different from the runtime rate 32000
>
> and nothing else happens. My kernel is
> uname -a
> Linux psp 5.10.0-10-amd64 #1 SMP Debian 5.10.84-1 (2021-12-08) x86_64 GNU/Linux
>
> What I can do?
>
>
>
> Sent with Proton Mail secure email.



-- 
Ricardo Ribalda
