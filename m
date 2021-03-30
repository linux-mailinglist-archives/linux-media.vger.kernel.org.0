Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4FA34E5BC
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 12:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhC3Krz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 06:47:55 -0400
Received: from ni.piap.pl ([195.187.100.5]:55740 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhC3Kr3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 06:47:29 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id E1C8F443A5A;
        Tue, 30 Mar 2021 12:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl E1C8F443A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1617101248; bh=U0yRFlMai+XiaM5nJzXcxdtqBQs+FxFrRSEuzCSHy/8=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=fzvqHznbZQWt+uCDJwAy9lPzCdPVwm4mrZql71J8WaTl1bR+5h5m7Yie6FGUIepmY
         HbBZZxt9abq7153e1ekpSpDrTIx/8bVSh0tyfkQEULK59rsJJmBcccg7FO3JXI1hf9
         zJ6/34JLt4PxuJQ8TtLUP6S5F9S0edOT16QmtR34=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: RFC: MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3mtv3s01z.fsf@t19.piap.pl>
        <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Tue, 30 Mar 2021 12:47:27 +0200
In-Reply-To: <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 16 Mar 2021 21:19:57 +0200")
Message-ID: <m3tuosx6io.fsf@t19.piap.pl>
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

Laurent,

There is an additional issue:

>> +static const struct v4l2_subdev_video_ops ar0521_video_ops =3D {
>> +	.g_frame_interval =3D ar0521_g_frame_interval,
>> +	.s_frame_interval =3D ar0521_s_frame_interval,
>
> For raw sensors, frame intervals should be configured using
> V4L2_CID_HBLANK and V4L2_CID_VBLANK instead. These two operations should
> be dropped.

Unfortunately, I require a way to specify an exact timings for the
sensor. The frame interval gives me a way to do this, but it requires
setting HBLANK and VBLANK _and_ an extra register
(AR0521_REG_EXTRA_DELAY) which is specified in pixels, not lines.

E.g. the total number of pixels (active or otherwise) is not
(width + h blank) * (heigth + v blank)
but rather:
(width + h blank) * (heigth + v blank) + extra_delay

How do I do that with HBLANK/VBLANK controls?
BTW there are specific constraints on the pixel clock as well
(the active scanning must be as fast as possible, which means fast pixel
clock, minimum possible hblank and thus long vblank).

All comments are appreciated.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
