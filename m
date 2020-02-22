Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DADDA169030
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2020 17:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgBVQQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Feb 2020 11:16:54 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33091 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727339AbgBVQQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Feb 2020 11:16:53 -0500
Received: by mail-qt1-f196.google.com with SMTP id d5so3608663qto.0
        for <linux-media@vger.kernel.org>; Sat, 22 Feb 2020 08:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding;
        bh=h6y2l7r0SZzY2frtObGMYDh0KWzbGps/82ggmwwCBNU=;
        b=l8WCK+5CmLy5GxaEj672sypZsWaZst47IfXTmIMT3jwQwDoF5dmJMAMSFApHrBe/vx
         XGVsmI2tE8uN/avIDYUejQhcvv2DlSBgNj3Nu7CAjqC8BHEFc+ZqPrHuikiucQrJe3cH
         KvL6dWnYsjYwLJhfhkj8o/khuygOtbtpkpKPDXAaiBSUoF6XrjZpowJgQQDXWNt8GMuQ
         tNaH5e+VSzVJCUyRzsMH/VpjQt+ngdQG9iTo4jsEW5TShrd5Fyo1xMCO8v2YztS2ZBr/
         iSB+q48q/AaZ99cDTgeK81W+rzl70mSM0ns9u43k/AmsuEqX5bK3Wpcowvp3B3tc/hSL
         NhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding;
        bh=h6y2l7r0SZzY2frtObGMYDh0KWzbGps/82ggmwwCBNU=;
        b=IQuReJ7gKZdNJHTrMYqfdTd6FoX2F2YYWToGZ0mg0eVgb9XL7aqi++pOx9/quFCDSO
         Q1HEWMIzFkBgwBIjGdYGcO6pW+D759x2mYn+jenjOOeGV41wrI1NPzcO0+4wFz0+a7vJ
         Ki7qZXXND2ebfiHxt/YJbdTO6ycu8p4bfyTC1nEAlROb9o+2js0S9L47LCUSw8NFp6W6
         47SDVsP7hVtiWM0qr2xp0qt6T0s7mwq1oPuf41Vn0uIbdLs/aOO4m2WTQ2v6YF8kEKBN
         diJdstGS8/V/Vt9MS4CsVF7krtdQ4B+EUPMxAvd5uZexkFzwee5KpUTTmVZB2qzfszsJ
         /uTA==
X-Gm-Message-State: APjAAAUbxAa/0CCVasqvGX2es7yVJU2tScvM3ROGHBrGd1K79G/2Mlvg
        uWbr7bebCLz2dgPEwMUBllDOVw==
X-Google-Smtp-Source: APXvYqzQJnMO/hL2UK6T7a8bbIuqQvjAjtSztWQGUDkp1eVnf0G8f7mkFf2gMNoTg3IbX7cYk0csDQ==
X-Received: by 2002:ac8:6645:: with SMTP id j5mr39444299qtp.167.1582388211225;
        Sat, 22 Feb 2020 08:16:51 -0800 (PST)
Received: from ?IPv6:127.0.0.1? ([2605:8d80:525:7910:3770:2d4d:77b5:eea])
        by smtp.gmail.com with ESMTPSA id k37sm3309147qtf.70.2020.02.22.08.16.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Feb 2020 08:16:50 -0800 (PST)
Date:   Sat, 22 Feb 2020 16:16:48 +0000 (UTC)
From:   +1 514-466-1652 <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        ezequiel@collabora.com, mchehab@kernel.org,
        Shawn Guo <shawnguo@kernel.org>, s.hauer@pengutronix.de,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org
Message-ID: <00366512-0bc7-4b06-a282-e8e60517c2b0@localhost>
In-Reply-To: <b30ab10a43c80e9096e45a6d52d125c1e297f021.camel@pengutronix.de>
References: <ce102c01-74b1-628d-2192-9d5cb7baa616@puri.sm> <b30ab10a43c80e9096e45a6d52d125c1e297f021.camel@pengutronix.de>
Subject: Re: video decoding on imx8mq vpu via v4l2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <00366512-0bc7-4b06-a282-e8e60517c2b0@localhost>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



14 f=C3=A9vr. 2020 08:50:16 Philipp Zabel :

