Return-Path: <linux-media+bounces-63512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4q3DE4DUH2pYqgAAu9opvQ
	(envelope-from <linux-media+bounces-63512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:15:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD4D635100
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FFI5cV9P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63512-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63512-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F77C304C7D6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D11399356;
	Wed,  3 Jun 2026 07:11:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A3390C8C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:11:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470668; cv=none; b=H/zGdAK62lDmbz+XiHvj8LmO6vCjB/3oEphiBFWgtk3V8NX10mA2UtKX9oHDt6Ul8RrCvyV8E4CxNlbRsMApJ7TcayLUNg6fKykm8HQDBHf6ugB9Y/AMjAkmu5X72ReA2nfsyWIZdk4kIWtScVpHjYfdPbF2NqScJJfQxATF/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470668; c=relaxed/simple;
	bh=TM+UMee5C+cLrttuBAyk62bsMANY6jDmr83c8aYqsYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKsGyZWMnsNnWgumuEwgWWkKoWU2qiOk+LDcNUCW6DZygWAMGonkooL51vgfyeOHIyIoTpz9Tdc7RIxcS300ZbM75EOO1yvV/aE63h8Uz8gDU8nKbpM7H5fVhFqRtyrfM8xtQPUSkqWbxquQm82g7nbT9rKpoor+uOSUpvcjz48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFI5cV9P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D32E1F00893;
	Wed,  3 Jun 2026 07:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470667;
	bh=50EegfUa1SqBpGOEFWH5G34wKdm3LDBxaTU84uCiy4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FFI5cV9PJOI8IsaztEPtF5Ks8VLRvR2XReGxOgJ6kHQ8o1fexKrxw6WnHXKtX3BfV
	 sN+W8IZHyXaP6NdGPkD8bwuVU1KFbxVGr8OzTiAt0WeH6ZMZL1I7eiZdQ22Bhhrj0/
	 KrUJgqE14E0+GxuEQEkYqYEdbsazOc7zCHQ6k77pVwSFyzPmeRPdz3vDLIJq0ltc2e
	 Ys91FXb9szWgemk+nCWNvm0sSNfM9zPYbU5zVcp0XSpDk+Tx0iWmLS1tJJCswPEkqa
	 /o01rX9REkjqCq59d1NDccspQC0gex4lC7WUAgL7mtSrRG3sdosxm1NQrH4eKmFRtC
	 uWwNiIxVhLlJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/12] media: microchip-isc: set SAM9X7 maximum
 resolution to 2560x1920
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-6-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-6-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:11:06 +0000
Message-Id: <20260603071107.4D32E1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63512-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCD4D635100

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The driver checks the machine root compatible string to infer de=
vice-specific hardware parameters instead of using a device match table.

Pre-existing issues:
- [High] The driver saves OF endpoint nodes into a persistent list without =
acquiring a reference, leading to a use-after-free and double-free during p=
robe.
--

commit c91e2880e308dc3e7795189aa50b13e996251309
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

media: microchip-isc: set SAM9X7 maximum resolution to 2560x1920

This patch updates the microchip-sama7g5-isc driver to support the SAM9X7
SoC. It reduces the maximum horizontal and vertical resolutions due to
smaller internal line buffer constraints on the SAM9X7 compared to the
SAMA7G5.

> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/d=
rivers/media/platform/microchip/microchip-sama7g5-isc.c
> index ca23e8adecbdc..4119cfe12cdf2 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -432,8 +435,13 @@ static int microchip_xisc_probe(struct platform_devi=
ce *pdev)
>  	isc->gamma_table =3D isc_sama7g5_gamma_table;
>  	isc->gamma_max =3D 0;
> =20
> -	isc->max_width =3D ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
> -	isc->max_height =3D ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
> +	if (of_machine_is_compatible("microchip,sam9x7")) {

[Severity: Medium]
Is checking the machine root compatible string the best approach here?

Typically, a device driver relies on its own device node's compatible
string to infer device-specific hardware parameters, rather than the root
machine's compatible string.

Could this be implemented by introducing a new compatible string for the
SAM9X7 XISC (e.g., microchip,sam9x7-isc) to the driver's of_match_table,
and associating the specific resolution limits using
of_device_get_match_data()?

> +		isc->max_width =3D ISC_SAM9X7_MAX_SUPPORT_WIDTH;
> +		isc->max_height =3D ISC_SAM9X7_MAX_SUPPORT_HEIGHT;
> +	} else {
> +		isc->max_width =3D ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
> +		isc->max_height =3D ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
> +	}
> =20
>  	isc->config_dpc =3D isc_sama7g5_config_dpc;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the probe
sequence, I noticed a potential reference counting issue with the endpoint
nodes.

In xisc_parse_dt(), the endpoint node is assigned without taking a
reference:

xisc_parse_dt() {
    ...
    for_each_endpoint_of_node(np, epn) {
        ...
        subdev_entity->epn =3D epn;
    ...
}

Since for_each_endpoint_of_node() drops the reference on the current epn
when it advances, subdev_entity->epn might point to a node whose
reference count has already been decremented.

Later in microchip_xisc_probe(), this endpoint is accessed and explicitly
freed:

microchip_xisc_probe() {
    ...
    list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
        struct fwnode_handle *fwnode =3D
            of_fwnode_handle(subdev_entity->epn);
        ...
        of_node_put(subdev_entity->epn);
    ...
}

Could this lead to a use-after-free when registering the async remote,
and a double-free when of_node_put() is called? Should the assignment
in xisc_parse_dt() use of_node_get(epn)?

A similar omission also appears to be present in the SAMA5D2 driver
variant in isc_parse_dt().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D6

