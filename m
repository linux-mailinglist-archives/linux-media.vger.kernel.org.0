Return-Path: <linux-media+bounces-52823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAkHDVLZkWlWnQEAu9opvQ
	(envelope-from <linux-media+bounces-52823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:33:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2713EDC1
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53D783010172
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7822EBB8F;
	Sun, 15 Feb 2026 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WSu9whVx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836ED17A30A;
	Sun, 15 Feb 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166016; cv=none; b=dsMlHviTjtVacD2w2wm0cCrB+iBwY2zeYXSqKzWKMZVtBEP/gWPYFtf8Lyr0IHYLURwcy6gzAbdsSWG0YaG7E3MDrzpenTZLFCibMQNTDYYYkD0IhPg0h8EYWY96/WJ2fbq+iq3Oy+kFGb6AOZkB3Z4qX5TbpGmbgWqJ76yJMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166016; c=relaxed/simple;
	bh=JAxX5gWrg6tjGGtSamI8fRvqZRvusE99VCBXZnkJYpc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GjUqPqy+5QevksYIK/6ycfni+uTPGS+0jJsD0fslGNwOm8QzJ5jWqxLpEkd7QcKDN34tVJetIxbrT3g0dFp/Ck6XvdRmCouiR4lXKQ+leDVNujDZrQ4EP5UfCa+DUJ9n17uU/Is0YZW2+rnhlEvKSvM0WrnivWItJPCY3ZhUExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WSu9whVx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 653A8FE;
	Sun, 15 Feb 2026 15:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771165955;
	bh=JAxX5gWrg6tjGGtSamI8fRvqZRvusE99VCBXZnkJYpc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WSu9whVxeZMbdjreLbZ9FREGLIIBwRJZTmbM82nWqKQtSNeWjU43RXcetS6rqywws
	 L1kqCgVVos2qXh/oPe1qYL+/B04MTqcn8snBZ68WwghJYX3TEmo93kZ+Zd8BtadSR4
	 rVueNmSmPHquJej9YlqBfieTd0ikv7lnilPKrjSQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260214-imx283-hang-fix-v2-1-f4fd3de0f020@ideasonboard.com>
References: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com> <20260214-imx283-hang-fix-v2-1-f4fd3de0f020@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx283: Enter full standby when stopping streaming
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
To: Hans Verkuil <hverkuil@kernel.org>, Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Sun, 15 Feb 2026 14:33:22 +0000
Message-ID: <177116600225.1941913.10868044011370028474@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52823-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: C4E2713EDC1
X-Rspamd-Action: no action

Quoting Jai Luthra (2026-02-14 13:05:21)
> Use IMX283_STANDBY (bit 0) instead of IMX283_STBLOGIC (bit 1) when
> stopping streaming. STBLOGIC only puts the sensor logic into standby but
> leaves the MIPI interface (along with other components) in an
> indeterminate state.
>=20
> This (presumably) causes the CSI receiver (e.g. Raspberry Pi's CFE) to
> miss the LP-11 to HS transition when streaming restarts, resulting in a
> hang of 10+ seconds. The issue is most visible when immediately
> restarting a full-resolution stream after stopping a 3x3 binned one, so
> that runtime suspend hasn't yet been triggered.
>=20
> Writing IMX283_STANDBY puts the entire sensor into standby. The
> imx283_standby_cancel() sequence already handles the full wakeup from
> this suspended state.
>=20
> Cc: stable@vger.kernel.org
> Link: https://github.com/raspberrypi/linux/issues/7153
> Link: https://github.com/will127534/OneInchEye/issues/12
> Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thank you for digging into this! Indeed - I think this series fixes all
my current known issues with this module.

Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 8ab63ad8f385f6e2a2d7432feff0af09a5356dc4..9b3094a57873c6e8ff8c41d05=
8ea3b0012642cac 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1158,7 +1158,7 @@ static int imx283_disable_streams(struct v4l2_subde=
v *sd,
>         if (pad !=3D IMAGE_PAD)
>                 return -EINVAL;
> =20
> -       ret =3D cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STBLOGI=
C, NULL);
> +       ret =3D cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY=
, NULL);
>         if (ret)
>                 dev_err(imx283->dev, "Failed to stop stream\n");
> =20
>=20
> --=20
> 2.53.0
>

