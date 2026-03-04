Return-Path: <linux-media+bounces-54457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 40GcGbgRqGmzngAAu9opvQ
	(envelope-from <linux-media+bounces-54457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:04:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B002D1FEA43
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8787A30378AB
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2EF36B056;
	Wed,  4 Mar 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WSk/z79n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E13368A9
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622254; cv=none; b=hbnI+e5QDa876xpzg6DuzK/ZO/sgS1IVKqDsPypGav3KUdAxM/gdAZsw6aWW3n3A3jXov6aiw2E6by7xgEwi3pgqveiSSw3l4oYntcC/vpzF7tAuIaK+B91cSD7ZqCgAJK/MeQkIvXYyvdTPR5eqxt/l/wJMqSPCM4awAQ1snYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622254; c=relaxed/simple;
	bh=So18C240TDK44Y0j9F81EU4nDSkbJYkTgI3N6TbPuv4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4D/N1TPX3Zq7yk3y8L627wUlkKvqygHk7LOmG/27uoPgAQrSGwVxIt8mRV5YZqGVXmdHWUjDraYg4iDjnj8K0SgwgilJCbZO5O/NQreQ8xJgPhYjQjW17/OMy1ZsZjTsbjeKiFp5OD18SSlb1ZUU4FSFZM2kHpTD4ySE9M3MxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WSk/z79n; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=fvgd6vg2erdvhe5mt4sdk2lrby.protonmail; t=1772622235; x=1772881435;
	bh=/LHRqxotLoaums1xPzpD84yWUTJwb1t8rQrsw0jejSY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WSk/z79nka6sfAlYIQ1DZGAPWXnV5BcsZglf9YXzpF/MHYMWSOkievmIborMoKBjK
	 o0PWgJZdvNYsq3g+A9+z4XYvnHcOr56okVyajaMkgNnEk0uRUQUKATkREDUs4+PCOU
	 sf7h+0nOsGtaP97AQl8KNNSIbK8XXj1cuifb3wE283lZ9++yHdZA9+uhy/M2g+n23z
	 BtW1oQnFYFR/sVKcKSCXrGvaoawAhz40uHRklUBJZXTygWRhRCew023eI6HA4IQpLJ
	 VH/Z8p326J6IbG/tbhvm0TkJz/WRSIDiRg3Fk4DvOu6+izybkQ9PYU7T7NUWMqolGe
	 SQvNWIA2v4QIA==
Date: Wed, 04 Mar 2026 11:03:51 +0000
To: sakari.ailus@linux.intel.com, Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com, tian.shu.qiu@intel.com, linux-media@vger.kernel.org
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, ilpo.jarvinen@linux.intel.com, tfiga@chromium.org, senozhatsky@chromium.org, claus.stovgaard@gmail.com, laurent.pinchart@ideasonboard.com, andriy.shevchenko@linux.intel.com, tomi.valkeinen@ideasonboard.com
Subject: Re: RFC: Intel IPU4 driver proof of concept
Message-ID: <jsjMql5IQTMsAgViwR9vrMG4CZ1hVx9JMN4wbc0E98BvUP-TRpgtYalrmzQeor4UHRCbLg3bBeeZcaWrTujAMrf0G8q8NyQrd4o954ZayKA=@proton.me>
In-Reply-To: <6f37f978-4898-473e-b774-7965d25bf27b@proton.me>
References: <20230727071558.1148653-1-bingbu.cao@intel.com> <20230727071558.1148653-11-bingbu.cao@intel.com> <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com> <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com> <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com> <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com> <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com> <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com> <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com> <6f37f978-4898-473e-b774-7965d25bf27b@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 082bcb94054cb79316033164343e25cf62ea9403
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B002D1FEA43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[proton.me:s=fvgd6vg2erdvhe5mt4sdk2lrby.protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54457-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,linux.intel.com,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruslanbey@proton.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:dkim,proton.me:email,proton.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Currently there are multiple IPU driver implementations actively
maintained by Intel engineers:

- mainline IPU6 [1]
- downstream IPU6 [2]
- downstream IPU4/IPU4P [3]
- staging IPU7 [4]
- downstream IPU7 [5]

As mentioned earlier, IPU4 and IPU6 share a large portion of the
code base, and IPU7 appears architecturally very similar as well.

The IPU7 TODO mentions working toward a common IPU module [6].
There was also an attempt to move from ipu6_* back to more
generic ipu_* naming [7].

Is a unified IPU core still planned?

If so, is it expected to include IPU4/IPU4P support?

Links:
[1] https://github.com/torvalds/linux/tree/master/drivers/media/pci/intel/i=
pu6
[2] https://github.com/intel/ipu6-drivers
[3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t-2=
51103T063840Z/drivers/media/pci/intel
[4] https://github.com/torvalds/linux/tree/master/drivers/staging/media/ipu=
7
[5] https://github.com/intel/ipu7-drivers
[6] https://github.com/torvalds/linux/blob/master/drivers/staging/media/ipu=
7/TODO#L17
[7] https://lore.kernel.org/all/20250502154446.88965-6-stanislaw.gruszka@li=
nux.intel.com/



On Sunday, February 22nd, 2026 at 8:57 PM, Ruslan Bay <ruslanbey@proton.me>=
 wrote:

> We now have a working IPU4P driver for Ice Lake devices [1][2].
>=20
> The current IPU4P implementation is based on Intel=E2=80=99s downstream I=
PU4
> driver [3]. ISYS capture works with libcamera and has been tested on
> Surface Pro 7 and Surface Book 3 [4]. The world-facing camera (ov8865)
> works; the user-facing (ov5693) is still being debugged.
>=20
> IPU4P and IPU6 both contain PSYS implementations downstream, but in
> practice only ISYS is usable with libcamera today.
>=20
> Earlier in this thread Andreas noted that IPU4 and IPU6 share more than
> 85% of the code base.IPU7 appears architecturally very similar as well.
>=20
> Before preparing an RFC, I would like clarification on direction:
>=20
> 1. Is the long-term plan to unify IPU6 and IPU7 under a common driver
>    structure?
> 2. If so, should IPU4/IPU4P be aligned on top of that?
> 3. If not, would it make sense to follow Andreas=E2=80=99 approach [5],
>    implement IPU4P on top of the IPU6 structure, and move it to
>    staging while iterating, as has been done for IPU7?
>=20
> The primary goal is upstream IPU4P support (large Ice Lake user base),
> but ideally this should align with the Apollo Lake IPU4 work shared
> earlier [5].
>=20
> What direction would you recommend?
>=20
> [1] https://github.com/ruslanbay/ipu4-drivers/tree/main/patches/kernel/v6=
.19
> [2] https://github.com/ruslanbay/linux/commits/ipu4-6.19
> [3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t=
-251103T063840Z/drivers/media/pci/intel
> [4] https://github.com/linux-surface/linux-surface/discussions/1353?sort=
=3Dnew
> [5] https://github.com/Kleist/ipu4-driver
>=20
> Thanks,
> Ruslan Bay
>=20
> On 12/20/23 1:53 PM, Andreas Helbech Kleist wrote:
> > Hi,
> >=20
> > As mentioned previously in Bingbu's IPU6 patch series, I'm working on
> > porting the driver to IPU4. I've now got a hole through so I think it
> > makes sense sense to share the code.
> >=20
> > I'm able to capture frames with yavta with the current code, but there
> > are several issues that needs to be fixed for it to be complete.
> >=20
> > # How it is tested
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The hardware is a custom x86 PC-like embedded device with the following
> > video pipeline:
> > Endoscope -> FPGA -> tc358748 -> IPU4 (E3950/Apollo Lake)
> >=20
> > See my colleague Claus' description[2] for more info.
> >=20
> > There is currently no V4L2 subdevice for the FPGA, so we have a custom
> > ambu-tc358748.c driver which pretends to be an image sensor.
> >=20
> > $ media-ctl -v \
> >   -V "\
> >     \"tc358748 0-000e\"    :0 [fmt:RGB888_1X24/800x800],\
> >     \"Intel IPU4 CSI2 0\"  :0 [fmt:RGB888_1X24/800x800],\
> >     \"Intel IPU4 CSI2 0\"  :1 [fmt:RGB888_1X24/800x800]\
> >     "\
> >   -l "\
> >     \"tc358748 0-000e\"    :0 -> \"Intel IPU4 CSI2 0\" :0 [1],\
> >     \"Intel IPU4 CSI2 0\"  :1 -> \"Intel IPU4 ISYS Capture 12\" :0 [5]\
> >   "
> >=20
> > $ yavta --data-prefix -c2 -n2 -I -s 800x800 --file=3D/tmp/frame-#.bin \
> >         -f XBGR32 /dev/video12
> >=20
> > This produces frame-*.bin files containing 800x800x4 bytes of valid
> > "BGR0" data.
> >=20
> > # The code
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The code is available at the tag
> > https://github.com/Kleist/linux/tree/kleist-v6.6-ipu4-hacks-1
> > (15245fe26e07)
> >=20
> >=20
> > Note that I haven't renamed the files to ipu4, to make it clear what
> > the changes are compared to the IPU6 driver.
> >=20
> > It is based on v6.6 with the IPU6 v2 patches[1] on top, and then my
> > hacks to make the IPU4 work. This is not meant for upstreaming as it
> > is. The commits are a cleaned up version of the chronological order I
> > made the port in. It is not yet in a state where I think an RFC PATCH
> > series makes sense yet, but I wanted to share it anyway.
> >=20
> > ## Changes compared to IPU6
> > diff --stat of the changes in ../ipu6/ compared to the IPU6 v2 patches:
> >=20
> >  drivers/media/pci/intel/ipu6/Kconfig               |  12 +-
> >  drivers/media/pci/intel/ipu6/Makefile              |  13 +-
> >  drivers/media/pci/intel/ipu6/ipu6-bus.c            |   2 +-
> >  drivers/media/pci/intel/ipu6/ipu6-bus.h            |   6 +-
> >  drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  71 ++-
> >  drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   8 +-
> >  drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  45 +-
> >  drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   2 +-
> >  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        | 171 ++++---
> >  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        | 237 ++++++----
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      | 219 +++++----
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |  11 +-
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  33 +-
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   8 +-
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 212 +++------
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |   4 -
> >  drivers/media/pci/intel/ipu6/ipu6-isys.c           | 435 +++----------
> > -----
> >  drivers/media/pci/intel/ipu6/ipu6-isys.h           |  18 +-
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.c            | 130 +++++-
> >  .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  98 +---
> >  .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   | 226 ++-------
> >  drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  | 172 ++-----
> >  drivers/media/pci/intel/ipu6/ipu6.c                | 511 ++++++++-----
> > --------
> >  drivers/media/pci/intel/ipu6/ipu6.h                |  37 +-
> >  24 files changed, 1032 insertions(+), 1649 deletions(-)
> >=20
> > Note that most of the deleted lines are removed because they are not
> > used in IPU4. E.g. the watermark handling, which I haven't seen an
> > equivalent for in the old IPU4 driver.
> >=20
> > ## Ambu-specific tweaks
> > Note that I'm using a hacked ipu-bridge (AMBU_IPU_BRIDGE) to setup the
> > fwnode graph for our hardware. You don't want if you're testing this,
> > so revert at least the "ambu: Add AMBU_IPU_BRIDGE" commit.
> >=20
> > I'm not sure the right approach for handling this would be going
> > forward. Of course the ambu-ipu-bridge shouldn't be upstreamed, so I'm
> > wondering how we can achieve something similar? The ACPI tables from
> > our BIOS unfortunately don't contain any info about the Toshiba Bridge
> > (tc358748), so we can't derive the information from there. Maybe some
> > kind of platform driver could be created which tweaks the ACPI info
> > before the ipu-bridge driver reads it?
> >=20
> > What do you typically do when you have some proprietary hardware that
> > does not provide proper ACPI information? We could carry the ambu-ipu-
> > bridge patches in our internal kernel tree, but that is not desirable
> > in the long term.
> >=20
> > # Inspiration for the IPU4 port
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > We are currently using a Intel LTS 4.19.217 based kernel[3], which
> > contains the old IPU4 driver. The port was basically made by comparing
> > mmiotrace's between the old IPU4 driver and the new driver.
> >=20
> > We're using the IPU4 FW ipu4_cpd_b0.bin extracted from a ClearLinux
> > package[4].
> >=20
> > # Known issues
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ## Doesn't yet work with gstreamer for unknown reasons
> > I get "Unexpected buffer address:" errors from
> > ipu6_isys_queue_buf_ready, and don't get an image through.
> >=20
> > ## 64 byte chunks of wrong data
> > We occasionally get 64 byte aligned 64 byte wrong data (all 0xCC) in
> > the captured frame*.bin files. This could be a cache invalidation
> > issue, we haven't looked into this yet. The code currently doesn't use
> > zlw_invalidate, even though it was ported from the old driver. We
> > haven't yet tested if enabling this fixes the issue.
> >=20
> > # Upstreaming
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > We would like to upstream this driver, probably after the IPU6 driver
> > has been merged. We're definitely not ready yet (either), but I already
> > have a couple of questions, that it would be nice to get some input on
> > from the community.
> >=20
> > ## How to share code between IPU4 and IPU6
> > Big parts of the code (approximately 6k out of 7k lines) does not need
> > to be changed compared to the IPU6 driver, so there is clearly a big
> > overlap in what the two drivers need to do. I'm not sure how the best
> > approach would be for sharing this functionality. I see a few options:
> > 1. Shared driver that supports both IPU's (still split in PCI driver
> > and -isys driver)
> > 2. Shared PCI driver that supports both IPU's, but device-specific
> > intel-ipu4-isys/intel-ipu6-isys drivers
> > 3. Separate drivers that use a shared "library module" (for lack of a
> > better term)
> >=20
> > My gut feeling is that 2. is the right choice, especially if we moved
> > the shared code in to the PCI driver and the more version-specific code
> > was moved into the specific drivers.
> >=20
> > The answer to this could also be input to Bingbu's IPU6 series, maybe
> > it would make sense to place some files differently if they eventually
> > will be used in both IPU4 and IPU6 drivers?
> >=20
> > ## How to implement our platform specific fwnode graph?
> > As mentioned above, we currently have a hacked ambu-ipu-bridge driver,
> > which is clearly not upstreamable. What would you typically do if you
> > need to make a v4l setup where the ACPI table information about
> > sensors/bridges is missing?
> >=20
> > /Andreas
> >=20
> > [1]https://lore.kernel.org/all/20231024112924.3934228-1-bingbu.cao@inte=
l.com/
> > [2]
> > https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015f.ca=
mel@gmail.com/
> > [3]
> > https://github.com/intel/linux-intel-lts/tree/lts-v4.19.217-base-211118=
T072627Z
> > [4]
> > https://download.clearlinux.org/releases/32370/clear/source/SRPMS/linux=
-firmware-ipu-19ww39-104.src.rpm
>=20
> 

