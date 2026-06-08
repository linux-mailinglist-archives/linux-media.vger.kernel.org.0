Return-Path: <linux-media+bounces-64218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vodyAp/rJmqvnAIAu9opvQ
	(envelope-from <linux-media+bounces-64218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:19:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E266589F4
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aRaQ4x0M;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64218-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64218-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2DFD3062DA1
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA2031E82F;
	Mon,  8 Jun 2026 15:30:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CFF31B100
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932632; cv=none; b=O8DifQaDfnQ/mIvds1YPKLiryHvPzHNkZd3FqpoWilP8/P0quUu6YeUSeh1mqjsJym0Zyih1z7On5Y+OP82az3J+otoY+eGXXJTZX7wxIXhDGes86lBDFVlA3m5sPLomO+5tsL6FEN50Ku76L7W63qLuJete/FRIwS7aotcbHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932632; c=relaxed/simple;
	bh=4g88Q4edjBVSublvQjOMe/i2ibm23IRsDlCor+hDjco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gR9ZTJ4Qg3v6AyEJot1tmkZZjf/XxmB5ombLUcnatLd2wZT5pziuE2PxB3FhqrCKca5OGrow6aoN2UyZ+Y24eiCI5tsmInFoagdr93hvG5Df9pO1ofKxo0seTpod6rlA1wTHew16MdO1AhetHDY7T1qKQqMNFLCHETQ8H52Rm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRaQ4x0M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654891F00893;
	Mon,  8 Jun 2026 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780932631;
	bh=j7AQNJVbCV95QcXfQDRd6gilP2BQQ7j7+Mjnpz8xfY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aRaQ4x0MCjeHlVFSMnhJOWUBIgiXbMjWVzizTm3q52kR7TKFRt8uAo+sv/i4KHcCl
	 46DsetO8qS4dUtD9TIr2Kss5zQ0S+gMUMKhopMnsRljI1QBH0CG3F3HuoUkRU66DTA
	 l/VAFnld6/hw9c1OzyaHYQ07A26LJ299DPy5GMeEAjhoLGnTq88vS0cgOtYM65VavZ
	 M0Q1HTVCEME/BwFmCsMuW1f5JV2d4jwZXRYpGA2m7MvyQbeDfDTWWbdLdp9EbeQICD
	 QDU4h16db1ASJNJ2JlqdpB5EtTElplP6wSlIXy/sPIlRITV0EiBd7phB++DvtY/JyG
	 Te3w7eClrZCQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] media: i2c: ds90ub960: Use VC mapping specific to
 ub9702
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608142901.3971821-5-r-donadkar@ti.com>
References: <20260608142901.3971821-5-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:30:31 +0000
Message-Id: <20260608153031.654891F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64218-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto,ti.com:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08E266589F4

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Silent truncation of virtual channel mappings for input VCs 2 and =
3 due to 8-bit integer limit.
- [High] Incorrect configuration of UB9702 virtual channel mapping register=
s causing complete loss of stream separation.
- [High] Undefined Behavior due to unconstrained bit shift when source subd=
evice specifies a virtual channel >=3D 8.
- [Low] Leftover unused function `ub960_get_output_vc`.
- [Low] Stale comment regarding virtual channel mappings.
--

commit 15df19511c1d0cefacb3523a72fdd7c858dac0ce
Author: Rishikesh Donadkar <r-donadkar@ti.com>

media: i2c: ds90ub960: Use VC mapping specific to ub9702

This commit adds a dedicated virtual channel mapping for the ub9702
deserializers, which require different VC configuration than the ub960.
It updates the configuration logic to select the appropriate mapping
based on the deserializer type.

> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index d1597659639f5..9ce6d9e6e3e85 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
[ ... ]
> @@ -3518,14 +3529,26 @@ static void ub960_get_vc_maps(struct ub960_data *=
priv, u8 *vc_map)
>  		}
> =20
>  		/* Start with all channels mapped to first free output */
> -		map =3D (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
> -			(cur_vc << 0);
> +
> +		if (priv->hw_data->chip_type =3D=3D UB960) {
> +			map =3D (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
> +				(cur_vc << 0);
> +		} else {
> +			map =3D (cur_vc << 4) | (cur_vc << 0);
> +		}
> =20
>  		/* Map actually used to channels to distinct free outputs */
>  		for (vc =3D 0; vc < UB960_MAX_VC; ++vc) {
>  			if (used_vc[vc]) {
> -				map &=3D ~(0x03 << (2 * vc));
> -				map |=3D (cur_vc << (2 * vc));
> +				if (priv->hw_data->chip_type =3D=3D UB960) {
> +					/* For ub960: 2 bits per VC */
> +					map &=3D ~(0x03 << (2 * vc));
> +					map |=3D (cur_vc << (2 * vc));
> +				} else {
> +					/* For ub9702: 4 bits per VC */
> +					map &=3D ~(0x0f << (4 * vc));
> +					map |=3D (cur_vc << (4 * vc));

[Severity: High]
Does this code silently truncate mappings for higher virtual channels?

The variable map is a u8. For vc >=3D 2, the shift amount 4 * vc is 8 or 12.
When the shifted value is assigned back into map, the upper bits will be
truncated to zero.

Could this lose the configuration for those channels while still improperly
consuming cur_vc allocation slots?

> +				}
>  				++cur_vc;
>  			}
>  		}
[ ... ]
> @@ -3705,8 +3728,7 @@ static int ub960_configure_ports_for_streaming(stru=
ct ub960_data *priv,
>  				for (i =3D 0; i < 8; i++)
>  					ub960_rxport_write(priv, nport,
>  							   UB9702_RR_VC_ID_MAP(i),
> -							   (nport << 4) | nport,
> -							   &ret);
> +							   vc_map[nport], &ret);

[Severity: Low]
Is the comment just above this block:
/* Map all VCs from this port to VC(nport) */
still accurate?

Since the code now dynamically writes vc_map[nport] instead of the static
(nport << 4) | nport, the comment might need an update.

[Severity: High]
Will this write the exact same packed configuration to all 8 stream registe=
rs?

The ub960_get_vc_maps() function packs multiple mappings into a single byte,
but the UB9702_RR_VC_ID_MAP(i) registers seem to configure TX routing for
each individual incoming stream.

Writing the identical packed byte to all 8 registers might map all incoming
streams to the exact same outgoing virtual channels, which could cause stre=
am
collisions.

>  			}
> =20
>  			break;
[ ... ]
> @@ -4018,9 +4040,13 @@ static int ub960_get_frame_desc(struct v4l2_subdev=
 *sd, unsigned int pad,
>  		fd->entry[fd->num_entries].length =3D source_entry->length;
>  		fd->entry[fd->num_entries].pixelcode =3D source_entry->pixelcode;
> =20
> -		fd->entry[fd->num_entries].bus.csi2.vc =3D
> -			ub960_get_output_vc(vc_map[nport],
> -					    source_entry->bus.csi2.vc);

[Severity: Low]
Does this change leave ub960_get_output_vc() as an unused function?

The original function definition doesn't seem to be removed in this patch,
which could result in dead code.

> +		if (priv->hw_data->chip_type =3D=3D UB960)
> +			fd->entry[fd->num_entries].bus.csi2.vc =3D
> +				(vc_map[nport] >> (2 * source_entry->bus.csi2.vc)) & 0x03;
> +		else
> +			fd->entry[fd->num_entries].bus.csi2.vc =3D
> +				(vc_map[nport] >> (4 * source_entry->bus.csi2.vc)) & 0x0f;

[Severity: High]
Can the source_entry->bus.csi2.vc be 8 or greater?

Since CSI-2 supports up to 16 virtual channels, a source channel of 8 or
more would result in a right shift of 32 or more bits on the promoted
32-bit integer. In C, shifting by the width of the type or greater
results in undefined behavior.

Also, because vc_map is truncated during generation, will this extract 0
for any source VC >=3D 2, incorrectly collapsing higher streams into output
VC 0?

> +
>  		dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
>  			route->sink_pad, route->sink_stream,
>  			fd->entry[fd->num_entries].bus.csi2.vc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142901.3971=
821-1-r-donadkar@ti.com?part=3D4

