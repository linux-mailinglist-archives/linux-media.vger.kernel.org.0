Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B57267A01
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 13:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbfGMLjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 07:39:14 -0400
Received: from mout.gmx.net ([212.227.15.18]:47861 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbfGMLjO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 07:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563017934;
        bh=BWWyqYc0Q9lHRlufOjwlKzREgcGCirILPkFoZng2iMw=;
        h=X-UI-Sender-Class:Subject:From:Cc:References:To:Date:In-Reply-To;
        b=l0bP+nVq4Z/ym5mL673tifm3R/v/AN0xnxmc1JYY10LUxZ3WuGZ55pdJQC9bwHMNL
         l1ooHC6BxBuuT/OHSV5dck2DI9VztTOLJ0zzQumDVRtaVN/2kiwXQQyEQrwfJkafLx
         kAz8lu5VMpuvk50bYQZw4tKiRVyKQLqb+gNuTR4E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.43.122] ([92.40.248.250]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MGyxN-1hiBm21fEp-00E2qN; Sat, 13
 Jul 2019 13:38:54 +0200
Subject: [REGRESSION] Xorg segfaults on Asus Chromebook CP101 with Linux v5.2
 (was Asus C101P Chromeboot fails to boot with Linux 5.2)
From:   Alex Dewar <alex.dewar@gmx.co.uk>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
References: <59042b09-7651-be1d-347f-0dc4aa02a91b@gmx.co.uk>
 <CANBLGcyO5wAHgSVjYFB+hcp+SzaKY9d0QJm-hxqnSYbZ4Yv97g@mail.gmail.com>
 <862e98f3-8a89-a05e-1e85-e6f6004da32b@gmx.co.uk>
 <5fe66d5d-0624-323f-3bf8-56134ca85eca@gmx.co.uk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk>
Date:   Sat, 13 Jul 2019 12:38:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5fe66d5d-0624-323f-3bf8-56134ca85eca@gmx.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:LbPaPzVSq7PJlnapOmV+BlI1ChwWNYoa0SaFu0C21B84M97YvV7
 85RffBT6jaGa40g+bVMVtOXftprToNyjJMhZ21zY+IwVtRgW6GMAs+zzSL7CbLyh+DcuWbv
 Gc+je70JuDlPCVNZZpllDXJ7wB/EiAjB7ad7ycDyadGdxCqNbl33o80PMLvk321yAP8t/E3
 zta3oivBwYDmHGCSViX/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zRO9TRRdg4Q=:OTrf3LHKXJB0WL90b8u/YF
 WpIex8PeEtoGFs631qIMrNBEK8Fb8vjim+Y0TmYya94HQsEJbHlkyPnn3xE/k/IJZVFnHRaxp
 1EagelV6OS8zlcViSPsuljs7/OKHU4f48Ogd/4KXNJaFFj5adg9YAYi0osg4m+Bk4e3uMvazn
 /fAtprsvifQwZM8Vk7bsGXYuCezEDDF17AbaFO7p13oaFNYhA+T52VstQr+9gZftY0GcBfph+
 K6B+FBi7JGyXglL7RdQna2Kf/U+VlKHz/YgkQEawnT84LBu21KKNOtOuAbLP0IsE9jN8iWETw
 47Shx5L2rJCD/05K981Hm35Mw4xft/gRpuCzKpsVG1Rkc6yzq1bxaZ7j1musUBC6gUzaHeBi9
 0BtIWbJn0u630XsvVU/6E3VRDX9qnuAu8pestYlV8oAzXzaAUG+9MmO86DK4fc31olRyn1WTs
 mpZzd/xZ9rX1cWZb0FBPDzXD/GiCiM/eJ/ifGjJokKnrVK9sfcIp8HiFNDNUgc77Et0LfC/jN
 GvMaiVRMH7eBTsy/ZLDegArWn4S/bsazA75tQtchmx1+X0/ymqkrYENO63CGVBpz/OSbhM4oP
 wX7gmS9mgp3dxVBRdpNQd3mWSIpUHiJMcQJVWyJEzTdqMhZmWtGr5M0TydHmIcG3OIKixSk6u
 b8HXYPPML0ugB+F4rmSP/hvSReKr/6r40xaNHaAR5JM3vbTSlU09tdkle60bkiKEQh+uXDLxo
 YzLc2ciQn8om5Tg0ro+4cTaj3h1I3HQ7BHqle0Xmj3AbK8nFXZmjYuf1GSp5tm30ogK4TAtME
 PN1433KPbgvUNTDzostkGze0dyaPqVND116h7oysndGY8oTQUUeS39qsMc0fAwGDmnHujKOiL
 GjA7veBdsXC0EgdgjniItnk7JRPMJEziFINoz0DGfvtJXEvlwPl/pAMe+eEDHrz92NQPP+SJn
 RwK+Sso8zaB+seDgnl5safxDVdgtjnmZysM5qQswcZuI0HYWCgL9GKBmmb44niMoZbcdxM6Xk
 2M1Nv3wyETg9T2xVXZmwFka3LMN8dnFfnl2Gzq15Cc96cVfzMIF+PkXrw1UTqTTPigDUx6dA5
 syw/bFdIZskDDZ9egAc79E5s/r1mYt2cc93
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I initially thought my machine was failing to boot entirely, but it
turns out it was just failing to start the display manager. I managed to
escape to a tty by hammering the keyboard a bit.

I suspect the culprit is the rockchip_vpu driver (in staging/media),
which has been renamed to hantro in this merge window. When I run startx
from a terminal, X fails to start and Xorg segfaults (log here:
http://users.sussex.ac.uk/~ad374/xorg.log). X seems to work without any
issues in v5.1.

I've also tried running trace on the Xorg process, but the output was
pretty verbose. I can share if that would be helpful though.

Best,
Alex

