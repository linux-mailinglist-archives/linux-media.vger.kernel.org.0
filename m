Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538755A1399
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 16:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237392AbiHYO3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 10:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbiHYO3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 10:29:35 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1CB5E666
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:29:32 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id u6so10887119qvp.5
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=wUQ3T0/i4Dq07WsQD8Dl5V/0aNLuBJ4rglXmTCF8+wY=;
        b=Iy6s2F83rOeArfptXQWVw0xbQ7DKhneQ2azqI6fCfXt/aYOvx+AiJuKm0z3Ibr68Rq
         2eqCLlcvP5PxThwKG4ZtW/Z7OsWPKT6KCRAbAFGofbUyb+qqthV5zft/Ht9TCBJcnMbK
         8rYZ1eWslav7W++C65xIdrNemhZOy3WjUkI8EvcJhMTfUpzzuEO9HyHcMxrwWlyb7jo0
         BUWxFIlYht4tVGzl1OjHSD4XHWe1dQKbRWvYglqeEKDFneUGvP2EuqwhYvniLy611+qw
         BrzzQJL9osTbC+jCiH+pIEddvGHFDucrvbkqhkTu4ZfboJtLqpv6nU9dTZDgOIPnZ+wd
         hrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=wUQ3T0/i4Dq07WsQD8Dl5V/0aNLuBJ4rglXmTCF8+wY=;
        b=tFzc0B2V+pjUua9ghUUObHYWHjc6iSNqj+46GQD1XtlkN9mlbeJ2iqOFpcD1K4Y1oY
         n4hgdLqdmbrFuHyzuSHlA/VvVdeedNxBzVuH5i0wpJIqYGGp9yA6HBCFeVqsm9DFSqYi
         STOyVUsRVEi1e18jjqgubdq1Xe9DBK5gygXDzEUBlNgTTzd8PqH33JEPWTfa1cWoJYUj
         guS8EFAzJ2Cs+nFX3EgQjJ1CtO+ZoERfzPJXdKSJWapMo/bUERqQkN04kEBXnn+BItsg
         pPM6BBLMCqKtjuoOHrGxjBhAdCuJQaezdiyzOOlw0x+5VGCmVLpdfn0hbWJfsfyJ4us4
         UMzw==
X-Gm-Message-State: ACgBeo3bk6q0tlwRadOeUJN7HjA/xliAO/TFrP0Dee3iIm7m00x+eqeh
        43NSu7RQkjlXQWEAKxDRAm7BZQ==
X-Google-Smtp-Source: AA6agR5zRvWHTI0rfQjguJHqcpReGwgUISQV8ZAKa0Z0YEqq9uo+bIlNXNErGdSvZd+g2yExNVYYwQ==
X-Received: by 2002:ad4:5f4f:0:b0:496:dc3c:7847 with SMTP id p15-20020ad45f4f000000b00496dc3c7847mr3910247qvg.80.1661437771233;
        Thu, 25 Aug 2022 07:29:31 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id cf17-20020a05622a401100b0034358bfc3c8sm14590143qtb.67.2022.08.25.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 07:29:30 -0700 (PDT)
Message-ID: <f6913d2fd8967ff9c778e5f33e1563f5aef8adf3.camel@ndufresne.ca>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Thu, 25 Aug 2022 10:29:29 -0400
In-Reply-To: <4693bb1d1b0234b9e9669a48edb4a52ba7adf4da.camel@ndufresne.ca>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
         <4693bb1d1b0234b9e9669a48edb4a52ba7adf4da.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mercredi 24 ao=C3=BBt 2022 =C3=A0 14:13 -0400, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> Hi all,
>=20
> Le mardi 23 ao=C3=BBt 2022 =C3=A0 12:53 +0200, Hans Verkuil a =C3=A9crit=
=C2=A0:
> > Hi all,
> >=20
> > Here is some more information about the Media Summit:
> >=20
> > Date: Monday September 12
> > Time: 8:45-18:00
> > Location: Convention Centre Dublin
> > Room: The Liffey B - Part 1 (subject to change)
> > Sponsored by: Cisco Systems Norway, Collabora and the Kodi Foundation
>=20
> [...]
>=20
> > Draft Agenda V2:
> >=20
> >  8:40 Getting settled
> >  9:00 Introduction
> >  9:10 Hans: Presentation on CTA-861 & edid-decode
> >  9:25 Nicolas: Stateless encoder progress
>=20
> Took me a while to wakeup on that one, I didn't have much travel options =
and I'm
> landing on the 12th but only at 11:30am. Do you mind moving this one in t=
he
> afternoon ?

I have managed to moved my flight a day earlier, so no need to change the
schedule anymore.

See you all in Dublin,
Nicolas

