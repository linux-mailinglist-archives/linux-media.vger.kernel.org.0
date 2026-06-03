Return-Path: <linux-media+bounces-63622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BJ4CEodAIGojzQAAu9opvQ
	(envelope-from <linux-media+bounces-63622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:56:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0338638D72
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eMMc9cfn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63622-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63622-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D8E8329E143
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0804D395AFD;
	Wed,  3 Jun 2026 14:34:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E03390618;
	Wed,  3 Jun 2026 14:34:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497260; cv=none; b=ceje4cQZGy1GtixM+Zm/mhUtLG8GYU40oIuzYbYQnirejz6qIjjBBJQP6q2MyGpDDJ8CwE1bD2RlVtnR9adRB1MA4wrddAJRYO23w7xIWIOU2QqLwjKX5zV40Bd13XFUW2UMyjlRXRV1sdHwqA8tdvoLDCFA2xggIxAbHxCkmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497260; c=relaxed/simple;
	bh=AFGDeRd3rVwy1/8w7qC9/F+kXG1fqznrvwc78syNtTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gAtWOQmXyhim8pNvLfH+ogD84pDNhnaxrBeJ0NU1fmWAUQklktHDQXZ9tQopHliLXd4+J5PPJYL3ZA5QGIJ+s0uM+hwOWfsFrQXZcOZcwptLDHO5rr8u2yke0kAa99QQ86MPFK9MkvJ2Kpy2B8snMZmB+iFWavKKUEkf8yj/KB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMMc9cfn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC751F00898;
	Wed,  3 Jun 2026 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497259;
	bh=VOisN/HpvS/olOWQe8wMMJaWHozqYb6HdXrnvJJ8/fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eMMc9cfngZP9LgtgoYyex8mvYmRkMAWdxfzM7dYb1oDfOvJUcmcYen5WQ1b21+8GD
	 ZOvif4IIjNxrsOKUWvu03I6Z6VADJOXp9so6i8WH0+BiydNaPK0tBQq19gCgSRrES4
	 t+fKYcCLpm0zGVfhuzzmBgLjWtYNUwqcFviLXzc5W8oMVIZ1ybZKZpFXqVgQ46F/hD
	 O8C4lm1mTdYZCw30hbyy69laAO1TlB+jIsEaU7GD1do9xd+vy9+7x4UJxr3ALD7edP
	 +xxawN1pNq20rmG9s0udIz8h+2e5cV3vnoLR9xE2ZbmJx2O+U0jKF2LrTZTKUff5oF
	 H9LP8gNgd2UgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/12] iommu: Add iris-vpu-bus to iommu_buses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:34:18 +0000
Message-Id: <20260603143418.DCC751F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,qualcomm.com:email,sashiko.dev:url,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63622-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0338638D72

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding a vendor-specific media driver virtual bus (`iris_vpu_bus_t=
ype`) to the core `iommu_buses` array is an architectural layering violatio=
n and abuses the device model.
--

commit 237441c1b5f7b6f9432bcd95591b1105966e57b0
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

iommu: Add iris-vpu-bus to iommu_buses

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e8f13dcebbde5..fe51600953ceb 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -13,6 +13,7 @@
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> +#include <linux/iris_vpu_bus.h>

[Severity: High]
Does this introduce a layering violation by pulling a vendor-specific media
driver header directly into the core IOMMU framework?

>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/errno.h>

[ ... ]

> @@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] =
=3D {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
> +	&iris_vpu_bus_type,
> +#endif
>  };

[Severity: High]
Is it appropriate to add an artificial software bus created inside a single
media driver to the system-level hardware interconnects list here?

The iommu_buses array is generally intended for system-level hardware
interconnects like PCI or Platform buses. Modifying the core framework to
accommodate a vendor driver's private bus seems to couple subsystems togeth=
er
incorrectly.

Additionally, because CONFIG_QCOM_IRIS_VPU_BUS is defined as a bool in the
driver's Kconfig and registers its bus using a postcore_initcall, this forc=
es
the custom bus code into the core kernel binary even when the media driver =
is
built as a loadable module, leading to kernel bloat and abusing core
initialization levels.

Can generic solutions be used instead, such as using standard platform_devi=
ce
child nodes or creating a standardized context bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D2

