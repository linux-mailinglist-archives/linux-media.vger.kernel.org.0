Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0116C1B1406
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgDTSJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTSJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:09:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FE9C061A0C;
        Mon, 20 Apr 2020 11:09:39 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f13so13336102wrm.13;
        Mon, 20 Apr 2020 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+/vuF9HAcua+VjNqFK+OSxRnZYILG6HAUBDeRd0Fqk=;
        b=gkFOaHjGE1jmqWE+dwS49aZKqQW/PaPPYbA0PdsZdBzcts8pkIrs7eXUInmxaK0HRy
         KdoEY02H57vDLbTgC29jNN6VI3Y/aNngGbVFWpYWhEJA6HZWQFaKw9MYN9sw7DkUcu4Z
         xeHqWor8YcaT5ACzQ1H2jzeuwGP38UR9cbe2z8Gq2YfV2OLwEjzmYA0jEG9/l5gNAfPI
         lnyXjJ05xpA2kjCOyOCotYJpD4fDqpeKg92SUTYe7UfVX2OgkL+966MpfyoJbCfC5UDV
         +1eLENWeSNTTn0C2pZKkw+E5qW+vdwOxLE0PjmawiUAQdMbaeJbc6ufDiV++8AFWm2V2
         Fhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+/vuF9HAcua+VjNqFK+OSxRnZYILG6HAUBDeRd0Fqk=;
        b=V52PHUR67Jo3IG00hVwY4D5/UzNNMHTPYQByD8EC9GEvliR1+ohkxbX8ov9ejEKrzn
         KaRyQYdFI/f1MzTjf/tqRPeG5hlUy0lZMEOM8UY+Ls4xp6aL6h6YwiPWcxoPUgwoLObk
         FoYablDKH+BD4WMAJocne759HwPb7yYkBVGQCM6AW3+a/hovifrlMFPIJVAEYMZtJu7B
         ChHpNeJpMThuPtI7EmgoB1Oe75r5KRvK1kAi3HOX34BNRzn426nv4DM7mFaAuPytt1Mw
         l8NorexFAz8dVIxIgGHera3CE0ZMxZ3BVpf2pfC02pc3DIeD+C3SDXzmbDVRn4GVkgUG
         W13w==
X-Gm-Message-State: AGi0PuaXz4SyXFf+jiTwXP58MuGbdPG7Giqzxcqd2gcupknAWsacckOz
        QQzUBfcOJBA4cM5c3vMJUGM=
X-Google-Smtp-Source: APiQypIide7sDTLoQe1rFkP7N82820wmIBUrJfyBR8i6hJHz8B1tOkkdIebD/w9NIEOYQjrD6NNipw==
X-Received: by 2002:adf:c109:: with SMTP id r9mr19874418wre.265.1587406178010;
        Mon, 20 Apr 2020 11:09:38 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id j10sm249671wmi.18.2020.04.20.11.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:09:37 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-sunxi@googlegroups.com
