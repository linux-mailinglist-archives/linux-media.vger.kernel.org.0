Return-Path: <linux-media+bounces-63495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NbpkFYfOH2qXqAAAu9opvQ
	(envelope-from <linux-media+bounces-63495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:49:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A4634D1A
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:49:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=b1WT6sF5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63495-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63495-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD5423043E97
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 06:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAB43955D8;
	Wed,  3 Jun 2026 06:48:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA21C84DC;
	Wed,  3 Jun 2026 06:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469309; cv=none; b=o7EL5FJTvsYMPxQn3a8RHKi1fc0bpr7A7kxsS5H2e/GbzT1rTQHl93hmz3p+yw8+bQiVg5lOpfNw49EgR18ZBhp3/SrZqBc1EYLB0O3FzCSyHMHH3MsjrjMqHvm8bs2Aa162nsvyyKBV8/f77yAC4yELV6szu0pS9ahpqvrbLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469309; c=relaxed/simple;
	bh=5k/c6VDEVBRdhrNJr2zMBa0bQcPXUXjROhDeuMYMBL4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=m4yZOE+UwhjYOSk17fFgv4y01xvbiZE4Xv8mA/u4GT1YDsEEnNko4JFZhvs7fgteVeKT6lbsFDxrzf0OewZfCBlmBhpQbL7mnfntYK5hb67qRRcjnh6RvSx9Crc6jA+cW02K3Lhn1wD/RK1tkaKvLHfkoZ09sb4pMvNG8Yuq3io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b1WT6sF5; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 803C1DF3;
	Wed,  3 Jun 2026 08:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780469283;
	bh=5k/c6VDEVBRdhrNJr2zMBa0bQcPXUXjROhDeuMYMBL4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b1WT6sF5L3UHoF+qviCSWaAPOP2lD4F5sKKcFpTel2EM9d1g17KoZyLMUy1yF/wiD
	 yyrCHguxL+ODDXnrII7WucqSKuEhlWn/Ea5kdgfUx4M0R0a/vvED+ERBaG7ZEzeNo7
	 YrE6DTLCHdlGiGBaz41A4fY1x8tTkJBUGuKPC6So=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for unpacked formats
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eugen Hristev <ehristev@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@redhat.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Scott Branden <sbranden@broadcom.com>
Date: Wed, 03 Jun 2026 12:18:20 +0530
Message-ID: <178046930079.1525445.16102733967737177325@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ehristev@kernel.org,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:mripard@redhat.com,m:kernel-list@raspberrypi.com,m:rjui@broadcom.com,m:sakari.ailus@linux.intel.com,m:sbranden@broadcom.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63495-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E3A4634D1A

Hi Eugen,

Quoting Eugen Hristev (2026-05-20 21:07:00)
> The commit
> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code associat=
ion")
> introduced a check to see whether the format requested is the same as the
> fourcc in the format list.
>=20
> However, this breaks the case when userspace requested an unpacked fourcc,
> e.g. RG10.
>=20
> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depe=
nding
> on what userspace requests.
> In the unpacking case, a dedicated register is being set.
>=20
> If the userspace requests pRAA, this works, because the check validates t=
he
> pipeline:
>=20
> v4l2-ctl -d /dev/video0 --set-fmt-video=3Dwidth=3D3280,height=3D2464,pixe=
lformat=3DpRAA \
>  --stream-mmap --stream-count=3D1 --stream-to=3Dframe.raw
>=20
> but, with
> v4l2-ctl -d /dev/video0 --set-fmt-video=3Dwidth=3D3280,height=3D2464,pixe=
lformat=3DRG10 \
> --stream-mmap --stream-count=3D1 --stream-to=3Dframe.raw
>=20
> unicam complains at validation level:
>=20
> image: format mismatch: 0x300f <=3D> RG10 little-endian (0x30314752)
>=20
> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into e=
ither
> RG10 or pRAA depending on the packing register.
>=20
> To fix this, modified the condition check to also allow in the case when
> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
>=20
> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code a=
ssociation")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/m=
edia/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..cc7627e9a51a 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_=
link *link)
>                  * In order to allow the applications using the old behav=
iour to
>                  * run, let's accept the old combination, but warn about =
it.
>                  */
> -               if (fmtinfo->fourcc !=3D fmt->pixelformat) {
> +               if (fmt->pixelformat !=3D fmtinfo->fourcc &&
> +                   fmt->pixelformat !=3D fmtinfo->unpacked_fourcc) {
>                         if ((fmt->pixelformat =3D=3D V4L2_PIX_FMT_BGR24 &&
>                              format->code =3D=3D MEDIA_BUS_FMT_BGR888_1X2=
4) ||
>                             (fmt->pixelformat =3D=3D V4L2_PIX_FMT_RGB24 &&
>=20

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
Jai

> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260520-bcmpi-2c4850314e21
>=20
> Best regards,
> -- =20
> Eugen Hristev <ehristev@kernel.org>
>=20
>

