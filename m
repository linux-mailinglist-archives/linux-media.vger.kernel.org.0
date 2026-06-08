Return-Path: <linux-media+bounces-64230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bV7DIr4DJ2qhpwIAu9opvQ
	(envelope-from <linux-media+bounces-64230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:02:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE431659817
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:02:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=JEkcIZBO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64230-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64230-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3114317C533
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 17:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323CB3D6CD6;
	Mon,  8 Jun 2026 17:16:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601E329E46;
	Mon,  8 Jun 2026 17:16:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938994; cv=none; b=FC11fURvbtCckpj4R/8iWRph/oxHj9o+EY8hiLgPE93Yin8IHGerTb17icYWHSFiLh5pYU0sZcRS3S6EfwVp5hUZ6RkVC2MmemC0FuEGfOdaNSh45HqCK8c2os11QuQ+nJdedgNpTDut+EgS8y6Y2bwjsOOgmMGAkXECBP809FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938994; c=relaxed/simple;
	bh=i9sYLSaYXZsexyAqcF4aij1p50VWjf05UqebYDTycFA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mLdWek8els1Rjqq5Yx4utVlLB+7L8XNYk+do8LmqfMMXOczGsu52UIXQACkJCaNL29L4c1xmrnHLVgY7Ln+xKmkUlFWdkYyx4v3mEaEWSMH/pJOl5t5Zooq4JA9zfBX+PF3pJFYiu4nmCoNjsHyyn3b2F0YOZhAyq4AdeWAsRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JEkcIZBO; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB83D296;
	Mon,  8 Jun 2026 19:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780938963;
	bh=i9sYLSaYXZsexyAqcF4aij1p50VWjf05UqebYDTycFA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JEkcIZBOGGjObVwJ/2QuPtjfZo5VvZfcSWhgyWjW8hEbKiHhyBnvK7qywaRz9vcSR
	 axYhOmI+V7/+bVWV7/xRKDq7ImzNAQJP6x3hNOyZRZmbgHPWa6t6BcEdTfmOs42uHg
	 ZieUeQZLpzY81M4iHN1lHLARLeuQT8H1JHIThKLY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260608142901.3971821-5-r-donadkar@ti.com>
References: <20260608142901.3971821-1-r-donadkar@ti.com> <20260608142901.3971821-5-r-donadkar@ti.com>
Subject: Re: [PATCH 4/4] media: i2c: ds90ub960: Use VC mapping specific to ub9702
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vigneshr@ti.com, mchehab@kernel.org, tomi.valkeinen@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev
Date: Mon, 08 Jun 2026 22:46:24 +0530
Message-ID: <178093898477.19620.2275596910999709059@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:y-abhilashchandra@ti.com,m:devarsht@ti.com,m:vigneshr@ti.com,m:mchehab@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:jai.luthra@linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64230-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,freya:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE431659817

Quoting Rishikesh Donadkar (2026-06-08 19:59:01)
> Add a dedicated virtual channel mapping for ub9702 deserializers which
> require different VC configuration compared to ub960. Update the
> configuration logic to select the appropriate map based on the
> deserializer type.
>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 44 ++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index d1597659639f..9ce6d9e6e3e8 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -3482,7 +3482,18 @@ static int ub960_rxport_handle_events(struct ub960=
_data *priv, u8 nport)
>   * as that is the most common HW configuration found on boards with DS90=
UB960.
>   * For using both CSI TX0 & TX1 the below method will need significant c=
hanges.
>   *
> + * VC mapping differs between ub960 and ub9702 deserializers:
> + * For ub960:
> + *             - Each VC uses 2 bits in the mapping register
> + *             - Supports up to 4 virtual channels (VC0-VC3)
> + * For ub9702:
> + *             - Each VC uses 4 bits in the mapping register
> + *             - Currently uses only 2 virtual channels (VC0, VC1)
> + *
> + * The mapping registers determine which output VC a given input VC
> + * will be mapped to when forwarding data from the deserializer.
>   */
> +
>  static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
>  {
>         struct device *dev =3D &priv->client->dev;
> @@ -3518,14 +3529,26 @@ static void ub960_get_vc_maps(struct ub960_data *=
priv, u8 *vc_map)
>                 }
> =20
>                 /* Start with all channels mapped to first free output */
> -               map =3D (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
> -                       (cur_vc << 0);
> +
> +               if (priv->hw_data->chip_type =3D=3D UB960) {
> +                       map =3D (cur_vc << 6) | (cur_vc << 4) | (cur_vc <=
< 2) |
> +                               (cur_vc << 0);
> +               } else {
> +                       map =3D (cur_vc << 4) | (cur_vc << 0);
> +               }
> =20

Same comment as last patch, I think this means that UB9702 would be broken
without this patch, which is never a good idea in mainline.

Please squash together patches so that each patch is an independent change
that doesn't break any device.

I'm fine with a Co-developed-by tag in the final single patch as it's been
quite a while since I looked at this :-)

Thanks,
    Jai

>                 /* Map actually used to channels to distinct free outputs=
 */
>                 for (vc =3D 0; vc < UB960_MAX_VC; ++vc) {
>                         if (used_vc[vc]) {
> -                               map &=3D ~(0x03 << (2 * vc));
> -                               map |=3D (cur_vc << (2 * vc));
> +                               if (priv->hw_data->chip_type =3D=3D UB960=
) {
> +                                       /* For ub960: 2 bits per VC */
> +                                       map &=3D ~(0x03 << (2 * vc));
> +                                       map |=3D (cur_vc << (2 * vc));
> +                               } else {
> +                                       /* For ub9702: 4 bits per VC */
> +                                       map &=3D ~(0x0f << (4 * vc));
> +                                       map |=3D (cur_vc << (4 * vc));
> +                               }
>                                 ++cur_vc;
>                         }
>                 }
> @@ -3705,8 +3728,7 @@ static int ub960_configure_ports_for_streaming(stru=
ct ub960_data *priv,
>                                 for (i =3D 0; i < 8; i++)
>                                         ub960_rxport_write(priv, nport,
>                                                            UB9702_RR_VC_I=
D_MAP(i),
> -                                                          (nport << 4) |=
 nport,
> -                                                          &ret);
> +                                                          vc_map[nport],=
 &ret);
>                         }
> =20
>                         break;
> @@ -4018,9 +4040,13 @@ static int ub960_get_frame_desc(struct v4l2_subdev=
 *sd, unsigned int pad,
>                 fd->entry[fd->num_entries].length =3D source_entry->lengt=
h;
>                 fd->entry[fd->num_entries].pixelcode =3D source_entry->pi=
xelcode;
> =20
> -               fd->entry[fd->num_entries].bus.csi2.vc =3D
> -                       ub960_get_output_vc(vc_map[nport],
> -                                           source_entry->bus.csi2.vc);
> +               if (priv->hw_data->chip_type =3D=3D UB960)
> +                       fd->entry[fd->num_entries].bus.csi2.vc =3D
> +                               (vc_map[nport] >> (2 * source_entry->bus.=
csi2.vc)) & 0x03;
> +               else
> +                       fd->entry[fd->num_entries].bus.csi2.vc =3D
> +                               (vc_map[nport] >> (4 * source_entry->bus.=
csi2.vc)) & 0x0f;
> +
>                 dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
>                         route->sink_pad, route->sink_stream,
>                         fd->entry[fd->num_entries].bus.csi2.vc);
> --=20
> 2.34.1
>

