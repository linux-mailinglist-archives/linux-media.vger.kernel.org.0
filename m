Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B062B39E137
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 17:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhFGPvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 11:51:39 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:36527 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhFGPvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 11:51:38 -0400
Received: by mail-pl1-f171.google.com with SMTP id x10so8922185plg.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jun 2021 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1cSDyRqs4/waFFpp4XK4bTohmPsgMHDek8V3s+9aWfY=;
        b=XWcJ8Pq86ApEWUqDjcMFt4Szfu0Nm0jhb7uS/2rKv98XxQ+xxglNjfhSE8FoDQoNEw
         fViBV2ca32xN8SjCgrGv6tSSLoXEnD51WyXXWAX2r+5l17aXo56RfMJkjrX4/+UV//3H
         tNF1di6YqKjDDUqGgn/yaIwnVWu2Ps4RygiRMXvFrpheucbHR+6720sYEkP1q48gQ0SQ
         2pttc+Z+rJNdbsh1xbi2OhLsJJjPA64jPuy90nPnq8JYjfNnJz3RJr2twUeyBvKwXX+e
         gqxw/nWFjNuF7JGWOZgpA2fZsuScGx996opkk1yHJkzehKS+q94wNAtT1dZEcwIlk0xC
         w6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1cSDyRqs4/waFFpp4XK4bTohmPsgMHDek8V3s+9aWfY=;
        b=I9P47/PNf/efv3b1gBcfFbUO1T2g/vKZzu6ubeMMnuin3XrH4go8IbzHjiAaTGi97E
         rgyXxC4JE9SrFVv9r2n9FY5eDJC9BFL4L8oK2y1XH3mXbaXiDsJ7BrkI+VM+kac69PUZ
         hIR7r/UpcEVIyW29IneovdLd7NFGKi72EgQ+XUtePF4FoB4fE85xN/I3h1V5K+g3rYQn
         YwCuwZTdBXpwX1hL4idgGUzr4zp59ISRxz1wbTTqEQlrPJxJI8hsr35DG/xq7h8AaU3i
         J7OAcoZnRVX7BqHlOTFGz5BOvgsVs7p5ZTGTcMWkxh1Yj+xlbl4QbnekuzxVkqACIHrh
         RPrQ==
X-Gm-Message-State: AOAM5331vhN9/+dtZALEXWJaMCvA91cR/M0z0mZ4fW7X7FhOl7JTJu5A
        sNsC2lv7RFtaGRVN0VUdnIcbR9MBT3lDcQJajQgBdQ==
X-Google-Smtp-Source: ABdhPJxGKfRV0ji63pJPz9hHFaeq12NxQqk8execz6yLGOqYuB9j2xv+69NDpQc+eKeCiqFKb8blcRd0GJXmxAnv7W0=
X-Received: by 2002:a17:903:1241:b029:10f:ff8c:a3fe with SMTP id
 u1-20020a1709031241b029010fff8ca3femr14775019plh.13.1623080910612; Mon, 07
 Jun 2021 08:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <m3sg1uq6xu.fsf@t19.piap.pl> <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl>
 <m3eeddhora.fsf@t19.piap.pl>
In-Reply-To: <m3eeddhora.fsf@t19.piap.pl>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 7 Jun 2021 08:48:19 -0700
Message-ID: <CAJ+vNU0E_0pB-1T+VpdmjJNVirAwCUNjKVbEV4wEbqHOzURj_A@mail.gmail.com>
Subject: Re: [PATCH] TDA1997x: enable EDID support
To:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 7, 2021 at 4:56 AM Krzysztof Ha=C5=82asa <khalasa@piap.pl> wrot=
e:
>
> Hi Hans,
>
> Hans Verkuil <hverkuil@xs4all.nl> writes:
>
> >> Without this patch, the TDA19971 chip's EDID is inactive.
> >
> > Was this wrong from the very beginning? How can this ever have been tes=
ted
> > without an EDID?
>
> It seems so. I suspect it might have worked in tests because this
> register isn't cleared on reboot. I.e., setting it once after power up
> makes it work to the next power up.
> Or, maybe, the HDMI signal source didn't need EDID.
>

Krzysztof,

Most likely it was that the HDMI signal source I tested with didn't
need EDID. I primarily used a V-SG4K HMDI signal generator in my
testing and development of the driver
(http://www.marshall-usa.com/monitors/model/V-SG4K-HDI.php) which
definitely doesn't need it. Other devices I tested with were another
Gateworks board with HDMI out (which also didn't need EDID) and
occasionally a 1st gen Google Chromecast and Amazon Fire stick (which
I'm not sure about).

> I'm looking at the previous version of this driver from Gateworks and it
> contains:
>
>      /* Configure EDID
>       *
>       * EDID_ENABLE bits:
>       *  7 - nack_off
>       *  6 - edid_only
>       *  1 - edid_b_en
>       *  0 - edid_a_en
>       */
>      reg =3D io_read(REG_EDID_ENABLE);
>      if (!tda1997x->internal_edid)
>          reg &=3D ~0x83; /* EDID Nack ON */
>      else
>          reg |=3D 0x83;  /* EDID Nack OFF */
>      io_write(REG_EDID_ENABLE, reg);
>
> Not sure what the "non-internal" EDID could be - a separate I2C EEPROM
> chip? I'm using this on Gateworks' GW54xx boards and I can't see any
> such EEPROM in the vicinity of the TDA19971, but I don't know how it is
> wired - perhaps Tim has some idea?

Not sure where the source above is from (this was all so long ago) but
my guess is that 'internal_edid' meant an EDID had been provided via
software and the else case meant there was no EDID available. There is
no support on that chip for an external EEPROM.

Tim
