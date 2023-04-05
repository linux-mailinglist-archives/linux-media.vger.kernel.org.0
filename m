Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C0E6D85DF
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 20:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjDESUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 14:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbjDESUX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 14:20:23 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD7976A2
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 11:20:13 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id m6-20020a4ae846000000b0053b9059edd5so5795677oom.3
        for <linux-media@vger.kernel.org>; Wed, 05 Apr 2023 11:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680718812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9jOIe9jAULaqUqaJ+7wO9sggYCb5mf0un4+3YcFzBY=;
        b=feJWB2vDo0pj8BmkRhsX5vPNLb3T7czB7kEX65Vvw7xND6k4cmrnRnNVK34T3JnvHk
         LOK7/AFxPif85Dx2VywU7fN2fHS8cUzUvgpUwMBKpLzeJ8Gfi6op9qUcKiBTz7JKmi+l
         bbKtSwdCpqIkUWWn3XqQpxm3CfjzB+fJN5/PWFCeARXLwt+oEQD0Ww254xU9QHgcsGNn
         oIGqEy6SkcXDs3DdrF2nnEG5e9TQczsgUsFFQmEN5sceKi8TC6iIg6lP9sMO2JU2Y0KK
         lRWQ9pCEVnTWZSxNvfJHwHkXE3U1divoZ5uKEZgEQe/0Jil+L7HFZGYV9KxUHPRtBv5c
         Kr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680718812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9jOIe9jAULaqUqaJ+7wO9sggYCb5mf0un4+3YcFzBY=;
        b=5RSfl056y4XyNe4UT2B7s1P93OMVunpehqArwDnZ6+YqPH7ltDoGT1TzCz6upPs8jA
         +8NDlAJldn4MPHct35FsJrTDTrVbvB253L0KqKtovM83dsV1Rr4SResE0uTc5ctOx3mF
         RieTbS3fPTHsCyiAWy9wLpl2yIMco90LfEcvJuu76W+Bb9k68eAcZLWqN9anlCcXCzis
         tqpzMs/EM3EytW/9FUY/lpWLc1l2ZaktW6PRkSJJZrTANyL5Y68xR+T3i5gbvZ//Ua6s
         9rxHLGf0jDa/gSNoSWazlCEi1BbT+zA49sal3udKjA7LRv6eYnL7Xlwltk7Rd1ebGIjV
         ZPKA==
X-Gm-Message-State: AAQBX9egDL+blG3l2uJhJhrQYu4WFJ87JDlAbdjUO7hQOYUpoI0uUoOL
        VMOySc6YRb9eF56o9EsGHwVS8BBCPQ77I1kXljel/xuBusU=
X-Google-Smtp-Source: AKy350Y8UNNWKGZvBANAPqfOOF2aeTG4xnJjdhnIyyTrMvZWm+Hd39dm3MvtEUeaJJYCksoE6qMRy5DifzqcZkMtpcE=
X-Received: by 2002:a4a:e792:0:b0:53b:4b20:b0a7 with SMTP id
 x18-20020a4ae792000000b0053b4b20b0a7mr2478516oov.1.1680718812224; Wed, 05 Apr
 2023 11:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
 <2abc1b2f-3f7d-c72a-3c3e-7fde8e3e9c5e@xs4all.nl> <CAC6x6itstZMNpA0=izPDkhNh3RVW=FJz+zr-H3htM0Lqh+mbXQ@mail.gmail.com>
 <CAC6x6it0_DU1dTO4-F-6_4akyL-ZO-JwS5CQOmaM3+k+Kon07A@mail.gmail.com>
 <6dabaf27-1d68-b6e5-12c3-cbef79867fc1@xs4all.nl> <CAC6x6iuOvHuRC7cUzA4N0TR2Ue6g55buhQ1-pD0_i1VvBaSaiw@mail.gmail.com>
In-Reply-To: <CAC6x6iuOvHuRC7cUzA4N0TR2Ue6g55buhQ1-pD0_i1VvBaSaiw@mail.gmail.com>
From:   Shawn Lindberg <shawn.lindberg@gmail.com>
Date:   Wed, 5 Apr 2023 13:20:01 -0500
Message-ID: <CAC6x6iuhVXZoje4WF6FFDxcRgjahR8NPfCugTKwik8vjGXY9gQ@mail.gmail.com>
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

