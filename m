Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B42D26CF3CC
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 21:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjC2T4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 15:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjC2T4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 15:56:37 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D41D83
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 12:56:36 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id r84so11232630oih.11
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680119795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV6SSLxGVe+qYUxVNOJbFfaBH6mCI2Ov23QNqXSmBuo=;
        b=XMSrBd96upboFRYPHREoSIWbEsF+SJl/KFxK09Xw++mN9oBgIKY5qXvDfCXnuUyeJY
         nIeWQXeA5aenk78/WixSo0lsyWV3wIfPH14Ap4CrDVt4OvC1B9fMbO/6CACIR0LuKgv3
         V52o7jL5LXZ4LeMhFrqCoaXd4VcvOhOML9XP9LNB4SHpU3Uaw6l8+l2SEx6YS0YpPdkH
         LNPZbvnx9nvNRWX7QZrWDM2/n/Cm2dG8wf6jkMzEEMF/M2Pw0kKSBzI31FACj4GUGrhL
         Hr1tY5G3jPMhyADpQpcD0sVeHVc7nyqskupYfTm5bCulLJW9bJXQwzuOvl7OQ/dH3DG5
         BRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680119795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV6SSLxGVe+qYUxVNOJbFfaBH6mCI2Ov23QNqXSmBuo=;
        b=GOCUDpDahtKhfOSGjvKL7xkUyGCf0rcDY1vN60lj6UaMqBaiibkOynb8toiCjJe0lL
         e/96BuU20gf1cSQ/imd/OZ7Y/m2njoeLk8n+zRWzIxMbY94/myHn8T+ZEK678TrxJ0+H
         aqsQJgjEAGNjUdcqA9547yPDs4JyczgFyv6OezhWsEoTeXgquStF0lJJqODiRKBsdwqs
         dV/EW8BFPp36MWhgJ50OscFFC+W/EUJ+a4mbL0XF5CJHFc1Dai0J2Snnh1tD2ccqhbAo
         VkcM/z8vkpUhEo/hWCpwXs1QuLzwBfP/slyWyDbXj/cGpqsl9ZAaaCLbCKIcUcRh2KUl
         Kbow==
X-Gm-Message-State: AO0yUKULoNrxV3qsi/qNOhCD2F3HMyIOlnHTsZVJVT2Y+9jMMPgO5uHp
        PXk+CGEF+Uvth3Q5OJmjw+UZ5p/7FTdc80kM4om/J3AmtJw=
X-Google-Smtp-Source: AK7set8d4CdHlpOrOblt0T2OnrvuQWYym2nNmrqqQ3JyIMn9updQnfalkDo/IDJOOAdqMHNIUOQBCctV//xtJnx6R9s=
X-Received: by 2002:aca:1b09:0:b0:383:fcba:70e6 with SMTP id
 b9-20020aca1b09000000b00383fcba70e6mr5486844oib.1.1680119795444; Wed, 29 Mar
 2023 12:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
 <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl>
In-Reply-To: <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl>
From:   Shawn Lindberg <shawn.lindberg@gmail.com>
Date:   Wed, 29 Mar 2023 14:56:24 -0500
Message-ID: <CAC6x6itstZMNpA0=izPDkhNh3RVW=FJz+zr-H3htM0Lqh+mbXQ@mail.gmail.com>
Subject: Re: Extremely long delay between CEC image-view-on an standby.
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
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

On Tue, Mar 28, 2023 at 2:58=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> > cec-ctl -d0 --tv --cec-version-1.4
>
> That's wrong, the RPi is a Playback device, not a TV. So use --playback i=
nstead.
>
> You should also add this line to the config.txt:
>
> hdmi_ignore_cec=3D1
>
> otherwise the RPi's firmware tries to process CEC messages as well.

Oh, I thought that the TV/playback command was indicating what sort of
device the connected device is. This wasn't clear from the man page,
either. Thank you for that. I made the change to config.txt and
strangely when the RPi rebooted (I have it set to do this
automatically once a day) the projector automatically turned on. I
have never experienced this before.

> > During this time, if I try to poll the projector, it will succeed.
> > However, if I monitor events, after a significant amount of time
> > (appears to be greater than 20 minutes, although this is difficult to
> > verify because of how long it takes) I go will eventually see the
> > following:
> >
> > Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
> >     Timestamp: 30981.428s
>
> Now it appears to be able to read the EDID again and it has a valid
> physical address.
>
> > Transmitted by Specific to Specific (14 to 14): POLL
> >     Tx, Not Acknowledged (4), Max Retries
> >     Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4), Max=
 Retries
> >
> > Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
> >     Timestamp: 30981.561s
> > Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0x84):
> >     phys-addr: 1.0.0.0
> >     prim-devtype: tv (0x00)
> >     Sequence: 22 Tx Timestamp: 30981.696s
> > Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87):
> >     vendor-id: 3075 (0x00000c03)
> >     Sequence: 23 Tx Timestamp: 30981.835s
> > Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
> >     abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
> >     reason: invalid-op (0x03)
> >     Sequence: 0 Rx Timestamp: 30981.949s
> > Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
> >     Sequence: 0 Rx Timestamp: 30982.026s
> > Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
> >     name: TV
> >     Sequence: 24 Tx Timestamp: 30982.137s
> >
> > After this point in time the standby command will succeed and the
> > projector will turn off. It's quite inconvenient to have to wait over
> > 20 minutes to turn the projector back off again. Any idea how I can
> > shorten this delay?
>
> There is something weird about your setup and EDID. I can't really tell
> what it is.

After making the above changes and retesting, the behavior didn't
change. I still get the device not connected message and the invalid
physical address when I try to do standby. I should also note that one
way around this issue is to reboot the RPi. For some reason that seems
to get around the long delay in getting the physical address.

I don't know what would be strange about my set up other than the
projector itself and a couple of lines I uncommented in the config.txt
to set the RPi to use HDMI even if the projector is not on at the time
of booting. Is there more information I can provide that would allow
us to figure out what's going on? If you are correct that for some
reason it is just not reading the EDID, is there a way to manually
provide that? I don't know much about it, but it's a static property
of the device (the projector in this case), right?

Thanks,
Shawn
