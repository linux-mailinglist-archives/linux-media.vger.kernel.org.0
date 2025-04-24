Return-Path: <linux-media+bounces-30953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B711EA9B195
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 16:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8AF81B81314
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 14:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C4C19F47E;
	Thu, 24 Apr 2025 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3Tn0mem"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE827456
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506708; cv=none; b=ex7dl29EuBAWuW0khmtSO/7MOj6cn4ynigl7rFibjsxh87tewpr9wr7nQwUkCRZB7AJhFZGm8w/tcuZ0hZyS5iDSRFICMQgMqSSFIVQfbIq7Ymtof9gvVVU8pXp19z8FSiLsFgxGRfjiaDP6vyyD+9PmTqbsjiArnJxUomKU3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506708; c=relaxed/simple;
	bh=NnsWgTNiODqiJt+9eGEcMKZ/r9Vug7Yt+pDkzUi3Nxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6gNJ1XDK+y4+mUH+RvM3VJZCM9ZAO11vQK0Zx52lsH6dTGEa/TYTHX8AvvKjbz2sKXCGd/puV/uGWjEvGG3s/wL6TuJyXdcP+qysp/oHR1VGdvKa5xrtnsM0wLugaI2PamNvZ72/kJXh4NOA0Is6BubCGxz4wAHw0dd0y5sngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3Tn0mem; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745506705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=pZck2uQm3BnWTjNxPbtnzD1pCOAmbncfQN3U55iJK/8=;
	b=V3Tn0memGRMV+4XYytXlXRQzTAJoBquVv+zfvHQW1ahGncYU98aVwKb87OV9VNlJ1M0/Ta
	CI+ZMvqvo4wUSwLldXIeAiXy5Bfaaxi7vUHnpXwC2zFvgbNtIoArCGkYKepC/Sn3A23yId
	6FrRChWN7u99BpcD4CgRFwY8vB3ToIo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-8l4qHhMtPUGHusP7-5BrMA-1; Thu, 24 Apr 2025 10:58:21 -0400
X-MC-Unique: 8l4qHhMtPUGHusP7-5BrMA-1
X-Mimecast-MFC-AGG-ID: 8l4qHhMtPUGHusP7-5BrMA_1745506700
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cec217977so6057605e9.0
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 07:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745506700; x=1746111500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZck2uQm3BnWTjNxPbtnzD1pCOAmbncfQN3U55iJK/8=;
        b=Q5ZE3hx5DE5xYSmxA7m1ztglDyCaYw6rmFVmhspRjPCfT6T1Q4fe4h4AG8ImMckfr+
         RHslsES3ZJ4CDMfR4grPyGjmK3/fml4ECgL0FLxjbLgJCKKcla6+lc+N7HhNfsOw9OgG
         c3/lRCoHo/5EBTaP+dOTjzdx63eiHxjJQkGRVnOfTMM9Cg8em6qpLYBUZCf2RzozcpG5
         llMfoKiP8m1yRP7nbgTH5rv167D8AoRb1sZb6Gm2z1Dr/+jsvmf2hrzVGYPcE8sjcqgn
         t0QefsmJzvVw7Z5Z3k04xMNAVezq5GZzR4Ft/ySHbD764aLfsTbKWMJtBoScXP56aocA
         RpyQ==
X-Gm-Message-State: AOJu0YwBstHoXilIcBkK7MISrOET4YZhGeO11vaweUOssBJTJYWx6NUR
	3y81henE5Q2EIs3mJJwCbyZ36OUDWIL2pOTuC9qXdwTbSdMW439K7c+NgB4zONoCUA8ZEi2WXxQ
	DkCAxDdBRJ0j/8Ig0YXpbB39IpmlXG4m1DCGLIy64DB4QSeGoFxeMHLbYt/rh4zBgrt3D
X-Gm-Gg: ASbGncvA2HuyyUhSGQ5btxw7afjVsGAP8RcO782LLJ8NS7o1sWhb/OdeBoxjlpNN3+A
	SrgVW7nvS9RvXun9ONnuUc/kGIZy39MIAZ8YUoNL/QBGdlei+d2Cs8Pkijjavs9++2EdIl8kqKg
	dEozzXFjUZ8enwB1a7KQ1xwNPKgOkfquaxxgwRfBrh+ZWjUB48X0GzyKyHqCY8udlP98PEwtowo
	sHdEfOKn82+Rdpb7tOp17fLL3meyqwfTBdWLKoRzv9WM1nl8mwNvFZzQWz123s=
