Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93738C0C0F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 21:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfI0T0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 15:26:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40901 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfI0T0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 15:26:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so6665480wmj.5
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=atZ+HwABnb2WOw4ZqmBj5Du6H7WpAIuoQkORgugSSTc=;
        b=ozQdGjetN1BXbZ1hB2WduySR5IKLJbK1DCVXDwZlC20zKzLbWQDGZb369mZaIGZEhb
         qUdpLkncqV+O0UohGQ7Joysn2YehboUwxPDr4ENnHNOzDe251xkm4TDAiE7r9Os7Zb6Z
         7wbMpY2mQEHvBrFkg5n8LNz116Bo+wu6mr9Ie1o+luh/96C97uiP8TLTAZpt7zGQyRSR
         08kXzx34aQEFBs3GmDP6zOdPtjnkNzhgiLaVHceVMxmdxu0mvY05SQx0MYl2QkOXuKpm
         RZqrpFvz1Kx0qa3lH4zVznZl5r9FO159WnTw5hTgOGA25tsp7u0Q7NQQ/I6xo0R+5Yyg
         3zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=atZ+HwABnb2WOw4ZqmBj5Du6H7WpAIuoQkORgugSSTc=;
        b=R5V4RKtsdnujLdGgtBomcinip6ttNhXDuwxdBpEu8n06k7+nlGACVPe9U7ga3rXVNE
         Vi3A20+IZ9k6n0Jjyj8jIUnd8S7LqvZ3IoSvbxcQwDrURArxymrESFs3ct0MrDUtdaVu
         Zt67CSTtxqYUKe4NpTeke8JPJbJQSxsB4sRFv4TWqLzhOnm7QGVSld3MiKk1TZ+6aTvC
         gaUcOAO2c10LYL5DSPoNRhmijwzeO8DwhL1+fq8/XQ8gPH1T9in1VLe6x/WPdSm2EZcc
         6yEMtG+o4FkKcYtPEoksAHKK0RH0KgXewgqZCSFfX8GPN2mh1D847smeI416QjPZx8xf
         iOqg==
X-Gm-Message-State: APjAAAVfgQRO5Op0s0MqFGPvOXdjVUyuAsWuwSnwSnFKUtuvQr2G2GtR
        hPQ6DWY9LjClQM+ChxOyKmuUO5fp1E/bDDenuhO5x3u0fhgZZksorrH/nEFTu5Me+OCiPiUnj+z
        2nRR+ovurGiP30E/Cl2K7T1mdYs0e4slRx4Du1A==
X-Google-Smtp-Source: APXvYqxVcsdsfkuQby+Sk9cluL4HiCfCaDaADXDEKwMVFcsN9+8HrhYBUWptuW3+RVMtkSXRypFW3TkwF1/8BwS+uEc=
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr8829409wml.14.1569612411650;
 Fri, 27 Sep 2019 12:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl> <20190829142931.GZ28351@bigcity.dyn.berto.se>
 <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com> <20190927190454.GA7409@bigcity.dyn.berto.se>
In-Reply-To: <20190927190454.GA7409@bigcity.dyn.berto.se>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 27 Sep 2019 12:26:40 -0700
Message-ID: <CAJ+vNU2shAbnLO9TY4dtPupLxE4UFvNi9FXoFF4MfPbtbAZo=g@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 12:04 PM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hi Tim,
>
> Sorry for taking to so long to look at this.
>
> On 2019-09-23 15:04:47 -0700, Tim Harvey wrote:
> > On Thu, Aug 29, 2019 at 7:29 AM Niklas S=C3=B6derlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > >
> > > Hi,
> > >
> > > On 2019-08-29 13:43:49 +0200, Hans Verkuil wrote:
> > > > Adding Niklas.
> > > >
> > > > Niklas, can you take a look at this?
> > >
> > > I'm happy to have a look at this. I'm currently moving so all my boar=
ds
> > > are in a box somewhere. I hope to have my lab up and running next wee=
k,
> > > so if this is not urgent I will look at it then.
> > >
> >
> > Niklas,
> >
> > Have you looked at this yet? Without this patch the ADV7280A does not
> > output proper BT.656. We tested this on a Gateworks Ventana GW5404-G
> > which uses the ADV7280A connected to the IMX6 CSI parallel bus. I'm
> > hoping to see this get merged and perhaps backported to older kernels.
>
> I only have access to an adv7180 so I was unable to test this patch.
> After reviewing the documentation I think the patch is OK if what you
> want is to unconditionally switch the driver from outputting BT.656-3 to
> outputting BT.656-4.
>
> As this change would effect a large number of compat strings (adv7280,
> adv7280-m, adv7281, adv7281-m, adv7281-ma, adv7282, adv7282-m) and the
> goal is to back port it I'm a bit reluctant to adding my tag to this
> patch as I'm not sure if this will break other setups.
>
> From the documentation about the BT.656-4 register (address 0x04 bit 7):
>
>     Between Revision 3 and Revision 4 of the ITU-R BT.656 standards,
>     the ITU has changed the toggling position for the V bit within
>     the SAV EAV codes for NTSC. The ITU-R BT.656-4 standard
>     bit allows the user to select an output mode that is compliant
>     with either the previous or new standard. For further information,
>     visit the International Telecommunication Union website.
>
>     Note that the standard change only affects NTSC and has no
>     bearing on PAL.
>
>     When ITU-R BT.656-4 is 0 (default), the ITU-R BT.656-3
>     specification is used. The V bit goes low at EAV of Line 10
>     and Line 273.
>
>     When ITU-R BT.656-4 is 1, the ITU-R BT.656-4 specification is
>     used. The V bit goes low at EAV of Line 20 and Line 283.
>
> Do you know what effects such a change would bring? Looking at the
> driver BT.656-4 seems to be set unconditionally for some adv7180 chips.
>

