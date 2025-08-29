Return-Path: <linux-media+bounces-41344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B645B3BFA5
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 17:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BF8A5A0D8B
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 15:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175BC32779A;
	Fri, 29 Aug 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RZrVyEEe"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9F326D54;
	Fri, 29 Aug 2025 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756482067; cv=none; b=mGKj123rzQpMmdDIgUqFBZNVpf72gvs178f03f1ykpbPCxPncsbjgq6oTtO46GL3aFv4JAKppX+vX8wQYur6VwCKJSLuKzL3p9rmlLMlV1Lp8GyZyBhzoeKKeiB/StJxDGBraHQ7+b+mA5maXJ1kPelXea1+VlryF7IPijXCi/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756482067; c=relaxed/simple;
	bh=F3j/ES+bWWGwnGf7MfhpFF6VZGrzyLff2kjZkVV0yjM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nWOI97UljA357NCuTBtK8awAep1FuPYzt9SDUUYEKMhY/nTDGeKWKfBUcEZ1ZCbIWCdwCZbyfizjUon9RE17baPtefSd6OynowXIlSGn6LS1L2Wpr6rQmr52+85Mm4DpPOUeubOhbDmSVVb7jtDfyy2oqcOuIks1Ucs1YyxVb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RZrVyEEe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756482063;
	bh=F3j/ES+bWWGwnGf7MfhpFF6VZGrzyLff2kjZkVV0yjM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RZrVyEEeRRmKVRHwY9EWmgEC/Vz6fzgy8AEFHv/MhnoXGq4hLqw8OtIR6IhMwgljL
	 IF0QsRQDFr5y09V8pjtljITgVVRcy1CbzofFqVlDQqclaPV/laOKrPciFdmTsUH81S
	 0G0LRxsfqqWZN93+vC+mtWxw48NAenJlBpQZxoyLTga7YrQ/eMpDPF6GymyrSikh7+
	 hLKVFpRZzZP2ObRh59cfH79vpTy58V3VZ9P2QpZjds2+IwrYdkDEVp48ljBv8Etq5/
	 XZ4M2rktqxKu1zyOMSN95/IHPkBq2IVm1G5uWNgqjvBmybzS3OG8D6R4DwGabPsmdy
	 DuHNUtfqHjQrg==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FBA617E0489;
	Fri, 29 Aug 2025 17:41:01 +0200 (CEST)
Message-ID: <f79ab2a0db0eb4aad20ed488de3635f9d8942cdf.camel@collabora.com>
Subject: Re: [PATCH v3 0/4] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 29 Aug 2025 11:40:59 -0400
In-Reply-To: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ecMmgB+uH+DWlWnHUeVO"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ecMmgB+uH+DWlWnHUeVO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jackson,

Le lundi 23 juin 2025 =C3=A0 09:21 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not=
 supported
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not=
 supported
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_REQBUFS/CREATE_BUF=
S/QUERYBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test CREATE_BUFS maximum buffe=
rs: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_EXPBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Requests: OK (Not Support=
ed)
>=20
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, War=
nings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed:=
 0, Warnings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0 Using 3 parallel job(s)
> Ran 133/147 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 40.114 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test fai=
ls because of a missing frame and slight corruption,
> =C2=A02 tests fail because of sizes which are incompatible with the IP, 1=
1 tests fail because of unsupported 10 bit format)
>=20
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Us=
ing 3 parallel job(s)
> Ran 78/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 43.364 secs
>=20
> (57 fail because the hardware is unable to decode=C2=A0 MBAFF / FMO / Fie=
ld / Extended profile streams.)
>=20
> Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Us=
ing 3 parallel job(s)
> Ran 25/69 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 40.411 secs


Ack, same results here and consistent.

>=20
> (44 fail because the hardware does not support field encoded and 422 enco=
ded stream)
>=20
> Seek test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. gst-play-1.0 seek.264
> 2. this will use waylandsink since gst-play-1.0 uses playbin.
> =C2=A0=C2=A0 if you don't want to hook up display,
> =C2=A0=C2=A0 you can run gst-play-1.0 seek.264 --videosink=3Dfakevideosin=
k instead 3. Let pipeline run for 2-3 seconds 4. press SPACE key to pause 5=
. press 0 to reset press SPACE to start again
>=20
> gst-play-1.0 seek.264 --videosink=3Dfakevideosink Press 'k' to see a list=
 of keyboard shortcuts.
