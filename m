Return-Path: <linux-media+bounces-30959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD448A9B510
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 19:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 100D77B6C52
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 17:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F035828BAAF;
	Thu, 24 Apr 2025 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="biIl7RIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD34A288C8D
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514755; cv=none; b=ol28yh53ayhaUC/8bZbNJ/icXwEtInjd/qUojmYb0As3KzIOL1t+YZC4pzJP7vVqX/s+FApPZxxOd/eeBskVnss3ir6gUWKYO4/12IlNIsYpMSRfooEm5yaOUmjpo62moP2CnOFampdOhUndwK/bjeKF0GrkvoWRxuAUMrcHbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514755; c=relaxed/simple;
	bh=vmhIU5jfXts2d4Tl0wmxVJ9i7cra/UDvObQSqoee3qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu7eKKdPY2lRf63cOGXKqpBOv8v8zeethHM5vvmwjW8iouJIhq1UmlyBjB4esOKNTBjg0aydO4RAsEcVmuLpN1hCsFMZHE2bKieXL27B/K2HOaTnyn1hNn03PU2wiPNZcJFiVd0HNmASMTrMLCgjqa5R17NnufhCEtc2VbiteCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=biIl7RIC; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-703cd93820fso12619477b3.2
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745514752; x=1746119552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6rkcV+qf1J/bMsQdHIweAoWjgi8IAjFqmmdS0F/BHg=;
        b=biIl7RICmJ6GZl02TGfMf93OnG+wVfp+kKMk1vhRvhOBM4ESjSHfmIYcnUWpERoCN+
         eS//Vbb68w9fApU+idyY7nDaL/vknxuqRZr5iXvE1R0XsiP+5WZhHPiGkRCqQhJIndFq
         PSxof73h7QW0UsBFvXEKrBgDhZwnIkgZ3+w5BQ7U+zaT4L0GmrUzQIYBQ71Awmd/3Iri
         6VIYKfOcWZXg5MxnfLeFG4ghqLSalUWsbIyaH21KpAy7dExe/q64sqXKY2VNne4dWpbq
         0py9RGPQY8WXhr++RzUWFov2JQOnnnBOEcmYkl4mYi+HaCdc3UrKZWGYj+hhbP9joWXh
         jPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514752; x=1746119552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6rkcV+qf1J/bMsQdHIweAoWjgi8IAjFqmmdS0F/BHg=;
        b=jVGCH5p3oycyCAPto341dioh/ULur8G0n0m8np3yg6HCDK1E8NxMjeol4A99VIzmD8
         /LlY7c2+3H3wfl5XmhLOt/T8/4iVDCXbDRF1WkilsRvWuKT4W6K2dPmWjoFxCPCdnYqA
         +0FhHZcm9E9HobMMHt6G2h06BW6fSA7GRZYDiKntx87h39jm+OOUdsr4r55Tarx5qGub
         9tjBYTY8BQynFd4Fk+xJe07YiidryuAsMnB6XQceA1c0vMLwF1/xq/OanL5EJuXU4uet
         wbteba5TaEbQnb1yx1cArYiscBEsqrftOqulzr3wN5TdCY1Zag8I727By8m2tDkeRaDu
         RmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/fe1BA4ejL6ygYgUIZNLCWFzfhagoyMLHeKD1PCYT+Fh/PSmRWmf6JP67lVP7GGLZx/SXTctFo4IMOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1XuPGtjAoc2SP6wZ9NmsVn0NDQdKewGsCWrxKZQhy+fUiwimf
	PJY+XbPKjh+MbsMktPaQ+rPYnelfyRXG4CD5yi8Dyb0js32ZNm0J3R3pGdnIep2tHvGPpjsK2Mr
	C3prpEBF3JvIJ2BlIa5Zxt2L7clk8ZEQSGXCJNA==
X-Gm-Gg: ASbGncuACDqBYGXy3Xd789+7+k2Glw/U17nLoDIiimv2mu9TGAl4II+X5Q4ZQU2O0mA
	QqUODe9452sUDewI0s5tM3Ag4KhqFBw8ZsHoCAzLt6CXYmM0o736KTXaPe1NLJrO0BXPrMS8UV1
	5jhZQSbX599H9YDF4ihj5qYn/yc7gN981RHuMzF6Nlht462U6Ya1TGkLDcaWeftqlK
X-Google-Smtp-Source: AGHT+IEb1QlBL6z4QcVPIf5VM9SEWHJ+R+yb2r/9r+ySoAmbEZ7S1S1wTahS4cT+Nitqgw7Rw8K7+eYgw1a62Qorlqg=
X-Received: by 2002:a05:690c:48c2:b0:6fb:9663:a5f with SMTP id
 00721157ae682-7084f115e72mr7524017b3.38.1745514751766; Thu, 24 Apr 2025
 10:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
