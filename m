Return-Path: <linux-media+bounces-24898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686BA15FF5
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 03:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA52D165C96
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 02:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FFC1F95C;
	Sun, 19 Jan 2025 02:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="xopNy89k"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26A10A1F;
	Sun, 19 Jan 2025 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737252882; cv=none; b=GimkQZLs/7/08PXeIi989fXh00+0sRZ2LaVryttb7YsIJ9N2Lkpogu6jw0PUMOZsj3nQ1xmWhGPpXvgJeQkuaMSk78DFgCUbVPmuauUG3kgVVvO+39pwk7JzNBoqB03KTpmS7vIx96iVuLwfYzDPUGL0GQMNBi2GyUyAwrZHFZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737252882; c=relaxed/simple;
	bh=QqirX0Q0VjLVqU0qyf1kgIBR6b4sc8TOUnugZvCOQbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIVSwne4g/xMMYII9bpeB7mND5b/7xPmbbnhG1MyQlgPr1BHLYmW81CRm1fLNKCbwXCbVkfj1Iw0zMCb8qTq/LFLKbm4fM12kmvufodF3pghpiLIR/AV0qEOvQCoQXeRdh09C5lHJW9Pf1hscHoksfV7E14ZfQ4bNpPcfX/1aRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=xopNy89k; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YbH962WKFz9sZj;
	Sun, 19 Jan 2025 03:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1737252874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wWue60IpM+2K4rr9WI0pySVl96xPtpPDMA0zbtye8g=;
	b=xopNy89kIA+rB0qNLpHBi5apwEvbOPxJ38lvwY7Xd7GKnZkMVTvaLLb/sA9sMkOTGCb5Rv
	SdISYOlAbUJ7grlPglVqyHcGok7sWXK+AJCw4QE/1eQXteFY6tnZP2dZM4CIEgwTAxFFbL
	j5KFo4yNZdfMoOPRyFuvGNm8RHXuPOTMrHsg3bVHMuCWSzxr1yjZa5RRGoG09ePK6uV/yg
	wxg7HoX2ECIu2WkUjZVZkQjbwOSbL2DQQ847X+TeDhPTF2iAyJaxj6oVIgnAhlXxVolCXZ
	KiyN1f1mMDl8d5saJilHpPGZSs8mUVcyrNl7rNkofmFNL6iN2Eixna/ovG+AEQ==
Message-ID: <bed5f370-113f-4109-b8f4-870dd15e93ce@timsurber.de>
Date: Sun, 19 Jan 2025 03:14:28 +0100
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
 <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
 <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dmitry,

I enabled the debug output and ran some tests again.


This is with the source (Windows / Nvidia GPU) set to 1920 x 1080 / 59 
Hz and 4:4:4 chroma. I use the default EDID.

# gst-launch-1.0 -v v4l2src device=/dev/video2 ! fakesink
# dmesg
hdmirx_hdmi_irq_handler: en_fiq
[  226.901822] fdee0000.hdmi_receiver: wait_reg_bit_status:  i:0, time: 10ms
[  226.938715] fdee0000.hdmi_receiver: wait_reg_bit_status:  i:36, time: 
50ms
[  226.938730] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
scdc_regbank_st:0x0
[  226.938738] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
HDMITX less than 3.4Gbps
[  226.946675] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[  226.946689] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
scdc_regbank_st:0x0
[  226.946698] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
HDMITX less than 3.4Gbps
[  226.954724] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[  226.954738] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
scdc_regbank_st:0x0
[  226.954746] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
HDMITX less than 3.4Gbps
[  226.962824] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[  226.962838] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
scdc_regbank_st:0x0
[  226.962846] fdee0000.hdmi_receiver: hdmirx_tmds_clk_ratio_config: 
HDMITX less than 3.4Gbps
[  226.962856] fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal 
lock ok, i:3
[  227.036484] fdee0000.hdmi_receiver: pkt_2_int_handler: pk2_st:0x800
[  227.036504] fdee0000.hdmi_receiver: pkt_2_int_handler: AVIIF_RCV_IRQ
[  227.036512] fdee0000.hdmi_receiver: hdmirx_hdmi_irq_handler: en_fiq
[  227.092219] fdee0000.hdmi_receiver: hdmirx_get_pix_fmt: pix_fmt: YUV444
[  227.092233] fdee0000.hdmi_receiver: hdmirx_get_colordepth: 
color_depth: 24, reg_val:4
[  227.092251] fdee0000.hdmi_receiver: hdmirx_format_change: queue 
res_chg_event
[  227.092261] fdee0000.hdmi_receiver: hdmirx_set_ddr_store_fmt: 
pix_fmt: YUV444, DMA_CONFIG1:0x12006001
[  227.092272] fdee0000.hdmi_receiver: hdmirx_interrupts_setup: enable
[  231.039033] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[  231.039061] fdee0000.hdmi_receiver: get timings from dma
[  231.039068] fdee0000.hdmi_receiver: act:1920x1080p, total:2200x1125, 
fps:86, pixclk:214076000
[  231.039080] fdee0000.hdmi_receiver: hfp:84, hact:1920, hs:48, 
hbp:148, vfp:4, vact:1080, vs:5, vbp:36
[  231.039092] fdee0000.hdmi_receiver: tmds_clk:214076000, pix_clk:214076000
[  231.039100] fdee0000.hdmi_receiver: interlace:0, fmt:2, color:24, 
mode:hdmi
[  231.039108] fdee0000.hdmi_receiver: deframer_st:0x11


