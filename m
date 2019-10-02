Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7F14C9383
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 23:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbfJBVbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 17:31:17 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34696 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfJBVbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 17:31:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id y135so5822244wmc.1
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 14:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D56EsFq+yogK9cZiFVw/DPVTGWBKef8F8jcSR/AKQ3g=;
        b=ndXGQW8dDRe7QL3ebDDBLuk+VCzPs2kCAhtNkD6GN7Id6Nm107AddEb5XrRS6xOGs5
         3ewGtj1pU625UJJaF89Fi7YTjOkMNSwKq80EtosEuFY6nlPD2YEqZAbgZVheDMYUDh7X
         1YcsZPJZ3z8ITpVWHpZNqJglyvmrL42bVATwKnjZdLXBVFMIpNuvFcGL0hTt8dvdcAlP
         XPNAbid0yeHa+Vb27VSVWI3ZAnWhkbQJ3NiCa6TCDcIFSemhhI/qJmB2EzTjALlEe3ER
         Spy4z4mT4mZRXKmGJBdpOPM0RvFKv7Q0Xm176Ps/A0nEfgnTTvj9MEn8jzb7J7YLnDg0
         JQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D56EsFq+yogK9cZiFVw/DPVTGWBKef8F8jcSR/AKQ3g=;
        b=kE7cFcj8DM0Ga3N0LXTSUIbdjfK7ON8ZQh3M+Dyvm28fvtzZ7qIbHxB4hudXQ9VUoU
         noeM1/wboWjqD7ynP0wE9wzOD3XsKbKvH6UVPlIlS8zy9K6U0IBbPJ9893ne0KYzxywc
         peXkXEbpsZA2M7/RLWzZERMMqLdJoyvFzskhBmTqB2CWjNxf6xO7VsftkvU9hWibzN/L
         wLXKtZ0v8CmgpBUHKW2PBfME853LUylG90ndtBgtPerBxbnHs6C/lhCFGxb1wIvftweA
         J5jV7274qO2+rnRryPeBCCax4bYTIYNhLEKt08SC+rK8JuBCqh9iK/2lR/D4apLI6Hrc
         PGFA==
X-Gm-Message-State: APjAAAWJTEYduKx1ce4i47g/MQA8xfd2L+aphou7IkczJRGyqYyq3UT9
        VgrTx6/wH+ajRKbRU+Wxuqy6tVK0w1mgva876+aQ9Q==
X-Google-Smtp-Source: APXvYqz2QZS7BdayHg+2SnsBWPxtjj5tVeN8+qLN0rDo7mEdZlszS3Ep4dzs9PAR6oOiJROuk6NKNpPxhN37ESfhQ9c=
X-Received: by 2002:a05:600c:2059:: with SMTP id p25mr4659990wmg.50.1570051871886;
 Wed, 02 Oct 2019 14:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl> <20190829142931.GZ28351@bigcity.dyn.berto.se>
 <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com>
 <20190927190454.GA7409@bigcity.dyn.berto.se> <CAJ+vNU2shAbnLO9TY4dtPupLxE4UFvNi9FXoFF4MfPbtbAZo=g@mail.gmail.com>
 <20190927204340.GB7409@bigcity.dyn.berto.se>
In-Reply-To: <20190927204340.GB7409@bigcity.dyn.berto.se>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 2 Oct 2019 14:31:00 -0700
Message-ID: <CAJ+vNU2=cXvi3f67igJX03rONodaPkuSRPS=x9WPSxwLnOEUvA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Matthew Michilot <matthew.michilot@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 1:43 PM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hi Tim,
>
> On 2019-09-27 12:26:40 -0700, Tim Harvey wrote:
> > On Fri, Sep 27, 2019 at 12:04 PM Niklas S=C3=B6derlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > >
> > > Hi Tim,
> > >
> > > Sorry for taking to so long to look at this.
> > >
> > > On 2019-09-23 15:04:47 -0700, Tim Harvey wrote:
> > > > On Thu, Aug 29, 2019 at 7:29 AM Niklas S=C3=B6derlund
> > > > <niklas.soderlund@ragnatech.se> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On 2019-08-29 13:43:49 +0200, Hans Verkuil wrote:
> > > > > > Adding Niklas.
> > > > > >
> > > > > > Niklas, can you take a look at this?
> > > > >
> > > > > I'm happy to have a look at this. I'm currently moving so all my =
boards
> > > > > are in a box somewhere. I hope to have my lab up and running next=
 week,
