Return-Path: <linux-media+bounces-63628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3XejG+tGIGq9zwAAu9opvQ
	(envelope-from <linux-media+bounces-63628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:23:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881706391F1
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:23:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W2w88syR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63628-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63628-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85EC93403B8C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231DC48A2CF;
	Wed,  3 Jun 2026 14:46:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075248A2AA;
	Wed,  3 Jun 2026 14:45:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497961; cv=none; b=kWiMZCbDHaO6uf9I6P0ByX+TmZ1ta3rX4ufIrimvK+zKYKWhhrITjC0TK5xhw8YyFgJkbLF9xTLkt2X6J8dgcQGjsZbSZooa75czKI1IHQxmP3jVaR13ytAZk91fF9pMnMh7oZi2/RjX7dfFafgLWynY6Mdm2Ftq9YMp6RnbRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497961; c=relaxed/simple;
	bh=Hj7C6wouDGtZTSsWIBx0C9Hgel2HtFzDxBtMXFHbYeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CGi9oLc3+Pd3b5253TJ/wIfab4xUBGmYw0PRQLalMiEuSp1veRrMALMkauzpaLfJCk5MLGckeIEoXYgJmiljOrgYzdVrTDrDxwGUCjWfiLGi1uvhS+AV/YcltMfKxwS5fuf+1SQU7tGr/85nsjFHgGmlmLIXwIU5hNAtZRT2WAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2w88syR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4D41F00893;
	Wed,  3 Jun 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497959;
	bh=vFbJXNmOQNsavXMkTLq4q7lIWPQxzVchyCWo9oodFh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2w88syRBG+CYmZ2Ov009DQRo1jXpqMF0TTadQrRdbtmhEgjcUEanTjfDMTTXe1n8
	 63yqtppWukXfRKrSsU2bP2hLVKjGzKcCqXmZ2pUu0beg9HgtdBrL4PFAJnbnYvQjsd
	 uSK7MxFdGmnoMfLC+LeS5STuUKj7DuOB6CdLIn+jJPBHYsYCMkyzruzvhJf7IW+4LC
	 pY8uyH0dOn0agcRpQbRPofhQ4hYbN3KxzwMwL4xR5N1M+bsYV0xJN3NMN3PRkIlGok
	 dATa++TXOb2KSsmhnXymBS8Jlpinms4s0pBDPMWY5HGZNr5MI1ThK6gb8sPsqx8K80
	 5H5chyzfmBixw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/12] media: iris: Add iris vpu bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:45:59 +0000
Message-Id: <20260603144559.8D4D41F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63628-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 881706391F1

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The dynamic device's `platform_data` is initialized with a pointer=
 to a short-lived stack variable, creating a persistent dangling pointer vu=
lnerability.
- [High] A devm allocation tied to the persistent core device causes a memo=
ry leak on every firmware reload.
--

commit 5c9139b17fe941a07d06bbded6b06a8c47d21867
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add iris vpu bus support

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/me=
dia/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 0000000000000..e3327b227332a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *iommu_fid =3D (const u32 *)dev_get_platdata(dev);

[Severity: High]
Can this dereference a dangling pointer if the dma_configure callback execu=
tes
asynchronously?

The iommu_fid pointer is populated in iris_vpu_bus_create_device() directly
from the caller's argument, which in iris_glymur_init_cb_devs() points to a
local stack variable. If this callback runs later (e.g., deferred probing),
it will read invalid stack memory.

> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
> +}
[ ... ]
> +struct device *iris_vpu_bus_create_device(struct device *parent_device, =
const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev =3D kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release =3D iris_vpu_bus_release_device;
> +	dev->bus =3D &iris_vpu_bus_type;
> +	dev->parent =3D parent_device;
> +	dev->coherent_dma_mask =3D dma_mask;
> +	dev->dma_mask =3D &dev->coherent_dma_mask;
> +	dev->platform_data =3D (void *)iommu_fid;

[Severity: High]
Does this code store a dangling pointer if the caller passes a stack variab=
le?

The caller iris_glymur_init_cb_devs() passes the address of a local stack
variable (fw_fid) for iommu_fid:

iris_glymur_init_cb_devs() {
    ...
    const u32 fw_fid =3D IOMMU_FID_IRIS_FIRMWARE;
    ...
    dev =3D iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask=
, &fw_fid);
    ...
}

Because the device structure outlives the caller's stack frame,
dev->platform_data becomes a dangling pointer immediately after
iris_glymur_init_cb_devs() returns. Should the value be copied into the
device structure instead of storing the pointer?

> +	dev_set_name(dev, "%s", name);
> +
> +	ret =3D device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}

Also, regarding an issue newly introduced in this series by commit
85711dbb43a8 ("media: iris: Enable Secure PAS support with IOMMU managed by=
 Linux"):

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580..8bdc9273036ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
[ ... ]
> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *c=
ore, const char *fw_name)
>  	if (strlen(fw_name) >=3D MAX_FIRMWARE_NAME_SIZE - 4)
>  		return -EINVAL;
> =20
> -	ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	ret =3D of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> =20
>  	mem_phys =3D res.start;
>  	res_size =3D resource_size(&res);
> =20
> -	ret =3D request_firmware(&firmware, fw_name, dev);
> +	pas_ctx =3D devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_ph=
ys, res_size);

[Severity: High]
Does this devm_ allocation cause a memory leak on every firmware reload?

On platforms that do not use a dedicated firmware context bank device
(where core->fw_dev is NULL), fw_dev falls back to the long-lived core->dev.

Because firmware loading can be repeatedly triggered upon firmware crashes
(via iris_sys_error_handler()), these devm_ allocations accumulate
indefinitely on core->dev's devres list without being explicitly freed
in iris_fw_unload() or iris_core_deinit().

Will repeated firmware reloads eventually exhaust system memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D1