Cc:     Samuel Holland <samuel@sholland.org>, linux-sunxi@googlegroups.com,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
Date:   Mon, 20 Apr 2020 20:09:35 +0200
Message-ID: <4523224.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20200420175651.GA610776@aptenodytes>
References: <20200408010232.48432-1-samuel@sholland.org> <5590139.lOV4Wx5bFT@jernej-laptop> <20200420175651.GA610776@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne ponedeljek, 20. april 2020 ob 19:56:51 CEST je Paul Kocialkowski=20
napisal(a):
> Hi Jernej,
>=20
> On Mon 20 Apr 20, 18:41, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 20. april 2020 ob 17:10:10 CEST je Paul Kocialkowski
> >=20
> > napisal(a):
> > > Hi,
> > >=20
> > > On Sun 19 Apr 20, 15:28, Samuel Holland wrote:
> > > > On 4/8/20 11:01 AM, Jernej =C5=A0krabec wrote:
> > > > > Hi Samuel!
> > > > >=20
> > > > > Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland=20
napisal(a):
> > > > >> This allows the VE clocks and PLL_VE to be disabled most of the
> > > > >> time.
> > > > >>=20
> > > > >> Since the device is stateless, each frame gets a separate runtime
> > > > >> PM
> > > > >> reference. Enable autosuspend so the PM callbacks are not run
> > > > >> before
> > > > >> and
> > > > >> after every frame.
> > > > >>=20
> > > > >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > > >> ---
> > > > >>=20
> > > > >> I tested this with v4l2-request-test. I don't have the setup to =
do
> > > > >> anything more complicated at the moment.
> > > > >>=20
> > > > >> ---
> > > > >>=20
> > > > >>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
> > > > >>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115
> > > > >>  ++++++++++++------
> > > > >>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
> > > > >>  3 files changed, 88 insertions(+), 37 deletions(-)
> > > >=20
> > > > [snip]
> > > >=20
> > > > > Reset above causes problem. When format is set in
> > > > > cedrus_s_fmt_vid_cap()
> > > > > a
> > > > > function is called, which sets few registers in HW. Of course, th=
ere
> > > > > is
> > > > > no
> > > > > guarantee that someone will start decoding immediately after capt=
ure
> > > > > format is set. So, if the driver puts VPU to sleep in the mean ti=
me,
> > > > > reset will clear those registers and decoded video will be in
> > > > > different
> > > > > format than expected. It could be even argued that registers shou=
ld
> > > > > not
> > > > > be set in that function and that this is design issue or bug in
> > > > > driver.
> > > >=20
> > > > You're right. I didn't see that cedrus_dst_format_set() was called
> > > > outside
> > > > cedrus_engine_enable/disable().
> > >=20
> > > This might indeed be an issue with multiple decoding contexts in
> > > parallel,
> > > with potentially different formats. For that reason, it looks like the
> > > right thing to do would be to set the format at each decoding run bas=
ed
> > > on
> > > the format set in the context by s_fmt.
> >=20
> > So you are suggesting that cedrus_dst_format_set() should be moved to
> > cedrus_device_run(), right? This way all registers are set at each run,
> > which is then truly stateless.
>=20
> Yes, exactly! But this is outside of the scope of this series though.

I'm not sure about being out of scope. It has to be moved anyway, so why no=
t=20
put it in best place?

Best

>=20
> Cheers,
>=20
> Paul
>=20
> > Best regards,
> > Jernej
> >=20
> > > > > Anyway, I made a runtime PM support long time ago, but never do
> > > > > anything
> > > > > besides running few tests:
> > > > > https://github.com/jernejsk/linux-1/commit/
> > > > > d245b7fa2a26e519ff675a255c45230575a4a848
> > > > >=20
> > > > > It takes a bit different approach. Power is enabled in start
> > > > > streaming
> > > > > and
> > > > > disabled in stop streaming. This is simpler approach and doesn't
> > > > > need
> > > > > autosuspend functionality. I also moved call to a function which
> > > > > sets
> > > > > format in HW registers to start streaming handler, so it's
> > > > > guaranteed
> > > > > to be set at the beginning.
> > > >=20
> > > > Assuming cedrus_device_run() only gets called between streamon and
> > > > streamoff (which appears to be the case), this looks like a better
> > > > design.
> > >=20
> > > Yes, this is defintiely ensured by the V4L2 framework. I agree that
> > > streamon/off are the correct sync points.
> > >=20
> > > > > Note that some registers are only set in start streaming handler.
> > > > > With
> > > > > your
> > > > > approach, if first frame is submitted too late, asserting and
> > > > > de-asserting
> > > > > reset line could reset those registers.
> > > >=20
> > > > I only see registers being set in cedrus_start_streaming() after yo=
ur
> > > > patch, where you add a call to cedrus_dst_format_set(). I can't find
> > > > any
> > > > registers being written in any of the ->start() callbacks.
> > > >=20
> > > > I'll send a v2 which combines the two patches: yours which handles =
the
> > > > runtime part better, and mine which handles the probe/remove part
> > > > better
> > > > with !CONFIG_PM.
> > >=20
> > > Thanks, that should do it!
> > >=20
> > > Cheers,
> > >=20
> > > Paul




