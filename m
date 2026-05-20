Return-Path: <linux-media+bounces-62340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NOuHh3gDWoN4gUAu9opvQ
	(envelope-from <linux-media+bounces-62340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:23:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B59F591D45
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F6563005591
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4FD36A02E;
	Wed, 20 May 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KN3UtxE1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE8363C79
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294221; cv=none; b=ePBqLTw24jm/KD9ZSwOsTDSIWVZYhCBBlDGcjqH3SBtST7WBQNfjrYyEuo86Vef+RX4wiUOJ32D5pLhRztj9/EngzWFUPuL71z1n6/sQPEcpESPpX/ExJ7UPJ5niqRfU5WmCfWkl2VAlBBl0WwcEC8WBD/OtZQghjH7MVtjMhLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294221; c=relaxed/simple;
	bh=IUnH0JtFtsayea2YxlGqfe3pLqNGCr9HM67SusVbdHA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ci7Yu9P6ErB027zL+XdS9NP+pUXMcteFnSMiQQM9Eb186zhjZIch+VeWlPmeSg5swoHZCuKm40+TZntwHodj57wFM6ufkhg0QESfwUKTSY5S63RmycrdnxKKBCrIjEhlyQk5BLp/MZsJPP7rwfXFuvtiIAbfI8Tgl9PrETb+3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KN3UtxE1 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97ABB42B;
	Wed, 20 May 2026 18:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779294202;
	bh=IUnH0JtFtsayea2YxlGqfe3pLqNGCr9HM67SusVbdHA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KN3UtxE1aBTkoK2SUsDxuZpho5wogMiOoQ8Y4zdQxVj3pMKhDlODbOY292NQ7Wvbp
	 fUTHrQRcGDFrYvVdqomxbMfSII0/jemekAf3K47pNMaXQubt3LmAsfMFa2ic7qWpdE
	 3x0QpLW1uTaPAlHtN0HHd6D1vrkqsg2SLxW3g+6s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-25-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-25-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 24/86] media: Documentation: Add scaling and post-scaler crop for common raw
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 20 May 2026 18:23:30 +0200
Message-ID: <177929421045.2341049.3815318982292932607@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62340-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1B59F591D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-09 22:13:59)
> Document scaling and post-scaler digital crop operations for the common
> raw sensor model.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/v4l/subdev-config-model.rst         | 26 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rs=
t b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index b450f698a608..1525119cbeb9 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -146,12 +146,19 @@ binning and sub-sampling to achieve the desired siz=
e.
> =20
>  The digital crop operation takes place after binning and sub-sampling. I=
t is
>  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, strea=
m) pair
> -0/0. The resulting image size is further output by the sensor on the sen=
sor's
> -data interface.
> +0/0.
> +
> +The scaling operation is performed after the digital crop. It is configu=
red by
> +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> +relative to the digital crop. The resulting image size is further output=
 by the
> +sensor on the sensor's data interface.
> =20
>  The sensor's output mbus code is configured by setting the format on the=
 (pad,
> -stream) pair 0/0. When setting the format, always use the same width and=
 height
> -as for the digital crop setting.
> +stream) pair 0/0. The width and height fields are used to configure post=
-scaler
> +digital crop if supported by the driver, affecting the right and bottom =
edges of
> +the frame. If post-scaler digital crop is not supported, the width and h=
eight
> +fields of the format will match the compose rectangle sizes applied on t=
he same
> +0/0 (pad, stream) pair.
> =20

Given most raw sensors don't support a scaler, or a post-scaler crop, IMO
this section would be easier to read if we say:

    The sensor's output mbus code is configured by setting the format on
    the (pad, stream) pair 0/0. The format's width and height should
    usually match the compose rectangle sizes applied on the same 0/0 (pad,
    stream) pair. If the sensor supports a post-scaler digital crop, the
    width and height may be lesser, affecting the right and bottom edges of
    the frame.

Thanks,
    Jai

>  Drivers may only support some or even none of these configurations, in w=
hich
>  case they do not expose the corresponding selection rectangles. If any s=
election
> @@ -220,12 +227,19 @@ Also refer to :ref:`Selection targets <v4l2-selecti=
on-targets-table>`.
>        - X
>        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_C=
OMPOSE``
>          rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> +        rectangle on (pad, stream) pair 0/0.
>      * - 0/0
>        - Format
>        - X
>        - X
> -      - Image data source format. Always assign the width and height fie=
lds of
> -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +      - Image data source format and post-scaler crop. The width and hei=
ght
> +        fields of the format, used to configure post-scaler crop on the =
right
> +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT=
_COMPOSE``
>          rectangle on (pad, stream) pair 0/0. The media bus code reflects=
 the
>          pixel data output of the sensor. Setting the media bus code on t=
his pad
>          configures the output format.
> --=20
> 2.47.3
>