> > > > > so if this is not urgent I will look at it then.
> > > > >
> > > >
> > > > Niklas,
> > > >
> > > > Have you looked at this yet? Without this patch the ADV7280A does n=
ot
> > > > output proper BT.656. We tested this on a Gateworks Ventana GW5404-=
G
> > > > which uses the ADV7280A connected to the IMX6 CSI parallel bus. I'm
> > > > hoping to see this get merged and perhaps backported to older kerne=
ls.
> > >
> > > I only have access to an adv7180 so I was unable to test this patch.
> > > After reviewing the documentation I think the patch is OK if what you
> > > want is to unconditionally switch the driver from outputting BT.656-3=
 to
> > > outputting BT.656-4.
> > >
> > > As this change would effect a large number of compat strings (adv7280=
,
> > > adv7280-m, adv7281, adv7281-m, adv7281-ma, adv7282, adv7282-m) and th=
e
> > > goal is to back port it I'm a bit reluctant to adding my tag to this
> > > patch as I'm not sure if this will break other setups.
> > >
> > > From the documentation about the BT.656-4 register (address 0x04 bit =
7):
> > >
> > >     Between Revision 3 and Revision 4 of the ITU-R BT.656 standards,
> > >     the ITU has changed the toggling position for the V bit within
> > >     the SAV EAV codes for NTSC. The ITU-R BT.656-4 standard
> > >     bit allows the user to select an output mode that is compliant
> > >     with either the previous or new standard. For further information=
,
> > >     visit the International Telecommunication Union website.
> > >
> > >     Note that the standard change only affects NTSC and has no
> > >     bearing on PAL.
> > >
> > >     When ITU-R BT.656-4 is 0 (default), the ITU-R BT.656-3
> > >     specification is used. The V bit goes low at EAV of Line 10
> > >     and Line 273.
> > >
> > >     When ITU-R BT.656-4 is 1, the ITU-R BT.656-4 specification is
> > >     used. The V bit goes low at EAV of Line 20 and Line 283.
> > >
> > > Do you know what effects such a change would bring? Looking at the
> > > driver BT.656-4 seems to be set unconditionally for some adv7180 chip=
s.
> > >
> >
> > Niklas,
> >
> > Quite simply, we have a board that has an ADV7180 attached to the
> > parallel CSI of an IMX6 that worked fine with mainline drivers then
> > when we revised this board to attach an ADV7280A in the same way
> > capture failed to sync. Investigation showed that the NEWAVMODE
> > differed between the two.
>
> I understand your problem, the driver configures adv7180 and adv7280
> differently.
>
> >
> > So if the point of the driver is to configure the variants in the same
> > way, this patch needs to be applied.
>
> I'm not sure that is the point of the driver. As the driver today
> configures different compatible strings differently. Some as ITU-R
> BT.656-3 and some as ITU-R BT.656-4, I can only assume there is a reason
> for that.
>
> >
> > I would maintain that the adv7180 comes up with NEWAVMODE enabled and
> > in order to be compatible we must configure the adv7282 the same.
> >
> > The same argument can be made for setting the V bit end position in
> > NTSC mode - its done for the adv7180 so for compatible output it
> > should be done for the adv7282.
>
> I understand that this is needed to make it a drop-in replacement for
> the adv7180 in your use-case. But I'm not sure it is a good idea for
> other users of the driver. What if someone is already using a adv7282 on
> a board and depends on it providing ITU-R BT.656-3 and the old settings?
> If this patch is picked up there use-cases may break.
>
> I'm not sure what the best way forward is I'm afraid. Looking at
> video-interfaces.txt we have a device tree property bus-type which is
> used to describe the bus is a BT.656 bus but not which revision of it.
>
> I'm not really found of driver specific bus descriptions, but maybe this
> is a case where one might consider adding one? Hans what do you think?
>

Niklas / Hans,

Thanks for the feedback. I thought that the goal of any 'compatible'
device should be to be configured identically. If that's not the case
then we need more discussion for sure.

There are 3 registers being changed by this patch which do the
following for the adv7182/adv7280/adv7181/adv7282:
- change output from BT656-3 to BT656-4 (as the driver does this for adv718=
0)
- enable NEWAVMODE meaning EAV/SAV codes are configurable (new code
but adv7180 enables this by power-on default and adv7280 does not)
- configure V bit end count (to be what adv7180 uses; this isn't used
if NEWAVMODE is disabled)

So its not only the question of how to decide to configure BT656-3 vs
BT656-4 but how to deal with differences in the EAV/SAV codes. I'm not
an expert so I don't know what configuration is BT656 compliant and of
course without knowing who is using these devices we can't tell what
would break even if we fix something that may be misconfigured already
(or even completely unused).

I'm cc'ing Steve Longerbeam as well as at one point he was suggesting
adding a 'newavmode' property to the adv7180 bindings and likely
recalls the discussions there.

Tim
