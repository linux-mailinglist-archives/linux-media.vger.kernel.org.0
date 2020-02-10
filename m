Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4201572AA
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 11:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgBJKQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 05:16:20 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46764 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgBJKQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 05:16:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id x14so6419651ljd.13;
        Mon, 10 Feb 2020 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lpoquTHHmtHSGcwS1XpaRBb7o3Yp7v/ANk3Nz1XtzWU=;
        b=uSmCZRmxFB0OUKvRi4fURYrJuafIVFAwEcpke4E2T4MoPc78+le8tVZ2My1Ru2f/wz
         99oO9LGpFPI+KPpO1vg9TDfXqW5iH4wT+IyN1in3ETBX+/uoTES/i8fFam38J6PVs+mx
         wCuxXZUjDp8hRiVV8plt5q1u8BhK1SSqtWZF3xP6w6VzO0cDqDJh6ak+iA+rBxHF/lgM
         gaLLugeJr06xbt7GiDCZIIM97Habs+NUkZd4Lg/d2v9JdVE3alZAEZ60fggp61kXlr+b
         ZQojbmRtdqLGJ27Z2enCmU2aW2BLbov5e/uerR+OT4aCLc6vtSOeD8Y63XqZ5DCHLT0L
         zLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lpoquTHHmtHSGcwS1XpaRBb7o3Yp7v/ANk3Nz1XtzWU=;
        b=PspZtCrK1YkJ0bmS2w9qGj+Rb+J3EeTu+pMeydzTtLjFFAP+9edN1XPmE7jl97oPvI
         Xippq4gkrsMUiWHBh4ocsxyY2WQbF1fuGkI52373UAZZD4vsRla7aGYg5NTOxZF6FsdL
         QF6GYq2X0eNXYxBak1+s5/M0wSL+JAIB3f54dnjO6CQ+53o06ROect8INcbZdtHWiDUd
         hTzlBufblBqvdromP4gcCke45awmWEyDiuQc4C+7oTMEr5dvEQjzcmIssP6kTujEqcKZ
         CiKb8UWMghf8Or0wO1zgo18ESnVQTemIGWaGP8AaaEfRsipVKROn3obnTlerhy72XV64
         APjQ==
X-Gm-Message-State: APjAAAWqt6k/9D0zkSntzezfmjIXZkdrXTROAbpOLdLTZux++ynTqm4Z
        T8adsbO6DESR+tnLH9vDo1M=
X-Google-Smtp-Source: APXvYqymMWYVuwGul+z7dz2+xQgtFCIGwgXxAoBye6KIElypYeMRrGEjwzF8zbwM/JwMqpVbTcoutw==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr434588ljj.97.1581329778685;
        Mon, 10 Feb 2020 02:16:18 -0800 (PST)
Received: from [127.0.0.1] (84-10-202-70.dynamic.chello.pl. [84.10.202.70])
        by smtp.gmail.com with ESMTPSA id y14sm6135601ljk.46.2020.02.10.02.16.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2020 02:16:17 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v4 0/4] media: meson: vdec: Add compliant H264 support
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <cc8defafcf4849f48786c41d94c4e44414903fac.camel@ndufresne.ca>
Date:   Mon, 10 Feb 2020 11:16:16 +0100
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8BAAA12D-B4D6-4F42-B763-B634C47539FD@gmail.com>
References: <20200116133025.1903-1-narmstrong@baylibre.com>
 <371bccfa68c4a9924137f087ef45c732e64bf808.camel@ndufresne.ca>
 <970b4e5b89db7f055217676a07281e37f6dcd35a.camel@ndufresne.ca>
 <f3d8eac3-73cb-75ad-3412-212b229f1654@baylibre.com>
 <cc8defafcf4849f48786c41d94c4e44414903fac.camel@ndufresne.ca>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> Wiadomo=C5=9B=C4=87 napisana przez Nicolas Dufresne =
<nicolas@ndufresne.ca> w dniu 08.02.2020, o godz. 22:08:
>=20
> I'm currently running Fedora 31 (Debian unstable should provide the
> same), with the stock GStreamer 1.16.1. And doing playback with:
>=20
> gst-play-1.0 Videos/bbb_sunflower_1080p_30fps_normal.mp4 =
--videosink=3D"kmssink" --flags=3Dvideo
>=20
> With this player, you can seek with the arrows (left/right), or go =
back
> to the start using 0 key. When you seek, the streaming stalls. If you
> switch the --videosink to fakevideosink as an example, seeking works
> perfectly, and kernel does not complain anymore. Same if you don't use
> a zero-copy path, like fbdevsink.
>=20

Nicolas,

Are You using streamer compiled with internal gst FFmpeg?
If so - then IIRC 1.16 gst build-in ffmpeg is at 4.2.1 level and it has =
missing some ffmpeg master v4l2 commits which are improving amlogic =
vdec<->ffmpeg cooperation.

Also I personally found adding =
https://github.com/tmm1/FFmpeg/commit/196bab90a29323722050111e936532ac9ac9=
bfda makes mythtv on s912/panfrost with DRM_PRIME =
EGL_LINUX_DMA_BUF_EXPORT working well - at least with H264 bluray =
content (progressive; probability of stream errors=3Dlow).
=20
Playback of TV interlaced content however still has issues on current =
vdec (5.5.2+Neil's v5 ML patch series): video playback sometimes becomes =
jumpy.=20
At this moment I suspect it is because bitstream errors (TV recordings =
recorded from SAT so stream errors are highly probable) are confusing =
vdec and vdec hw + ffmpeg v4l2 are not able to deal/recover with =
this=E2=80=A6.
(this more demanding error handling is IMHO general attribute of =
stateful decoders when compared to state-less)

Generally I think vdec error recovery in vdec<->ffmpeg needs be =
inspected and maybe there is place to improvement=E2=80=A6..
   =20

