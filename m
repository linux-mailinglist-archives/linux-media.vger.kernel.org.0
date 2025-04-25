Return-Path: <linux-media+bounces-30982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05335A9BF27
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE8C1B66EE2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E7C22D7A8;
	Fri, 25 Apr 2025 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NFExCxqK"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C91E5B70
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 07:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564725; cv=none; b=koOm1REwuYPwna+beAKlIIhk8hhCpLzpBSsyL3AMz0RB7HiobiGE2QLeZIO0/zhdCvJE3af8JyEoNc8S6fTAFDVHqN5/pM1WSCi1AoAEucsdMGyTb5aiu78SLTgxkEgBPjJ7NLMFXrryC7d+Lm8WloFwcFidJ8wVUhBGVvrge7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564725; c=relaxed/simple;
	bh=zTcV4Q7bBN0VeRPmqejm1KsHIFQMEWsuiCeIIeOdl6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kh1q3QcEtG5fKi4YT0GTYWMw9eW7cAk30dexROIrbUfX7rFB0lAxn4kZ/Aa80Vnk5NMWzYd0IiI/r6J3yqIQyrKxOKCxRmkvEcTR1OyUitZ9or6rxZPbW96BosH8X9XzmcgxFgLsjDRbMHo9MzFgAU9lljAFpYmKPP9DN9Q4+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NFExCxqK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745564722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bHKnsPiZE+FUzCcFyig80psrQi25rZQV/MOLPvxw6w=;
	b=NFExCxqKN5HceHnt7k4cpS8l/g/dhcWVRTgz5Lomal5ul4fZa4L2YMmgLDyOr2AoZ3sgUu
	PMEN+5BOabZ+zPKgrWKkrGTTO4A4pyw0xZDcbBZRdv0twIBW3OuQSgzIo/18jp9G5KabYq
	SaTGL8mLwuu5NHrKa3c4sLY+/awttog=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-8HC5YgfyOQiu8Cc0Q26Y9Q-1; Fri, 25 Apr 2025 03:05:19 -0400
X-MC-Unique: 8HC5YgfyOQiu8Cc0Q26Y9Q-1
X-Mimecast-MFC-AGG-ID: 8HC5YgfyOQiu8Cc0Q26Y9Q_1745564718
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so11838275e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 00:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564718; x=1746169518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bHKnsPiZE+FUzCcFyig80psrQi25rZQV/MOLPvxw6w=;
        b=T0NZjiuTTKRzyGzoe93F6KWYwLvHsPzr12mTEjBYapuZ5FnnABTkT97ylw9NFvyA7+
         Qszkn24LvabrowajwJiigu+C+R9lwTZh6vjblobiJszdywznMf1+0WIMTjXlmzZhg8A/
         NgFCPDUy3Ndwosk5F/EHs6AGLejALSHVEY38lrg9PJ65SMRX7bLNnVk4biFrMdCFlR9E
         lHA4urXEJ0APXE4+/wBAHKNc5SVhOzefe6JJgLO1TZiFpKJtMJ7oVzL01euT1zxZdfZw
         tWBvu+pWDXHs7VEztj4wcrUqpw0T8PZgHVsi2+37cjhOCx2286CK2x4ccDLhpSI1nSP3
         hDAw==
X-Forwarded-Encrypted: i=1; AJvYcCWK4YvNsQuLmJXJLUK84JJSpFV7gokIWTb0GCX8yJtGiZAHYFii9J8cb+ETVnHSWAzLcinz0Zl8JhVQig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0mXHx8TF3G2NdWYFhkLlrZ3PqEjBFVqjFN0MA0DiKfkpaNOW
	/b1pAkmquuauJsIwH3bkQC9mpFTxxTc0C5oZK+R8YAarIIJyK1uWbyC8NfJHkfh70vArVh2Ti2+
	5khSFuk2yU4hPqrqJdM3FBoOdP0Jb6na15QqcmzsS9RtvQVufpsnVCv1TqLtr
