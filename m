Return-Path: <linux-media+bounces-51297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGVOFMQrcWl1fAAAu9opvQ
	(envelope-from <linux-media+bounces-51297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:40:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C325C5E9
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 793C5A50277
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 18:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2983B8D51;
	Wed, 21 Jan 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="VCF+aaxx"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C93B8BA8
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020617; cv=none; b=ZVAJixMo2LDBpjJiL/NXoBlLuMQW1MNHpyb7BV5O1TfLPtpCNrxOJkTFhHn5k2sOYd/cS76gir4z8DcKRKpGm7SC9jftNxEfXhB+QBSAt+xHu4tXKEVwkpMhC7xdT1TTBKBHJg4sAxI7iRyxGD8zChz3UvgrpAl2rNmmdEsLFQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020617; c=relaxed/simple;
	bh=eJKCMso7036sO/V6dysrI+W2C9tgo22EVaLwnBNlYww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBb8hZXWnn9GapXb2xVZ2HH0l3Xn6Vps+F8UBmnL9mgn8z9rbLmQZG757TxmiiyUFsm8ArxunCsYQeq9vDntmmUSVm8NhokoVO1Zf7KpVQNEYPzoZ+I/YwFjd7xK06Kztph7hT2GFUlqTKYmp6+C2WsSTye5z80MF5hsgO9wKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=VCF+aaxx; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1769020587; x=1769625387; i=wahrenst@gmx.net;
	bh=UEctFUPx+pfHRkGgS09badurwmS6YIhme6eYbuhNrpo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VCF+aaxxv3VqP/FPwLYh5v8lQtzsWkbJOhep6gmwi1mVWvDsLA6S3I0bcbofoIGC
	 M3/OA/3HKa7QgyeReKCSnt3wyIxQQ1Iq+rSmjm8QkijnJYNFznm4lQ7QVlqaRyw0F
	 Jbf94XlX/wwO1NkR1TYOybm370b6i0cL9GPGu8aTG4w3vEObZU38kTmMW1B6VbcXS
	 6sA8Jd1c9/RgSyJkRm5/UycvmPX4bOErEtt5ADmaNDv9VhQMrnsyB1Er5LWkxfqdz
	 RX0E6llvq4vA/QHdTBm15i9WrFiiIfsIGgB03tXErF3zoxzcFTm17AC6raX/LnJn5
	 j1h0KefzsnANatwV1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1wA1K22iKj-00lrEn; Wed, 21
 Jan 2026 19:36:27 +0100
Message-ID: <4dec6316-0ae3-44bf-b23d-8b05f3c2c607@gmx.net>
Date: Wed, 21 Jan 2026 19:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] media: Add support for Raspberry Pi 4 ISP
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.org>, Umang Jain <uajain@igalia.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FfoZvqDQll0v1VBEutAb7Jb28xj7SCdtNDvVgnn/+E/ux76bEU2
 ZpBB44x1hbFJBxu0ubJD5SxeIRkU5ASvHS1Oa4R3GZwEpfv9Re9Mp1wZ4slFxsdam3JlDJ1
 TyCG0ikijxLUTJS+Qc8aGI3Yd0vbGW4K3/Pbfu7f2h4S5p0n85miJ8srSiX3kwqJ+GKFoC5
 eQn3tKMdQ5Z6nVWmp/TEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H/0OPAD27sI=;Gnt2/y0wtf8iErt1AsOLBRaAbf2
 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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51297-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmx.net,quarantine];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[gmx.net:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C4C325C5E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai,

Am 13.01.26 um 10:05 schrieb Jai Luthra:
> Hi,
>
> This series adds support for the ISP used in Raspberry Pi 4 (and earlier
> variants) by adding the bcm2835-isp V4L2 driver.
could you please point me to the upstream patch, which enables VCHIQ=20
support for Raspberry Pi 4?

AFAIR only Raspberry Pi 0 - 3 were officially supported.

Best regards
>
> The underlying hardware for the ISP is accessed through the VideoCore
> VPU, via the VCHIQ/MMAL interface that was recently destaged under
> platform/raspberrypi. The ISP driver, and thus this series depends on
> VCSM CMA driver for shared memory support (for lens shading buffers):
>
> https://lore.kernel.org/all/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@idea=
sonboard.com/
>
> The ISP driver introduced in this series has been taken from the one
> present in the downstream raspberrypi 6.12 tree, squashing together
> various commits, along with minor cleanups and renaming directories. For
> testing it with libcamera, please use this branch that supports upstream
> unicam and the correct base ID for ISP controls:
>
> https://github.com/jailuthra/libcamera/tree/pi4-upstream
>
> Thanks,
> Jai
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Dave Stevenson (1):
>        media: videobuf2: Allow exporting of a struct dmabuf
>
> Jai Luthra (5):
>        platform/raspberrypi: vchiq-mmal: Move headers to include/linux
>        platform/raspberrypi: vchiq-mmal: Support ISP parameters and stat=
s
>        platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
>        platform/raspberrypi: vchiq: Add helpers for vchiq driver data
>        media: platform: broadcom: Move unicam driver to subdir
>
> Naushir Patuck (4):
>        media: uapi: v4l-ctrls: Add CID base for the bcm2835-isp driver
>        media: uapi: v4l2-core: Add ISP statistics output V4L2 fourcc typ=
e
>        media: platform: broadcom: Add bcm2835-isp driver
>        platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq
>
>   Documentation/admin-guide/media/bcm2835-isp.rst    |  127 ++
>   .../userspace-api/media/drivers/index.rst          |    1 +
>   .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>   .../media/v4l/pixfmt-meta-bcm2835-isp-stats.rst    |   35 +
>   MAINTAINERS                                        |   12 +-
>   drivers/media/common/videobuf2/videobuf2-core.c    |   21 +-
>   drivers/media/platform/broadcom/Kconfig            |   23 +-
>   drivers/media/platform/broadcom/Makefile           |    3 +-
>   .../media/platform/broadcom/bcm2835-isp/Kconfig    |   14 +
>   .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
>   .../broadcom/bcm2835-isp/bcm2835-isp-ctrls.h       |   73 +
>   .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++
>   .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1836 ++++++++++++=
++++++++
>   .../media/platform/broadcom/bcm2835-unicam/Kconfig |   23 +
>   .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
>   .../{ =3D> bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
>   .../broadcom/{ =3D> bcm2835-unicam}/bcm2835-unicam.c |    0
>   drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
>   .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
>   .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
>   .../linux/raspberrypi}/mmal-common.h               |    2 +
>   .../linux/raspberrypi}/mmal-encodings.h            |   68 +
>   .../linux/raspberrypi}/mmal-msg-common.h           |    0
>   .../linux/raspberrypi}/mmal-msg-format.h           |    0
>   .../linux/raspberrypi}/mmal-msg-port.h             |    0
>   .../linux/raspberrypi}/mmal-msg.h                  |    0
>   .../linux/raspberrypi}/mmal-parameters.h           |   86 +
>   .../linux/raspberrypi}/mmal-vchiq.h                |    0
>   include/linux/raspberrypi/vchiq_arm.h              |    1 +
>   include/linux/raspberrypi/vchiq_bus.h              |   10 +
>   include/media/videobuf2-core.h                     |   15 +
>   include/uapi/linux/bcm2835-isp.h                   |  347 ++++
>   include/uapi/linux/v4l2-controls.h                 |    6 +
>   include/uapi/linux/videodev2.h                     |    1 +
>   34 files changed, 3252 insertions(+), 30 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
> prerequisite-message-id: 20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideason=
board.com
> prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
> prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
> prerequisite-patch-id: f65e3f6e8db823fcfc37421da10a76f92cf56d9d
> prerequisite-patch-id: dbfc2fc4237c738e499e802be972dd8f2736a714
> prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
> prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49
>
> Best regards,


