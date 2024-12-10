Return-Path: <linux-media+bounces-23088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C359EBA4E
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB352830C6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958DF226194;
	Tue, 10 Dec 2024 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b="gk+EkgS7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0D23ED7F;
	Tue, 10 Dec 2024 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860007; cv=pass; b=TWHrFM+LsqL0jqVjk54MS18R2lBAfDZ3Yd74o/cLX0UOT7rNiBKFIBGAp/UXX7EYngreoh0anfPfYXx+FTVoxfOTP6jGnahGLEp7ojytU4YPDOlqhOBEu3G9WoX8XyyH/n7N2i8iD3AgjPn2kc4MdnK6u+gEt2IhhGUQaARnRGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860007; c=relaxed/simple;
	bh=bSP+5CU6Tq/3ZNJIIeTdIo0dH4kLwJEhBHDwmlRkmTs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jggsODHcG/aehra3k9KdqjTFFh9645GBZi4RAbNYC5y31+PNFu8hr2JnwF6xXmfZsBnPqfbzubXfsicRjgah5wkozq24/N3JWQY2G1ejl92EIr8IePKP/hqcQ1oCN232FU3zwJbh2xMJYIMNlROxxMzraVK/8orR4i0q4AIRCO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b=gk+EkgS7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1733859973; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N7j7rJANTO9Fs9sfoZEXmkoThSK8aqWNiJDuQ+gAvd2YiX05CwDXOX/JgAgB79Wy2e9RdahELPhSUfKl5RVLznK5tIa9bo/IHEPsFrfrWZutSalmbGM8sFgQPErmcZoD0VRxrrSRxdaGVIEEv9iM1V6GEAZhTMJTf3Xd+/AR1CQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733859973; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V5v280arAlfnX/7La05ySk67riDlfV/dnfYsaTBkvYA=; 
	b=d94Z8v8d7YEjzMtoClM+kXqxhXPx9m70QxSvrmPbwfQOfeBsqMivjiHM/iYJ+jmwrU660LNjk2httByDAHiAghXupaAUNg8MYuAYv5hWS2AFjdM5xBfdDUy4kYCCcA+5cSciKxrcNye+GWh+22ywIWQFe1kjA5PjSPWblE6CvRw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=shreeya.patel@collabora.com;
	dmarc=pass header.from=<shreeya.patel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733859972;
	s=zohomail; d=collabora.com; i=shreeya.patel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V5v280arAlfnX/7La05ySk67riDlfV/dnfYsaTBkvYA=;
	b=gk+EkgS7qCwQAzcmYZhbjOSNB7tSix0O0l1bWzJVCSww0NaND8rVfIrgt+XY+nXK
	+KQzyqq4ibkEScq2QbCc7uSGsOktJkGZ3+Zkrl9rMW1fDDM8MmrMCmztYusspzXxwT5
	Y8frr0lLp6sYrCw5cGFRgtCWNsFDtKgFyAmCPek0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1733859970857864.9988375805766; Tue, 10 Dec 2024 11:46:10 -0800 (PST)
Date: Wed, 11 Dec 2024 01:16:10 +0530
From: Shreeya Patel <shreeya.patel@collabora.com>
To: =?UTF-8?Q?=22Heiko_St=C3=BCbner=22?= <heiko@sntech.de>
Cc: "mchehab" <mchehab@kernel.org>, "robh" <robh@kernel.org>,
	"krzk+dt" <krzk+dt@kernel.org>, "conor+dt" <conor+dt@kernel.org>,
	"mturquette" <mturquette@baylibre.com>, "sboyd" <sboyd@kernel.org>,
	"p.zabel" <p.zabel@pengutronix.de>,
	"jose.abreu" <jose.abreu@synopsys.com>,
	"nelson.costa" <nelson.costa@synopsys.com>,
	"shawn.wen" <shawn.wen@rock-chips.com>,
	"nicolas.dufresne" <nicolas.dufresne@collabora.com>,
	"hverkuil" <hverkuil@xs4all.nl>,
	"hverkuil-cisco" <hverkuil-cisco@xs4all.nl>,
	"kernel" <kernel@collabora.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-media" <linux-media@vger.kernel.org>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip" <linux-rockchip@lists.infradead.org>,
	"dmitry.osipenko" <dmitry.osipenko@collabora.com>
