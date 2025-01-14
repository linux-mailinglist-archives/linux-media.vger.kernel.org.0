Return-Path: <linux-media+bounces-24720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38CA108ED
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 15:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795551884B77
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 14:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E761313FD86;
	Tue, 14 Jan 2025 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J6wdGop5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79323244E;
	Tue, 14 Jan 2025 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864225; cv=none; b=bc2F1n008xA9Tjr7At4jKiaSzEPoYepUTAzpDwUHYQcys4W2XT+uC5wx8zotpdbyBAQDpFN1anYcvvhwlgMlY3+RUmfJ1Ilaqv6Jp1YXzsViX5pYezRGuSWzgVzp8PHv3eueOqo5CXvKGhHm4ivGREqPnlWYdAmBbC3vyGOICrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864225; c=relaxed/simple;
	bh=UcLT/NGwEPJZ5L1DHsFtFzF+XOJMTV8UvHS9FoikQUE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lvS3KdtUfWhQmgFfeB+oq+xu4M7nOrR1/zfZoZUFmDuYcl+7ImaTgBIwguVbDSnG63kAxCiUs9Rzp/xELaSmPRh5vUHQBKQzZqmnFY2/qEG2TTVTjUWmy2NhGXn2biLLns4gzsEeFUbEZg1zU1rxbpraMCklff2xWsvrMGcXPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J6wdGop5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736864221;
	bh=UcLT/NGwEPJZ5L1DHsFtFzF+XOJMTV8UvHS9FoikQUE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J6wdGop5G4nss4xyIPKF1t7RgMLG7uignLmWgtjyf/K7aqRNzaFLmZOLNdIgQoN03
	 mBtzE0NfcjP8UrsFiF2V36hFhuIUuS/Pwwrrr132lusduiDR6OUdojfNFgn/O+h84e
	 E2KCxWlMg/96AjAfJJ1HvgLwCevc73sjTmXVbWg0y9eU9v+GpGKZwoT+JAaBAH40NX
	 44l/ff93fblxo6G79nkFpDImkyQ9G/UAiQ7clKytn/JT3zObw37DhHGdQBDVM+L3YP
	 RbFY9HaEDzuKW2N7JPG8T+pwHMNNLsZy6WOwacukqcrxE9BIA51dW4iXT/PlZXg56e
	 YFAM0Wx6kGIsw==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 869C917E02BE;
	Tue, 14 Jan 2025 15:16:58 +0100 (CET)
Message-ID: <c71eb0c2052814f709d1cc36bd3e968d72a96749.camel@collabora.com>
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Tim Surber	
 <me@timsurber.de>, Shreeya Patel <shreeya.patel@collabora.com>,
 heiko@sntech.de, 	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, 	jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 	hverkuil@xs4all.nl,
 hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Tue, 14 Jan 2025 09:16:55 -0500
In-Reply-To: <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
	 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
	 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
	 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
	 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
	 <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
	 <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mardi 14 janvier 2025 à 14:37 +0300, Dmitry Osipenko a écrit :
