Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5229D36D772
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 14:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236905AbhD1MgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 08:36:22 -0400
Received: from ni.piap.pl ([195.187.100.5]:48998 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234439AbhD1MgV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 08:36:21 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 9E831444032;
        Wed, 28 Apr 2021 14:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 9E831444032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1619613332; bh=QG+dsPO25iZIXCJg6jPdT+oPy9Rb1+B7Kg31/40cdVM=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=BzBX6c2UJyS4SVAp2e8hVYI0I8O3B+bIcpTKZg6z1etSX4U41uetBv210EYWv5pgj
         6J3M21+t5QWuaC6aaFxNbCE7GN9i3JUFbbPc+aXxUAfb61pQcZANyZmFM9+S4a7XOg
         Xu0Krjr8zl5d/0s8HPXqhmDLsZjojwbcP5TkzJFs=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org
Subject: Re: RFC: MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3mtv3s01z.fsf@t19.piap.pl>
        <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Wed, 28 Apr 2021 14:35:32 +0200
In-Reply-To: <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 16 Mar 2021 21:19:57 +0200")
Message-ID: <m3k0om8u3v.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm working on AR0521 MIPI camera sensor driver update and I'm still not
sure how the timings should be programmed. V4L2 has:

- V4L2_CID_LINK_FREQ
  I understand it's a menu with fixed integers (frequencies in Hz).
Documentation/driver-api/media/camera-sensor.rst:
"For camera sensors that are connected to a bus where transmitter and recei=
ver
require common configuration set by drivers, such as CSI-2 or parallel (BT.=
601
or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmit=
ter
drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
frequency used on the bus."

How (and if) do I use the above when the sensor in question uses PLLs
and can generate arbitrary link frequencies?

- V4L2_CID_VBLANK and V4L2_CID_HBLANK
These are fine for setting the timings (and the AR0521 can use them).
There is, however, another value needed for precise timing control, the
so called "extra" timing (a hw register), specified in pixels.
The calculated frame rate is thus:
fr =3D pixel_clock / (width + hblank) * (height + vblank) + extra.

How do I specify the "extra"?

Currently, I'm using the [sg]_frame_interval() functions, should it stay
this way (so there are [HV]BLANK controls AND [sg]_frame_interval() in
parallel on the same device)?

It appears the userspace should be able to set, in addition to *BLANK,
the pixel clock. How do I do that? The V4L2_CID_PIXEL_RATE appears to be
a good candidate, but v4l2_ctrl_fill() sets a read-only flag on it.

Any ideas?

At present I'm about to use two (orthogonal) interfaces (frame interval
based and the - incomplete - [hv]blank-based) - but perhaps I'm missing
something important?
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