Message-ID: <193b21b8ee6.1291091ad1750656.8123869056710701348@collabora.com>
In-Reply-To: <7197326.aoefvbuG5b@diego>
References: <01020193ad025176-f2e8e4fd-41a6-42ef-b3d0-dfa87a6d0abd-000000@eu-west-1.amazonses.com> <7197326.aoefvbuG5b@diego>
Subject: Re: [PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

 ---- On Tue, 10 Dec 2024 02:43:47 +0530  Heiko St=C3=BCbner  wrote ---=20
 > Hi Shreeya,
 >=20

Hi Heiko,

 > Am Montag, 9. Dezember 2024, 21:00:30 CET schrieb Shreeya Patel:
 > > This series implements support for the Synopsys DesignWare
 > > HDMI RX Controller, being compliant with standard HDMI 1.4b
 > > and HDMI 2.0.
 >=20
 > could you take a look at your mail-setup please?
 >=20
 > This cover-letter came with a message-id of=20
 > 01020193ad025176-f2e8e4fd-41a6-42ef-b3d0-dfa87a6d0abd-000000@eu-west-1.a=
mazonses.com
 >=20
 > same for patch1 that also got an amazon-message-id and lost its
 > in-reply-to reference,
 >=20
 > while the patches  2-4 have correct message-ids and reference
 > 20241209200120.3228643-1-shreeya.patel@collabora.com
 >=20
 > as their parent. So it looks like some amazon service did some
 > rewriting and broke threading :-( .
 >=20

Yes, unfortunately there was a server timeout error after sending the
first patch which broke the thread.
I've resent the patch series now.


Thanks,
Shreeya Patel

 > Thanks a lot
 > Heiko
 >=20
 > > Features that are currently supported by the HDMI RX driver
 > > have been tested on rock5b board using a HDMI to micro-HDMI cable.
 > > It is recommended to use a good quality cable as there were
 > > multiple issues seen during testing the driver.
 > >=20
 > > Please note the below information :-
 > > * HDMIRX driver now only works with the opensource TF-A.
 > > * We have tested the working of OBS studio with HDMIRX driver and
 > > there were no issues seen.
 > > * We also tested and verified the support for interlaced video.
 > >=20
 > > To test the HDMI RX Controller driver, following example commands can =
be used :-
 > >=20
 > > root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video=
0 \
 > > --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3D'BGR3' --st=
ream-mmap=3D4 \
 > > --stream-skip=3D3 --stream-count=3D100 --stream-to=3D/home/hdmiin4k.ra=
w --stream-poll
 > >=20
 > > root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvi=
deo \
 > > -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv
 > >=20
 > > CEC compliance test results :-
 > >=20
 > > * https://gitlab.collabora.com/-/snippets/380
 > > * https://gitlab.collabora.com/-/snippets/381
 > >=20
 > > Following is the v4l2-compliance test result :-
 > >=20
 > > root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video0=
=20
 > > v4l2-compliance 1.29.0-5278, 64 bits, 64-bit time_t
 > > v4l2-compliance SHA: 791da13728d9 2024-11-25 10:01:57
 > >=20
 > > Compliance test for snps_hdmirx device /dev/video0:
 > >=20
 > > Driver Info:
 > > =C2=A0=C2=A0=C2=A0=C2=A0Driver name      : snps_hdmirx
 > > =C2=A0=C2=A0=C2=A0=C2=A0Card type        : snps_hdmirx
 > > =C2=A0=C2=A0=C2=A0=C2=A0Bus info         : platform:fdee0000.hdmi_rece=
iver
 > > =C2=A0=C2=A0=C2=A0=C2=A0Driver version   : 6.12.0
 > > =C2=A0=C2=A0=C2=A0=C2=A0Capabilities     : 0x84201000
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Video Capture Multipla=
nar
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Streaming
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Extended Pix Format
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Device Capabilities
 > > =C2=A0=C2=A0=C2=A0=C2=A0Device Caps      : 0x04201000
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Video Capture Multipla=
nar
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Streaming
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Extended Pix Format
 > >=20
 > > Required ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCAP: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test invalid ioctls: OK
 > >=20
 > > Allow for multiple opens:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test second /dev/video0 open: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCAP: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PRIORITY: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test for unlimited opens: OK
 > >=20
 > > Debug ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_DBG_G/S_REGISTER: OK (Not Supporte=
d)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_LOG_STATUS: OK
 > >=20
 > > Input ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not=
 Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUMAUDIO: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/ENUMINPUT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_AUDIO: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0Inputs: 1 Audio Inputs: 0 Tuners: 0
 > >=20
 > > Output ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_MODULATOR: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUMAUDOUT: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_AUDOUT: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0Outputs: 0 Audio Outputs: 0 Modulators: 0
 > >=20
 > > Input/Output configuration ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Suppor=
ted)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_DV_TIMINGS_CAP: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_EDID: OK
 > >=20
 > > Control ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCTRL: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_CTRL: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/TRY_EXT_CTRLS: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0Standard Controls: 4 Private Controls: 0
 > >=20
 > > Format ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS=
: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PARM: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_FBUF: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_FMT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_TRY_FMT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_S_FMT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supporte=
d)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Cropping: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Composing: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Scaling: OK (Not Supported)
 > >=20
 > > Codec ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Support=
ed)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_ENC_INDEX: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(TRY_)DECODER_CMD: OK (Not Support=
ed)
 > >=20
 > > Buffer ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test CREATE_BUFS maximum buffers: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_REMOVE_BUFS: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_EXPBUF: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Requests: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test blocking wait: OK
 > >=20
 > > Total for snps_hdmirx device /dev/video0: 48, Succeeded: 48, Failed: 0=
