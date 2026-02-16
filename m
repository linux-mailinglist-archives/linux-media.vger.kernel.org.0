Return-Path: <linux-media+bounces-52882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFvkIgAtk2mZ2AEAu9opvQ
	(envelope-from <linux-media+bounces-52882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:43:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15865144C5D
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BCEA3042B43
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDE7310777;
	Mon, 16 Feb 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bhiwq9sF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3B223708;
	Mon, 16 Feb 2026 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252906; cv=none; b=JP/p95cReWGqSJKiVZxf53WAHJvWE5M+Gku7cHh7HQfvMcFa/zRdcSgF+FRZPraDbYbxbvBWnwxDpKAUyqt+js9/dW9ptYjBQgRe0caSBBnPNZKnOS0CKH2gR1211p5GT5wFExEIPMQ4YGwJJeKUBaqotCxHkX0OzuCvHYhWrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252906; c=relaxed/simple;
	bh=DWTAOnJY1clr/RODiXV+S5BwJRSM1N7UR5c4H/6xYbc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KVKZ7xXvmIbCFhU6iJ+2GVoFgahWxI33ILv6rOqJeGxJypq3rGAuIf85wGPj1l0t05hszWKvcQyyhzPIJoEWBtj8gO6/SWD4GtuG21pgLPPY08LqHo7tBtV8iHY6VYScLCS0zzACdglu461Gx7a7Q0u2Pe3KwvbElc+TUBMLxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bhiwq9sF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EB284B3;
	Mon, 16 Feb 2026 15:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771252853;
	bh=DWTAOnJY1clr/RODiXV+S5BwJRSM1N7UR5c4H/6xYbc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bhiwq9sFbyoBwh2NHSZeQtBBLuBGPdFomBgIeZSaoKC81sQ3fq8e4phPdhgyj1T4z
	 fc+8ntVuSbMzxa93gUav6hRYm8EfzmtXDe4r5UkVtgpP48v3C6KMVYofJwfmxPaRYZ
	 +GyhL7QavJ/cQBJzSOgz6gjnbeY9DMp+UDeEfi6M=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-3-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-3-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 03/25] media: i2c: imx283: Move imx283_mode structure definition
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:11:38 +0530
Message-ID: <177125289894.14753.11170098781129796052@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52882-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 15865144C5D
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:42)
> Move the struct imx283_mode further down in the compilation unit so that
> it can make reference of the scan out mode structures which are
> presently defined after.
>=20
> No functional change intended in this commit.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 118 ++++++++++++++++++++++-----------------=
------
>  1 file changed, 59 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 9a47cd0b181a..d53cea49baae 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -195,65 +195,6 @@ struct imx283_reg_list {
>         const struct cci_reg_sequence *regs;
>  };
> =20
> -/* Mode : resolution and related config values */
> -struct imx283_mode {
> -       unsigned int mode;
> -
> -       /* Bits per pixel */
> -       unsigned int bpp;
> -
> -       /* Frame width */
> -       unsigned int width;
> -
> -       /* Frame height */
> -       unsigned int height;
> -
> -       /*
> -        * Minimum horizontal timing in pixel-units
> -        *
> -        * Note that HMAX is written in 72MHz units, and the datasheet as=
sumes a
> -        * 720MHz link frequency. Convert datasheet values with the follo=
wing:
> -        *
> -        * For 12 bpp modes (480Mbps) convert with:
> -        *   hmax =3D [hmax in 72MHz units] * 480 / 72
> -        *
> -        * For 10 bpp modes (576Mbps) convert with:
> -        *   hmax =3D [hmax in 72MHz units] * 576 / 72
> -        */
> -       u32 min_hmax;
> -
> -       /* minimum V-timing in lines */
> -       u32 min_vmax;
> -
> -       /* default H-timing */
> -       u32 default_hmax;
> -
> -       /* default V-timing */
> -       u32 default_vmax;
> -
> -       /* minimum SHR */
> -       u32 min_shr;
> -
> -       /*
> -        * Per-mode vertical crop constants used to calculate values
> -        * of IMX283REG_WIDCUT and IMX283_REG_VWINPOS.
> -        */
> -       u32 veff;
> -       u32 vst;
> -       u32 vct;
> -
> -       /* Horizontal and vertical binning ratio */
> -       u8 hbin_ratio;
> -       u8 vbin_ratio;
> -
> -       /* Optical Blanking */
> -       u32 horizontal_ob;
> -       u32 vertical_ob;
> -
> -       /* Analog crop rectangle. */
> -       struct v4l2_rect crop;
> -};
> -
>  struct imx283_input_frequency {
>         unsigned int mhz;
>         unsigned int reg_count;
> @@ -352,6 +293,65 @@ static const struct imx283_readout_mode imx283_reado=
ut_modes[] =3D {
>          */
>  };
> =20
> +/* Mode : resolution and related config values */
> +struct imx283_mode {
> +       unsigned int mode;
> +
> +       /* Bits per pixel */
> +       unsigned int bpp;
> +
> +       /* Frame width */
> +       unsigned int width;
> +
> +       /* Frame height */
> +       unsigned int height;
> +
> +       /*
> +        * Minimum horizontal timing in pixel-units
> +        *
> +        * Note that HMAX is written in 72MHz units, and the datasheet as=
sumes a
> +        * 720MHz link frequency. Convert datasheet values with the follo=
wing:
> +        *
> +        * For 12 bpp modes (480Mbps) convert with:
> +        *   hmax =3D [hmax in 72MHz units] * 480 / 72
> +        *
> +        * For 10 bpp modes (576Mbps) convert with:
> +        *   hmax =3D [hmax in 72MHz units] * 576 / 72
> +        */
> +       u32 min_hmax;
> +
> +       /* minimum V-timing in lines */
> +       u32 min_vmax;
> +
> +       /* default H-timing */
> +       u32 default_hmax;
> +
> +       /* default V-timing */
> +       u32 default_vmax;
> +
> +       /* minimum SHR */
> +       u32 min_shr;
> +
> +       /*
> +        * Per-mode vertical crop constants used to calculate values
> +        * of IMX283REG_WIDCUT and IMX283_REG_VWINPOS.
> +        */
> +       u32 veff;
> +       u32 vst;
> +       u32 vct;
> +
> +       /* Horizontal and vertical binning ratio */
> +       u8 hbin_ratio;
> +       u8 vbin_ratio;
> +
> +       /* Optical Blanking */
> +       u32 horizontal_ob;
> +       u32 vertical_ob;
> +
> +       /* Analog crop rectangle. */
> +       struct v4l2_rect crop;
> +};
> +
>  static const struct cci_reg_sequence mipi_data_rate_1440Mbps[] =3D {
>         /* The default register settings provide the 1440Mbps rate */
>         { CCI_REG8(0x36c5), 0x00 }, /* Undocumented */
>=20
> --=20
> 2.52.0
>

