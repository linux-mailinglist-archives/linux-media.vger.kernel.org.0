Return-Path: <linux-media+bounces-61273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BEtOSY2A2ox1wEAu9opvQ
	(envelope-from <linux-media+bounces-61273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:16:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138852224E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57AAB308A5A3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E6E32AADC;
	Tue, 12 May 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="ERzj7mV7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9F30C34E
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595339; cv=none; b=Wlnz7ItPttx1R0irxI1FZtX7KTbiBIuq3ktwEEe/xRREhUlhSlgbZrHMRhWb73axURlClyXZh5CPC9GRZcc4qKq+AOgbpxJHaHuArDAsI4skgUhwMUqLoWqZHS/5hZxIl+XdUUxFvonKwAV9cc/1YypizTl81qmz8iPG0FRnEZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595339; c=relaxed/simple;
	bh=KUBh1oh0er2A8eHqyIho2Le54Um2loA0sPLqxmaOMfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXf/WnFrO6GOTDuMG7dj4RzGO9Im0XvL4TJRTpVwdAJgKnHgbEIuIGKc99AtApfeA7Ez64A6oYiJEFZLi8jJ+6DNVG2UO1VYLnR4Bo1AhR/+S1Pu1QBbpM35vkO2XGRQJ5khcqyoYAAUOJpCa92Wtt0S2rgz9rbh5FaEWiasZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=ERzj7mV7; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8b6ea7716bfso60932626d6.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778595337; x=1779200137; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t5yuzSij9ihN7bsN0SDs0fsi6mzTuBWCdwEM+hrLAO0=;
        b=ERzj7mV7nMhav8hRDKpTlM6zX155aHwaFq+VQMHIrEkv1S/fk3HAPjqZzLDVgugoGv
         VIvOrKsVCWiNUds4gEwcu/g6XUK7sl5OUAXV3Pp5fJY1+qSrQY9BFUQXrUurD5X/URp/
         8stP0bW1yVUgOT+GoSxogkWUsZs0RZhLObspaipWtq+NnidChLqubxaC/VvcBijtfDa4
         kExXtuPNyvfgHg8rhQle+lneHUsU7drDN6NpD5ytiMitLAfO6C8BXCOb9UIkaMbKfFsV
         urN3RJhQFw56jfLlLHR8NCUMqrmPaRAjNWxXvhpKKVxCpHBlAXxrZ8SiNdozW9lJ1qAP
         lweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595337; x=1779200137;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5yuzSij9ihN7bsN0SDs0fsi6mzTuBWCdwEM+hrLAO0=;
        b=dPw78eldJxxjDikIp5lqyBG1XCd1dx2Kwv2vJAIjvopqh4OqbSKzdltN/wYQp4EyF2
         svkF/Xcj59q0o1YN/HNgdQdYQqAjCyRQM4uEB541s15spfsC8OqjCJ8pITiXtmYRMOzH
         bKxNMrnaRCm2VlcvtBdVfRv/kgkXSAtBuY78O2vNPgysy2NIzRRB7ja5cRgzoahBvVZi
         eq3m1hhfS5lAnOP3uLMpn0P+wzbpw4DrHINps5W3MC5LCD35aEaE5uzC+2i0S1+weKiK
         ntmQIcops8Vue/cPpAZvvB2V8HeAupMzYanALJfVUFDHSQ3VUp3vXeU8w2iEy467PbAi
         DBxw==
X-Gm-Message-State: AOJu0YzUV3fVMXPgJ3nozUesYPDALVIfRqcY6yhdNWwJsH0C0L8yTNOn
	3lV/4srSlTKe3q2+sW3+ch3E/qFxC6sg8zkYtyMya66wIElTkSt2swszQBDGQvME90Y=
X-Gm-Gg: Acq92OEYHk1zeWE+Ccb4aMZ3FZJoH8uIQmzhc0GFZB9ibF/uV1COcYzs4i3Y7DO/LHU
	bT0Fk5oOzScJnv1m/fCL2pvYpmyG3AR6TCN+K6BFrLqv57ec3G6hVTDoB8ZzGxpT57oyrSNa8HI
	TDq40gcyvswFKmooVJVO8/Jk+blyP1/vHtksQoKaX9QwGFOGoj1haAyRPgaQ7xlTd9Wz0MosTFm
	JShWVxvRo9SzSxPrDGQKD7qPP/v4GlmIhXNBAPos2wNqRSGQzYEqCU/jnQt4QdI2vMs30iZM5lo
	6QO4S7y8fOUX/SkkKPRoL7P0vNkj3tPsMVjnZ998J5XyMUxzrXQYFLB79KpBxGqUYw1dcTMUz40
	n8+9mIuOROp0hhhNUmEVUp8GGj2i3bPBQyRaP3hQHKinKcmvLi4u/WYAWmrmRbrjwFObidbMpWk
	FAZKcE543YloTc7dxnOQw7M8Y5m3T6hmAbmk0QWXE=
X-Received: by 2002:a05:6214:1c83:b0:8ac:8337:ca08 with SMTP id 6a1803df08f44-8c1b0959359mr215100206d6.51.1778595335519;
        Tue, 12 May 2026 07:15:35 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a3401b1sm125364016d6.22.2026.05.12.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:15:33 -0700 (PDT)
Message-ID: <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate
 into separate function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Tue, 12 May 2026 10:15:30 -0400
In-Reply-To: <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
	 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
	 <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Hb+ed2d1W1UpJMfZXIXO"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9138852224E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61273-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,pengutronix.de:email,sashiko.dev:url,ndufresne-ca.20251104.gappssmtp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--=-Hb+ed2d1W1UpJMfZXIXO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 mai 2026 =C3=A0 16:08 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 5/9/26 12:11 AM, Nicolas Dufresne wrote:
> > Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9cr=
it=C2=A0:
> > > Split the flip and rotate command configuration into a separate
> > > function in preparation of filling the command stream at streamon.
> > > As the userspace can change the flipping and rotation controls while
> > > streaming, we have to update them with each new frame to prevent the
> > > user being unable to change them while streaming.
> > >=20
> > > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > For code point of view, everything seems fine, but the commit message l=
eave me a
> > bit wondering. Any rotation that isn't 180 degree will cause the width =
and
> > height to be reversed, and a new stride is needed to present the buffer
> > correctly. Meaning the capture format can be affected by this change.
>=20
> Sorry for missing to properly communicate my intention with this patch.
>=20
> I've stumbled over the RGA pulling a spin lock on the controls, when=20
> starting the next job [1]. This made me realize that the driver allows=
=20
> changing the controls while streaming, which my change to move the=20
> command buffer setup to streamon breaks (as a potential rotation isn't=
=20
> updated until the next streamon).
>=20
> This commit is the result of trying to not break the old behavior by=20
> moving the relevant code parts to be run on every frame instead of being=
=20
> only run at streamon. I didn't think about the 90 degree rotation=20
> problems, which are also present in the current RGA state.
>=20
> sashiko.dev also pointed out that my simple code move didn't work for=20
> the mirroring case [2], as the relevant command buffer is ore'd with the=
=20
> mirroring flags. Also I've noticed that the rotation mode affects the=20
> scaling factor. To avoid these footguns, I've got the idea to set a flag=
=20
> to raise when the controls change. Then I can fully re-initialize the=20
> command buffer on the next frame and fully avoid these kind of problems.

Thanks for the update, thanks for looking into that.

>=20
>=20
> [1]=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/media/platform/rockchip/rga/rga.c?id=3D50897c955902c93ae71c38698abb9=
10525ebdc89#n41
>=20
> [2]=20
> https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40peng=
utronix.de?part=3D16
>=20
> >=20
> > To stick with the spec, the capture format needs to be updated, and it =
needs to
> > happen in a way user can be able to read it back for the correct frame =
if
> > userspace make use of the queues. I see 3 options, let me know what you=
 think,
> > or what is later implemented if you already thought about that.
> >=20
> > 1. Synchronously update the capture format width/height, document in th=
e
> > respective control this behaviour, leaving to userspace to remember whi=
ch frames
> > the change will apply to.
> >=20
> > This works nicely for this type of HW, but would be a bit complicated f=
or a
> > deinterlacer, since the buffering might be HW specific. It also make us=
age of
> > queues harder, less independent.
> >=20
> > 2. Force a drain/stop/start for any 90 degree rotation
> >=20
> > This might impose a longer idle time for the converter core, and is kin=
d of
> > opposite of your commit message. But requires no spec work.
> >=20
> > 3. Emit SRC_CH, implement the drain procedure typical to decoder resolu=
tion
> > change.
> >=20
> > Typically it means userspace can keep buffering on the OUTPUT queue, an=
d once
> > the LAST buffer is met, it can simply read the new format (and new stri=
de, since
> > due to alignment, this might be hardware specific) and toggle streamoff=
/on only
> > on capture queue to reactivate the processing.
> >=20
> > The 3. is more complex for the driver, but its a proven race-free metho=
d for
> > decoders already. 2 would be statusquo to get this series in, and we co=
uld post-
> > poned more advance work for seamless 90degree rorations. 1., I don't re=
ally like
> > that solution, it not quite generic enough.
>=20
> I'll go with option 2 for now to keep it simple and improve the status=
=20
> quo a bit.

Works for me.

Nicolas

>=20
> Sincerely
> =C2=A0=C2=A0 =C2=A0 Sven
>=20
> > feedback welcome,
> > Nicolas
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++=
++++++++++-----------
> > > =C2=A0=C2=A01 file changed, 34 insertions(+), 23 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/m=
edia/platform/rockchip/rga/rga-hw.c
> > > index dac3cb6aa17d3..6c1956b04f6ba 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> > > +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> > > @@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx =
*ctx, dma_addr_t dma_addr)
> > > =C2=A0=C2=A0	dest[reg >> 2] |=3D 0x7 << 8;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
> > > +static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *dest =3D ctx->cmdbuf_virt;
> > > +	union rga_src_info src_info;
> > > +
> > > +	src_info.val =3D dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
> > > +
> > > +	if (ctx->vflip)
> > > +		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_X;
> > > +
> > > +	if (ctx->hflip)
> > > +		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_Y;
> > > +
> > > +	switch (ctx->rotate) {
> > > +	case 90:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_90_DEGREE;
> > > +		break;
> > > +	case 180:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_180_DEGREE;
> > > +		break;
> > > +	case 270:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_270_DEGREE;
> > > +		break;
> > > +	default:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_0_DEGREE;
> > > +		break;
> > > +	}
> > > +
> > > +	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] =3D src_info.val;
> > > +}
> > > +
> > > +static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> > > =C2=A0=C2=A0	u32 *dest =3D ctx->cmdbuf_virt;
> > > @@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ct=
x *ctx)
> > > =C2=A0=C2=A0		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	if (ctx->vflip)
> > > -		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_X;
> > > -
> > > -	if (ctx->hflip)
> > > -		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_Y;
> > > -
> > > -	switch (ctx->rotate) {
> > > -	case 90:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_90_DEGREE;
> > > -		break;
> > > -	case 180:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_180_DEGREE;
> > > -		break;
> > > -	case 270:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_270_DEGREE;
> > > -		break;
> > > -	default:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_0_DEGREE;
> > > -		break;
> > > -	}
> > > -
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * Calculate the up/down scaling mode/factor.
> > > =C2=A0=C2=A0	 *
> > > @@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> > > =C2=A0=20
> > > =C2=A0=C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> > > =C2=A0=C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> > > -	rga_cmd_set_trans_info(ctx);
> > > +	rga_cmd_set_format_scale_info(ctx);
> > > +	rga_cmd_set_flip_rotate_info(ctx);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> > > =C2=A0=20

--=-Hb+ed2d1W1UpJMfZXIXO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagM2AwAKCRDZQZRRKWBy
9MamAQCg9e/Ky0+zC2Z8lfiVls39juZyDf++dO5vz2Rw3IxBCgD+MDZjn42S+QzA
DS03AmFWK0jBnfunAQURY5X9xMeNrQo=
=BRHu
-----END PGP SIGNATURE-----

--=-Hb+ed2d1W1UpJMfZXIXO--