> Hi Martin,
>
> On Fri, 2020-02-14 at 12:46 +0100, Martin Kepplinger wrote:
>
> > Hi,
> >
> > I'd like to test decoding an mpeg2 or h264 video file on imx8mq, using
> > its vpu:
> >
> > I use Philipp's changes for imx8m from
> > https://git.pengutronix.de/cgit/pza/linux/log/?h=3Dhantro/imx8m-wip in =
my
> > tree:
> >
> > https://source.puri.sm/martin.kepplinger/linux-next/commits/5.6-rc1/lib=
rem5__integration
> >
> > and play around with gstreamer, taking notes at
> > https://source.puri.sm/Librem5/linux-next/issues/74
> >
> > The driver probes fine and v4l2 appearently sees the MEM2MEM decoder:
> >
> > $ v4l2-ctl --list-devices
> > nxp,imx8mq-vpu-dec (platform: hantro-vpu):
> > /dev/video0
> >
> >
> > AFAIK gstreamer should provide a "v4l2videodec" element which it doesn'=
t:
> >
>
> The GStreamer V4L2 decoder elements are only implemented for the
> stateful codec API [1] so far.
>
> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/dev-decoder.h=
tml
>
> There are plans to add direct support for stateless codecs [2] to
> GStreamer, but that will still be a bit of work as far as I understand.
>
> [added Nicolas to Cc:]

That is correct. I have a WIP branch here, than decode some H264, forward, =
assuming no queues after the decoder. So still need to be polished. It is a=
lso limited to Hantro driver, as I didn't fully implemented the slice data =
and the reference lists needed by Cedrus on Allwinner.

https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/commits/v4l2codecs=
-hantro



>
> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/dev-stateless=
-decoder.html
>
> In the interim, I have plugged together a GStreamer VA-API stack based
> on Bootlin's libva-v4l2-request backend. See below.
>
>
> > $ gst-inspect-1.0|grep -i v4l
> > video4linux2: v4l2deviceprovider (GstDeviceProviderFactory)
> > video4linux2: v4l2radio: Radio (video4linux2) Tuner
> > video4linux2: v4l2sink: Video (video4linux2) Sink
> > video4linux2: v4l2src: Video (video4linux2) Source
> >
> > First: Philipp, do you plan to continue working on supporting hantro fo=
r
> > imx8m upstream?
> >
>
> Yes. We need to sort out the i.MX8MM power domain bindings / drivers,
> and I have to test that the Hantro G1 kernel patches work on i.MX8MM as
> well, to make sure we got the DT bindings right. I'll then resend the
> series for both i.MX8MQ and i.MX8MM.
>
>
> > Then: What codec would be appropriate to test decoding now? It seems
> > like h264 is supposed to be implemented. How do you test?
> >
>
> There is a patched FFmpeg floating around that can drive the Hantro
> driver. I'm using a patched libva-v4l2-request [3] / libva [4] /
> GStreamer VA-API [5,6] stack to test.
>
> [3] https://github.com/bootlin/libva-v4l2-request/pull/29
> [4] https://github.com/intel/libva/pull/332
> [5] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/merge_reques=
ts/729
> [6] https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge_reques=
ts/171
>
>
> > And finally: What could be missing here? I use debian's gstreamer
> > package, but in this case it can't really be a config/build issue in
> > gstreamer, right?
> >
>
> None of this was merged in 1.16.2. The GStreamer VA-API changes depend
> on API changes in libva, which currently add Hantro-specifics to a
> generic API, and all this is based on a still unstable kernel API.

I've tested Philipp patch against VA driver, and that worked well for me. T=
hough it requires patches on so many components that it's quite challenging=
 to package. Notably you need to backport some parser work and its comes wi=
th a new VA API. I think it's very unlikely this will be merged upstream. T=
o make things worst, no one, including me, wants to maintain such a userspa=
ce driver.

And that's why I wrote a new one that does not use an abstraction. It still=
 depends on new API in the parser. This is something we might revisit kerne=
l, as these parameters are very HW specific. On GStreamer side, I'm sharing=
 code with MS DxVA support, and hope we can bring more accelerator around t=
his in the future. It's the model FFMPEG and Chromium have adopted, and wha=
t makes it more mature today. About Chromium, there is a branch using the n=
ew driver, but I can't find it at the moment.

>
> regards
> Philipp
>