> Now playing /root/seek.264
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...aused
> 0:00:09.9 / 0:00:09.7
> Reached end of play list.
>=20
> Sequence Change test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> gst-launch-1.0 filesrc location=3D./drc.h264 ! h264parse ! v4l2h264dec ! =
filesink location=3D./h264_output_420.yuv Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> Redistribute latency...
> Got EOS from element "pipeline0".
> Execution ended after 0:00:00.113620590
> Setting pipeline to NULL ...
> Freeing pipeline ...

I tried and reproduce your results. I've used an ISOMP4 file, nothing big, =
720p
10min video. After 30s of seeking back and forth I've got a deadlock, with =
the
following kernel log:

vdec 4210000.video-codec: wave5_vpu_firmware_command_queue_error_check: sti=
ll running: 0x1000

I don't know if its worse then before, but the bug is severe enough to be
concern. To reproduce easily, I pick a longer video, seek forward close to =
the
end, and then seek back (gst-play so smaller steps back) very quickly till =
it
reaches position 0, and repeat.

This happened without resolution change happening concurrent to seeks, just=
 a
flat, single resolution video. Once I do the same test with an agressive DR=
C in
place, I hit kernel crash. I will share in private email the DRC H.264 samp=
le
I'm using, and how to make it bigger so its manually seekable.

[  678.819859] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000358
[  678.828746] Mem abort info:
[  678.832378]   ESR =3D 0x0000000096000004
[  678.838555]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  678.845921]   SET =3D 0, FnV =3D 0
[  678.849882]   EA =3D 0, S1PTW =3D 0
[  678.854241]   FSC =3D 0x04: level 0 translation fault
[  678.860098] Data abort info:
[  678.864410]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
[  678.871000]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[  678.877384]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[  678.887785] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000882215000
[  678.901210] [0000000000000358] pgd=3D0000000000000000, p4d=3D00000000000=
00000
[  678.908585] Internal error: Oops: 0000000096000004 [#1]  SMP
[  678.914266] Modules linked in: rfkill qrtr rpmsg_ctrl rpmsg_char phy_cad=
ence_torrent tps6594_esm tps6594_pfsm tps6594_regulator rtc_tps6594 ti_am33=
5x_adc kfifo_buf pinctrl_tps6594 gpio_regmap cdns3 cdns_usb_common mux_gpio=
 omap_mailbox ti_k3_r5_remoteproc phy_j721e_wiz phy_can_transceiver wave5 v=
4l2_mem2mem powervr videobuf2_dma_contig drm_gpuvm videobuf2_memops videobu=
f2_v4l2 drm_exec at24 drm_shmem_helper tps6594_i2c videodev gpu_sched tps65=
94_core videobuf2_common k3_j72xx_bandgap ti_k3_dsp_remoteproc mc drm_kms_h=
elper ti_k3_common sa2ul ti_am335x_tscadc authenc m_can_platform m_can can_=
dev cdns3_ti rti_wdt fuse drm dm_mod backlight ipv6
[  678.971012] CPU: 1 UID: 0 PID: 51 Comm: kworker/1:1 Not tainted 6.17.0-r=
c3-jacinto+ #2 PREEMPT=20
[  678.979704] Hardware name: Texas Instruments J721S2 EVM (DT)
[  678.985358] Workqueue: events v4l2_m2m_device_run_work [v4l2_mem2mem]
[  678.991811] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  678.998767] pc : v4l2_m2m_try_run+0x74/0x13c [v4l2_mem2mem]
[  679.004345] lr : v4l2_m2m_try_run+0x60/0x13c [v4l2_mem2mem]
[  679.009922] sp : ffff800083333d60
[  679.013232] x29: ffff800083333d60 x28: 0000000000000000 x27: 00000000000=
00000
[  679.020358] x26: ffff000b7dfa8468 x25: 0000000000000000 x24: ffff0008000=
12205
[  679.027480] x23: ffff0008011aa300 x22: ffff000b7dfa8440 x21: ffff0008053=
f2220
[  679.034602] x20: ffff000800012200 x19: ffff0008053f2000 x18: 00000000000=
00000
[  679.041724] x17: 0000000000000000 x16: 0000000000000000 x15: 009f729c552=
fd3f8
[  679.048846] x14: 00000000000002ae x13: ffff8000811f4790 x12: 00000000000=
00537
[  679.055968] x11: 00000000000000c0 x10: 0000000000000ab0 x9 : ffff8000833=
33c80
[  679.063090] x8 : ffff0008011aae10 x7 : 0000000000002d02 x6 : 00000000000=
0ba6b
[  679.070212] x5 : ffff000827f68b40 x4 : ffff0008011aa300 x3 : ffff00080b2=
bb480
[  679.077333] x2 : 0000000000000000 x1 : ffff80007a972538 x0 : 00000000000=
00000
[  679.084456] Call trace:
[  679.086893]  v4l2_m2m_try_run+0x74/0x13c [v4l2_mem2mem] (P)
[  679.092462]  v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem]
[  679.098285]  process_one_work+0x150/0x290
[  679.102294]  worker_thread+0x2d0/0x3ec
[  679.106034]  kthread+0x12c/0x210
[  679.109255]  ret_from_fork+0x10/0x20
[  679.112825] Code: 39530000 370005c0 f9400260 f9412661 (f941ac00)=20
[  679.118905] ---[ end trace 0000000000000000 ]---


