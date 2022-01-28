Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8539849F51E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 09:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347287AbiA1Ib6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 03:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbiA1Ib5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 03:31:57 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72728C061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 00:31:57 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id c24so8359667edy.4
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 00:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7PneUcA+rtaBTto9VN/aivMCIyOiz0ICV6W4EYWaWz8=;
        b=Kqs+AA1gRjgq5NXvScQ8LIacuGe5pyzezAAKCfk9E+LvompEPwvOrf+AI5YBZNQGkU
         HSmk+M+/uGG+m6aOHIqAqrlEvOGioBfohoLJVxdjxAzUJmexxoAgs0vmFS5Y3vIckXlD
         qT8EOuS0qodiCsa9bVyGQ5G0Oxw4yj97wzty0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7PneUcA+rtaBTto9VN/aivMCIyOiz0ICV6W4EYWaWz8=;
        b=ukE0KMwcuWK5JHYb8vm0EywMfo4eaIn5uSyrwTHKmUKxEGhdVCu3aX742TeOKip0jK
         oBTyjtex1hQFdoRbZjhyKncTFM5YruTnQlKV+sVQmKHRxkGrVZaFoNnmQpeQfV8feGwq
         A1qqCeTWEGTgzPmXpZNaqFtUFYaY/w6dFwXi846n9035prUS3SAfSX0CsHaCxsThMwUb
         o1HiIFPWC3fIvL7fEEXgmsDFoj6xHc46A0oQDkozCUKw9NOpnEG+PmvmT4Fg8pgZ7lOD
         40dPu/HiGvWfxJfK1zfwzcssTt9d3JHc7cCWwFLVN+cgvnSIvv4JWJtYEQd0u65ZmnJH
         qK0Q==
X-Gm-Message-State: AOAM533zdClI/h7RrgUcJoVleeG1AiI10V3jiflEBaizVGCUxTRZDiZ/
        tocvWXNn7MFGEZYZGgUxasIODMP5d9HLMg==
X-Google-Smtp-Source: ABdhPJwvnI+SwQQsEmikGdquvNT6zZlCV6CQijf1BG/6ySllJoLlxPwRjwwlI4Qp1muIhjqwwZEkFA==
X-Received: by 2002:a50:c8ca:: with SMTP id k10mr7339106edh.99.1643358715922;
        Fri, 28 Jan 2022 00:31:55 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id x12sm11437773edv.57.2022.01.28.00.31.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 00:31:55 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id m11so8260094edi.13
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 00:31:55 -0800 (PST)
X-Received: by 2002:a05:6402:4313:: with SMTP id m19mr7006284edc.320.1643358714866;
 Fri, 28 Jan 2022 00:31:54 -0800 (PST)
MIME-Version: 1.0
References: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one> <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
In-Reply-To: <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 28 Jan 2022 09:31:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCuLQWFxMLKj9no7-qdZMRp3AJdgZ=u8356hc7mf-6fQyA@mail.gmail.com>
Message-ID: <CANiDSCuLQWFxMLKj9no7-qdZMRp3AJdgZ=u8356hc7mf-6fQyA@mail.gmail.com>
Subject: Re: Get j5 WebCam JVCU100 supported by Linux UVC driver
To:     Mohammad <moin@librem.one>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I received out of list the dmesg output from Mohammad

It looks like a hardware error to me:

[   48.729618] iTCO_wdt: unable to reset NO_REBOOT flag, device
disabled by hardware/BIOS
[   48.749361] uvcvideo: Found UVC 1.00 device j5 WebCam JVCU100 (0711:3108)
[   48.751876] uvcvideo: Failed to query (129) UVC probe control : -32
(exp. 26).
[   48.751879] uvcvideo: Failed to initialize the device (-5).
[   48.751930] usbcore: registered new interface driver uvcvideo




On Wed, 26 Jan 2022 at 17:23, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Mohammad
>
> Could you share the output of dmesg when you connect the device?
>
> And also lsusb -vvvv -d 0711:3108
>
>
> Thanks!
>
> On Wed, 26 Jan 2022 at 17:20, Mohammad <moin@librem.one> wrote:
> >
> > Greetings,
> >
> > I have been trying to use the j5 WebCam JVCU100 on Linux and it doesn't
> > function properly.  Cheese cannot seem to find it, and I did not see it
> > listed on your list of supported devices, so I thought I would bring it
> > to your attention.  Here is what I see from running lsusb:
> >
> > Bus 001 Device 006: ID 0711:3108 Magic Control Technology Corp. j5
> > WebCam JVCU100
> >
> > Also, running lsusb -d 0711:3108 -v | grep "14 Video" returns
> >
> > Couldn't open device, some information will be missing
> >       bFunctionClass         14 Video
> >       bInterfaceClass        14 Video
> >       bInterfaceClass        14 Video
> >       bInterfaceClass        14 Video
> >       bInterfaceClass        14 Video
> >
> > So, looks like the Linux UVC driver at least recognizes the webcam.
> > Please let me know if you can help with this, thanks!
> >
> > Regards,
> >
> > Mohammad
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