>=20
> > 10:00 Ricardo: Introduce ChromeOS camera project
> >=20
> > 11:00 Break
> >=20
> > 11:15 Kieran: Fault tolerance
> >=20
> >   I raised this in the past when we first started hitting the issue on
> >   Renesas platforms with multiple cameras in a single media graph, but =
now
> >   I think it's become more critical with desktop / laptop devices that =
are
> >   hitting the issue (i.e. the IPU3).
> >=20
> >   Summary of issue:
> >=20
> >   - Multiple cameras that can function independently successfully, are
> >     prevented from functioning or fully probing by V4L2 if one componen=
t
> >     of another camera fails to load or probe.
> >=20
> >     If Camera A has a VCM, and Camera B does not, Camera B will not be
> >     available at all if Camera A's VCM is not fully probed, even though
> >     Camera B can be fully functional and complete.
> >=20
> >     Even if Camera A does not have the VCM probed, it may still functio=
n
> >     successfully (with a fixed focal position) - but our current
> >     implementation will mean that it will not even be available to
> >     capture images.
> >=20
> >   We talked about this quite a long time ago, and I believe the general
> >   consensus was that we can have events on the media graph. But
> >   unfortunately at the time, there was no development scheduled on that=
,
> >   and it wasn't something I was able to continue at the time.
> >=20
> >   I'd like to bring it up to refresh the topic, and see if we can make
> >   some progress as it's now affecting more general devices.
> >=20
> > 11:45 Jacopo: Representing addition sensor processing stages.
> >=20
> >   How to represent additional processing stages that happens
> >   on the sensor side, mostly additional subsampling/cropping that happe=
n
> >   between the analogue cropping on the full pixel array and the final
> >   image sent on the wire.
> >=20
> >   https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2v=
ADevuXZdXQdhWpSmow@mail.gmail.com/
> >=20
> >   Dave made a good introduction of the issue his email which got
> >   largely unanswered.
> >=20
> >   The issue is particularly relevant for RAW sensors, where applying
> >   subsampling has an impact on the sensor's sensitivity and requires
> >   to adjust the gains and exposure accordingly.
> >=20
> >   The V4L2 selection API falls short on this and the only other
> >   solution I am aware of is registering additional subdevices as the
> >   CCS driver does.
> >=20
> > 12:30 Lunch
> >=20
> > 13:30 Dave: On-sensor temperature reporting.
> >=20
> >   Thread started by Benjamin at
> >   https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.m=
ugnier@foss.st.com/
> >   but no resolution over using hwmon API or V4L2 control. If hwmon
> >   then we need Media Controller framework to tie the sensor and thermal
> >   device together.
> >=20
> >   It's recently been queried for IMX477 with the Pi
> >   (https://github.com/raspberrypi/libcamera/issues/19), but it will
> >   apply to many sensors.
> >=20
> > 13:50 Dave: Synchronising sensors for stereoscopic operation.
> >=20
> >   How should that be configured? Allowing configuration from userspace
> >   would allow sensors to be operated independently which can be useful =
for
> >   test purposes, or should it be enforced from DT/ACPI? Do we set a def=
ault
> >   configuration for each sensor from DT/ACPI and then allow userspace t=
o
> >   override should it wish?
> >=20
> > 14:10 Dave: Lens drivers.
> >=20
> >   Each driver will have a "useful" range which is effectively dictated =
by
> >   the overall module. Should that be defined via DT as it is a feature =
of
> >   the platform, or leave the driver totally generic and expect userspac=
e
> >   to do something sensible?
> >=20
> >   In the case of simple systems without libcamera, do we set default fo=
r
> >   V4L2_CID_FOCUS_ABSOLUTE to a sensible hyperfocal distance, and can
> >   that again be defined in DT as it is defining the hardware?
> >=20
> > 14:30 Dave: Controlling sensor GPIO outputs.
> >=20
> >   Controlling sensor GPIO outputs for things such as flash triggers,
> >   vsync, frame start/end, exposure start/end, etc.
> >=20
> >   There is a huge range of features available so do we have any hope of
> >   standardising some of it, or do we end up hiding these away in the
> >   drivers with custom DT bindings to configure them? If we accept that
> >   there will be variation, can we vaguely standardise what those
> >   bindings look like? Or should these be V4L2 controls as things like
> >   pulse widths may want to be adjusted by userspace?
> >=20
> > 15:00 Break
> >=20
> > 15:30 Jacopo: Reconcile handling of regulator, gpios and clock on OF an=
d ACPI platforms.
> >=20
> >   We recently got a few series trying to reconcile handling of regulato=
rs,
> >   gpios and clocks on OF and ACPI platforms all of them doing the usual
> >   "similar but slightly different" thing:
> >=20
> >   https://lore.kernel.org/linux-media/20220425061022.1569480-1-paul.eld=
er@ideasonboard.com/
> >   https://lore.kernel.org/linux-media/20220329090133.338073-1-jacopo@jm=
ondi.org/
> >   https://lore.kernel.org/linux-media/20220509143226.531117-1-foss+kern=
el@0leil.net/
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D0c2c7a1e0d69221b9d489bfd8cf53262d6f82446
> >=20
> >   ACPI and OF handles clocks slightly differently, and it is not clear
> >   to me if ACPI based platform need explicit handling of
> >   clocks/regulator or ACPI does "the right thing" by itself (I'm
> >   afraid the answer is actually "it depends"). I'm ACPI illiterate
> >   so I cannot propose anything meaningful but if anyone is interested
> >   in discussing this further this might be a good time to do so ?
> >=20
> >=20
> > 16:00 Laurent: V4L2 streams series.
> >=20
> >   I'd like to discuss the V4L2 streams series, in particular how to
> >   upstream the parts that won't be upstream yet by mid-September.
> >   Discussing the next steps would also be useful, as there's lots we co=
uld
> >   build on top.
> >=20
> > 16:30 Laurent: How can we finalize conversion of v4l-utils to meson?
> >=20
> > 16:45-18:00 Anything else?
> >=20
> > Regards,
> >=20
> > 	Hans
>=20

