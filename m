Return-Path: <linux-media+bounces-62341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE1HCvvqDWrM4gUAu9opvQ
	(envelope-from <linux-media+bounces-62341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 19:10:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B5593044
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 19:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B6C3400C1B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C497036B05E;
	Wed, 20 May 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hYwrmvDu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977636CE19
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294363; cv=none; b=Fls+yO/BIQaCtCj+KfYnhyL4w58uMn7q9dF+EawloqiCdMFWimReC2QicHoFnWbFoEJSZbi4hkFm5s7PophCcbYT8aeOoC1a8RtJYbRPyZO8Ks0focWmb1sJ6yDrsRE5fEr7DbPQi92Gu7sKlNoaijfQyR2tRUGYea13MvIWwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294363; c=relaxed/simple;
	bh=mMLaxsNVt5O+EwXEWJL/pxrpqxSN7osrhW1Jr/HsH3Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dLUAQNbL0bYciUiLIXNelGCBcvJysi7hoO0WNLTqm7i5Gk5VpwEI9UNUEOJEqFMq1fBFlIx6VMQAfQueN+tHtZipuESnMHRIREd5Nmc5IcjlGzU+oQocinDWdRqUA7XH39kNmYZp0nvKDzIrMlDXG7NbvslqXdMSjWlvAcyq9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hYwrmvDu reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3041268;
	Wed, 20 May 2026 18:25:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779294345;
	bh=mMLaxsNVt5O+EwXEWJL/pxrpqxSN7osrhW1Jr/HsH3Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hYwrmvDu2jzjCzaiVwYbcAKl7LgqrdLzE+74/urdswwmB+5rnBhyC2sJrFGnwC6QQ
	 IErmZFr66bRSyuN+b7Mzej8IGVpjTfWRJnqACL+ajEIfu0v2ZF4euZqrq/B2hVwOwO
	 MBGvGEgXSQ3t8qUs36u7hbfhu/vuv7wOi1V4JNyw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-31-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-31-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 30/86] media: Documentation: Add binning and sub-sampling controls
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 20 May 2026 18:25:54 +0200
Message-ID: <177929435413.2341049.9256551425193410552@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62341-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 9D7B5593044
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-09 22:14:05)
> Document the binning and scaling controls (V4L2_CID_BINNING and

nit: s/scaling/sub-sampling

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
> model.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rs=
t b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index 0fb01bf6c825..fb6d8a1bcac7 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -144,8 +144,12 @@ separately horizontally and vertically.
> =20
>  The combined effect of binning and sub-sampling is configured using the
>  ``V4L2_SEL_TGT_COMPOSE`` rectangle, relative to the analogue crop rectan=
gle, on
> -(pad, stream) pair 1/0. The driver implementation determines how to conf=
igure
> -binning and sub-sampling to achieve the desired size.
> +(pad, stream) pair 1/0. It depends on the driver which of these operatio=
ns are
> +being used to achieve the resulting size. Binning and sub-sampling are a=
lso
> +directly configured using :ref:`V4L2_CID_BINNING_FACTORS
> +<image_source_control_binning_factors>` and
> +:ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and V4L2_CID_SUBSAMPLING_VERTICAL
> +<image_source_control_subsampling>` controls on drivers that support the=
m.
> =20
>  The digital crop operation takes place after binning and sub-sampling. I=
t is
>  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, strea=
m) pair
> @@ -216,9 +220,15 @@ Also refer to :ref:`Selection targets <v4l2-selectio=
n-targets-table>`.
>        - \-
>        - X
>        - Binning and sub-sampling. This rectangle is relative to the
> -        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> -        combination of binning and sub-sampling is configured using this
> -        selection target.
> +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binni=
ng is
> +        configured using the :ref:`V4L2_CID_BINNING_FACTORS
> +        <image_source_control_binning_factors>` control and sub-sampling=
 is configured
> +        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> +        V4L2_CID_SUBSAMPLING_VERTICAL <image_source_control_subsampling>`
> +        controls on drivers that support these controls. To configure bi=
nning
> +        and sub-sampling on drivers that do not support these controls, =
the
> +        selection rectangle may be changed directly to configure the com=
bined
> +        effect on the image size.
>      * - 2/0
>        - Format
>        - X
> --=20
> 2.47.3
>

