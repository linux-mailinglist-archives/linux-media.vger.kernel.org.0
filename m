Return-Path: <linux-media+bounces-24473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A2A0695E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 00:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F09A61673B8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 23:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832E2204C2C;
	Wed,  8 Jan 2025 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="JAfvD+pd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D422611;
	Wed,  8 Jan 2025 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736378272; cv=none; b=KXBPhJmi7+H8nn/AF4J0tJMYvazc5RUO5waQraFTkgKKTySiDXk7em4L7yekfN3tC5tjXw/1XGJoUVSjZsifWsxGXnsqSmn1UsoIT4j9hvOskgOruDYKCXgR+a5c85MNKxuOeKMYp7L1V2P9qYMFDe6WJU+sMtOmpJBt6aBkR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736378272; c=relaxed/simple;
	bh=uYnNNV3Og25ZrR7XwJS/aCY9o38HMm12OOUgkHL2jD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpMwCimZ3UVo7Soz/dfXlxeW8YTsAx+HsoTkRZJLKftyFwgyu7LzOql8dACPe26Cs57PlY7tyI+cCSICqukxuVifkcCkFz0uKCHMv0DiS2uCq45RiaUhC/vGU5DiHpfs6p70mESqhRamNINiqvglHOqZg+OCeqtO59QrgqyaHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=JAfvD+pd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YT3jZ39S2z9sWt;
	Thu,  9 Jan 2025 00:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1736378258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/X0WBBqCGRGq8C7ulGGLTNywZC6aKr6ETbimA2Nz/ns=;
	b=JAfvD+pdAeKiUoArfy+4UiHiMzwvFhIWF4V+OQwYFiWD/VVanEpTe4A8wZyA1kbIX8BJUo
	SAAr4juuBaNYIFru96NwPHEUIKW+huo2bLKGcpeDJ+4NpMhlIZ6txOMtBSWQQeGy4OyQk2
	+bkUXr4rLVN355a1wSzrClAizugbundksLMsHnAZANUGDfa0vzbl7DujtfKduX2wNX3VeB
	jk8aC5a/47RI/z6NprAcs4FVPw9zvAlsqTQIi3BprYTgOYRUMBguoKJbypnwcCIWQy5U/b
	0l2eK9G1+vT48+OCF1P3MVrSIvSoZZx7ll/rsvGQp3LAFaGueuary2JZNmhjtQ==
Message-ID: <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
Date: Thu, 9 Jan 2025 00:17:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4YT3jZ39S2z9sWt

Hi,

I tested your patch with the command

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink

If this worked I moved on to a visual test using

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! v4l2convert ! 
waylandsink

I used a Windows PC  with a Nvidia GTX 4060 as my source for the 
following tests.

| Format       | Result                                      |
| ------------ | ------------------------------------------- |
| 4k60p RGB    | Recognized as 1080p / 120 fps - no output   |
| 4k60p 4:2:2  | Recognized as 1080p / 120 fps - no output   |
| 4k60p 4:4:4  | Error: Device wants 1 planes                |
| 4k30p RGB    | ok                                          |
| 4k30p 4:2:2  | ok                                          |
| 4k30p 4:4:4  | Error: Device wants 1 planes                |
| FHD60p RGB   | ok                                          |
| FHD60p 4:2:2 | ok                                          |
| FHD60p 4:4:4 | Error: Device wants 1 planes                |


When testing 4:4:4 chroma I got the following error:

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
/sys/v4l2/gstv4l2object.c(4344): gst_v4l2_object_set_format_full (): 
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Device wants 1 planes

I could record and convert (with errors) the files with 4:4:4 chroma 
using the command Shreeya posted, but the resulting video had wrong 
colors and was flashing.

I was not able to test 4:2:0 chroma. I tried to generate an custom EDID 
with support for it but I could not select it in the graphics driver in 
the source, maybe this is just an issue with my setup.

I also observed that the the framerate is reported wrong, for example 
setting the source to FHD60p RGB resulted in the following:

# v4l2-ctl --all -L --list-formats-ext -d /dev/video0
Active width: 1920
	Active height: 1080
	Total width: 2200
	Total height: 1125
	Frame format: progressive
	Polarities: -vsync -hsync
	Pixelclock: 214076000 Hz (86.50 frames per second)

This wrong framerate reporting seemed to happen across all framerates 
and resolutions. Gstreamer Pipeline negotation showed the same results.

During my testing I got sometimes an error


# dmesg
dma alloc of size 24883200 failed


I'm not sure when this happened and how to reproduce it.

Then I tried to use an AppleTV 4k as source. I don't know what 
resolution it tried to negotiate but I got this error in addition to the 
previous "Device wants 1 planes" and no connection:

# dmesg
fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, 
tmds_clk_ratio:0
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0, 
dma_st10:0x10
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, 
tmds_clk_ratio:0
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0, 
dma_st10:0x14


Best regards,
Tim