X-Received: by 2002:a05:600c:3487:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-4409bd2019fmr33681935e9.17.1745506699733;
        Thu, 24 Apr 2025 07:58:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4aQbP2RVs5+qkhY27Pm1KYW/RykAq5htEi+JX/ft8KHC/dSGnReE4yElalzv6TrZpdBJVwg==
X-Received: by 2002:a05:600c:3487:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-4409bd2019fmr33681715e9.17.1745506699310;
        Thu, 24 Apr 2025 07:58:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2c07a2sm23971795e9.39.2025.04.24.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:58:18 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:58:18 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: linux-media@vger.kernel.org
Subject: upstream unicam not returning any buffer
Message-ID: <20250424-exuberant-carp-from-pluto-cce66c@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qu4ksva6uwsxqe6z"
Content-Disposition: inline


--qu4ksva6uwsxqe6z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: upstream unicam not returning any buffer
MIME-Version: 1.0

Hi,

I've been trying to port a v4l2 application from the downstream unicam
driver (with the 6.6 kernel) to upstream (6.13.11) kernel.

While the application seemed to work ok with the downstream driver, the
same code will never get any buffer from the upstream unicode driver.
Either dqbuf will block forever (if it's blocking), or never return a
buffer (if it's non-blocking).

The media-controller topology after the application configured it is:

Media controller API version 6.13.11

Media device information
------------------------
driver          unicam
model           unicam
serial
bus info        platform:fe801000.csi
hw revision     0x0
driver version  6.13.11

Device topology
- entity 1: unicam (3 pads, 3 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: SINK
		[stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
		<- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
	pad1: SOURCE
		[stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
		-> "unicam-image":0 [ENABLED,IMMUTABLE]
	pad2: SOURCE
		-> "unicam-embedded":0 [ENABLED,IMMUTABLE]

- entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
	pad0: SOURCE
		[stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
		[dv.caps:BT.656/1120 min:640x350@13000000 max:1920x1200@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,custom]
		[dv.detect:BT.656/1120 1280x720p60 (1650x750) stds: flags:]
		[dv.current:BT.656/1120 1280x720p60 (1650x750) stds: flags:]
		-> "unicam":0 [ENABLED,IMMUTABLE]

- entity 9: unicam-image (1 pad, 1 link)
            type Node subtype V4L flags 1
            device node name /dev/video0
	pad0: SINK
		<- "unicam":1 [ENABLED,IMMUTABLE]

- entity 15: unicam-embedded (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
	pad0: SINK
		<- "unicam":2 [ENABLED,IMMUTABLE]

The interrupt count in /proc/interrupts increases with a somewhat
reasonable rate, so it looks like I'm getting interrupts.

Enabling the debug output of the unicam driver gives the following logs:

[ 2522.686656] unicam fe801000.csi: Starting stream on image device
[ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, nodes 1
[ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 0
[ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 819
[ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1638
[ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 2457
[ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 3276
[ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
[ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1059226
[ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
[ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1059226
[ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for node 0
[ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
[ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for node 0

Do you know what could be going on? I tried to compare the upstream and
downstream unicam drivers, and the interrupt handler seems to be
slightly different, but I'm afraid I'm a bit out of my depth there.

Also, and while it seems unrelated (it happens when exiting the
application), I'm getting:

[  452.053788] ------------[ cut here ]------------
[  452.058502] WARNING: CPU: 3 PID: 734 at drivers/media/common/videobuf2/videobuf2-core.c:2222 __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common]
[  452.071517] Modules linked in: vc4 hci_uart snd_soc_hdmi_codec btqca bcm2835_v4l2(C) snd_soc_core btrtl btbcm btsdio btintel brcmfmac_wcc bluetooth bcm2835_mmal_vchiq(C) ac97_bus snd_pcm_dmaengine videobuf2_vmalloc bcm2835_unicam snd_compress brcmfmac drm_dma_helper tc358743 v4l2_dv_timings videobuf2_v4l2 v4l2_fwnode videobuf2_dma_contig cpufreq_dt v4l2_async videodev brcmutil snd_bcm2835(C) drm_display_helper videobuf2_memops raspberrypi_cpufreq v3d snd_pcm videobuf2_common snd_timer pwrseq_core vfat fat snd soundcore mc cfg80211 bcm2711_thermal cec vchiq(C) broadcom bcm_phy_ptp bcm_phy_lib ledtrig_default_on gpu_sched i2c_mux_pinctrl leds_gpio genet pwm_bcm2835 iproc_rng200 i2c_mux mdio_bcm_unimac rfkill loop fuse nfnetlink reset_gpio gpio_raspberrypi_exp pwrseq_simple dwc2 crct10dif_ce raspberrypi_hwmon i2c_brcmstb clk_bcm2711_dvp udc_core sdhci_iproc bcm2835_wdt i2c_bcm2835 sdhci_pltfm bcm2835_dma sdhci phy_generic nvmem_rmem mmc_block rpmb_core mmc_core
[  452.157993] CPU: 3 UID: 0 PID: 734 Comm: dradis.bin Tainted: G         C         6.13.11 #252
[  452.166655] Tainted: [C]=CRAP
[  452.169663] Hardware name: raspberrypi Raspberry Pi 4 Model B Rev 1.1/Raspberry Pi 4 Model B Rev 1.1, BIOS 2024.10 10/01/2024
[  452.181140] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  452.188207] pc : __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common]
[  452.194503] lr : __vb2_queue_cancel+0x48/0x2f0 [videobuf2_common]
[  452.200707] sp : ffff800080e4bb30
[  452.204068] x29: ffff800080e4bb40 x28: 0000000000000009 x27: 0000000000000000
[  452.211321] x26: ffff40e6cda48b98 x25: 00000000400004d8 x24: 00000000000e001b
[  452.218573] x23: ffff40e6d064b280 x22: 0000000000000000 x21: ffff40e6d278c8b8
[  452.225824] x20: ffff40e6d278c630 x19: ffff40e6d278c738 x18: 00000000dbfbb796
[  452.233076] x17: 0000000000000000 x16: ffffc258986100e0 x15: 00000002d9a24a9e
[  452.240328] x14: 0000000000000000 x13: 00000002d9c4d651 x12: ffff40e6c08fa640
[  452.247578] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000100000000
[  452.254829] x8 : 0000000000000002 x7 : 0000000000008080 x6 : 00000000a6000004
[  452.262079] x5 : ffff800080e4b87a x4 : ffff40e6ff99a780 x3 : 0000000000000000
[  452.269329] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
[  452.276581] Call trace:
[  452.279061]  __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common] (P)
[  452.285357]  vb2_core_queue_release+0x2c/0x88 [videobuf2_common]
[  452.291472]  vb2_fop_release+0x80/0xc0 [videobuf2_v4l2]
[  452.296791]  v4l2_release+0xa8/0x128 [videodev]
[  452.301474]  __fput+0xa0/0x318
[  452.304583]  ____fput+0x20/0x38
[  452.307775]  task_work_run+0xb8/0xe8
[  452.311410]  do_exit+0x220/0x9c0
[  452.314688]  do_group_exit+0x7c/0xb0
[  452.318317]  get_signal+0x76c/0x878
[  452.321860]  do_signal+0xa4/0x1d8
[  452.325227]  do_notify_resume+0x70/0x160
[  452.329209]  el0_svc+0x70/0xe0
[  452.332313]  el0t_64_sync_handler+0x78/0x108
[  452.336650]  el0t_64_sync+0x19c/0x1a0
[  452.340368] ---[ end trace 0000000000000000 ]---
[  452.345101] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
[  452.354584] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active state

Let me know if you need anything more,
Maxime

--qu4ksva6uwsxqe6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCaApRiQAKCRDj7w1vZxhR
xYD9AQCXwo4AEoJMi9iwbAY0j4ZKfh4aRyfFfUXL31ycd1zfHwD+N+MkZmwRAAYn
eXCB3dxlWDNy8RdXVbJfKxK+fWLilAs=
=N07y
-----END PGP SIGNATURE-----

--qu4ksva6uwsxqe6z--


