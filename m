Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7EE6D33FD
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 22:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjDAUz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 16:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjDAUz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 16:55:56 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCA8133
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 13:55:54 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id n6-20020a4abd06000000b0053b59893660so4063183oop.0
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 13:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680382554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEebtX0gBqn6oK3wEB881X7URlB383c9JV1sVM2h4oQ=;
        b=nX1/npWRmJyyRQCll79Xf8X2no9NVtbBqKSvEJ320GopGc9KxDjXuoYoSOLiqtYnTk
         a8IFV2IN89xeKeSPpBsRKv36RX9fgi2fG9eSJv+mAmqdhlzkX7qBCCH/Cyr5x9PmYCVe
         bWrJMCCay2/1lWnXGA0ssT3ibyEYL0MWU9jvr3icUHatf9qUUxkwHCwzXBixanGm/RK7
         wymdkoNZ9FH5pOEoIhF2DpKpzHart3ITuBbcrtW3tDTOKwB7vjF4NJeu2yoP6Nxi/wAI
         43DvZHUybnI4DKOnGPhGd5KcyCgJwWI1mcKmLVT+phEafb7+3sIMeLTL60vkWgbtdnA1
         uvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680382554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEebtX0gBqn6oK3wEB881X7URlB383c9JV1sVM2h4oQ=;
        b=A6jTidyKDfqorRRveEe+XY/NFbP8jTEK3z2Tx0uFiXZuAth5xaKvp7RXbcjr58t2WV
         8TRjnom4dKVWFJwiiuybyQB6l5MVO4DRvyaNsb9iMDbSdEb9FGqe2RVxjXm9L7A3A4ga
         Fy3lEAMUS1Jtx93FfMtEF9tClqt03kbhcZsd/FwOQi9LuVoMOkcOHSVgIz6pi56X0Zq7
         bdf48OtrjCHoiCVXP2Y6txF9NiY1DM4h93nDk8A//KS5IxSSx4AxtwDi7pwsoAF3I1w2
         GJyrxiEJGhlZHk7xlivDsR9U7LqcXy7GEqYMH5XkyXoBcr5gNYO5POHCbfohsCjyX1tJ
         fpQQ==
X-Gm-Message-State: AO0yUKVfaF8wyaVPYpGj9E+Q57q4CTx2szGQm98r5ATleKC16QYX8bc3
        HaAYaVXboAnQ6O1CjngFWCpAp4YjqYspVaTik4abhgvm/Sg=
X-Google-Smtp-Source: AK7set9+HOc7QWfkVxsTLN/BdAxYlFdttkMlQnKOXBmN8dCU5w1HHgQ24pfzDAdNi2dHAC5ipAJqPZv+ZfdvebWxMss=
X-Received: by 2002:a4a:e5cf:0:b0:52e:17e2:7d4c with SMTP id
 r15-20020a4ae5cf000000b0052e17e27d4cmr9843840oov.1.1680382553884; Sat, 01 Apr
 2023 13:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
 <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl> <CAC6x6itstZMNpA0=izPDkhNh3RVW=FJz+zr-H3htM0Lqh+mbXQ@mail.gmail.com>
 <CAC6x6it0_DU1dTO4-F-6_4akyL-ZO-JwS5CQOmaM3+k+Kon07A@mail.gmail.com> <6dabaf27-1d68-b6e5-12c3-cbef79867fc1@xs4all.nl>
In-Reply-To: <6dabaf27-1d68-b6e5-12c3-cbef79867fc1@xs4all.nl>
From:   Shawn Lindberg <shawn.lindberg@gmail.com>
Date:   Sat, 1 Apr 2023 15:55:43 -0500
Message-ID: <CAC6x6iuOvHuRC7cUzA4N0TR2Ue6g55buhQ1-pD0_i1VvBaSaiw@mail.gmail.com>
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

On Sat, Apr 1, 2023 at 3:17=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 31/03/2023 22:23, Shawn Lindberg wrote:
> > On Wed, Mar 29, 2023 at 2:56=E2=80=AFPM Shawn Lindberg <shawn.lindberg@=
gmail.com> wrote:
> >>
> >> On Tue, Mar 28, 2023 at 2:58=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.=
nl> wrote:
> >>>
> >>>> cec-ctl -d0 --tv --cec-version-1.4
> >>>
> >>> That's wrong, the RPi is a Playback device, not a TV. So use --playba=
ck instead.
> >>>
> >>> You should also add this line to the config.txt:
> >>>
> >>> hdmi_ignore_cec=3D1
> >>>
> >>> otherwise the RPi's firmware tries to process CEC messages as well.
> >>
> >> Oh, I thought that the TV/playback command was indicating what sort of
> >> device the connected device is. This wasn't clear from the man page,
> >> either. Thank you for that. I made the change to config.txt and
> >> strangely when the RPi rebooted (I have it set to do this
> >> automatically once a day) the projector automatically turned on. I
> >> have never experienced this before.
> >
> > Further update on this. I continue to see the projector automatically
> > power on every time the RPi does its daily reboot, so I think I may
> > have to remove the hdmi_ignore_cec from the config.txt. Especially
> > since I can't figure out how to reliably shut the projector back off
> > again.
>
> From what I can tell, the Raspberry Pi doesn't transmit anything over CEC
> at boot time, regardless of whether hdmi_ignore_cec is present or not.
> That's with a Raspberry Pi 4B. It might be different for an RPi 3.