>=20
> Change since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v3 4/4] media: chips-media: wave5: Improve performance of de=
coder
> =C2=A0- squash v2's #3~#6 to #4 patch of v3

Thanks for this update, I'll check if anything is left appart from stabilit=
y and
provide feedback. I'm looking forward you input on the disclosed bug I have=
 hit.

Nicolas

>=20
> Change since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v2 2/7] media: chips-media: wave5: Improve performance of de=
coder
> =C2=A0- change log to dbg level
>=20
> Change since v0:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v1 2/7] media: chips-media: wave5: Improve performance of de=
coder
> =C2=A0- separates the previous patch to a few patches
>=20
> * For [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
> =C2=A0- separated from the previous patch of performance improvement of
> =C2=A0=C2=A0 decoder
>=20
> * For [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever sta=
te is changed
> =C2=A0- separated from the previous patch of performance improvement of
> =C2=A0=C2=A0 decoder
>=20
> * For [PATCH v1 5/7] media: chips-media: wave5: Fix not to free resources=
 normally when
> =C2=A0=C2=A0=C2=A0 instance was destroyed
> =C2=A0- separated from the previous patch of performance improvement of
> =C2=A0=C2=A0 decoder
>=20
> * For [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel pani=
c when closed
> =C2=A0- separated from the previous patch of performance improvement of
> =C2=A0=C2=A0 decoder
>=20
>=20
> Jackson Lee (4):
> =C2=A0 media: chips-media: wave5: Fix SError of kernel panic when closed
> =C2=A0 media: chips-media: wave5: Fix Null reference while testing fluste=
r
> =C2=A0 media: chips-media: wave5: Add WARN_ON to check if dec_output_info=
 is
> =C2=A0=C2=A0=C2=A0 NULL
> =C2=A0 media: chips-media: wave5: Improve performance of decoder
>=20
> =C2=A0.../platform/chips-media/wave5/wave5-helper.c |=C2=A0 23 ++-
> =C2=A0.../platform/chips-media/wave5/wave5-hw.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> =C2=A0.../chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 139 ++++++++++++------
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../platform/chips-media/wave5/wave5-vpu.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 71 +++++++--
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.c |=C2=A0 37 ++---
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.h |=C2=A0 11 ++
> =C2=A0.../chips-media/wave5/wave5-vpuconfig.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A08 files changed, 219 insertions(+), 73 deletions(-)

--=-ecMmgB+uH+DWlWnHUeVO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLHKCwAKCRDZQZRRKWBy
9KwWAP9YFnwnCw+shXgmITJgFF3slg4B6wlTxY7WqJvCL8g3ZwD+OZTgSfrmjUBU
8yhvhxnL+pNjJl3lf8hdoWlObhR7GgM=
=xvB6
-----END PGP SIGNATURE-----

--=-ecMmgB+uH+DWlWnHUeVO--

