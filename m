Return-Path: <linux-media+bounces-56387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJbBMxBovGlQyQIAu9opvQ
	(envelope-from <linux-media+bounces-56387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:18:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ECA2D297C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19C9A3010525
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9A4326D51;
	Thu, 19 Mar 2026 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hf757IYm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D323D2A1;
	Thu, 19 Mar 2026 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955078; cv=none; b=NmblGFSimtaY6HUTjBgFfnnlGsufrm7o/onk6c4KuLudGNH4RzhVEaiFkra55x0L097IeTCkG1ZudLv6+jo1a7rp9opPzYXtxxh8HWfhA7NxYdElTn9mJOoddUtWT76XtgOHCKE376zXFKZY3TL/4yJVidhQ2KHtBFRQ4VNTMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955078; c=relaxed/simple;
	bh=7JyptTP6FFzefbiTDJSEQ7BxEUT6G+ZVczYYtcld+9U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YIKZ+GmbbrJZv4qtp9q8fWe5mltxKUNUdp3+i3QFvOL1X5PL15cbCJgCxlzkwizA8cGAbqX+MHrdaDI3mGd1g+EnLqxFAlqlm12LiqWZ/wRAar/WWvnR/86anJq5hAZS7IWnVSEXM+BtaqApMa50JdYdcce3zUWhu6/rXx0Geas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hf757IYm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773955074;
	bh=7JyptTP6FFzefbiTDJSEQ7BxEUT6G+ZVczYYtcld+9U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Hf757IYmM23rrjFFi2A1ZRDWUeZxDQWY8IumZdvtW8JJez2dBaQJ4J7sG+w6/nYSk
	 i9AyglWbSo6m8q/NdbqWBg5GSdQ8SK05Suzhd+q43gbXlA3IFBvTwGPiELHg7WEy9n
	 O35aXUgyLl86iYFHEipSYhKS9Cymwmcd87XB1G2io878xCJwtAjY2nh9FweLsHtFIE
	 gn9Ctu9n+cSkv4TGnoT0a7qvL+rMz2QRjGjx8NoUr61vlbBQ9wbc7S9WvQq54dqOEV
	 /wZBHakml+mgTjH0XMayAhGBKWpslwBppaZrnhfenLmFopE2h2kyj4njCrcjAW1uS4
	 yOu9PDDNcCDVQ==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A908F17E0ECE;
	Thu, 19 Mar 2026 22:17:53 +0100 (CET)
Message-ID: <c6ddf8a7cc7224921b62f74b87d1c8e5c9c4a120.camel@collabora.com>
Subject: Re: [PATCH v0 1/3] media: chips-media: wave5: Add Support for
 Background Detection
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Thu, 19 Mar 2026 17:17:51 -0400
In-Reply-To: <20260319053210.90-2-jackson.lee@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
	 <20260319053210.90-2-jackson.lee@chipsnmedia.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-USDCyQC8w9oWBCuQWsrV"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56387-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[chipsnmedia.com,kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36ECA2D297C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-USDCyQC8w9oWBCuQWsrV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 mars 2026 =C3=A0 14:32 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> Wave5 encoder can be configured to detect a background region in a frame.
> If a background region is detected, it will use less bits or skip mode to
> encode that region. This can assist in lowering the video bitrate for a
> given stream.

Since you are adding a generic control (and I think the feature is pretty c=
lear
an generic), you should make this clear in the text. So start saying you ar=
e
adding a generic control for the background detection feature and then quot=
e
that this will be implemented by wave5. Its just a nit on wording, I have n=
o
doubt this option would also exist on other IP and be compatible through th=
e
provided description.

>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
> =C2=A0Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-hw.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c=C2=A0 | 7 =
+++++++
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpuapi.h=C2=A0=C2=A0=
 | 1 +
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 ++
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A06 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index c8890cb5e00a..b992a0d5c7bf 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -605,6 +605,11 @@ enum v4l2_mpeg_video_frame_skip_mode -
> =C2=A0=C2=A0=C2=A0=C2=A0 chosen data limit then the frame will be skipped=
. Possible values
> =C2=A0=C2=A0=C2=A0=C2=A0 are:
> =C2=A0
> +``V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION (boolean)``
> +=C2=A0=C2=A0=C2=A0 If enabled then, the encoder detect a background regi=
on in frame and

drop then

> +=C2=A0=C2=A0=C2=A0 use low bits or skip mode to encode the background re=
gion.
> +=C2=A0=C2=A0=C2=A0 If a lot of scenes are stationary or background, It m=
ay help to
> +=C2=A0=C2=A0=C2=A0 reduce the video bitrate. Applicable to the encoder.
> =C2=A0
> =C2=A0.. tabularcolumns:: |p{8.2cm}|p{9.3cm}|
> =C2=A0
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index 687ce6ccf3ae..c516d125f553 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c

Please, split the API addition from the driver changes.

> @@ -49,6 +49,7 @@
> =C2=A0
> =C2=A0#define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
> =C2=A0#define SEQ_PARAM_PROFILE_MASK		GENMASK(30, 24)
> +#define SEQ_BG_PARAM_REG_DATA		0x3800410
> =C2=A0
> =C2=A0static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32
> reg_fail_reason,
> =C2=A0				 const char *func);
> @@ -1838,7 +1839,8 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *ins=
t)
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_RC_BIT_RATIO_LAYER_4_7, 0)=
;
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_ROT_PARAM, rot_mir_mode);
> =C2=A0
> -	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM, 0);
> +	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SEQ_BG_PARAM_REG_DATA | p_param->bg_det=
ection);
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CUSTOM_LAMBDA_ADDR, 0);
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CONF_WIN_TOP_BOT,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_param->conf_win_bot << 16 | p_pa=
ram->conf_win_top);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 7613fcdbafed..6fe01217233f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -780,6 +780,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctr=
l)
> =C2=A0	case V4L2_CID_MPEG_VIDEO_BITRATE:
> =C2=A0		inst->bit_rate =3D ctrl->val;
> =C2=A0		break;
> +	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
> +		inst->enc_param.bg_detection =3D ctrl->val;
> +		break;
> =C2=A0	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
> =C2=A0		inst->enc_param.avc_idr_period =3D ctrl->val;
> =C2=A0		break;
> @@ -1205,6 +1208,7 @@ static int wave5_set_enc_openparam(struct enc_open_=
param
> *open_param,
> =C2=A0	open_param->wave_param.beta_offset_div2 =3D input.beta_offset_div2=
;
> =C2=A0	open_param->wave_param.decoding_refresh_type =3D
> input.decoding_refresh_type;
> =C2=A0	open_param->wave_param.intra_period =3D input.intra_period;
> +	open_param->wave_param.bg_detection =3D input.bg_detection;
> =C2=A0	if (inst->std =3D=3D W_HEVC_ENC) {
> =C2=A0		if (input.intra_period =3D=3D 0) {
> =C2=A0			open_param->wave_param.decoding_refresh_type =3D
> DEC_REFRESH_TYPE_IDR;
> @@ -1700,6 +1704,9 @@ static int wave5_vpu_open_enc(struct file *filp)
> =C2=A0	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
> =C2=A0			=C2=A0 0, 1, 1, 1);
> +	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> +			=C2=A0 V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION,
> +			=C2=A0 0, 1, 1, 0);

The hard question, last parameter here is def, so I read this is disabled b=
y
default. What's the side effect of having this enabled by default ? Did you
already considered that option ?

regards,
Nicolas

> =C2=A0	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> =C2=A0			=C2=A0 V4L2_CID_HFLIP,
> =C2=A0			=C2=A0 0, 1, 1, 0);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index c64135769869..dc31689e0d27 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -570,6 +570,7 @@ struct enc_wave_param {
> =C2=A0	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8
> transform */
> =C2=A0	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
> =C2=A0	u32 forced_idr_header_enable: 1; /* enable header encoding before =
IDR
> frame */
> +	u32 bg_detection: 1; /* enable background detection */
> =C2=A0};
> =C2=A0
> =C2=A0struct enc_open_param {
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-
> core/v4l2-ctrls-defs.c
> index 551426c4cd01..e062f2088490 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -889,6 +889,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> =C2=A0	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return
> "Display Delay";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return
> "Display Delay Enable";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return
> "Generate Access Unit Delimiters";
> +	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:		return
> "Background Detection";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263
> I-Frame QP Value";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263
> P-Frame QP Value";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263
> B-Frame QP Value";
> @@ -1296,6 +1297,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum
> v4l2_ctrl_type *type,
> =C2=A0	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
> =C2=A0	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> =C2=A0	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
> +	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
> =C2=A0	case V4L2_CID_WIDE_DYNAMIC_RANGE:
> =C2=A0	case V4L2_CID_IMAGE_STABILIZATION:
> =C2=A0	case V4L2_CID_RDS_RECEPTION:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-
> controls.h
> index 68dd0c4e47b2..939f796261c0 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -464,6 +464,8 @@ enum v4l2_mpeg_video_intra_refresh_period_type {
> =C2=A0	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC	=3D 1,
> =C2=A0};
> =C2=A0
> +#define
> V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION	(V4L2_CID_CODEC_BASE+238)
> +
> =C2=A0/* CIDs for the MPEG-2 Part 2 (H.262) codec */
> =C2=A0#define
> V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> =C2=A0enum v4l2_mpeg_video_mpeg2_level {

--=-USDCyQC8w9oWBCuQWsrV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxn/wAKCRDZQZRRKWBy
9LD/AQCS1rDEjXwUoahytHRC/EB1pghlQrbyFWpfB25j6/AGswEApDd149gRHYTQ
RDrj7oOaIyDHCE4hQqCYe0ckVUNHhAI=
=EYVd
-----END PGP SIGNATURE-----

--=-USDCyQC8w9oWBCuQWsrV--