On Sat, Apr 1, 2023 at 3:55=E2=80=AFPM Shawn Lindberg <shawn.lindberg@gmail=
.com> wrote:
>
> On Sat, Apr 1, 2023 at 3:17=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
> >
> > On 31/03/2023 22:23, Shawn Lindberg wrote:
> > > On Wed, Mar 29, 2023 at 2:56=E2=80=AFPM Shawn Lindberg <shawn.lindber=
g@gmail.com> wrote:
> > >>
> > >> On Tue, Mar 28, 2023 at 2:58=E2=80=AFAM Hans Verkuil <hverkuil@xs4al=
l.nl> wrote:
> > >>>
> > >>>> cec-ctl -d0 --tv --cec-version-1.4
> > >>>
> > >>> That's wrong, the RPi is a Playback device, not a TV. So use --play=
back instead.
> > >>>
> > >>> You should also add this line to the config.txt:
> > >>>
> > >>> hdmi_ignore_cec=3D1
> > >>>
> > >>> otherwise the RPi's firmware tries to process CEC messages as well.
> > >>
> > >> Oh, I thought that the TV/playback command was indicating what sort =
of
> > >> device the connected device is. This wasn't clear from the man page,
> > >> either. Thank you for that. I made the change to config.txt and
> > >> strangely when the RPi rebooted (I have it set to do this
> > >> automatically once a day) the projector automatically turned on. I
> > >> have never experienced this before.
> > >
> > > Further update on this. I continue to see the projector automatically
> > > power on every time the RPi does its daily reboot, so I think I may
> > > have to remove the hdmi_ignore_cec from the config.txt. Especially
> > > since I can't figure out how to reliably shut the projector back off
> > > again.
> >
> > From what I can tell, the Raspberry Pi doesn't transmit anything over C=
EC
> > at boot time, regardless of whether hdmi_ignore_cec is present or not.
> > That's with a Raspberry Pi 4B. It might be different for an RPi 3.
>
> That is strange. I am also using a Raspberry Pi 4B. I do have the
> following changes to my config.txt:
>
> # uncomment if hdmi display is not detected and composite is being output
> hdmi_force_hotplug=3D1
>
> # uncomment to force a specific HDMI mode (this will force VGA)
> hdmi_group=3D1
> hdmi_mode=3D16
>
> # Additional line added to prevent firmware from processing CEC messages.
> hdmi_ignore_cec=3D1
>
>
> > >>>> During this time, if I try to poll the projector, it will succeed.
> > >>>> However, if I monitor events, after a significant amount of time
> > >>>> (appears to be greater than 20 minutes, although this is difficult=
 to
> > >>>> verify because of how long it takes) I go will eventually see the
> > >>>> following:
> > >>>>
> > >>>> Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
> > >>>>     Timestamp: 30981.428s
> > >>>
> > >>> Now it appears to be able to read the EDID again and it has a valid
> > >>> physical address.
> > >>>
> > >>>> Transmitted by Specific to Specific (14 to 14): POLL
> > >>>>     Tx, Not Acknowledged (4), Max Retries
> > >>>>     Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4)=
, Max Retries
> > >>>>
> > >>>> Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
> > >>>>     Timestamp: 30981.561s
> > >>>> Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0=
x84):
> > >>>>     phys-addr: 1.0.0.0
> > >>>>     prim-devtype: tv (0x00)
> > >>>>     Sequence: 22 Tx Timestamp: 30981.696s
> > >>>> Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87)=
:
> > >>>>     vendor-id: 3075 (0x00000c03)
> > >>>>     Sequence: 23 Tx Timestamp: 30981.835s
> > >>>> Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
> > >>>>     abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
> > >>>>     reason: invalid-op (0x03)
> > >>>>     Sequence: 0 Rx Timestamp: 30981.949s
> > >>>> Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
> > >>>>     Sequence: 0 Rx Timestamp: 30982.026s
> > >>>> Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
> > >>>>     name: TV
> > >>>>     Sequence: 24 Tx Timestamp: 30982.137s
> > >>>>
> > >>>> After this point in time the standby command will succeed and the
> > >>>> projector will turn off. It's quite inconvenient to have to wait o=
ver
> > >>>> 20 minutes to turn the projector back off again. Any idea how I ca=
n
> > >>>> shorten this delay?
> > >>>
> > >>> There is something weird about your setup and EDID. I can't really =
tell
> > >>> what it is.
> > >>
> > >> After making the above changes and retesting, the behavior didn't
> > >> change. I still get the device not connected message and the invalid
> > >> physical address when I try to do standby. I should also note that o=
ne
> > >> way around this issue is to reboot the RPi. For some reason that see=
ms
> > >> to get around the long delay in getting the physical address.
> > >>
> > >> I don't know what would be strange about my set up other than the
> > >> projector itself and a couple of lines I uncommented in the config.t=
xt
> > >> to set the RPi to use HDMI even if the projector is not on at the ti=
me
> > >> of booting. Is there more information I can provide that would allow
> > >> us to figure out what's going on? If you are correct that for some
> > >> reason it is just not reading the EDID, is there a way to manually
> > >> provide that? I don't know much about it, but it's a static property
> > >> of the device (the projector in this case), right?
> > >
> > > Since I noticed that the physical address is populated properly when
> > > the RPi is booted while the projector is turned on, I did that and
> > > then tried using the get-edid utility to see if I could read the EDID
> > > block and save it to a file. Unfortunately, this didn't work, as the
> > > utility reports that there was no EDID available on any of the buses.
> > > So once again I am out of ideas.
> >
> > The EDID also appears in /sys:
> >
> > /sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid
> > /sys/devices/platform/gpu/drm/card1/card1-HDMI-A-2/edid
> >
> > get-edid works fine on my RPi 4B, so if that doesn't work, then it real=
ly
> > looks like there is something weird going on with your projector.
>
> Thank you for that. Based on this information with the projector on
> during boot, I was able to get the following output from parse-edid. I
> did not copy the entire output, just a snippet to indicate that it is
> able to get a valid EDID at boot time.
>
> cat /sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid | parse-edid
> Checksum Correct
>
> Section "Monitor"
>     Identifier "LG PROJECTOR"
>     ModelName "LG PROJECTOR"
>     VendorName "GSM"
>     # Monitor Manufactured week 33 of 2017
>     # EDID version 1.3
>     # Digital Display
>     DisplaySize 1600 900
>     Gamma 2.20
>     Option "DPMS" "false"
>     Horizsync 30-83
>     VertRefresh 58-62
>     # Maximum pixel clock is 160MHz
>     #Not giving standard mode: 640x480, 60Hz
>
> In summary, it seems that at boot time and after waiting an extended
> amount of time after turning on the projector using the image-view-on
> command, the EDID file is available and valid. So although my
> projector may be strange, I am guessing that there must be a way to
> manually provide the EDID file, force the physical address, or some
> other workaround/solution. However, I'm certainly no expert in this
> area so I would defer to those of you who are.

I finally found some more time to experiment with this, and I tried
saving a copy of the EDID while it was available after the machine
rebooted and the projector automatically turned on. Unsurprisingly,
after I turned the projector off using standby and then turned it back
on using image-view-on, the EDID was not available from
/sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid.

So I tried the following command to see if I could get the physical
address to update from the saved EDID.

cec-ctl -d0 -t0 -T --phys-addr-from-edid projector_edid
        CEC_ADAP_G_CAPS returned 0 (Success)
The CEC adapter doesn't allow setting the physical address manually,
ignore this option.

        CEC_ADAP_S_PHYS_ADDR returned -1 (Inappropriate ioctl for device)
        CEC_ADAP_G_PHYS_ADDR returned 0 (Success)
        CEC_ADAP_G_LOG_ADDRS returned 0 (Success)
        CEC_ADAP_G_CONNECTOR_INFO returned 0 (Success)

I'm not really sure why this would be the case.
