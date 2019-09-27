Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF24CC0CC8
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfI0Unr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:43:47 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:44156 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbfI0Unq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:43:46 -0400
Received: by mail-lj1-f169.google.com with SMTP id m13so3729339ljj.11
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=A0GOiTYcakjAsLgMbhX6Gl6xJaZlx6KbV4y/K1peXEI=;
        b=AR/Au2s+7lQ9sclq3bK8t01/TXhB7sbpX9bS2NjVaOFNB9gM40RN6jNnSE6aCyggh6
         FjvHFo92laJsiTYib53OGFXorKCaGJGq2o7Xd21NwIzvufPNPiIM80dwd1WJWg/JSzYt
         mtw5LG9ns1AnVpi9EpMeEOW0Iqjqo4XR+sda5JqPYXQOG0e5eZ2sebCAmXWYQwpxQkYj
         g1G1uGXyn8lyAULLJeE9bhp+l9lJig6kbWHU0TOi0HHqnQ8GBuTvkwsshHCFRTkYVqDC
         MYIM5h9MGyRmxdjAgngqBKF6LAXXj3KEWd+uPTrz+Tn6T2iSRv8vlCQ+7r9/CNaQxqCG
         MUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=A0GOiTYcakjAsLgMbhX6Gl6xJaZlx6KbV4y/K1peXEI=;
        b=ROC4Na1y5Y/Nf1PHd+/RGjx/duMVmPqYqWzcakUnFUOKuMM2xCdExYD6MpwV4JCZc2
         nvtq3I6ZZWHBD6UnFSUf6kZnKqgTqn6LgT1AagsZ1f0BNWbDiKSzj1/qzKphAEolOQ9Z
         uOLGC0LrfpynRWdhfc1OICTvFzmkhbrQhnTxnerNbKydQvtz37T8Fl7lN5EOf29RxdJT
         WA8fG9si2AZmBL7p4z6xDIQsTtvun+bQvhkfaUEOlGaOXuWcW5KmorzAxrvibOCKOV3b
         LrHYhoDkGBHqvKHbXh5vXmeeuMWGmKQwhJqKSLr95SuhvzzSTuo244DO7C0XFqKmSp23
         z2hQ==
X-Gm-Message-State: APjAAAVj33fkdHRESR55kvowaRZ30sTgsMn0OvF0wtoQN5Wm+UtBz8uF
        zpYX/CSGLInrPx5+Vh8UrkUcqg==
X-Google-Smtp-Source: APXvYqxdsX9RsMQgUiuSw434Z+l3kvSe89jRZ2Qm/1YwlVyDnT+ULtg7zMmNOQeGGubp2NFuaGnsgA==
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr4011053ljj.18.1569617021581;
        Fri, 27 Sep 2019 13:43:41 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id k23sm657897ljk.93.2019.09.27.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 13:43:40 -0700 (PDT)
Date:   Fri, 27 Sep 2019 22:43:40 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
Message-ID: <20190927204340.GB7409@bigcity.dyn.berto.se>
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl>
 <20190829142931.GZ28351@bigcity.dyn.berto.se>
 <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com>
 <20190927190454.GA7409@bigcity.dyn.berto.se>
 <CAJ+vNU2shAbnLO9TY4dtPupLxE4UFvNi9FXoFF4MfPbtbAZo=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+vNU2shAbnLO9TY4dtPupLxE4UFvNi9FXoFF4MfPbtbAZo=g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On 2019-09-27 12:26:40 -0700, Tim Harvey wrote:
> On Fri, Sep 27, 2019 at 12:04 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Tim,
> >
> > Sorry for taking to so long to look at this.
> >
> > On 2019-09-23 15:04:47 -0700, Tim Harvey wrote:
> > > On Thu, Aug 29, 2019 at 7:29 AM Niklas Söderlund
> > > <niklas.soderlund@ragnatech.se> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 2019-08-29 13:43:49 +0200, Hans Verkuil wrote:
> > > > > Adding Niklas.
> > > > >
> > > > > Niklas, can you take a look at this?
> > > >
> > > > I'm happy to have a look at this. I'm currently moving so all my boards
> > > > are in a box somewhere. I hope to have my lab up and running next week,
> > > > so if this is not urgent I will look at it then.
> > > >
> > >
> > > Niklas,
> > >
> > > Have you looked at this yet? Without this patch the ADV7280A does not
> > > output proper BT.656. We tested this on a Gateworks Ventana GW5404-G
> > > which uses the ADV7280A connected to the IMX6 CSI parallel bus. I'm
> > > hoping to see this get merged and perhaps backported to older kernels.
> >
> > I only have access to an adv7180 so I was unable to test this patch.
> > After reviewing the documentation I think the patch is OK if what you
> > want is to unconditionally switch the driver from outputting BT.656-3 to
> > outputting BT.656-4.
> >
> > As this change would effect a large number of compat strings (adv7280,
> > adv7280-m, adv7281, adv7281-m, adv7281-ma, adv7282, adv7282-m) and the
> > goal is to back port it I'm a bit reluctant to adding my tag to this
> > patch as I'm not sure if this will break other setups.
> >
> > From the documentation about the BT.656-4 register (address 0x04 bit 7):
> >
> >     Between Revision 3 and Revision 4 of the ITU-R BT.656 standards,
> >     the ITU has changed the toggling position for the V bit within
> >     the SAV EAV codes for NTSC. The ITU-R BT.656-4 standard
> >     bit allows the user to select an output mode that is compliant
> >     with either the previous or new standard. For further information,
> >     visit the International Telecommunication Union website.
> >
> >     Note that the standard change only affects NTSC and has no
> >     bearing on PAL.
> >
> >     When ITU-R BT.656-4 is 0 (default), the ITU-R BT.656-3
> >     specification is used. The V bit goes low at EAV of Line 10
> >     and Line 273.
> >
> >     When ITU-R BT.656-4 is 1, the ITU-R BT.656-4 specification is
> >     used. The V bit goes low at EAV of Line 20 and Line 283.
> >
> > Do you know what effects such a change would bring? Looking at the
> > driver BT.656-4 seems to be set unconditionally for some adv7180 chips.
> >
> 
> Niklas,
> 
> Quite simply, we have a board that has an ADV7180 attached to the
> parallel CSI of an IMX6 that worked fine with mainline drivers then
> when we revised this board to attach an ADV7280A in the same way
> capture failed to sync. Investigation showed that the NEWAVMODE
> differed between the two.

