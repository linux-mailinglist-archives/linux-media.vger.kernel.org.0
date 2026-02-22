Return-Path: <linux-media+bounces-53145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBdFDsFfm2kmywMAu9opvQ
	(envelope-from <linux-media+bounces-53145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 20:57:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EF1703B4
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 20:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50F30300980E
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 19:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78835BDB8;
	Sun, 22 Feb 2026 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="MN+lJy9m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79DE34F498
	for <linux-media@vger.kernel.org>; Sun, 22 Feb 2026 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771790264; cv=none; b=CfM04XGG0Kwy40Qf+/QPVd2f3u95vWsBM8XbpWcVbhW6RBV71P5dvrdFnI6o76psDuAUxAEnxKFvHHX96AzG0ZD6+isXaoc1U2ghLnCIzY+Cnm8B/Xv9JKrNQYoZOf3Ncj+3+ZaGoUNWY5tqNgR0dGCycR5AsXrhNY7PHEeLK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771790264; c=relaxed/simple;
	bh=R1L/HH0FjupSMC3dCFpbqmQXfAo35zLpkD+5mzPPk3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ay3JJ3guAybf6J8w6nPPyLOQpRPmHB5U8pYNwBauFoneSjkumkLcxwKiAhzSgu4+HhgBlRvCEoK/4s/u5iMhA4OEjIGjH70iUGIGGWj2vY3jKZOWNHWF4RuPzxwDJjwVaEoEYnlFQMPYMVO+bD/QttgBzVDcs/2FJBaWNBC0B8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=fail smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=MN+lJy9m; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771790241; x=1772049441;
	bh=ycYZe0tXV+C+hTkrpeTy8HOFOdhZQnvauJTAyC0Zv5s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MN+lJy9mm6NdhqMrR7wUBCl4JaTpxX202LbiqbZ+UPALfPzDI9oTnine9vhy4vy1J
	 gsZIz3SiG8LyB9palIVRwU5owR+Q9w0pFZpBPMTctNhRR9lqqZRNPaTU0fo7AGo4l9
	 4O6ySaT+0tMeqbbzR9rXyu8wgGOu/vTbhHgYvl227tTX/bHNEnLHeSaZZY054bi2X1
	 scBtlRFQBlU+N2V++T6dqPEJbY9pviqgDxvPc6mHwul69SGEQfgxe2jrulQImGNbNz
	 FJ19vjkDAawUx8KCrevDn6E0EnmdLz9Myb79Euf5yGSjy9lYZLQOQ8vE+y2GYLd26T
	 2VutCsSM4alLw==
Date: Sun, 22 Feb 2026 19:57:15 +0000
To: Andreas Helbech Kleist <andreaskleist@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, Ricardo Ribalda <ribalda@chromium.org>, claus.stovgaard@gmail.com
From: Ruslan Bay <ruslanbey@proton.me>
Cc: ilpo.jarvinen@linux.intel.com, tfiga@chromium.org, senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com, tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: RFC: Intel IPU4 driver proof of concept
Message-ID: <6f37f978-4898-473e-b774-7965d25bf27b@proton.me>
In-Reply-To: <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com> <20230727071558.1148653-11-bingbu.cao@intel.com> <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com> <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com> <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com> <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com> <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com> <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com> <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: dbcc994f52754ec12c905ea0b91d94c5692f9d5c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53145-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,linux.intel.com,intel.com,vger.kernel.org,ideasonboard.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruslanbey@proton.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 517EF1703B4
X-Rspamd-Action: no action

We now have a working IPU4P driver for Ice Lake devices [1][2].

The current IPU4P implementation is based on Intel=E2=80=99s downstream IPU=
4
driver [3]. ISYS capture works with libcamera and has been tested on
Surface Pro 7 and Surface Book 3 [4]. The world-facing camera (ov8865)
works; the user-facing (ov5693) is still being debugged.

IPU4P and IPU6 both contain PSYS implementations downstream, but in
practice only ISYS is usable with libcamera today.

Earlier in this thread Andreas noted that IPU4 and IPU6 share more than
85% of the code base.IPU7 appears architecturally very similar as well.

Before preparing an RFC, I would like clarification on direction:

1. Is the long-term plan to unify IPU6 and IPU7 under a common driver
   structure?
2. If so, should IPU4/IPU4P be aligned on top of that?
3. If not, would it make sense to follow Andreas=E2=80=99 approach [5],
   implement IPU4P on top of the IPU6 structure, and move it to
   staging while iterating, as has been done for IPU7?

The primary goal is upstream IPU4P support (large Ice Lake user base),
but ideally this should align with the Apollo Lake IPU4 work shared
earlier [5].

What direction would you recommend?

[1] https://github.com/ruslanbay/ipu4-drivers/tree/main/patches/kernel/v6.1=
9
[2] https://github.com/ruslanbay/linux/commits/ipu4-6.19
[3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t-2=
51103T063840Z/drivers/media/pci/intel
[4] https://github.com/linux-surface/linux-surface/discussions/1353?sort=3D=
new
[5] https://github.com/Kleist/ipu4-driver

Thanks,
Ruslan Bay

On 12/20/23 1:53 PM, Andreas Helbech Kleist wrote:
> Hi,
>=20
> As mentioned previously in Bingbu's IPU6 patch series, I'm working on
> porting the driver to IPU4. I've now got a hole through so I think it
> makes sense sense to share the code.
>=20
> I'm able to capture frames with yavta with the current code, but there
> are several issues that needs to be fixed for it to be complete.
>=20
> # How it is tested
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The hardware is a custom x86 PC-like embedded device with the following
> video pipeline:
> Endoscope -> FPGA -> tc358748 -> IPU4 (E3950/Apollo Lake)
>=20
> See my colleague Claus' description[2] for more info.
>=20
> There is currently no V4L2 subdevice for the FPGA, so we have a custom
> ambu-tc358748.c driver which pretends to be an image sensor.
>=20
> $ media-ctl -v \
>   -V "\
>     \"tc358748 0-000e\"    :0 [fmt:RGB888_1X24/800x800],\
>     \"Intel IPU4 CSI2 0\"  :0 [fmt:RGB888_1X24/800x800],\
>     \"Intel IPU4 CSI2 0\"  :1 [fmt:RGB888_1X24/800x800]\
>     "\
>   -l "\
>     \"tc358748 0-000e\"    :0 -> \"Intel IPU4 CSI2 0\" :0 [1],\
>     \"Intel IPU4 CSI2 0\"  :1 -> \"Intel IPU4 ISYS Capture 12\" :0 [5]\
>   "
>=20
> $ yavta --data-prefix -c2 -n2 -I -s 800x800 --file=3D/tmp/frame-#.bin \
>         -f XBGR32 /dev/video12
>=20
> This produces frame-*.bin files containing 800x800x4 bytes of valid
> "BGR0" data.
>=20
> # The code
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The code is available at the tag
> https://github.com/Kleist/linux/tree/kleist-v6.6-ipu4-hacks-1
> (15245fe26e07)
>=20
>=20
> Note that I haven't renamed the files to ipu4, to make it clear what
> the changes are compared to the IPU6 driver.
>=20
> It is based on v6.6 with the IPU6 v2 patches[1] on top, and then my
> hacks to make the IPU4 work. This is not meant for upstreaming as it
> is. The commits are a cleaned up version of the chronological order I
> made the port in. It is not yet in a state where I think an RFC PATCH
> series makes sense yet, but I wanted to share it anyway.
>=20
> ## Changes compared to IPU6
> diff --stat of the changes in ../ipu6/ compared to the IPU6 v2 patches:
>=20
>  drivers/media/pci/intel/ipu6/Kconfig               |  12 +-
>  drivers/media/pci/intel/ipu6/Makefile              |  13 +-
>  drivers/media/pci/intel/ipu6/ipu6-bus.c            |   2 +-
>  drivers/media/pci/intel/ipu6/ipu6-bus.h            |   6 +-
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  71 ++-
>  drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   8 +-
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  45 +-
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   2 +-
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        | 171 ++++---
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        | 237 ++++++----
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      | 219 +++++----
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |  11 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  33 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   8 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 212 +++------
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |   4 -
>  drivers/media/pci/intel/ipu6/ipu6-isys.c           | 435 +++----------
> -----
>  drivers/media/pci/intel/ipu6/ipu6-isys.h           |  18 +-
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c            | 130 +++++-
>  .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  98 +---
>  .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   | 226 ++-------
>  drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  | 172 ++-----
>  drivers/media/pci/intel/ipu6/ipu6.c                | 511 ++++++++-----
> --------
>  drivers/media/pci/intel/ipu6/ipu6.h                |  37 +-
>  24 files changed, 1032 insertions(+), 1649 deletions(-)
>=20
> Note that most of the deleted lines are removed because they are not
> used in IPU4. E.g. the watermark handling, which I haven't seen an
> equivalent for in the old IPU4 driver.
>=20
> ## Ambu-specific tweaks
> Note that I'm using a hacked ipu-bridge (AMBU_IPU_BRIDGE) to setup the
> fwnode graph for our hardware. You don't want if you're testing this,
> so revert at least the "ambu: Add AMBU_IPU_BRIDGE" commit.
>=20
> I'm not sure the right approach for handling this would be going
> forward. Of course the ambu-ipu-bridge shouldn't be upstreamed, so I'm
> wondering how we can achieve something similar? The ACPI tables from
> our BIOS unfortunately don't contain any info about the Toshiba Bridge
> (tc358748), so we can't derive the information from there. Maybe some
> kind of platform driver could be created which tweaks the ACPI info
> before the ipu-bridge driver reads it?
>=20
> What do you typically do when you have some proprietary hardware that
> does not provide proper ACPI information? We could carry the ambu-ipu-
> bridge patches in our internal kernel tree, but that is not desirable
> in the long term.
>=20
> # Inspiration for the IPU4 port
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> We are currently using a Intel LTS 4.19.217 based kernel[3], which
> contains the old IPU4 driver. The port was basically made by comparing
> mmiotrace's between the old IPU4 driver and the new driver.
>=20
> We're using the IPU4 FW ipu4_cpd_b0.bin extracted from a ClearLinux
> package[4].
>=20
> # Known issues
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ## Doesn't yet work with gstreamer for unknown reasons
> I get "Unexpected buffer address:" errors from
> ipu6_isys_queue_buf_ready, and don't get an image through.
>=20
> ## 64 byte chunks of wrong data
> We occasionally get 64 byte aligned 64 byte wrong data (all 0xCC) in
> the captured frame*.bin files. This could be a cache invalidation
> issue, we haven't looked into this yet. The code currently doesn't use
> zlw_invalidate, even though it was ported from the old driver. We
> haven't yet tested if enabling this fixes the issue.
>=20
> # Upstreaming
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> We would like to upstream this driver, probably after the IPU6 driver
> has been merged. We're definitely not ready yet (either), but I already
> have a couple of questions, that it would be nice to get some input on
> from the community.
>=20
> ##=C2=A0How to share code between IPU4 and IPU6
> Big parts of the code (approximately 6k out of 7k lines) does not need
> to be changed compared to the IPU6 driver, so there is clearly a big
> overlap in what the two drivers need to do. I'm not sure how the best
> approach would be for sharing this functionality. I see a few options:
> 1. Shared driver that supports both IPU's (still split in PCI driver
> and -isys driver)
> 2. Shared PCI driver that supports both IPU's, but device-specific
> intel-ipu4-isys/intel-ipu6-isys drivers
> 3. Separate drivers that use a shared "library module" (for lack of a
> better term)
>=20
> My gut feeling is that 2. is the right choice, especially if we moved
> the shared code in to the PCI driver and the more version-specific code
> was moved into the specific drivers.
>=20
> The answer to this could also be input to Bingbu's IPU6 series, maybe
> it would make sense to place some files differently if they eventually
> will be used in both IPU4 and IPU6 drivers?
>=20
> ## How to implement our platform specific fwnode graph?
> As mentioned above, we currently have a hacked ambu-ipu-bridge driver,
> which is clearly not upstreamable. What would you typically do if you
> need to make a v4l setup where the ACPI table information about
> sensors/bridges is missing?
>=20
> /Andreas
>=20
> [1]https://lore.kernel.org/all/20231024112924.3934228-1-bingbu.cao@intel.=
com/
> [2]
> https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015f.came=
l@gmail.com/
> [3]
> https://github.com/intel/linux-intel-lts/tree/lts-v4.19.217-base-211118T0=
72627Z
> [4]
> https://download.clearlinux.org/releases/32370/clear/source/SRPMS/linux-f=
irmware-ipu-19ww39-104.src.rpm



