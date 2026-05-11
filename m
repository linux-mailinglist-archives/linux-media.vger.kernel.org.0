Return-Path: <linux-media+bounces-61172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IENFG30zAmrSowEAu9opvQ
	(envelope-from <linux-media+bounces-61172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:52:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C534351544D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFC663055BC3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED7237E30F;
	Mon, 11 May 2026 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.kiszka@web.de header.b="ATj66XIN"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D5355F35;
	Mon, 11 May 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528992; cv=none; b=ndK/3Y4TxU/s4gofTYFpiDzKaoLUP4DfaJhrzYbu7frFF2p1r89JbniPxQQ1/acILE/bp7Mty6PWGkqlDJaV+SO2DNKt2+hTXaamLgPmo3QkfQq/flcz7b1lSdXpvtGyQf8H9yrlQVkJzmwwSx4TuOR8KRZXjC38aaOAQGnhcBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528992; c=relaxed/simple;
	bh=wXh3VZl/NC3xuvaZO1ICZUKW3axZRLvD+ocoShrrLEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6Gz0NctGb19ZL+iBfWTIYywz1yGwDpPVhynmeFwUOTVCqNUyOOqUylC5hDJ1Eytg4OL2FHY6mNv8Vqv3Hw5SnrGzFo5AZU9xGpW0I8/PQTSxIfbVpnQeNzvEXvAXRGjw5ZCGd1n0jNcrXzPhxq3r9b2PmoI8gZ4QcZk35g3cnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.kiszka@web.de header.b=ATj66XIN; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1778528983; x=1779133783; i=jan.kiszka@web.de;
	bh=F9jKWXR2soPkZ3O4BqHD21iAKBkwQeOWNKREGwMIp8Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ATj66XINX03vCAFzxnHTlTbZTb6d5WOMP2lO4YD71ueu8pdlU/Dqy7bjOZtmZs6v
	 aM6BU3ezkLQWzgNhE4krpJyS2OCkzqYYb5/EFlsTsEQ+13OD14mBhh2+9DTlvrIQd
	 HXeP13WMCt8JqFEgbMVnI6ATynKhqWd9HSQcQTVAuDgFBUoMGoXogT0kPGkzZZNiR
	 mZ6ivZOhsmVMruXrahYdXi4TG6QPaWfXCDEGN+99gaLN/DUlGQIS8fgQ+hzaKSyNz
	 QN6I/jpjaX/Jx36zwVFnePxRx9tbeAntwDjUdOlREaowhqhOOLekbPqkI5RJjwSdA
	 VoEZCBAgelCL3fkHpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwR0J-1xEuKw2Y9V-00zjtl; Mon, 11
 May 2026 21:49:43 +0200
Message-ID: <ddf8cf6b-fb99-4c5a-91a8-32462e178deb@web.de>
Date: Mon, 11 May 2026 21:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL for v7.1-rc3] media fixes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Oliver Neukum <oneukum@suse.com>
References: <20260505132501.1cbb9d20@foz.lan>
From: Jan Kiszka <jan.kiszka@web.de>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@web.de; keydata=
 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
In-Reply-To: <20260505132501.1cbb9d20@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gkxxA1EdnpKzJf1o6hYMoAGoRXpkrykkZD2GszLIFd59nf7uFHu
 1OCECBulub1y+2JE5LS5qDzetEEuA31YZwanbktx0w5G+9JYwMHaSuSRTHQCAD9iZQwV968
 qrGDbnbzM5Qok5mj6nFK+s/SIpzKCe8pOO/j8cy5Z5U46hUF4e0EbYjGxLCtP8OsEy6+EKK
 fCgE/yAZYP94xhCYPP1fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MSPjwH4DdPs=;64ilZlNBd0v3T/xM9c4OnLMGeSO
 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
X-Rspamd-Queue-Id: C534351544D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61172-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jan.kiszka@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 05.05.26 13:25, Mauro Carvalho Chehab wrote:
> Hi Linus,
>=20
> Please pull from:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git m=
edia/v7.1-2
>=20
> For:
>=20
> - rc: ttusbir: fix inverted error logic.

Though announced here, this fix [1] was missing from the PR. Please=20
don't forget in the next round and make sure it hits stable as well.

Thanks,
Jan

[1] https://lore.kernel.org/linux-media/20260410210309.724713-1-oneukum@su=
se.com/

> - Venus/Iris fixes:
>     Kconfig cross compile build testing for x86
>     Use-after-free fix for internal buffers
>     dma_free_attrs size fix
>     Switch to hardware mode clocks
>     Use-after-free fix for a concurrency path
>     Fix H265D_MAX_SLICE size for sc7280 devices
> - camoss: fix some clock-related issues.
>    =20
> Regards,
> Mauro
>=20
> ---
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e=
731:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git =
tags/media/v7.1-2
>=20
> for you to fetch changes up to 23c39cb598977f10909a2387c5e5f34afc1d6933:
>=20
>   media: qcom: camss: avoid format string warning (2026-04-27 08:41:22 +=
0200)
>=20
> ----------------------------------------------------------------
> [GIT PULL for v7.1-rc3] media fixes
>=20
> ----------------------------------------------------------------
> Arnd Bergmann (3):
>       media: venus: fix QCOM_MDT_LOADER dependency
>       media: iris: fix QCOM_MDT_LOADER dependency
>       media: qcom: camss: avoid format string warning
>=20
> Dikshita Agarwal (1):
>       media: iris: Fix use-after-free in iris_release_internal_buffers()
>=20
> Dmitry Baryshkov (1):
>       media: qcom: iris: increase H265D_MAX_SLICE to fix H.265 decoding =
on SC7280
>=20
> Thomas Fourier (1):
>       media: iris: Fix dma_free_attrs() size in iris_hfi_queues_init()
>=20
> Vikash Garodia (1):
>       media: iris: switch to hardware mode after firmware boot
>=20
> Vishnu Reddy (1):
>       media: iris: fix use-after-free of fmt_src during MBPF check
>=20
> Wenmeng Liu (3):
>       media: qcom: camss: Fix csid IRQ offset for sa8775p
>       media: qcom: camss: Fix csid clock configuration for sa8775p
>       media: qcom: camss: Add missing clocks for VFE lite on sa8775p
>=20
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 +-
>  drivers/media/platform/qcom/camss/camss-csiphy.c   | 10 ++-
>  drivers/media/platform/qcom/camss/camss.c          | 80 +++++++++++----=
=2D------
>  drivers/media/platform/qcom/iris/Kconfig           |  2 +-
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  6 +-
>  drivers/media/platform/qcom/iris/iris_core.c       |  4 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  6 --
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  1 -
>  drivers/media/platform/qcom/iris/iris_venc.c       |  6 --
>  drivers/media/platform/qcom/iris/iris_venc.h       |  1 -
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +--
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  2 +-
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +
>  drivers/media/platform/qcom/venus/Kconfig          |  2 +-
>  20 files changed, 98 insertions(+), 93 deletions(-)


