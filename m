Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827A06D2957
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 22:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbjCaUXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 16:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbjCaUXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 16:23:41 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092B01EFF2
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:23:40 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id w13so6201689oik.2
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680294219;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P59x6BdhOC5Y7nOh4z8mldmNz5baNSsCARZd2JDo8Bg=;
        b=MFa6UW6I9YSg7KkzIb68Ex6AqNaR2ILqghEfEP9KmJ8QHA+2RTw/ksB60/XZ101/NB
         Fd3/WYJe510PxAGjpVehMQIrkX954aqKu92Nc4a4t1RAg7p+e1huxj6T87OioE0953nX
         9JiHYCV2xoDlaAXQ8n/I0Y/NPqNLCJRBPh00IQoOK/KGwj4e0YEYgAj5kvaOOjMy0ky5
         0bpQdlQGrM6+kJdX31EXRh9ldbwaGbVIhgrDUpdS6RXc0PqrycCAsrVwuM7GVZa3Ucj7
         mggzkTgMrLxyHvgFMkI2QUDH/NK/3RCwBz9+HpFKz5Qj3zWhNcYX2V6t0RIic07xAEnY
         eCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680294219;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P59x6BdhOC5Y7nOh4z8mldmNz5baNSsCARZd2JDo8Bg=;
        b=sW2rLxcgPagHnZZit6zxjvds6FCx35mAEaAGJipuX1awsByfZajsNgjI2jXZvgf+EH
         4I5MxPhsj239rg9MeiOciXWpYo1LzkBQ1CfY4jztoulOG9cpWGm0leqoo1/qvLiZGchF
         cSWRqdOaeT07g5m5BedNwYkY/cNunckOpAZ+mxxllfWrnCvyhjzDoF3byCP/7oqS5ca7
         YwpMOOF/v2PaeuBNLo3xfNuXW8eH0zMRAb8DPKdHI1IRvD91Eb7YGjkk3930IzeEHfpe
         OcPFzHm9ojFrd1wuKhHDJ9bNmZFBIfw4bcuNlRm8Vo5K9fiHDwK8a6yCeJSUnG25yl/P
         U30g==
X-Gm-Message-State: AO0yUKVxuXEZ7NTcoyzncyZAtuSZK6vkBCTuxLHknplQD4HvUaYsq0ck
        uU2nYa8pOJ3LRMWo1YRXC6xrS/ocdPVTtfINOKZVEHWMTP8=
X-Google-Smtp-Source: AK7set8HBDH8mBgPROwpz6HwHgErB3N3y8wZVdNvaR5ojxYSznGQuK1zfu0EXlQI3J+XOeqlsnljhW9pIHmOe2PM/Ko=
X-Received: by 2002:aca:1b09:0:b0:384:23ce:10e7 with SMTP id
 b9-20020aca1b09000000b0038423ce10e7mr7397756oib.1.1680294219035; Fri, 31 Mar
 2023 13:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
 <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl> <CAC6x6itstZMNpA0=izPDkhNh3RVW=FJz+zr-H3htM0Lqh+mbXQ@mail.gmail.com>
In-Reply-To: <CAC6x6itstZMNpA0=izPDkhNh3RVW=FJz+zr-H3htM0Lqh+mbXQ@mail.gmail.com>
From:   Shawn Lindberg <shawn.lindberg@gmail.com>
Date:   Fri, 31 Mar 2023 15:23:28 -0500
Message-ID: <CAC6x6it0_DU1dTO4-F-6_4akyL-ZO-JwS5CQOmaM3+k+Kon07A@mail.gmail.com>
Subject: Re: Extremely long delay between CEC image-view-on an standby.
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 29, 2023 at 2:56=E2=80=AFPM Shawn Lindberg <shawn.lindberg@gmai=
l.com> wrote:
>
> On Tue, Mar 28, 2023 at 2:58=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl>=
 wrote:
> >
> > > cec-ctl -d0 --tv --cec-version-1.4
> >
> > That's wrong, the RPi is a Playback device, not a TV. So use --playback=
 instead.
> >
> > You should also add this line to the config.txt:
> >
> > hdmi_ignore_cec=3D1
> >
> > otherwise the RPi's firmware tries to process CEC messages as well.
>
> Oh, I thought that the TV/playback command was indicating what sort of
> device the connected device is. This wasn't clear from the man page,
> either. Thank you for that. I made the change to config.txt and
> strangely when the RPi rebooted (I have it set to do this
> automatically once a day) the projector automatically turned on. I
> have never experienced this before.

Further update on this. I continue to see the projector automatically
power on every time the RPi does its daily reboot, so I think I may
have to remove the hdmi_ignore_cec from the config.txt. Especially
since I can't figure out how to reliably shut the projector back off
again.

> > > During this time, if I try to poll the projector, it will succeed.
> > > However, if I monitor events, after a significant amount of time
> > > (appears to be greater than 20 minutes, although this is difficult to
> > > verify because of how long it takes) I go will eventually see the
> > > following:
> > >
> > > Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
> > >     Timestamp: 30981.428s
> >
> > Now it appears to be able to read the EDID again and it has a valid
> > physical address.
> >
> > > Transmitted by Specific to Specific (14 to 14): POLL
> > >     Tx, Not Acknowledged (4), Max Retries
> > >     Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4), M=
ax Retries
> > >
> > > Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
> > >     Timestamp: 30981.561s
> > > Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0x84=
):
> > >     phys-addr: 1.0.0.0
> > >     prim-devtype: tv (0x00)
> > >     Sequence: 22 Tx Timestamp: 30981.696s
> > > Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87):
> > >     vendor-id: 3075 (0x00000c03)
> > >     Sequence: 23 Tx Timestamp: 30981.835s
> > > Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
> > >     abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
> > >     reason: invalid-op (0x03)
> > >     Sequence: 0 Rx Timestamp: 30981.949s
> > > Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
> > >     Sequence: 0 Rx Timestamp: 30982.026s
> > > Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
> > >     name: TV
> > >     Sequence: 24 Tx Timestamp: 30982.137s
> > >
> > > After this point in time the standby command will succeed and the
> > > projector will turn off. It's quite inconvenient to have to wait over
> > > 20 minutes to turn the projector back off again. Any idea how I can
> > > shorten this delay?
> >
> > There is something weird about your setup and EDID. I can't really tell
> > what it is.
>
> After making the above changes and retesting, the behavior didn't
> change. I still get the device not connected message and the invalid
> physical address when I try to do standby. I should also note that one
> way around this issue is to reboot the RPi. For some reason that seems
> to get around the long delay in getting the physical address.
>
> I don't know what would be strange about my set up other than the
> projector itself and a couple of lines I uncommented in the config.txt
> to set the RPi to use HDMI even if the projector is not on at the time
> of booting. Is there more information I can provide that would allow
> us to figure out what's going on? If you are correct that for some
> reason it is just not reading the EDID, is there a way to manually
> provide that? I don't know much about it, but it's a static property
> of the device (the projector in this case), right?

Since I noticed that the physical address is populated properly when
the RPi is booted while the projector is turned on, I did that and
then tried using the get-edid utility to see if I could read the EDID
block and save it to a file. Unfortunately, this didn't work, as the
utility reports that there was no EDID available on any of the buses.
So once again I am out of ideas.