X-Gm-Gg: ASbGnctr3ZP6RpccJWYPDsrJcd1tFGZSXICVaWE+pE6GkNiwgmd/FkprSuNy6F51pn+
	uWdQ7CVqGGRPtwxpECdfk0VSrSHJeArjlYAMTmr13xhC+g/FxLhLbsfdiM0o6wxYgRkV9R8FDac
	2/dmARQsvAtPkWnwbcgylZKA0K8NizFSOxHWIRW4oY/u+r6gkYqYanCCxfgq7q3M01gh50xTeCu
	xIuX+ZWwXouJhXljDAeQGrwOLINrPDv3clUj+OaWh/vlWYP87qrrFHrXArZbFI=
X-Received: by 2002:a05:600c:5029:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-440a65cdbafmr8478415e9.7.1745564717902;
        Fri, 25 Apr 2025 00:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsfu5vYKtkQKeigFS7Dl8YHtcFF2OL0juQ8Nhzaul+FfkWBeEkemQ9sPSXB1kkIue6uDiZ7g==
X-Received: by 2002:a05:600c:5029:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-440a65cdbafmr8477945e9.7.1745564717417;
        Fri, 25 Apr 2025 00:05:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a25sm1423227f8f.69.2025.04.25.00.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:05:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:05:16 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: upstream unicam not returning any buffer
Message-ID: <20250425-zealous-malachite-boar-f5384e@houat>
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
 <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zxvo2z2bsbbixvlb"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>


--zxvo2z2bsbbixvlb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: upstream unicam not returning any buffer
MIME-Version: 1.0

Hi Dave,