I understand your problem, the driver configures adv7180 and adv7280 
differently.

> 
> So if the point of the driver is to configure the variants in the same
> way, this patch needs to be applied.

I'm not sure that is the point of the driver. As the driver today 
configures different compatible strings differently. Some as ITU-R 
BT.656-3 and some as ITU-R BT.656-4, I can only assume there is a reason 
for that.

> 
> I would maintain that the adv7180 comes up with NEWAVMODE enabled and
> in order to be compatible we must configure the adv7282 the same.
> 
> The same argument can be made for setting the V bit end position in
> NTSC mode - its done for the adv7180 so for compatible output it
> should be done for the adv7282.

I understand that this is needed to make it a drop-in replacement for 
the adv7180 in your use-case. But I'm not sure it is a good idea for 
other users of the driver. What if someone is already using a adv7282 on 
a board and depends on it providing ITU-R BT.656-3 and the old settings?
If this patch is picked up there use-cases may break.

I'm not sure what the best way forward is I'm afraid. Looking at 
video-interfaces.txt we have a device tree property bus-type which is 
used to describe the bus is a BT.656 bus but not which revision of it.

I'm not really found of driver specific bus descriptions, but maybe this 
is a case where one might consider adding one? Hans what do you think?

> 
> > >
> > > Regards,
> > >
> > > Tim
> > >
> > > > >
> > > > > Regards,
> > > > >
> > > > >       Hans
> > > > >
> > > > > On 8/27/19 11:55 PM, Matthew Michilot wrote:
> > > > > > From: Matthew Michilot <matthew.michilot@gmail.com>
> > > > > >
> > > > > > Captured video would be out of sync when using the adv7280 with
> > > > > > the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
> > > > > > be configured properly to ensure BT.656-4 compatibility.
> > > > > >
> > > > > > An error in the adv7280 reference manual suggested that EAV/SAV mode
> > > > > > was enabled by default, however upon inspecting register 0x31, it was
> > > > > > determined to be disabled by default.
> >
> > The manual I have [1] states that NEWAVMODE is switched off by default.
> > I'm only asking as I would like to know if there is an error in that
> > datasheet or not.
> >
> > 1. https://www.analog.com/media/en/technical-documentation/user-guides/ADV7280_7281_7282_7283_UG-637.pdf
> >
> 
> Table 99 in that document shows NEVAVMODE disabled on power-up
> (0x31=0x02) yet Page 77 shows it enabled at power-up. Looking at an
> actual device we find it is indeed disabled on powerup (0x31=0x02) so
> Table 99 is correct, and Page 77 is not.
> 
> If you look at the ADV7180 datasheet
> (https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7180.pdf)
> Table 105 shows NEWAVMODE enabled by default which is also reflected
> in the register details on Page 91 and is what you find on an actual
> device.
> 
> Regards,
> 
> Tim
> 
> -- 
> 
> 
> CONFIDENTIALITY NOTICE: This email constitutes an electronic 
> communication within the meaning of the Electronic Communications Privacy 
> Act, 18 U.S.C. 2510, and its disclosure is strictly limited to the named 
> recipient(s) intended by the sender of this message. This email, and any 
> attachments, may contain confidential and/or proprietary information. If 
> you are not a named recipient, any copying, using, disclosing or 
> distributing to others the information in this email and attachments is 
> STRICTLY PROHIBITED. If you have received this email in error, please 
> notify the sender immediately and permanently delete the email, any 
> attachments, and all copies thereof from any drives or storage media and 
> destroy any printouts or hard copies of the email and attachments.
> 
>  
> 
> 
> EXPORT COMPLIANCE NOTICE: This email and any attachments may contain 
> technical data subject to U.S export restrictions under the International 
> Traffic in Arms Regulations (ITAR) or the Export Administration Regulations 
> (EAR). Export or transfer of this technical data and/or related information 
> to any foreign person(s) or entity(ies), either within the U.S. or outside 
> of the U.S., may require advance export authorization by the appropriate 
> U.S. Government agency prior to export or transfer. In addition, technical 
> data may not be exported or transferred to certain countries or specified 
> designated nationals identified by U.S. embargo controls without prior 
> export authorization. By accepting this email and any attachments, all 
> recipients confirm that they understand and will comply with all applicable 
> ITAR, EAR and embargo compliance requirements.

-- 
Regards,
Niklas Söderlund
