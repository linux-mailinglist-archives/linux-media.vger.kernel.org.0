Return-Path: <linux-media+bounces-63556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dCLuEU3xH2rxsgAAu9opvQ
	(envelope-from <linux-media+bounces-63556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:18:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078263612E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kFF6jq8q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63556-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63556-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BECFB306FC2B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE63837AA9A;
	Wed,  3 Jun 2026 09:10:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE01377560;
	Wed,  3 Jun 2026 09:10:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477835; cv=none; b=migwgOVH35JT/94+XU6m3FOq8a23YH9376GwuOBmZgButrinbWYtnBBpU+JVpK1pnqRVzDH+ErB+CpNq2tbfpYR0QuzEkuvfxQ2NsbLTnaivcdCib9M7tEjvt2Z7aWWenwsdj3BdtXVQVV2w9xJ6sD3bpcWAtnn5CHkIMiDInDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477835; c=relaxed/simple;
	bh=zzQFkLEs8Y6IoulvfdbemPvInIuP7KWYqUfJUDQcAlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPAY+N2xRKcS36i1bBruY0yAI0Yl6qL3rKqqPXv3x+rcGOpdABkJLKDMow5rq3yb9v+ftB1w79tczCCxYLGjYz/OIBjvTAyfZiZjKTKdDRUG5UeYaA0LBtISffmQRrosVqUZwLeegkAf2tN6SUiepsa3NCOKxlut/4517c8As+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFF6jq8q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948081F00893;
	Wed,  3 Jun 2026 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477833;
	bh=X0Ih1g5ia3iu3JNKJQKGtf2DQ8GYWzw0377ONBgc+QY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kFF6jq8qCNmt/HZkVDRr24thhSaUxLbSDBhU4umZqdkMx5qry5TC9ANJ3+u94CVnr
	 SoCh6xmTVr2OBfH2uipv2m+gBKToK/rdUBae/4lCM0z+yGHBdd23piEWFhqd4YBHzA
	 GscaTpD7bEJ4Cu8iDdFIjh6vL1EXMKg1yQP2+F3YWZ/SFBDuwykB65bJaBUHtrAJKP
	 lXMS0Qcr0Z7iJx8KNuPD7a0z3IaOgi1OHSQOYvCVrWyMuNAMqj4GrL5PSiyERDy9Cq
	 gGxVB5kIYpZFvWHD/4cHnOoCiewGvB7LdCbc64VSipTe8se7t6FlufFMK39onCRVJv
	 UisWZ9JjjKJjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/14] media: mediatek: decoder: support av1 extend
 vsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603084045.17488-15-kyrie.wu@mediatek.com>
References: <20260603084045.17488-15-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 09:10:33 +0000
Message-Id: <20260603091033.948081F00893@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,mediatek.com:email];
	TAGGED_FROM(0.00)[bounces-63556-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 9078263612E

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Out-of-bounds write to VPU shared memory in `vdec_av1_slice_vsi_to=
_remote()` due to unconditional struct memcpy.

Pre-existing issues:
- [High] Missing bounds check on `tile_cols` and `tile_rows` leads to heap =
buffer overflow during AV1 tile setup.
--

commit 704ba9a36ee79563029e1b285c390dcbc873258d
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: decoder: support av1 extend vsi
   =20
The driver can't access tile buffer address for extend architecture,
set tile group information in vcp and share it with kernel.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index a0c7e89b8ae4d..e9265b112bfbe 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
[ ... ]
> @@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
>  	struct vdec_av1_slice_frame frame;
>  	struct vdec_av1_slice_state state;
>  	u32 cur_lst_tile_id;
> +	struct vdec_av1_slice_tile_group tile_group;
> +	unsigned int reserved[4];
>  };

[Severity: High]
Does this struct size increase cause an out-of-bounds write in
vdec_av1_slice_vsi_to_remote()?

Since vdec_av1_slice_vsi_to_remote() unconditionally uses sizeof(*vsi):

static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *=
vsi,
						struct vdec_av1_slice_vsi *remote_vsi)
{
	memcpy(remote_vsi, vsi, sizeof(*vsi));
}

and this patch adds the large tile_group structure to it, won't this copy t=
he
new larger size?

For non-EXT devices, the remote firmware buffer remains AV1_NON_EXT_VSI_SIZE
(0xD50), so won't this write past the end of the VPU shared memory?

[ ... ]
> @@ -1402,17 +1409,29 @@ static void vdec_av1_slice_setup_uh(struct vdec_a=
v1_slice_instance *instance,
>  	vdec_av1_slice_setup_tile(frame, &ctrl_fh->tile_info);
>  }

[Severity: High]
This is a pre-existing issue, but does vdec_av1_slice_setup_tile()
lack bounds checking for tile->tile_cols and tile->tile_rows?

vdec_av1_slice_setup_tile() reads ctrl_tile->tile_cols and
ctrl_tile->tile_rows from userspace control without validation:

static void vdec_av1_slice_setup_tile(struct vdec_av1_slice_frame *frame,
				      struct v4l2_av1_tile_info *ctrl_tile)
{
	...
	tile->tile_cols =3D ctrl_tile->tile_cols;
	tile->tile_rows =3D ctrl_tile->tile_rows;
	...
	for (i =3D 0; i < tile->tile_cols + 1; i++)
		tile->mi_col_starts[i] =3D
			ALIGN(ctrl_tile->mi_col_starts[i], BIT(mib_size_log2)) >> mib_size_log2;

	for (i =3D 0; i < tile->tile_rows + 1; i++)
		tile->mi_row_starts[i] =3D
			ALIGN(ctrl_tile->mi_row_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
}

Since mi_col_starts and mi_row_starts are fixed-size arrays (65 elements) in
struct vdec_av1_slice_tile, could a malicious application supply values
greater than 64 and cause a heap buffer overflow when copying from
ctrl_tile?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D14