It seems that YUV444 is recognized - but not always - sometimes it does 
not register changes in the source and it tries to establish a pipeline 
still with RGB.

This is with the source set to RGB.
# gst-launch-1.0 -v v4l2src device=/dev/video2 ! fakesink

[  869.317467] fdee0000.hdmi_receiver: tx_5v_power_present: 1
[  869.317491] fdee0000.hdmi_receiver: get timings from dma
[  869.317497] fdee0000.hdmi_receiver: act:1920x1080p, total:2200x1125, 
fps:86, pixclk:214072000
[  869.317506] fdee0000.hdmi_receiver: hfp:84, hact:1920, hs:48, 
hbp:148, vfp:4, vact:1080, vs:5, vbp:36
[  869.317515] fdee0000.hdmi_receiver: tmds_clk:214072000, pix_clk:214072000
[  869.317521] fdee0000.hdmi_receiver: interlace:0, fmt:0, color:24, 
mode:hdmi
[  869.317528] fdee0000.hdmi_receiver: deframer_st:0x11
[  869.317534] fdee0000.hdmi_receiver: query_dv_timings: 1920x1080p86.49 
(2200x1125)
[  869.317556] fdee0000.hdmi_receiver: s_dv_timings: 1920x1080p86.49 
(2200x1125)
[  869.317574] fdee0000.hdmi_receiver: C-Plane 0 size: 6220800, Total 
imagesize: 6220800
[  869.317581] fdee0000.hdmi_receiver: hdmirx_set_fmt: req(1920, 1080), 
out(1920, 1080), fmt:0x33524742
[  869.317637] fdee0000.hdmi_receiver: C-Plane 0 size: 6220800, Total 
imagesize: 6220800
[  869.317650] fdee0000.hdmi_receiver: C-Plane 0 size: 6220800, Total 
imagesize: 6220800
[  869.317881] fdee0000.hdmi_receiver: C-Plane 0 size: 6220800, Total 
imagesize: 6220800
[  869.318092] fdee0000.hdmi_receiver: C-Plane 0 size: 6220800, Total 
imagesize: 6220800
[  869.318287] fdee0000.hdmi_receiver: C-Plane 0 size: 6220800, Total 
imagesize: 6220800
[  869.318298] fdee0000.hdmi_receiver: hdmirx_set_fmt: req(1920, 1080), 
out(1920, 1080), fmt:0x33524742
[  869.318836] fdee0000.hdmi_receiver: vid-cap-mplane: count 4, size 6220800
[  869.321814] fdee0000.hdmi_receiver: hdmirx_start_streaming: 
start_stream cur_buf y_addr:0xe10c0000, uv_addr:0xe10c0000
[  869.321831] fdee0000.hdmi_receiver: hdmirx_start_streaming: enable dma
[  869.331693] fdee0000.hdmi_receiver: dma_irq st1:0x100, st13:546
[  869.331708] fdee0000.hdmi_receiver: line_flag_int_handler: last have 
no dma_idle_irq
[  869.339684] fdee0000.hdmi_receiver: dma_irq st1:0x80, st13:0
[  869.348380] fdee0000.hdmi_receiver: dma_irq st1:0x100, st13:547


Observe the reported fps of 86 in the above log file. Also gstreamer 
reports a framerate of 214072/2475 - also around 86.

