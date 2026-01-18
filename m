Return-Path: <linux-media+bounces-50984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D7D397AF
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 16:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 604573005AB6
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 15:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2346A33B;
	Sun, 18 Jan 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="iqxRD7qW"
X-Original-To: linux-media@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8A1A9F93
	for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751821; cv=none; b=P0raiaVaVbn/pCsYi/R7XJnksZjZAwDtzJOkE6EECUMsUZJSjRWWxCdieDLFmTS4OEEEPNBW6K11X3RSF/1jpyEhp4fFEKITwD9/sNgsmY9OXjSeNvufdHdA56sZFhDa7AD+Lo6ibDWHb/wZ29dNIUoazSgNMRKkOeCbwwbH3p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751821; c=relaxed/simple;
	bh=DJOBU6rOWWSo4xYKU7nMBHAijuGXD1m4lRBW3wOS7HA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=GOZdWUw/Bfu3fV6mYhlZLhahDvdNaUX1CRA8nns80IGEkW5JrJJitlO1zj5RS5/GplwpKEuFTa6gX9s7qAomuU3bSf+qTFMat69BnSngyPhyJLlpaDjfPs+xipmCq8zeZeBKq+0LBM+28kvH9VGtIHTWFvYRDcG5T4eNcgT6KkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=iqxRD7qW; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768751806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABgVdweYWnojo/0/vbQ5PCIHpjC4QGW/+p3bJL9oPSA=;
	b=iqxRD7qWNwPe7m7/GzbPYD8LR3NtXFoCDtrZ1qn/pUoFqWLTqW0FELymu7uDUZRfMQWqDN
	o0rXB2+dC0e+Eb8+EVGNi+iS8S59J3XLUoS+R+yH7hxxH9g6M8dp5siyNnPSU6dFJSM/N6
	T5rPLP4Q2Qh1QXjNs01xzldCDHfo+sQPe8GiLsUBfl5pjaZPcfkYum86moLNJ6U4cYlOg/
	Ds+ruNaxXbHv5HUl2SY6IxUFwwjvH2BpbFzHoSfF/D35pHFexjrKmRA22VgvFDa+oLCnLL
	zFFtn5M/eJabNgDtbbaP5SU7yAH9Wz+ZsiStE5SnxH02KylwzoT79i207CSX/w==
Date: Sun, 18 Jan 2026 16:56:41 +0100
Message-Id: <DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-tech.com>
Cc: =?utf-8?q?Olivier_Cr=C3=AAte?= <olivier.crete@collabora.com>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Dragan Simic" <dsimic@manjaro.org>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 "Andy Yan" <andyshrk@163.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] media: rockchip: rkvdec: add support for the
 VDPU346 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Christian Hewitt" <christianshewitt@gmail.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
In-Reply-To: <20260110053727.2295260-1-christianshewitt@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Christian,

On Sat Jan 10, 2026 at 6:37 AM CET, Christian Hewitt wrote:
> This series depends upon Detlev Casanova's current v8 series for VDPU381 =
and
> VDPU383 support [0]. It adds support for the VDPU346 IP block used for H2=
64,
> HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to be=
 a
> close relation to VDPU381 used with RK3588, except with a single core, ou=
tput
> limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU=
346
> vs 6.1 on VDPU381. To handle differences we declare a new compatible.
> ...
> NB: Testing with the v1 series showed lower mbps bitrate performance. Thi=
s
> appears to be resolved though it's unclear to me whether this results fro=
m
> kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2=
].
> However with my current Linux 6.19-rc4 test branch [3] I'm now able to pl=
ay
> Jellyfish H264 and HEVC test media over 100mbps.

I've now done quite a bit of testing on 3 separate devices: TL;DR:

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # PineTab2, Quartz64=
-A, NanoPi R5S

My main test setup was with Sway and mpv, which was based on a
self-compiled ffmpeg from [2] (commit: ea34873176, [4]) and mpv PR 14690
[5] (commit: 307d2a8 [6]).
That all ran on a Debian Forky system with my own 6.19-rc5 kernel ([7]).
Detlev's v8 series made things quite a bit better vs previous versions.

I also did a quick test with that same mpv and kernel, but then on KDE
Plasma and only on the PineTab2.

Finally, I did some tests with custom LibreELEC builds [8], which also
uses the code from this patch set.

While using the ``--vo=3Ddmabuf-wayland`` parameter with mpv wasn't needed
on Rock 5B (RK3588) with most of my test files, it was absolutely needed
for all my test files on RK3566/RK3568.