Niklas,

Quite simply, we have a board that has an ADV7180 attached to the
parallel CSI of an IMX6 that worked fine with mainline drivers then
when we revised this board to attach an ADV7280A in the same way
capture failed to sync. Investigation showed that the NEWAVMODE
differed between the two.

So if the point of the driver is to configure the variants in the same
way, this patch needs to be applied.

I would maintain that the adv7180 comes up with NEWAVMODE enabled and
in order to be compatible we must configure the adv7282 the same.

The same argument can be made for setting the V bit end position in
NTSC mode - its done for the adv7180 so for compatible output it
should be done for the adv7282.

> >
> > Regards,
> >
> > Tim
> >
> > > >
> > > > Regards,
> > > >
> > > >       Hans
> > > >
> > > > On 8/27/19 11:55 PM, Matthew Michilot wrote:
> > > > > From: Matthew Michilot <matthew.michilot@gmail.com>
> > > > >
> > > > > Captured video would be out of sync when using the adv7280 with
> > > > > the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had t=
o
> > > > > be configured properly to ensure BT.656-4 compatibility.
> > > > >
> > > > > An error in the adv7280 reference manual suggested that EAV/SAV m=
ode
> > > > > was enabled by default, however upon inspecting register 0x31, it=
 was
> > > > > determined to be disabled by default.
>
> The manual I have [1] states that NEWAVMODE is switched off by default.
> I'm only asking as I would like to know if there is an error in that
> datasheet or not.
>
> 1. https://www.analog.com/media/en/technical-documentation/user-guides/AD=
V7280_7281_7282_7283_UG-637.pdf
>

Table 99 in that document shows NEVAVMODE disabled on power-up
(0x31=3D0x02) yet Page 77 shows it enabled at power-up. Looking at an
actual device we find it is indeed disabled on powerup (0x31=3D0x02) so
Table 99 is correct, and Page 77 is not.

If you look at the ADV7180 datasheet
(https://www.analog.com/media/en/technical-documentation/data-sheets/ADV718=
0.pdf)
Table 105 shows NEWAVMODE enabled by default which is also reflected
in the register details on Page 91 and is what you find on an actual
device.

Regards,

Tim

--=20


CONFIDENTIALITY NOTICE: This email constitutes an electronic=20
communication within the meaning of the Electronic Communications Privacy=
=20
Act, 18 U.S.C. 2510, and its disclosure is strictly limited to the named=20
recipient(s) intended by the sender of this message. This email, and any=20
attachments, may contain confidential and/or proprietary information. If=20
you are not a named recipient, any copying, using, disclosing or=20
distributing to others the information in this email and attachments is=20
STRICTLY PROHIBITED. If you have received this email in error, please=20
notify the sender immediately and permanently delete the email, any=20
attachments, and all copies thereof from any drives or storage media and=20
destroy any printouts or hard copies of the email and attachments.

=C2=A0


EXPORT COMPLIANCE NOTICE: This email and any attachments may contain=20
technical data subject to U.S export restrictions under the International=
=20
Traffic in Arms Regulations (ITAR) or the Export Administration Regulations=
=20
(EAR). Export or transfer of this technical data and/or related information=
=20
to any foreign person(s) or entity(ies), either within the U.S. or outside=
=20
of the U.S., may require advance export authorization by the appropriate=20
U.S. Government agency prior to export or transfer. In addition, technical=
=20
data may not be exported or transferred to certain countries or specified=
=20
designated nationals identified by U.S. embargo controls without prior=20
export authorization. By accepting this email and any attachments, all=20
recipients confirm that they understand and will comply with all applicable=
=20
ITAR, EAR and embargo compliance requirements.
