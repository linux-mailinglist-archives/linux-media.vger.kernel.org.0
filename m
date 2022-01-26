Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2231B49CF8E
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 17:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236694AbiAZQYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 11:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236445AbiAZQYH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 11:24:07 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E17C06161C
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 08:24:07 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id j2so69423543edj.8
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 08:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hFSfHysSt/TEJp53DfQbM674LCf5MMeKjoUR3QbAsnA=;
        b=jJJT2DO3zZ4THh1nhrXHp3COcV9z0Ta/vU9epMck6jFQLYM9UqUtY7DNG1CN4gukv6
         +3Sb6DsUDn5HnLn3fESD6PLpTZNUL7MLC4zDOAYNX5vYnE3Cl0Ld0RNQBYF1bRvN7Ygs
         TCe5S26C4GoUl/G6IYV0yGtyt1Q26HmkVEvKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hFSfHysSt/TEJp53DfQbM674LCf5MMeKjoUR3QbAsnA=;
        b=uosSlJJcRKM40vbYnF2mWfq32c1K7yDDmBROu2ZvTrOt5iARebJD6WDgpRC9F3FqZT
         Y5W2gtK/TpHR2fYsWCipL7UEs8IfJsbXSDLiqxx1t8uPfnICz959EMP6cwNr4TEpLgL2
         Nir2PWCTHgsjH2cXObY7YnenbV/gvTjL78kqW/KOxh7pbFNI7Guy3H7ObkK8irD3njGU
         FjntQuNsSkf/dy0vhESZyLALeng9BkTsd4SZQUuH/HFB0EhRG2rG2/ETV/c8E3nws9GN
         J3a3oHU+CqWtfmHkdndej/bXaQ0y7qP1VbcnX1RmoaU9GanjXaT/fVaERj3idMdxwyIV
         7FiQ==
X-Gm-Message-State: AOAM531QctV3rwFI03EOdXqe9BlnmapH8kOhQ6PpGFOvPS3PvDEQEMZG
        trGOsP+1J6FBcKP+A4XGrk1tfJAjDYz2Rg==
X-Google-Smtp-Source: ABdhPJy2ukOBh9oDKPZryi2tzp/kHdsUWDVAItNeWMENjIyPp/6GBir5Fx1swaScfAufBwrsp/POFw==
X-Received: by 2002:aa7:cf0c:: with SMTP id a12mr24983048edy.185.1643214245766;
        Wed, 26 Jan 2022 08:24:05 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id by16sm7629564ejb.73.2022.01.26.08.24.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 08:24:05 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id h7so40233672ejf.1
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 08:24:05 -0800 (PST)
X-Received: by 2002:a17:906:2cd5:: with SMTP id r21mr21127790ejr.435.1643214245062;
 Wed, 26 Jan 2022 08:24:05 -0800 (PST)
MIME-Version: 1.0
References: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one>
In-Reply-To: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 26 Jan 2022 17:23:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
Message-ID: <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
Subject: Re: Get j5 WebCam JVCU100 supported by Linux UVC driver
To:     Mohammad <moin@librem.one>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mohammad

Could you share the output of dmesg when you connect the device?

And also lsusb -vvvv -d 0711:3108


Thanks!

On Wed, 26 Jan 2022 at 17:20, Mohammad <moin@librem.one> wrote:
>
> Greetings,
>
> I have been trying to use the j5 WebCam JVCU100 on Linux and it doesn't
> function properly.  Cheese cannot seem to find it, and I did not see it
> listed on your list of supported devices, so I thought I would bring it
> to your attention.  Here is what I see from running lsusb:
>
> Bus 001 Device 006: ID 0711:3108 Magic Control Technology Corp. j5
> WebCam JVCU100
>
> Also, running lsusb -d 0711:3108 -v | grep "14 Video" returns
>
> Couldn't open device, some information will be missing
>       bFunctionClass         14 Video
>       bInterfaceClass        14 Video
>       bInterfaceClass        14 Video
>       bInterfaceClass        14 Video
>       bInterfaceClass        14 Video
>
> So, looks like the Linux UVC driver at least recognizes the webcam.
> Please let me know if you can help with this, thanks!
>
> Regards,
>
> Mohammad
>


-- 
Ricardo Ribalda
