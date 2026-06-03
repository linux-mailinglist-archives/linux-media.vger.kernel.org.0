Return-Path: <linux-media+bounces-63511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GC7+CSHTH2rnqQAAu9opvQ
	(envelope-from <linux-media+bounces-63511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:09:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FD635035
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:09:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gXEIZbxR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63511-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63511-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC16B3017BFF
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5E63905E4;
	Wed,  3 Jun 2026 07:09:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336F2874F5
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470557; cv=none; b=bafaM/RBhfd0DU6CaaW88u2kz5Ei3wCAUpWbjqyTxKDz39SnzySXTA4iBujv1mgbqIof15RbhbGSgy+Cy7NnUNRNd40+13xdpigZu4625QwRJEvz8G4X/l1wV65ONCs7gXzUzBmxJ6nbeTBT8fvSeP9L2JHQkZ/IiwX6TQOP0lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470557; c=relaxed/simple;
	bh=Rlmj+uGE9oz35HogCS3tcigGiYGZPBhQe3f20530b1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UMhWFf1bdaY66AFQ2lbUqMk3qZjZReioh026rJkdQqCfF59HpKl65eJ3VvNxp9qqvmkWhnVE8rz2QudBK8ZHZIq+mzb9OZ1kBTooT1q89p63+wVeIfKOTNtJ0Q2USTO1JHkTQPhO09zCN3jLSJV9IDqnB3Irx/i/7bdUZLGc/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXEIZbxR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944F21F0089F;
	Wed,  3 Jun 2026 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470555;
	bh=cViQmkVKhT2assR6t71kVGk0DyucdZlLlGtJ9YCsiwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gXEIZbxRhpoZa1yo6vIw4dL7UFDi8IyJjc4OT9fTIcy5pxQ2jbW1tAmTC+BXMmRRj
	 DIpUC95H8E9G7Viuji85keqGJH5oUZbvUVsHGqfMHrv3AO1mivjRttaV2hH6tW6LLG
	 jqgxLJABnz2M/g5ttAPeSKnvaglo8pFRaB7ruQW86Nq7iC+c2yNWCUY83bDRn2OCU+
	 K4KopEeUTeCz1ChqINFv3WDTguKLzjfzseUYf1Bm6Amq7XHXL+bxUkNAr/zVDHSv9o
	 YONknquQ0Ae5OtLCPiWjXimkFcnq8t/oSQywB+rkDzBl+SUazPAea5aAj/NLHiQ7YM
	 IMhh5XqwD0waQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/12] media: microchip-isc: add driver documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-5-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-5-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:09:15 +0000
Message-Id: <20260603070915.944F21F0089F@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63511-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,microchip.com:email,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 893FD635035

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The newly added documentation incorrectly directs userspace develop=
ers to `atmel-isc-media.h`, which is not an exported UAPI header.
- [Low] Mismatch between documented and implemented minimum value for White=
 Balance offset controls.
--

commit 71e9f4b43ec565af48fe0deff5792741daea5496
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

media: microchip-isc: add driver documentation

This commit adds UAPI documentation for the Microchip ISC and XISC drivers.
It covers driver topology, supported formats, controls, the AWB algorithm,
the gamma table layout, and custom controls.

> diff --git a/Documentation/userspace-api/media/drivers/microchip-isc.rst =
b/Documentation/userspace-api/media/drivers/microchip-isc.rst
> new file mode 100644
> index 0000000000000..69c7672e122a9
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/microchip-isc.rst

[ ... ]

> +SAMA7G5/SAM9X7 add:
> +
> +* ``V4L2_CID_HUE``: -180..180 degrees
> +* ``V4L2_CID_SATURATION``: 0..127, default 16 (Q4 fixed-point, 16 =3D 1.=
0x)
> +
> +Custom controls (defined in ``atmel-isc-media.h``):

[Severity: Low]
Will this correctly guide userspace application developers?

The documentation points users to atmel-isc-media.h for custom control
definitions. However, because atmel-isc-media.h is located in include/linux/
rather than include/uapi/linux/, it is an internal kernel header and will
not be exported by make headers_install.

> +
> +* ``ISC_CID_R_GAIN``, ``ISC_CID_B_GAIN``, ``ISC_CID_GR_GAIN``,
> +  ``ISC_CID_GB_GAIN``: WB gains, 0..8191, Q2.9 (512 =3D 1.0x)
> +* ``ISC_CID_R_OFFSET``, ``ISC_CID_B_OFFSET``, ``ISC_CID_GR_OFFSET``,
> +  ``ISC_CID_GB_OFFSET``: WB offsets, -4096..4095

[Severity: Low]
Does the minimum value for the WB offset controls match the driver
implementation?

The documentation states the range is -4096 to 4095, but looking at
drivers/media/platform/microchip/microchip-isc-base.c, the ISC_CTRL_OFF
macro sets the .min value to -4095:

drivers/media/platform/microchip/microchip-isc-base.c:
#define ISC_CTRL_OFF(_id, _name) \
    ...
    .min =3D -4095, \
    ...

Could this be updated so the documentation matches the off-by-one difference
in the source?

> +
> +Pipeline
> +--------

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D5

