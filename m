Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228EF9515B
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 01:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728545AbfHSXC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 19:02:28 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35420 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbfHSXC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 19:02:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id u34so3859164qte.2;
        Mon, 19 Aug 2019 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ch4jA9pONjtk/Z4LqeHHWiGHsq1WXCAfEIg/BkBMJiY=;
        b=QNGqQBLece/JlbbZf3creWkGeaYh7AvYT7t0EHJK1oab8rX45BQRjiWbeP6jFnElJy
         iW9NKOwdKvdI18OXNbwhCFrALBoSxibgAlsyTJsivjw+XAsAvEuddcDCf59TC4EBzfgf
         cevSWkwEbWEVKegmjnQf/c3D+Vy2ewv086huz7cOvAIo+ZGp1sWJGI8WegldTrkeG/rB
         Wr0MaaU+bfrTjXO2f9+Z9kbskqLX/v1tuzb5I/PrkMqd5VBwM57yOVYBb/TjXYPhkYZ6
         pWBflUwl55dFJKLl7PUYbMvYyzq0fgh0JUx0g0yuTWzmITEWXw/HKlkyNzDbLutAcJ9K
         CGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ch4jA9pONjtk/Z4LqeHHWiGHsq1WXCAfEIg/BkBMJiY=;
        b=XTac4m8YjgjwnpSNxHmTmUxENRwu02rLzNIm6V+NGvVwJQHprti+j4GddpV7LyS4DH
         Uta8vc/3rUoW4wJ79D2QaxGjhlNLuj3f/hFeFE4G/iP14uxw6Cwm4KtlesddqvUck+Tn
         jshK/FnYV3PESYL4DfywAfP4Hctw9cSi50NZcmKyaRK7X4/hbrVP6IDbp+eeVYpW+k7I
         UkM2JPMk/Y0MDYU0wH0ODjr2V4GqT/U2fq3IGVb5ewRLl+tbQNhVHL1QT7QB0fg5m8CC
         0KhEsGI+ED7es1GwQ1fVdVRywIgsAOCtxtYKkass49GYjSb7vNYXMP3pcATNvXcI7hih
         ft5w==
X-Gm-Message-State: APjAAAVpJnZDENzHOiumzVdHtIRSfsSZAtWPVEsMQFx3mRefwPXyQk60
        2jcOfNrsXl2lbNu/TnZwqj/RxztOEiHha0rOCs8=
X-Google-Smtp-Source: APXvYqz0oKtLKKMVCnayxkA0wWDlCeW2p/EMH+Dzj4XF0YauoZ24YMthjhbaevwUoelJizSQg1A1J69+Y+/onCzojeY=
X-Received: by 2002:ac8:1605:: with SMTP id p5mr23151806qtj.79.1566255746695;
 Mon, 19 Aug 2019 16:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
 <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc> <CALaQ_hqEZ-kco1esyB4mk0z9Q9Xt1XZsgYKR7gSdF7COERKoOA@mail.gmail.com>
 <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org> <da6a1b65-cbe5-4e5e-d61c-43644a23da34@kernel.org>
In-Reply-To: <da6a1b65-cbe5-4e5e-d61c-43644a23da34@kernel.org>
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Mon, 19 Aug 2019 18:02:18 -0500
Message-ID: <CALaQ_hoaoT+fzJZvEjCr6snjQme13LF2aph8cfvBCP5qta_QNQ@mail.gmail.com>
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     shuah <shuah@kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>, sean@mess.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(resubmitting due to non "reply-to-all"):

Bugger, I just sent a reply to your last message, but it bounced back with:
*****
550 5.7.1 Content-Policy reject msg: The message contains HTML
subpart, therefore we consider it SPAM or Outlook Virus. TEXT/PLAIN is
accepted.! BF:<U 0.466751>; S1728494AbfHSVzk
*****
I just switched this email to plain-text and will resubmit my previous
email as plain-text.

Anyway, yeah, all I did in au0828-cards.c was add my 0x0400 like:
*****
 { USB_DEVICE(0x2040, 0x7281),
.driver_info = AU0828_BOARD_HAUPPAUGE_HVR950Q_MXL },
{ USB_DEVICE(0x05e1, 0x0400),
.driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
{ USB_DEVICE(0x05e1, 0x0480),
.driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
{ USB_DEVICE(0x2040, 0x8200),
.driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
*****

That's all I've ever had to do. I never knew about the quirks-table.h.
I'll take a look.
I saw in the log the 0x05e1 addition was made in 2016, but maybe it
only applies to the Media Controller API change requirement now (thus,
not having caused any problems in the past since the API wasn't being
used).

I've never sent in a patch before (anywhere. I just point out a
problem and let the dev code it in their style). Also I don't want to
be a bother in case something even that small could somehow break
something else, especially for something "off-brand"(?).
I never really minded building the module by itself.

I've just now started the build for linux-5.2.y with the
quirks-table.h change along with au0828-cards.c.
Thanks for that heads-up. Hopefully that does the trick (whatever the
trick/quirk is).

On Mon, Aug 19, 2019 at 4:44 PM shuah <shuah@kernel.org> wrote:
>
> On 8/19/19 2:49 PM, shuah wrote:
> > Hi Nathan,
> >
> > Just catching up with this thread. Let me know what you find. Can you
> > build your own kernel and see what you can find?
> >
>
> You said you make changes to the
>
> "Whenever I update my kernel, I edit the
> ./drivers/media/usb/au0828/au0828-cards.c file adding an entry for my
> 0x400 device.
> I've been doing it for years and it's been working fine... until now..."
>
> Please send me the changes you make to the file. I see the following
> WOODBURY devices. I am assuming you add 0x400 entry.
>
> { USB_DEVICE(0x05e1, 0x0480),
>                  .driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
>          { USB_DEVICE(0x2040, 0x8200),
>                  .driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
>
>
> There is another table in sound/usb/quirks-table.h for AU0828
> devices. In addition to 812658d88d26, 66354f18fe5f makes change
> to this table to add a flag. I see two entries in that table:
>
> AU0828_DEVICE(0x05e1, 0x0480, "Hauppauge", "Woodbury"),
> AU0828_DEVICE(0x2040, 0x8200, "Hauppauge", "Woodbury"),
>
> Since these drivers are now coupled doing resource sharing,
> could it be that with your change to au02828 device table,
> your changes are bow incomplete.
>
> I don't have a Woodbury device though. This is something to
> try.
>
> Did you consider sending patch to add your device variant,
> so you don't have to keep making this change whenever you
> go to a new kernel?
>
> thanks,
> -- Shuah
