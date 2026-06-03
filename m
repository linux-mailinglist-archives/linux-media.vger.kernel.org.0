Return-Path: <linux-media+bounces-63550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TuosGDntH2oUsgAAu9opvQ
	(envelope-from <linux-media+bounces-63550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:00:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB851635F0F
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fv3dZ+zM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63550-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63550-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0DC5307374A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EAC438FE0;
	Wed,  3 Jun 2026 08:59:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0B409112;
	Wed,  3 Jun 2026 08:59:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477189; cv=none; b=Gndl2ecst7I1p+TOzR+R7LIVXMowog4i1t9/WnQlfsUJvtEh8pybiJ8K9RsdxAqTDFBT8RH6gUlys/+gDX4OZI4jQkh8F5tFlV1NDvj5H/ZH0z0uHVVGue/qRYx+KuY2MJZdJu28I1lCEScEV6v+FKNnaeBb22dWD7TsoKQ8lfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477189; c=relaxed/simple;
	bh=EraAJllM2k0pFFwkfe15iY+NLP8elH2WG5D1zys1DCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oZ7ZcPvOFd2xUE1B55oy0GlQyrWTmqliFWLUdRdvf8L0yrlpOHBkOshsHwlenPj5sFCnYYA2can7GXDZAl5lS6beM/tjK/A0cbPRPtYoafW9pjiywBHom5P2oti+Q2LRzy/aAEJlDrJs8EH9rGTUTippd0d/10qquNeMUCriEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fv3dZ+zM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CD01F00893;
	Wed,  3 Jun 2026 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477188;
	bh=N8jXeg6WlNR1NMvIlJFLSjjvT1fbY6XZ+2t2abj7K+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fv3dZ+zMWpr2bYP5iE0JiF8Osmhw57W3tCAocPi7ulMJSsggs3u64v4bDSMM+f4FS
	 XyLsb3KR3/xXYg2CWSFTLl97NctwGSl9xTEROZNM476wJdvh7/sswPrmnEr0RhXuTc
	 m4Y5Bo+n4Odlm0eknyam55/d4FtKUI3Jadu83VrFPLNtIVwzYA/U+cp/7UghINtDiE
	 T1vPMkYadVRIaIRboDUaQr3czCLOYa25R4/tqqmzdxbAoKIYtQ3a3VZrx8+SZK0ZLL
	 moBz5dSktBbEXrJYZLKuy8yaAGyB6njhpmKoUHeNjnyPFC/PrGVk0M+NR6HwFgxUx/
	 LOqdmWGQyRjBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/14] media: mediatek: vcodec: get share memory
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603084045.17488-6-kyrie.wu@mediatek.com>
References: <20260603084045.17488-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:59:47 +0000
Message-Id: <20260603085948.10CD01F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,mediatek.com:email,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63550-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB851635F0F

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The `mtk_vcodec_vcp_msg` ops structure lacks the `get_venc_capa` c=
allback, causing a NULL pointer dereference when opening a VCP encoder.
- [High] The VCP memory address mapping breaks encoder initialization becau=
se encoder drivers were not updated to pass the new enum values.

Pre-existing issues:
- [High] Missing bounds validation for firmware-provided AV1 table sizes ca=
uses potential out-of-bounds reads.
- [High] `if (!ptr)` error checks fail to catch `ERR_PTR`, leading to kerne=
l panic on mapping failure.
--

commit 2fc79ef1812a3894cd11fa26b7b0e560b49068a2
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: get share memory address

There is only one share memory for vcp architecture, need to
divide it into many different functions.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
[ ... ]
> @@ -434,8 +434,26 @@ static unsigned int mtk_vcodec_vcp_get_vdec_capa(str=
uct mtk_vcodec_fw *fw)
>  	       MTK_VDEC_IS_SUPPORT_10BIT | MTK_VDEC_IS_SUPPORT_EXT;
>  }
> =20
> -static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_d=
mem_addr)
> +static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_ty=
pe)
>  {

[Severity: High]
Does the VCP firmware operations structure mtk_vcodec_vcp_msg support encod=
ers?

When opening an encoder device, fops_vcodec_open() unconditionally calls
mtk_vcodec_fw_get_venc_capa(), which invokes fw->ops->get_venc_capa(fw).
If mtk_vcodec_vcp_msg does not assign the .get_venc_capa callback, won't
opening a VCP encoder trigger a NULL pointer dereference?

> +	unsigned char *vsi_core =3D fw->vcp->vsi_core_addr;
> +
> +	switch (mem_type) {
> +	case ENCODER_MEM:
> +	case VCODEC_LAT_MEM:
> +		return fw->vcp->vsi_addr;
> +	case VCODEC_CORE_MEM:
> +		return vsi_core;
> +	case VP9_FRAME_MEM:
> +		return vsi_core + VCODEC_VSI_LEN;
> +	case AV1_CDF_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
> +	case AV1_IQ_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;
> +	default:
> +		break;
> +	}
> +
>  	return NULL;
>  }

[Severity: High]
Are we sure all encoder calls have been updated to pass the new memory type
enums?

It looks like the encoder subsystem still passes physical device addresses
instead of the new enum mtk_vcp_mem_type. For example, handle_enc_init_msg()
in venc_vpu_if.c passes msg->vpu_inst_addr, and h264_enc_alloc_work_buf() in
venc_h264_if.c passes vpua.

Since this switch statement will fall through to default for those physical
addresses, won't mtk_vcodec_fw_map_dm_addr() now return NULL and trigger a
crash during encoder initialization?

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
[ ... ]
> @@ -775,7 +784,7 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_=
av1_slice_instance *instanc
>  	ctx =3D instance->ctx;
>  	vsi =3D instance->vpu.vsi;
>  	remote_cdf_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						     (u32)vsi->cdf_table_addr);
> +						     vdec_av1_get_cdf_table_addr(ctx, vsi));

[Severity: High]
This is a pre-existing issue, but is it safe to use vsi->cdf_table_size wit=
hout
validation?

In vdec_av1_slice_init_cdf_table(), the size vsi->cdf_table_size is provided
by the untrusted firmware and later used in a memory copy:

memcpy(instance->cdf_table.va, remote_cdf_table, vsi->cdf_table_size);

Could a compromised firmware provide an arbitrarily large size, leading to =
an
out-of-bounds read from the DMA region and a corresponding out-of-bounds wr=
ite
into kernel memory?

>  	if (IS_ERR(remote_cdf_table)) {
>  		mtk_vdec_err(ctx, "failed to map cdf table\n");
>  		return PTR_ERR(remote_cdf_table);

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
[ ... ]
> @@ -514,7 +523,7 @@ static int vdec_vp9_slice_init_default_frame_ctx(stru=
ct vdec_vp9_slice_instance
>  		return -EINVAL;
> =20
>  	remote_frame_ctx =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						     (u32)vsi->default_frame_ctx);
> +						     vdec_vp9_get_frame_ctx_addr(ctx, vsi));
>  	if (!remote_frame_ctx) {
>  		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
>  		return -EINVAL;

[Severity: High]
This is a pre-existing issue, but does this error check handle ERR_PTR retu=
rns
correctly?

When using SCP firmware, scp_mapping_dm_addr() returns ERR_PTR(-EINVAL) on
mapping failure. Since an error pointer evaluates as true, the
if (!remote_frame_ctx) check is bypassed.

Could this allow the invalid ERR_PTR to be passed to kmemdup() further down=
 in
the function, causing a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D5

