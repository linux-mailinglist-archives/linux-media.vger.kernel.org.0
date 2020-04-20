Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA88D1B11F1
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 18:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgDTQl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 12:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726208AbgDTQl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 12:41:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB79FC061A0C;
        Mon, 20 Apr 2020 09:41:27 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j1so7595273wrt.1;
        Mon, 20 Apr 2020 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pHkfqaZsrvViCrU4vsZGcZiXBeGIBVSy7YBzRqpKWdA=;
        b=DocS62iBm+MaxthEy8q58x+ZJU00CguRHCiYuW6dSG4/U6ZyGPWmJrpqRaNjkRtbF7
         /RdZSQWSQ5H6mteZjuHLXUdo5lFRpI3NnH8AfGByJ9+aIiSkz/qzxmyb5XOd0oKkuUsG
         5IetuYNfruFqMLFvjQX8+VAgTEgvRhLcCFAVYfSpeNrSsewv1pjunDnWaVYCwjh2Ec5N
         /3t24EgrtLPIjg2mkbufRaGlL+k6ZWxTG60iMpCC+tZKDq3qJ9vY+fbowAm6WE53kEhc
         o9nC28ByOnpk4pqSScAIK+vx+0Bn7EcqO7v0rNdv5mDmP2rkenwq4oordoJJOvDWy/aI
         NbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pHkfqaZsrvViCrU4vsZGcZiXBeGIBVSy7YBzRqpKWdA=;
        b=WCY63XXr/U0haQyEZ6ICnhPE/UFnOGjfJeX1C7QPgx6s6/iITJJxzsWa85qf/+Indy
         LkucqTz4Cb+vMm7kWhhkacrxGC4+gVClp6wVB8bQ5aLo4yow0OcQRERVbdA8NlZBAhB0
         DHfHpvnPbXCHyi3QyC4PIn31POfi6zqDXN6ICEgckuEUuFXImZ+GD+7/ZmFatWsiWYE9
         czir/Wef4nh83ImzUAC9BxLMkLFXV86xeVPVbikHUt0ZWMvDE7z9pwkX6xatXlH86n3y
         ptAJlSTo3aNtCN8cLrOLRUlrzpXjHTTQI2u7prq5+q+Q7APtpFGZ32b99q2ExijkSbim
         R8XA==
X-Gm-Message-State: AGi0PuabZfvauEq4yAhhVSsDKiaxoB3xoJksNtpW/LXNfg9AMg6NQv40
        RNRR/qUAPctICHuwDV5Qh4w=
X-Google-Smtp-Source: APiQypIu7Usjxv+iYA4v7BBaqwgthc4mJlRmQjaEIvh6W/U/9yhM0xy2y9UlKGHHHnWU6b0Gch+giQ==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr19160703wrt.236.1587400886434;
        Mon, 20 Apr 2020 09:41:26 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id j13sm48180wro.51.2020.04.20.09.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 09:41:25 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Samuel Holland <samuel@sholland.org>, linux-sunxi@googlegroups.com
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        paul.kocialkowski@bootlin.com
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
Date:   Mon, 20 Apr 2020 18:41:23 +0200
Message-ID: <5590139.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20200420151010.GL125838@aptenodytes>
References: <20200408010232.48432-1-samuel@sholland.org> <244922ec-ed3a-eca7-6640-49de7ad9c605@sholland.org> <20200420151010.GL125838@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 20. april 2020 ob 17:10:10 CEST je Paul Kocialkowski=20
napisal(a):
> Hi,
>=20
> On Sun 19 Apr 20, 15:28, Samuel Holland wrote:
> > On 4/8/20 11:01 AM, Jernej =C5=A0krabec wrote:
> > > Hi Samuel!
> > >=20
> > > Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland napisal(=
a):
> > >> This allows the VE clocks and PLL_VE to be disabled most of the time.
> > >>=20
> > >> Since the device is stateless, each frame gets a separate runtime PM
> > >> reference. Enable autosuspend so the PM callbacks are not run before
> > >> and
> > >> after every frame.
> > >>=20
> > >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> > >> ---
> > >>=20
> > >> I tested this with v4l2-request-test. I don't have the setup to do
> > >> anything more complicated at the moment.
> > >>=20
> > >> ---
> > >>=20
> > >>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
> > >>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115 ++++++++++++---=
=2D--
> > >>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
> > >>  3 files changed, 88 insertions(+), 37 deletions(-)
> >=20
> > [snip]
> >=20
> > > Reset above causes problem. When format is set in cedrus_s_fmt_vid_ca=
p()
> > > a
> > > function is called, which sets few registers in HW. Of course, there =
is
> > > no
> > > guarantee that someone will start decoding immediately after capture
> > > format is set. So, if the driver puts VPU to sleep in the mean time,
> > > reset will clear those registers and decoded video will be in differe=
nt
> > > format than expected. It could be even argued that registers should n=
ot
> > > be set in that function and that this is design issue or bug in drive=
r.
> >=20
> > You're right. I didn't see that cedrus_dst_format_set() was called outs=
ide
> > cedrus_engine_enable/disable().
>=20
> This might indeed be an issue with multiple decoding contexts in parallel,
> with potentially different formats. For that reason, it looks like the
> right thing to do would be to set the format at each decoding run based on
> the format set in the context by s_fmt.

So you are suggesting that cedrus_dst_format_set() should be moved to=20
cedrus_device_run(), right? This way all registers are set at each run, whi=
ch=20
is then truly stateless.

Best regards,
Jernej

>=20
> > > Anyway, I made a runtime PM support long time ago, but never do anyth=
ing
> > > besides running few tests:
> > > https://github.com/jernejsk/linux-1/commit/
> > > d245b7fa2a26e519ff675a255c45230575a4a848
> > >=20
> > > It takes a bit different approach. Power is enabled in start streaming
> > > and
> > > disabled in stop streaming. This is simpler approach and doesn't need
> > > autosuspend functionality. I also moved call to a function which sets
> > > format in HW registers to start streaming handler, so it's guaranteed
> > > to be set at the beginning.
> >=20
> > Assuming cedrus_device_run() only gets called between streamon and
> > streamoff (which appears to be the case), this looks like a better
> > design.
>=20
> Yes, this is defintiely ensured by the V4L2 framework. I agree that
> streamon/off are the correct sync points.
>=20
> > > Note that some registers are only set in start streaming handler. With
> > > your
> > > approach, if first frame is submitted too late, asserting and
> > > de-asserting
> > > reset line could reset those registers.
> >=20
> > I only see registers being set in cedrus_start_streaming() after your
> > patch, where you add a call to cedrus_dst_format_set(). I can't find any
> > registers being written in any of the ->start() callbacks.
> >=20
> > I'll send a v2 which combines the two patches: yours which handles the
> > runtime part better, and mine which handles the probe/remove part better
> > with !CONFIG_PM.
> Thanks, that should do it!
>=20
> Cheers,
>=20
> Paul