Playing 1080p (or lower) media was either perfect or quite good, meaning
sometimes little artifacts were visible. This was on the PineTab2's
(RK3566) own screen or on my 1080p monitor with the Q64-A (RK3566) or
the NanoPi R5S (RK3568). Using the 'i'/'I' keyboard shortcut to display
an overlay with display statistics or enabling subtitles was generally a
'way' to get more artifacts. With 'i'/'I' you'd then also see the frame
drop count rise.
This was the case with both H264 and HEVC files, where I got the
'feeling' that HEVC worked (just) a bit better. Dunno if that's because
of the codec or that the video bitrate is lower with HEVC. Quite a few
of my test files are in both H264 as HEVC.

Testing with the 'Jellyfin' files was generally perfect. The maximum
bitrate I have is 30M though. There were some artifacts visible on the
PineTab2 though. With Jellyfin's HEVC files, but not my own HEVC files,
I did see the following warnings in dmesg:

  rkvdec_hevc_run: 291 callbacks suppressed
  rkvdec fdf80200.video-codec: Long an short term RPS not set

But I think that's expected? (given Detlev's remark on v8 cover page)

Playing 4K media on a 1080p (or lower) screen resulted in severe audio
sync issues. It seems the video rendering actually works, but in 'slow
motion'. Hearing 2 secs of audio for 1 sec of video was not uncommon.
Even with 4K media files, the CPU utilization was still around 15-25% on
all cores.

When testing on KDE Plasma, the display results were quite a bit worse.
I primarily mention this as I suspect that the 'display pipeline'
(possibly not the correct technical term), plays an (important) factor.
CPU utilization often around 40% on all cores.

I then connected the Q64-A or NanoPi R5S to my 4K TV. Displaying 1080
media was generally 'reasonable', meaning artifacts were visible several
times during playback. 4K media files still had severe 'audio sync'
issues.

I then went on to try LibreELEC's builds. The artifacts I (sometimes)
saw, were gone :-D OTOH, I did get several major issues 'in return',
like rk_iommu Page fault resulting in a black screen and the only way to
'recover' from it, was a reboot. I also got a kernel oops.
Some dmesg logs available at [9].

Then I tried something ... for 'shits and giggles'.
I recently learned about a Costa Rica 'test video' in 4K HDR (YT ID:
``LXb3EKWsInQ``) and I converted that to H264 and HEVC. The H264 version
was identified by MediaInfo as 'High 10@L6' and the HEVC version as
'Main 10@L5.1@Main'.
I tried to play that on the Q64-A (RK3566) ... and saw my TV show a
'popup' indicating it recognized it as HDR :-O And it actually played
them. It seems it couldn't completely keep up as it seems too slow at
some points and then appear to make a 'jump' to the then current time
spot. I think it worked a bit better with the HEVC version then the H264
one. But proper viewing/testing was always interrupted by a rk_iommu
Page fault and thus a black screen.
It worked even better on the NanoPi R5S (RK3568) and may even have
played it correctly; otherwise it came *really* close. But here too, the
fun was interrrupted by a black screen at some point.

So it seems it may be able to play video files/formats which, according
to the TRM, it isn't supposed to be able to play?
Too early to tell, but seeing the 'HDR popup' was a really cool surprise.

So, it's not perfect and I suspect various elements in the 'display
pipeline' can/should/need to be improved. I have no idea which though.
But the current state is good enough for me to give my Tested-by tag.

HTH,
  Diederik

> [0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D10=
40540
> [1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/=
boot/dts/rockchip/rk356x.dtsi#L1539
> [2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3
> [3] https://github.com/chewitt/linux/commits/rockchip-6.19.y

[4] https://salsa.debian.org/diederik/ffmpeg/-/tree/v4l2request-v3-n8.1
[5] https://github.com/mpv-player/mpv/pull/14690
[6] https://salsa.debian.org/diederik/mpv/-/tree/v4l2request-support
[7] https://salsa.debian.org/diederik/linux/-/tree/cknow/master-next
[8] https://chewitt.libreelec.tv/testing/
[9] https://paste.sr.ht/~diederik/1d9468cbc52c49ec210b4b29754486608a9efea2
    https://paste.sr.ht/~diederik/214eb00f6ac634d16f54f25b2ec578ca27dc5134
    https://paste.sr.ht/~diederik/669c3731a108f650f9e0bdc03df848a69355d56f

> Christian Hewitt (3):
>   media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
>   media: rkvdec: Add support for the VDPU346 variant
>   arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
>
>  .../bindings/media/rockchip,vdec.yaml         |   2 +
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
>  3 files changed, 154 insertions(+)


