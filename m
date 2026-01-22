Return-Path: <linux-media+bounces-51316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM9SHITEcWnfLwAAu9opvQ
	(envelope-from <linux-media+bounces-51316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:32:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A056243F
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 495484F5BFA
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 06:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6AB33E364;
	Thu, 22 Jan 2026 06:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YPIa5Yi1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C529ACD7
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769063528; cv=none; b=HR8/ll7J21mdsfFu01Z3rEze5QoJ7LWJVm7TBETLq83a/lVurowAwUcYneVot2vNndIpnZzle6B8HH6UiZpsh40Qzh1yQ/v0vgGAC1GDTpY7IT4CuIBhpbm2t/9UsPz/CDKKIxovZyx0hQLg1bfKhkTPWsl8SUbSpmDlaSI4lxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769063528; c=relaxed/simple;
	bh=Vi92szvXqaUmT6nXzA3SWjH7v8LKB3F9o7uzbHYqMmc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OuN1/pS12SUNNOXNxQCXUI2kWM2VQE7y2QYvoELP0YCQhh8mpqIT1CgirzQfs7YCsgCdU1yfsPlJ3Q7ZHNwfhCtozG1WZYcdaG89T/zdBwM1eT/tCnvxZdD4BbtujbTmNakSACNoFMCPygvQTubWsDH8MO/Z1ElfhPB9H/iadLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YPIa5Yi1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:59ca:af14:f475:ddf6:11d2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 320DD324;
	Thu, 22 Jan 2026 07:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769063489;
	bh=Vi92szvXqaUmT6nXzA3SWjH7v8LKB3F9o7uzbHYqMmc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YPIa5Yi1heC1oWwvr/3+9cePsh0NGmGcJ8/0QmZbavVEpEjloTHYB6a554cNtwb+W
	 evwZGskeO4eZlYMk53YZeNYtla7bTMP0wAf3hTgjHcyIc8RlHEwpdlCleLbRvYMyWe
	 MdH2r5F8/BVfEJdn3VpiVYORfOhlgcwlO4DDUNyg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4dec6316-0ae3-44bf-b23d-8b05f3c2c607@gmx.net>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com> <4dec6316-0ae3-44bf-b23d-8b05f3c2c607@gmx.net>
Subject: Re: [PATCH 00/10] media: Add support for Raspberry Pi 4 ISP
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>, Umang Jain <uajain@igalia.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Tomasz Figa <tfiga@chromium.org>
Date: Thu, 22 Jan 2026 12:01:57 +0530
Message-ID: <176906351709.9154.11222619502063088695@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[broadcom.com,samsung.com,kernel.org,raspberrypi.com,gmx.net,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51316-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: D6A056243F
X-Rspamd-Action: no action

Hi Stefan,

Quoting Stefan Wahren (2026-01-22 00:06:23)
> Hi Jai,
>=20
> Am 13.01.26 um 10:05 schrieb Jai Luthra:
> > Hi,
> >
> > This series adds support for the ISP used in Raspberry Pi 4 (and earlier
> > variants) by adding the bcm2835-isp V4L2 driver.
> could you please point me to the upstream patch, which enables VCHIQ=20
> support for Raspberry Pi 4?

The VCHIQ driver currently in upstream is working fine in my testing with
the ISP on Raspberry Pi 4.

arch/arm/boot/dts/broadcom/bcm2711-rpi.dts inherits the vchiq device tree
node from bcm2835-rpi.dts, which uses the "brcm,bcm2835-vchiq" compatible.

>=20
> AFAIR only Raspberry Pi 0 - 3 were officially supported.
>=20

Ah my bad. Do you know which peripheral requires the changes to VCHIQ and
DMA to function properly on Pi 4?

I saw the downstream tree defines new bcm2711-* compatibles for the DMA
engine and VCHIQ, mostly for 36-bit address support. I had those patches in
my tree at some point while debugging, but dropped them as the issue was
found in the firmware clock management.

If 36-bit addresses are indeed required for some ISP feature I didn't
notice, I can add those patches back before posting the next revision.

> Best regards
> >
> > The underlying hardware for the ISP is accessed through the VideoCore
> > VPU, via the VCHIQ/MMAL interface that was recently destaged under
> > platform/raspberrypi. The ISP driver, and thus this series depends on
> > VCSM CMA driver for shared memory support (for lens shading buffers):
> >
> > https://lore.kernel.org/all/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ide=
asonboard.com/
> >
> > The ISP driver introduced in this series has been taken from the one
> > present in the downstream raspberrypi 6.12 tree, squashing together
> > various commits, along with minor cleanups and renaming directories. For
> > testing it with libcamera, please use this branch that supports upstream
> > unicam and the correct base ID for ISP controls:
> >
> > https://github.com/jailuthra/libcamera/tree/pi4-upstream
> >
> > Thanks,
> > Jai

Thanks,
    Jai

> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > Dave Stevenson (1):
> >        media: videobuf2: Allow exporting of a struct dmabuf
> >
> > Jai Luthra (5):
> >        platform/raspberrypi: vchiq-mmal: Move headers to include/linux
> >        platform/raspberrypi: vchiq-mmal: Support ISP parameters and sta=
ts
> >        platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
> >        platform/raspberrypi: vchiq: Add helpers for vchiq driver data
> >        media: platform: broadcom: Move unicam driver to subdir
> >
> > Naushir Patuck (4):
> >        media: uapi: v4l-ctrls: Add CID base for the bcm2835-isp driver
> >        media: uapi: v4l2-core: Add ISP statistics output V4L2 fourcc ty=
pe
> >        media: platform: broadcom: Add bcm2835-isp driver
> >        platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq
> >
> >   Documentation/admin-guide/media/bcm2835-isp.rst    |  127 ++
> >   .../userspace-api/media/drivers/index.rst          |    1 +
> >   .../userspace-api/media/v4l/meta-formats.rst       |    1 +
> >   .../media/v4l/pixfmt-meta-bcm2835-isp-stats.rst    |   35 +
> >   MAINTAINERS                                        |   12 +-
> >   drivers/media/common/videobuf2/videobuf2-core.c    |   21 +-
> >   drivers/media/platform/broadcom/Kconfig            |   23 +-
> >   drivers/media/platform/broadcom/Makefile           |    3 +-
> >   .../media/platform/broadcom/bcm2835-isp/Kconfig    |   14 +
> >   .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
> >   .../broadcom/bcm2835-isp/bcm2835-isp-ctrls.h       |   73 +
> >   .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++
> >   .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1836 +++++++++++=
+++++++++
> >   .../media/platform/broadcom/bcm2835-unicam/Kconfig |   23 +
> >   .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
> >   .../{ =3D> bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
> >   .../broadcom/{ =3D> bcm2835-unicam}/bcm2835-unicam.c |    0
> >   drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
> >   .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
> >   .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
> >   .../linux/raspberrypi}/mmal-common.h               |    2 +
> >   .../linux/raspberrypi}/mmal-encodings.h            |   68 +
> >   .../linux/raspberrypi}/mmal-msg-common.h           |    0
> >   .../linux/raspberrypi}/mmal-msg-format.h           |    0
> >   .../linux/raspberrypi}/mmal-msg-port.h             |    0
> >   .../linux/raspberrypi}/mmal-msg.h                  |    0
> >   .../linux/raspberrypi}/mmal-parameters.h           |   86 +
> >   .../linux/raspberrypi}/mmal-vchiq.h                |    0
> >   include/linux/raspberrypi/vchiq_arm.h              |    1 +
> >   include/linux/raspberrypi/vchiq_bus.h              |   10 +
> >   include/media/videobuf2-core.h                     |   15 +
> >   include/uapi/linux/bcm2835-isp.h                   |  347 ++++
> >   include/uapi/linux/v4l2-controls.h                 |    6 +
> >   include/uapi/linux/videodev2.h                     |    1 +
> >   34 files changed, 3252 insertions(+), 30 deletions(-)
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
> > prerequisite-message-id: 20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideaso=
nboard.com
> > prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
> > prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
> > prerequisite-patch-id: f65e3f6e8db823fcfc37421da10a76f92cf56d9d
> > prerequisite-patch-id: dbfc2fc4237c738e499e802be972dd8f2736a714
> > prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
> > prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49
> >
> > Best regards,
>