I could sometimes also create the "Device wants 1 planes" using RGB - 
replugging fixed it, but could never fix it in YUV444.

Next week I have time for more testing.

Best regards,
Tim

On 1/14/25 12:37, Dmitry Osipenko wrote:
> On 1/9/25 02:17, Tim Surber wrote:
>> Hi,
>>
>> I tested your patch with the command
>>
>> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
>>
>> If this worked I moved on to a visual test using
>>
>> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! v4l2convert !
>> waylandsink
>>
>> I used a Windows PC  with a Nvidia GTX 4060 as my source for the
>> following tests.
>>
>> | Format       | Result                                      |
>> | ------------ | ------------------------------------------- |
>> | 4k60p RGB    | Recognized as 1080p / 120 fps - no output   |
>> | 4k60p 4:2:2  | Recognized as 1080p / 120 fps - no output   |
>> | 4k60p 4:4:4  | Error: Device wants 1 planes                |
>> | 4k30p RGB    | ok                                          |
>> | 4k30p 4:2:2  | ok                                          |
>> | 4k30p 4:4:4  | Error: Device wants 1 planes                |
>> | FHD60p RGB   | ok                                          |
>> | FHD60p 4:2:2 | ok                                          |
>> | FHD60p 4:4:4 | Error: Device wants 1 planes                |
>>
>>
>> When testing 4:4:4 chroma I got the following error:
>>
>> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
>> /sys/v4l2/gstv4l2object.c(4344): gst_v4l2_object_set_format_full (): /
>> GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
>> Device wants 1 planes
>>
>> I could record and convert (with errors) the files with 4:4:4 chroma
>> using the command Shreeya posted, but the resulting video had wrong
>> colors and was flashing.
>>
>> I was not able to test 4:2:0 chroma. I tried to generate an custom EDID
>> with support for it but I could not select it in the graphics driver in
>> the source, maybe this is just an issue with my setup.
> 
> Thanks a lot for the testing, very appreciate it! Good that RGB works
> for you with no problems.
> 
> Testing YUV formats isn't trivial. Personally I've a custom setup with a
> modified display driver of RPi to test them. See more below.
> 
>> I also observed that the the framerate is reported wrong, for example
>> setting the source to FHD60p RGB resulted in the following:
>>
>> # v4l2-ctl --all -L --list-formats-ext -d /dev/video0
>> Active width: 1920
>>      Active height: 1080
>>      Total width: 2200
>>      Total height: 1125
>>      Frame format: progressive
>>      Polarities: -vsync -hsync
>>      Pixelclock: 214076000 Hz (86.50 frames per second)
>>
>> This wrong framerate reporting seemed to happen across all framerates
>> and resolutions. Gstreamer Pipeline negotation showed the same results.
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
>          Active width: 3840
>          Active height: 2160
>          Total width: 4400
>          Total height: 2250
>          Frame format: progressive
>          Polarities: -vsync -hsync
>          Pixelclock: 296992000 Hz (30.00 frames per second)
> 
> Note the timing data reported by v4l2-ctl updates after launching the
> capture. It's not updated dynamically when you changing mode on the source.
> 
> Lastly, please run `echo 3 >
> /sys/module/synopsys_hdmirx/parameters/debug`.  Watch the kmsg log.
> Check that it says "hdmirx_get_pix_fmt: pix_fmt: YUV444" when you
> connecting HDMI cable to a YUV444 source and see other related messages.
> If it says RGB, then your source is transmitting RGB.
> 
>> During my testing I got sometimes an error
>>
>>
>> # dmesg
>> dma alloc of size 24883200 failed
>>
>>
>> I'm not sure when this happened and how to reproduce it.
> 
> This comes from v4l core, should be harmless as long as capture works.
> It's a known noisy msg, you may ignore it for today.
> 
>> Then I tried to use an AppleTV 4k as source. I don't know what
>> resolution it tried to negotiate but I got this error in addition to the
>> previous "Device wants 1 planes" and no connection:
>>
>> # dmesg
>> fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
>> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
>> tmds_clk_ratio:0
>> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
>> dma_st10:0x10
>> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
>> tmds_clk_ratio:0
>> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
>> dma_st10:0x14
> 
> "Device wants 1 planes" sounds like you're using a wrong v4l video
> device. Please double check. Though, the "signal not lock" means it
> doesn't work anyways, please make sure you're using the default driver
> EDID and not a custom one.
> 