, Warnings: 0
 > >=20
 > >=20
 > > Changes in v5 :-
 > > - Fix the interrupt IRQ number in the dt-bindings and device tree
 > > - Add alignment property to ensure hdmi-receiver-cma
 > >   starts at a 64KB-aligned address
 > > - Change the MODULE_DESCRIPTION
 > > - Add VIDEO_SYNOPSYS_HDMIRX as prefix to the default edid config
 > > - Drop the enabling of default edid in the Kconfig
 > > - Replace the default EDID with hdmi-4k-300mhz EDID produced
 > >   by v4l2-ctl tool for better compatibility with various HDMI
 > >   cables and adapters
 > > - Rework the write_edid and set_edid functions
 > > - During format change, retrieve the current pixel format,
 > >   color depth, and AVI infoframe details instead of only
 > >   detecting the format
 > > - Improve the logging mechanism and delays in the
 > >   hdmirx_wait_signal_lock function
 > > - Fix the 4K@60 capturing for RGB format
 > > - Document what hdmirx_check_timing_valid function does
 > > - Rework the hdmirx_get_detected_timings function
 > > - Fix the NV16/24 size image value
 > > - Add the implementation from Benjamin Hoff to expose the
 > >   ITC type to v4l2
 > > - Remove all the firmware related code
 > >=20
 > > Changes in v4 :-
 > > - Remove DTS changes included in the device tree patch
 > > - Remove the hdmi rx pin info as it's already present
 > > in the rk3588-base-pinctrl.dtsi
 > > - Create a separate config option for selecting the EDID
 > > and enable it by default
 > > - Improve the comment related to DV timings and move it
 > > to the side of hdmirx_get_detected_timings
 > > - Add 100ms delay before pulling the HPD high
 > > - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
 > > - Drop the bus info from hdmirx_querycap
 > > - If *num_planes !=3D 0 then return 0 in hdmirx_queue_setup
 > > - Set queue->min_queued_buffers to 1
 > > - Drop q->allow_cache_hints =3D 0; as it's always 0 by default
 > > - Add a comment for q->dma_attrs =3D DMA_ATTR_FORCE_CONTIGUOUS;
 > > - Drop .read =3D vb2_fop_read as it's not supported by driver
 > > - Remove redundant edid_init_data_600M
 > > - Make HPD low when driver is loaded
 > > - Add support for reading AVI Infoframe
 > > - Remove msg_len checks from hdmirx_cec_transmit
 > > - Add info about the CEC compliance test in the cover letter
 > > - Add arbitration lost status
 > > - Validate the physical address inside the EDID
 > >=20
 > > Changes in v3 :-
 > > - Use v4l2-common helpers in the HDMIRX driver
 > > - Rename cma node and phandle names
 > > - Elaborate the comment to explain 160MiB calculation
 > > - Move &hdmi_receiver_cma to the rock5b dts file
 > > - Add information about interlaced video testing in the
 > > cover-letter
 > >=20
 > > Changes in v2 :-
 > > - Fix checkpatch --strict warnings
 > > - Move the dt-binding include file changes in a separate patch
 > > - Add a description for the hardware in the dt-bindings file
 > > - Rename resets, vo1 grf and HPD properties
 > > - Add a proper description for grf and vo1-grf phandles in the
 > > bindings
 > > - Rename the HDMI RX node name to hdmi-receiver
 > > - Include gpio header file in binding example to fix the
 > > dt_binding_check failure
 > > - Move hdmirx_cma node to the rk3588.dtsi file
 > > - Add an entry to MAINTAINERS file for the HDMIRX driver
 > >=20
 > > Shreeya Patel (4):
 > >   MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
 > >   dt-bindings: media: Document bindings for HDMI RX Controller
 > >   arm64: dts: rockchip: Add device tree support for HDMI RX Controller
 > >   media: platform: synopsys: Add support for HDMI input driver
 > >=20
 > >  .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
 > >  MAINTAINERS                                   |    8 +
 > >  .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
 > >  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
 > >  drivers/media/platform/Kconfig                |    1 +
 > >  drivers/media/platform/Makefile               |    1 +
 > >  drivers/media/platform/synopsys/Kconfig       |    3 +
 > >  drivers/media/platform/synopsys/Makefile      |    2 +
 > >  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
 > >  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
 > >  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2662 ++++++++++++++++=
+
 > >  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
 > >  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  283 ++
 > >  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
 > >  14 files changed, 3633 insertions(+)
 > >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hd=
mi-rx.yaml
 > >  create mode 100644 drivers/media/platform/synopsys/Kconfig
 > >  create mode 100644 drivers/media/platform/synopsys/Makefile
 > >  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
 > >  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
 > >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
.c
 > >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
.h
 > >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
_cec.c
 > >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
_cec.h
 > >=20
 > >=20
 >=20
 >=20
 >=20
 >=20
 >=20