That is strange. I am also using a Raspberry Pi 4B. I do have the
following changes to my config.txt:

# uncomment if hdmi display is not detected and composite is being output
hdmi_force_hotplug=3D1

# uncomment to force a specific HDMI mode (this will force VGA)
hdmi_group=3D1
hdmi_mode=3D16

# Additional line added to prevent firmware from processing CEC messages.
hdmi_ignore_cec=3D1


> >>>> During this time, if I try to poll the projector, it will succeed.
> >>>> However, if I monitor events, after a significant amount of time
> >>>> (appears to be greater than 20 minutes, although this is difficult t=
o
> >>>> verify because of how long it takes) I go will eventually see the
> >>>> following:
> >>>>
> >>>> Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
> >>>>     Timestamp: 30981.428s
> >>>
> >>> Now it appears to be able to read the EDID again and it has a valid
> >>> physical address.
> >>>
> >>>> Transmitted by Specific to Specific (14 to 14): POLL
> >>>>     Tx, Not Acknowledged (4), Max Retries
> >>>>     Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4), =
Max Retries
> >>>>
> >>>> Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
> >>>>     Timestamp: 30981.561s
> >>>> Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0x8=
4):
> >>>>     phys-addr: 1.0.0.0
> >>>>     prim-devtype: tv (0x00)
> >>>>     Sequence: 22 Tx Timestamp: 30981.696s
> >>>> Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87):
> >>>>     vendor-id: 3075 (0x00000c03)
> >>>>     Sequence: 23 Tx Timestamp: 30981.835s
> >>>> Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
> >>>>     abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
> >>>>     reason: invalid-op (0x03)
> >>>>     Sequence: 0 Rx Timestamp: 30981.949s
> >>>> Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
> >>>>     Sequence: 0 Rx Timestamp: 30982.026s
> >>>> Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
> >>>>     name: TV
> >>>>     Sequence: 24 Tx Timestamp: 30982.137s
> >>>>
> >>>> After this point in time the standby command will succeed and the
> >>>> projector will turn off. It's quite inconvenient to have to wait ove=
r
> >>>> 20 minutes to turn the projector back off again. Any idea how I can
> >>>> shorten this delay?
> >>>
> >>> There is something weird about your setup and EDID. I can't really te=
ll
> >>> what it is.
> >>
> >> After making the above changes and retesting, the behavior didn't
> >> change. I still get the device not connected message and the invalid
> >> physical address when I try to do standby. I should also note that one
> >> way around this issue is to reboot the RPi. For some reason that seems
> >> to get around the long delay in getting the physical address.
> >>
> >> I don't know what would be strange about my set up other than the
> >> projector itself and a couple of lines I uncommented in the config.txt
> >> to set the RPi to use HDMI even if the projector is not on at the time
> >> of booting. Is there more information I can provide that would allow
> >> us to figure out what's going on? If you are correct that for some
> >> reason it is just not reading the EDID, is there a way to manually
> >> provide that? I don't know much about it, but it's a static property
> >> of the device (the projector in this case), right?
> >
> > Since I noticed that the physical address is populated properly when
> > the RPi is booted while the projector is turned on, I did that and
> > then tried using the get-edid utility to see if I could read the EDID
> > block and save it to a file. Unfortunately, this didn't work, as the
> > utility reports that there was no EDID available on any of the buses.
> > So once again I am out of ideas.
>
> The EDID also appears in /sys:
>
> /sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid
> /sys/devices/platform/gpu/drm/card1/card1-HDMI-A-2/edid
>
> get-edid works fine on my RPi 4B, so if that doesn't work, then it really
> looks like there is something weird going on with your projector.

Thank you for that. Based on this information with the projector on
during boot, I was able to get the following output from parse-edid. I
did not copy the entire output, just a snippet to indicate that it is
able to get a valid EDID at boot time.

cat /sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid | parse-edid
Checksum Correct

Section "Monitor"
    Identifier "LG PROJECTOR"
    ModelName "LG PROJECTOR"
    VendorName "GSM"
    # Monitor Manufactured week 33 of 2017
    # EDID version 1.3
    # Digital Display
    DisplaySize 1600 900
    Gamma 2.20
    Option "DPMS" "false"
    Horizsync 30-83
    VertRefresh 58-62
    # Maximum pixel clock is 160MHz
    #Not giving standard mode: 640x480, 60Hz

In summary, it seems that at boot time and after waiting an extended
amount of time after turning on the projector using the image-view-on
command, the EDID file is available and valid. So although my
projector may be strange, I am guessing that there must be a way to
manually provide the EDID file, force the physical address, or some
other workaround/solution. However, I'm certainly no expert in this
area so I would defer to those of you who are.

Thanks,
Shawn