On Thu, Apr 24, 2025 at 06:12:14PM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
> <kernel-list@raspberrypi.com> wrote:
> >
> > Hi,
> >
> > I've been trying to port a v4l2 application from the downstream unicam
> > driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
> >
> > While the application seemed to work ok with the downstream driver, the
> > same code will never get any buffer from the upstream unicode driver.
> > Either dqbuf will block forever (if it's blocking), or never return a
> > buffer (if it's non-blocking).
> >
> > The media-controller topology after the application configured it is:
> >
> > Media controller API version 6.13.11
> >
> > Media device information
> > ------------------------
> > driver          unicam
> > model           unicam
> > serial
> > bus info        platform:fe801000.csi
> > hw revision     0x0
> > driver version  6.13.11
> >
> > Device topology
> > - entity 1: unicam (3 pads, 3 links, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: SINK
> >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspac=
e:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> >                 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
> >         pad1: SOURCE
> >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspac=
e:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "unicam-image":0 [ENABLED,IMMUTABLE]
> >         pad2: SOURCE
> >                 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> >
> > - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev1
> >         pad0: SOURCE
> >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspac=
e:srgb]
> >                 [dv.caps:BT.656/1120 min:640x350@13000000 max:1920x1200=
@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,custo=
m]
> >                 [dv.detect:BT.656/1120 1280x720p60 (1650x750) stds: fla=
gs:]
> >                 [dv.current:BT.656/1120 1280x720p60 (1650x750) stds: fl=
ags:]
> >                 -> "unicam":0 [ENABLED,IMMUTABLE]
> >
> > - entity 9: unicam-image (1 pad, 1 link)
> >             type Node subtype V4L flags 1
> >             device node name /dev/video0
> >         pad0: SINK
> >                 <- "unicam":1 [ENABLED,IMMUTABLE]
> >
> > - entity 15: unicam-embedded (1 pad, 1 link)
> >              type Node subtype V4L flags 0
> >              device node name /dev/video1
> >         pad0: SINK
> >                 <- "unicam":2 [ENABLED,IMMUTABLE]
> >
> > The interrupt count in /proc/interrupts increases with a somewhat
> > reasonable rate, so it looks like I'm getting interrupts.
> >
> > Enabling the debug output of the unicam driver gives the following logs:
> >
> > [ 2522.686656] unicam fe801000.csi: Starting stream on image device
> > [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, nodes 1
> > [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 0
> > [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 819
> > [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 1638
> > [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 2457
> > [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 3276
> > [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 1059226
> > [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 1059226
> > [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 1059226
> > [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 1059226
> > [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 1059226
> > [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for node 0
> >
> > Do you know what could be going on? I tried to compare the upstream and
> > downstream unicam drivers, and the interrupt handler seems to be
> > slightly different, but I'm afraid I'm a bit out of my depth there.
>=20
> I must admit to not having run the upstream driver in anger.
>=20
> Your interrupt traces are odd for at least two reasons.
>=20
> ISTA always being 0x1 means only frame start events. No frame end
> (0x2) or line count interrupts (0x4).
> You should be getting 4 line count interrupts every frame or every 128
> lines if greater, and frame end at the end of each frame. Your
> interrupts are every 16.6ms (ish), which would follow with being FS
> only.
>=20
> "lines done" is incrementing by more than the 720 lines expected for
> the configured resolution. I suspect that it has updated the write
> address to the new buffer, and they just happen to be contiguous (at
> least to start with).
> Downstream has code that (incorrectly) returns the buffer to the
> internal queue if we get repeated FS events, but it probably wants to
> return them to userspace with VB2_BUF_STATE_ERROR.
>=20
> I'll try to find a few minutes to battle the upstream driver with
> tc358743 and see what I get.

I guess if it was RGB, it could be a vsync polarity issue then and
probably a DT issue, but I can't recall something similar for CSI.

The DT overlay I've been using is:

#include <dt-bindings/media/video-interfaces.h>

/dts-v1/;
/plugin/;

&csi1 {
	status =3D "okay";

	port {
		csi1_ep: endpoint {
			remote-endpoint =3D <&tc358743_ep>;
			bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
			clock-noncontinuous;
			data-lanes =3D <1 2>;
		};
	};
};

&i2c0 {
	status =3D "okay";
};

&i2c0mux {
	status =3D "okay";
};

&i2c0_1 {
	#address-cells =3D <1>;
	#size-cells =3D <0>;
	status =3D "okay";

	tc358743@f {
		compatible =3D "toshiba,tc358743";
		reg =3D <0x0f>;
		clock-names =3D "refclk";
		clocks =3D <&clk_27MHz>;

		port {
			tc358743_ep: endpoint {
				remote-endpoint =3D <&csi1_ep>;
				clock-noncontinuous;
				clock-lanes =3D <0>;
				data-lanes =3D <1 2>;
				link-frequencies =3D /bits/ 64 <486000000>;
			};
		};
	};
};

On top of current mainline DT.

> I have just noticed that 6.13 didn't get a backport of
> https://github.com/torvalds/linux/commit/697a252bb2ea414cc1c0b4cf4e3d94a8=
79eaf162.
> I don't know if that would affect you (gut feel is not).
>=20
> > Also, and while it seems unrelated (it happens when exiting the
> > application), I'm getting:
> >
> > [  452.053788] ------------[ cut here ]------------
> > [  452.058502] WARNING: CPU: 3 PID: 734 at drivers/media/common/videobu=
f2/videobuf2-core.c:2222 __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common]
> > [  452.071517] Modules linked in: vc4 hci_uart snd_soc_hdmi_codec btqca=
 bcm2835_v4l2(C) snd_soc_core btrtl btbcm btsdio btintel brcmfmac_wcc bluet=
ooth bcm2835_mmal_vchiq(C) ac97_bus snd_pcm_dmaengine videobuf2_vmalloc bcm=
2835_unicam snd_compress brcmfmac drm_dma_helper tc358743 v4l2_dv_timings v=
ideobuf2_v4l2 v4l2_fwnode videobuf2_dma_contig cpufreq_dt v4l2_async videod=
ev brcmutil snd_bcm2835(C) drm_display_helper videobuf2_memops raspberrypi_=
cpufreq v3d snd_pcm videobuf2_common snd_timer pwrseq_core vfat fat snd sou=
ndcore mc cfg80211 bcm2711_thermal cec vchiq(C) broadcom bcm_phy_ptp bcm_ph=
y_lib ledtrig_default_on gpu_sched i2c_mux_pinctrl leds_gpio genet pwm_bcm2=
835 iproc_rng200 i2c_mux mdio_bcm_unimac rfkill loop fuse nfnetlink reset_g=
pio gpio_raspberrypi_exp pwrseq_simple dwc2 crct10dif_ce raspberrypi_hwmon =
i2c_brcmstb clk_bcm2711_dvp udc_core sdhci_iproc bcm2835_wdt i2c_bcm2835 sd=
hci_pltfm bcm2835_dma sdhci phy_generic nvmem_rmem mmc_block rpmb_core mmc_=
core
> > [  452.157993] CPU: 3 UID: 0 PID: 734 Comm: dradis.bin Tainted: G      =
   C         6.13.11 #252
> > [  452.166655] Tainted: [C]=3DCRAP
> > [  452.169663] Hardware name: raspberrypi Raspberry Pi 4 Model B Rev 1.=
1/Raspberry Pi 4 Model B Rev 1.1, BIOS 2024.10 10/01/2024
> > [  452.181140] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  452.188207] pc : __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common]
> > [  452.194503] lr : __vb2_queue_cancel+0x48/0x2f0 [videobuf2_common]
> > [  452.200707] sp : ffff800080e4bb30
> > [  452.204068] x29: ffff800080e4bb40 x28: 0000000000000009 x27: 0000000=
000000000
> > [  452.211321] x26: ffff40e6cda48b98 x25: 00000000400004d8 x24: 0000000=
0000e001b
> > [  452.218573] x23: ffff40e6d064b280 x22: 0000000000000000 x21: ffff40e=
6d278c8b8
> > [  452.225824] x20: ffff40e6d278c630 x19: ffff40e6d278c738 x18: 0000000=
0dbfbb796
> > [  452.233076] x17: 0000000000000000 x16: ffffc258986100e0 x15: 0000000=
2d9a24a9e
> > [  452.240328] x14: 0000000000000000 x13: 00000002d9c4d651 x12: ffff40e=
6c08fa640
> > [  452.247578] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000=
100000000
> > [  452.254829] x8 : 0000000000000002 x7 : 0000000000008080 x6 : 0000000=
0a6000004
> > [  452.262079] x5 : ffff800080e4b87a x4 : ffff40e6ff99a780 x3 : 0000000=
000000000
> > [  452.269329] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000=
000000000
> > [  452.276581] Call trace:
> > [  452.279061]  __vb2_queue_cancel+0x260/0x2f0 [videobuf2_common] (P)
> > [  452.285357]  vb2_core_queue_release+0x2c/0x88 [videobuf2_common]
> > [  452.291472]  vb2_fop_release+0x80/0xc0 [videobuf2_v4l2]
> > [  452.296791]  v4l2_release+0xa8/0x128 [videodev]
> > [  452.301474]  __fput+0xa0/0x318
> > [  452.304583]  ____fput+0x20/0x38
> > [  452.307775]  task_work_run+0xb8/0xe8
> > [  452.311410]  do_exit+0x220/0x9c0
> > [  452.314688]  do_group_exit+0x7c/0xb0
> > [  452.318317]  get_signal+0x76c/0x878
> > [  452.321860]  do_signal+0xa4/0x1d8
> > [  452.325227]  do_notify_resume+0x70/0x160
> > [  452.329209]  el0_svc+0x70/0xe0
> > [  452.332313]  el0t_64_sync_handler+0x78/0x108
> > [  452.336650]  el0t_64_sync+0x19c/0x1a0
> > [  452.340368] ---[ end trace 0000000000000000 ]---
> > [  452.345101] videobuf2_common: driver bug: stop_streaming operation i=
s leaving buffer 1 in active state
> > [  452.354584] videobuf2_common: driver bug: stop_streaming operation i=
s leaving buffer 2 in active state
>=20
> I'm guessing this is exit without closing file handles cleanly, ie ctrl-c.

Yes.

> Somewhere along the line a couple of buffers haven't been cancelled with =
vb2.
>=20
> Downstream I'd originally copied atmel-isi (IIRC) and the handling it
> had. The upstream driver is just using vb2_fop_release, and I can't
> immediately see the path that would call streamoff in those
> situations.
> Setting CONFIG_VIDEO_ADV_DEBUG appears to dump a load of stats for
> unbalanced things in vb2_queue_free, so it'd be interesting to know
> what that reported.
> (https://elixir.bootlin.com/linux/v6.14.3/source/drivers/media/common/vid=
eobuf2/videobuf2-core.c#L606)

I'll give it a try, thanks!
Maxime

--zxvo2z2bsbbixvlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaAs0KwAKCRAnX84Zoj2+
dnSBAYCCuigf5FLQjZ3UqtENr1tPcr8bI4dQZq+1AhElS404dY64PlQTBiHhLk5s
wMYpKMABgOG9un/HQODbur3/I5f2vCLFrQUfmhG8nOryHriKQyfmgeyC7aEBNl7D
nsEHy6nUrA==
=2iDx
-----END PGP SIGNATURE-----

--zxvo2z2bsbbixvlb--