> On 1/9/25 02:17, Tim Surber wrote:
> > Hi,
> > 
> > I tested your patch with the command
> > 
> > # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
> > 
> > If this worked I moved on to a visual test using
> > 
> > # gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! v4l2convert !
> > waylandsink
> > 
> > I used a Windows PC  with a Nvidia GTX 4060 as my source for the
> > following tests.
> > 
> > > Format       | Result                                      |
> > > ------------ | ------------------------------------------- |
> > > 4k60p RGB    | Recognized as 1080p / 120 fps - no output   |
> > > 4k60p 4:2:2  | Recognized as 1080p / 120 fps - no output   |
> > > 4k60p 4:4:4  | Error: Device wants 1 planes                |
> > > 4k30p RGB    | ok                                          |
> > > 4k30p 4:2:2  | ok                                          |
> > > 4k30p 4:4:4  | Error: Device wants 1 planes                |
> > > FHD60p RGB   | ok                                          |
> > > FHD60p 4:2:2 | ok                                          |
> > > FHD60p 4:4:4 | Error: Device wants 1 planes                |
> > 
> > 
> > When testing 4:4:4 chroma I got the following error:
> > 
> > # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
> > /sys/v4l2/gstv4l2object.c(4344): gst_v4l2_object_set_format_full (): /
> > GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Device wants 1 planes
> > 
> > I could record and convert (with errors) the files with 4:4:4 chroma
> > using the command Shreeya posted, but the resulting video had wrong
> > colors and was flashing.
> > 
> > I was not able to test 4:2:0 chroma. I tried to generate an custom EDID
> > with support for it but I could not select it in the graphics driver in
> > the source, maybe this is just an issue with my setup.
> 
> Thanks a lot for the testing, very appreciate it! Good that RGB works
> for you with no problems.
> 
> Testing YUV formats isn't trivial. Personally I've a custom setup with a
> modified display driver of RPi to test them. See more below.
> 
> > I also observed that the the framerate is reported wrong, for example
> > setting the source to FHD60p RGB resulted in the following:
> > 
> > # v4l2-ctl --all -L --list-formats-ext -d /dev/video0
> > Active width: 1920
> >     Active height: 1080
> >     Total width: 2200
> >     Total height: 1125
> >     Frame format: progressive
> >     Polarities: -vsync -hsync
> >     Pixelclock: 214076000 Hz (86.50 frames per second)
> > 
> > This wrong framerate reporting seemed to happen across all framerates
> > and resolutions. Gstreamer Pipeline negotation showed the same results.
> 
> I've re-tested YUV444 4k capture using RPi4, works flawlessly. Note for
> gst-launch-1.0 you used video1 and video0 device is used by v4l2-ctl
> command above, maybe you're using wrong device. Please post a complete
> output of the v4l2-ctl command.
> 
> The command I used to test YUV444 capture:
> 
> # v4l2-ctl --verbose -d /dev/video1
> --set-fmt-video=width=3840,height=2160,pixelformat=NV24 --stream-mmap=4
> --stream-skip=3 --stream-count=3300 --stream-to=hdmi.raw --stream-poll
> 
> The I converted captured data to a video file and played it:
> 
> # ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt nv24
> -y -i hdmi.raw output.mkv && mpv output.mkv -loop 0
> 
> Don't see any problems with a reported framerate:
> 
> DV timings:
>         Active width: 3840
>         Active height: 2160
>         Total width: 4400
>         Total height: 2250
>         Frame format: progressive
>         Polarities: -vsync -hsync
>         Pixelclock: 296992000 Hz (30.00 frames per second)
> 
> Note the timing data reported by v4l2-ctl updates after launching the
> capture. It's not updated dynamically when you changing mode on the source.

GStreamer uses G_PARM to get and report the frame interval (and flip the
fraction over to make it a frame rate). I've assumed these two should match and
it wasn't worth a special case of HDMI receivers.

Nicolas

> 
> Lastly, please run `echo 3 >
> /sys/module/synopsys_hdmirx/parameters/debug`.  Watch the kmsg log.
> Check that it says "hdmirx_get_pix_fmt: pix_fmt: YUV444" when you
> connecting HDMI cable to a YUV444 source and see other related messages.
> If it says RGB, then your source is transmitting RGB.
> 
> > During my testing I got sometimes an error
> > 
> > 
> > # dmesg
> > dma alloc of size 24883200 failed
> > 
> > 
> > I'm not sure when this happened and how to reproduce it.
> 
> This comes from v4l core, should be harmless as long as capture works.
> It's a known noisy msg, you may ignore it for today.
> 
> > Then I tried to use an AppleTV 4k as source. I don't know what
> > resolution it tried to negotiate but I got this error in addition to the
> > previous "Device wants 1 planes" and no connection:
> > 
> > # dmesg
> > fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
> > tmds_clk_ratio:0
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
> > dma_st10:0x10
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
> > tmds_clk_ratio:0
> > fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
> > dma_st10:0x14
> 
> "Device wants 1 planes" sounds like you're using a wrong v4l video
> device. Please double check. Though, the "signal not lock" means it
> doesn't work anyways, please make sure you're using the default driver
> EDID and not a custom one.
> 


