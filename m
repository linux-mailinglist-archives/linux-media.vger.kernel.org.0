Return-Path: <linux-media+bounces-60064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCJhD+E182kUygEAu9opvQ
	(envelope-from <linux-media+bounces-60064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:58:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1374A122D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C86E7300D34A
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1956737419A;
	Thu, 30 Apr 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cRqa/DFE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471933BED31;
	Thu, 30 Apr 2026 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546688; cv=none; b=aSR87A5PaMT8xi+oXdUtFY5hxc6bjfwZZKLKf+WGldTeWY8ief9HkPrrMDkIjR0O9LyvDuTS38nGbbPyFTFU6H0sOILkrOZnM/95cmoekaLQQlUXxu7pYUZH1W4XECAkrnsiI95zMWF2b279TChqzl0naDCMnGOZj0FHK3cbuTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546688; c=relaxed/simple;
	bh=0HZUKrU0YkW9M6yafeg/ajAKyx+SE84QliduMJwkIuY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=T03e5Pr0eGWGO9+VkuqO+ZziQB+ltnXJKDSG/lrlUly7PHz0PErXTvHYx9gAwjzIfks5CxwF8s8m+K5f1Vs2E468uoqAuFnY11eHwAWeRySrHU23wly0WOIANIWMTngvnUSE8FXEcQmpr8nozMnwl6ODXYsad68517B/nLqFcjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cRqa/DFE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FAC88FA;
	Thu, 30 Apr 2026 12:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777546573;
	bh=0HZUKrU0YkW9M6yafeg/ajAKyx+SE84QliduMJwkIuY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cRqa/DFEHo6QVRdOmtbjKgVBYddZgu5LgL7hpaNulqzTBz9fgcSrn6uoYsnxtc03N
	 Y5rOsBA/EDq98Ze2R5tbCnl3yRF6AdLaxI20juakJ77Ll7JXzNZ6YW9QH++o4ZpwZf
	 Yhpi7rxhwQKRtvrObkvPAss1N6ljZNqHNUTTQYRM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260426200143.109896-1-marbe@gmx.de>
References: <20260426200143.109896-1-marbe@gmx.de>
Subject: Re: [PATCH] media: i2c: ov02e10: Add get_selection support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Berger <marbe@gmx.de>
To: Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>, Marcel Berger <marbe@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 30 Apr 2026 11:57:54 +0100
Message-ID: <177754667491.45302.5641280513931081281@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: CE1374A122D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60064-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmx.de,linux.intel.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gmx.de:email,ping.linuxembedded.co.uk:mid]

Quoting Marcel Berger (2026-04-26 21:01:43)

Usually we'd try to add a bit more detail to the commit message here
please. Even if it's simple.

> Signed-off-by: Marcel Berger <marbe@gmx.de>
> ---
>  drivers/media/i2c/ov02e10.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
> index 4a64cba..097188f 100644
> --- a/drivers/media/i2c/ov02e10.c
> +++ b/drivers/media/i2c/ov02e10.c
> @@ -655,6 +655,30 @@ static int ov02e10_get_format(struct v4l2_subdev *sd,
>         return 0;
>  }
> =20
> +static int ov02e10_get_selection(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_selection *sel)
> +{
> +       struct ov02e10 *ov02e10 =3D to_ov02e10(sd);
> +
> +       if (sel->pad !=3D 0)
> +               return -EINVAL;
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.left =3D 0;
> +               sel->r.top =3D 0;
> +               sel->r.width =3D ov02e10->cur_mode->width;
> +               sel->r.height =3D ov02e10->cur_mode->height;

I'm afraid this looks wrong, or perhaps insufficient ?

These should report the correct properties of the camera, so I'd expect
somewhere for this to report the full resolution of the camera active
area - not just always pass through the current active mode.

--
Kieran


> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
>  static int ov02e10_enum_mbus_code(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_mbus_code_enum *code)
> @@ -703,6 +727,7 @@ static const struct v4l2_subdev_pad_ops ov02e10_pad_o=
ps =3D {
>         .get_fmt =3D ov02e10_get_format,
>         .enum_mbus_code =3D ov02e10_enum_mbus_code,
>         .enum_frame_size =3D ov02e10_enum_frame_size,
> +       .get_selection =3D ov02e10_get_selection,
>         .enable_streams =3D ov02e10_enable_streams,
>         .disable_streams =3D ov02e10_disable_streams,
>  };
> --=20
> 2.53.0
>