In-Reply-To: <20250424-exuberant-carp-from-pluto-cce66c@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 24 Apr 2025 18:12:14 +0100
X-Gm-Features: ATxdqUElLyDXtue10QfxZtrU49o0ZC8K5nphWIZDx-KgeRtjtFFQf-_rxc-VwF0
Message-ID: <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
Subject: Re: upstream unicam not returning any buffer
To: Maxime Ripard <mripard@redhat.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime

On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
<kernel-list@raspberrypi.com> wrote:
>
> Hi,
>
> I've been trying to port a v4l2 application from the downstream unicam
> driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
>
> While the application seemed to work ok with the downstream driver, the
> same code will never get any buffer from the upstream unicode driver.
> Either dqbuf will block forever (if it's blocking), or never return a
> buffer (if it's non-blocking).
>
> The media-controller topology after the application configured it is:
>
> Media controller API version 6.13.11
>
> Media device information
> ------------------------
> driver          unicam
> model           unicam
> serial
> bus info        platform:fe801000.csi
> hw revision     0x0
> driver version  6.13.11
>
> Device topology
> - entity 1: unicam (3 pads, 3 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: SINK
>                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:=
srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
>         pad1: SOURCE
>                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:=
srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "unicam-image":0 [ENABLED,IMMUTABLE]
>         pad2: SOURCE
>                 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
>
> - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: SOURCE
>                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:=
srgb]
>                 [dv.caps:BT.656/1120 min:640x350@13000000 max:1920x1200@1=
65000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,custom]
>                 [dv.detect:BT.656/1120 1280x720p60 (1650x750) stds: flags=
:]
>                 [dv.current:BT.656/1120 1280x720p60 (1650x750) stds: flag=
s:]
>                 -> "unicam":0 [ENABLED,IMMUTABLE]
>
> - entity 9: unicam-image (1 pad, 1 link)
>             type Node subtype V4L flags 1
>             device node name /dev/video0
>         pad0: SINK
>                 <- "unicam":1 [ENABLED,IMMUTABLE]
>
> - entity 15: unicam-embedded (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video1
>         pad0: SINK
>                 <- "unicam":2 [ENABLED,IMMUTABLE]
>
> The interrupt count in /proc/interrupts increases with a somewhat
> reasonable rate, so it looks like I'm getting interrupts.
>
> Enabling the debug output of the unicam driver gives the following logs:
>
> [ 2522.686656] unicam fe801000.csi: Starting stream on image device
> [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, nodes 1
> [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence=
 0, lines done 0
> [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence=
 0, lines done 819
> [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence=
 0, lines done 1638
> [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence=
 0, lines done 2457
> [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence=
 0, lines done 3276
> [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence=
 0, lines done 1059226
> [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence=
 0, lines done 1059226
> [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence=
 0, lines done 1059226
> [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence=
 0, lines done 1059226
> [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for node 0
> [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence=
 0, lines done 1059226
> [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for node 0
>
> Do you know what could be going on? I tried to compare the upstream and
> downstream unicam drivers, and the interrupt handler seems to be
> slightly different, but I'm afraid I'm a bit out of my depth there.

I must admit to not having run the upstream driver in anger.

Your interrupt traces are odd for at least two reasons.

ISTA always being 0x1 means only frame start events. No frame end
(0x2) or line count interrupts (0x4).
You should be getting 4 line count interrupts every frame or every 128
lines if greater, and frame end at the end of each frame. Your
interrupts are every 16.6ms (ish), which would follow with being FS
only.

"lines done" is incrementing by more than the 720 lines expected for
the configured resolution. I suspect that it has updated the write
address to the new buffer, and they just happen to be contiguous (at
least to start with).
Downstream has code that (incorrectly) returns the buffer to the
internal queue if we get repeated FS events, but it probably wants to
return them to userspace with VB2_BUF_STATE_ERROR.

I'll try to find a few minutes to battle the upstream driver with
tc358743 and see what I get.

I have just noticed that 6.13 didn't get a backport of
https://github.com/torvalds/linux/commit/697a252bb2ea414cc1c0b4cf4e3d94a879=
eaf162.
I don't know if that would affect you (gut feel is not).

> Also, and while it seems unrelated (it happens when exiting the
> application), I'm getting:
>
> [  452.053788] ------------[ cut here ]------------
> [  452.058502] WARNING: CPU: 3 PID: 734 at drivers/media/common/videobuf2=
/videobuf2-core.c:2222 __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common]
> [  452.071517] Modules linked in: vc4 hci_uart snd_soc_hdmi_codec btqca b=
cm2835_v4l2(C) snd_soc_core btrtl btbcm btsdio btintel brcmfmac_wcc bluetoo=
th bcm2835_mmal_vchiq(C) ac97_bus snd_pcm_dmaengine videobuf2_vmalloc bcm28=
35_unicam snd_compress brcmfmac drm_dma_helper tc358743 v4l2_dv_timings vid=
eobuf2_v4l2 v4l2_fwnode videobuf2_dma_contig cpufreq_dt v4l2_async videodev=
 brcmutil snd_bcm2835(C) drm_display_helper videobuf2_memops raspberrypi_cp=
ufreq v3d snd_pcm videobuf2_common snd_timer pwrseq_core vfat fat snd sound=
core mc cfg80211 bcm2711_thermal cec vchiq(C) broadcom bcm_phy_ptp bcm_phy_=
lib ledtrig_default_on gpu_sched i2c_mux_pinctrl leds_gpio genet pwm_bcm283=
5 iproc_rng200 i2c_mux mdio_bcm_unimac rfkill loop fuse nfnetlink reset_gpi=
o gpio_raspberrypi_exp pwrseq_simple dwc2 crct10dif_ce raspberrypi_hwmon i2=
c_brcmstb clk_bcm2711_dvp udc_core sdhci_iproc bcm2835_wdt i2c_bcm2835 sdhc=
i_pltfm bcm2835_dma sdhci phy_generic nvmem_rmem mmc_block rpmb_core mmc_co=
re
> [  452.157993] CPU: 3 UID: 0 PID: 734 Comm: dradis.bin Tainted: G        =
 C         6.13.11 #252
> [  452.166655] Tainted: [C]=3DCRAP
> [  452.169663] Hardware name: raspberrypi Raspberry Pi 4 Model B Rev 1.1/=
Raspberry Pi 4 Model B Rev 1.1, BIOS 2024.10 10/01/2024
> [  452.181140] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  452.188207] pc : __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common]
> [  452.194503] lr : __vb2_queue_cancel+0x48/0x2f0 [videobuf2_common]
> [  452.200707] sp : ffff800080e4bb30
> [  452.204068] x29: ffff800080e4bb40 x28: 0000000000000009 x27: 000000000=
0000000
> [  452.211321] x26: ffff40e6cda48b98 x25: 00000000400004d8 x24: 000000000=
00e001b
> [  452.218573] x23: ffff40e6d064b280 x22: 0000000000000000 x21: ffff40e6d=
278c8b8
> [  452.225824] x20: ffff40e6d278c630 x19: ffff40e6d278c738 x18: 00000000d=
bfbb796
> [  452.233076] x17: 0000000000000000 x16: ffffc258986100e0 x15: 00000002d=
9a24a9e
> [  452.240328] x14: 0000000000000000 x13: 00000002d9c4d651 x12: ffff40e6c=
08fa640
> [  452.247578] x11: 0000000000000000 x10: 0000000000000000 x9 : 000000010=
0000000
> [  452.254829] x8 : 0000000000000002 x7 : 0000000000008080 x6 : 00000000a=
6000004
> [  452.262079] x5 : ffff800080e4b87a x4 : ffff40e6ff99a780 x3 : 000000000=
0000000
> [  452.269329] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 000000000=
0000000
> [  452.276581] Call trace:
> [  452.279061]  __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common] (P)
> [  452.285357]  vb2_core_queue_release+0x2c/0x88 [videobuf2_common]
> [  452.291472]  vb2_fop_release+0x80/0xc0 [videobuf2_v4l2]
> [  452.296791]  v4l2_release+0xa8/0x128 [videodev]
> [  452.301474]  __fput+0xa0/0x318
> [  452.304583]  ____fput+0x20/0x38
> [  452.307775]  task_work_run+0xb8/0xe8
> [  452.311410]  do_exit+0x220/0x9c0
> [  452.314688]  do_group_exit+0x7c/0xb0
> [  452.318317]  get_signal+0x76c/0x878
> [  452.321860]  do_signal+0xa4/0x1d8
> [  452.325227]  do_notify_resume+0x70/0x160
> [  452.329209]  el0_svc+0x70/0xe0
> [  452.332313]  el0t_64_sync_handler+0x78/0x108
> [  452.336650]  el0t_64_sync+0x19c/0x1a0
> [  452.340368] ---[ end trace 0000000000000000 ]---
> [  452.345101] videobuf2_common: driver bug: stop_streaming operation is =
leaving buffer 1 in active state
> [  452.354584] videobuf2_common: driver bug: stop_streaming operation is =
leaving buffer 2 in active state

I'm guessing this is exit without closing file handles cleanly, ie ctrl-c.
Somewhere along the line a couple of buffers haven't been cancelled with vb=
2.

Downstream I'd originally copied atmel-isi (IIRC) and the handling it
had. The upstream driver is just using vb2_fop_release, and I can't
immediately see the path that would call streamoff in those
situations.
Setting CONFIG_VIDEO_ADV_DEBUG appears to dump a load of stats for
unbalanced things in vb2_queue_free, so it'd be interesting to know
what that reported.
(https://elixir.bootlin.com/linux/v6.14.3/source/drivers/media/common/video=
buf2/videobuf2-core.c#L606)

  Dave

