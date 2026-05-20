Return-Path: <linux-media+bounces-62212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HMWOhNjDWquwgUAu9opvQ
	(envelope-from <linux-media+bounces-62212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:30:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C71588F91
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DECB63032380
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75F236E48B;
	Wed, 20 May 2026 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A2ygz50a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5334DCC8
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262197; cv=none; b=NAWLF3JwR0t2qSGhAKVw93dea2xbfVGG4f1Yi0uxRHsEunzSy/54Q2zGKPX3hxX1UAFNOOpHKo7nMEQnaCZEHygtbJ3xHJNooCa04xe8XMpfKSwCX0W+yUejVLF5CTwKlRlDWgIUzXMxKaXG7mfWarqdYAT1QPnB5XMHWETJ3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262197; c=relaxed/simple;
	bh=0ePZAeB43i8A/OxyQKXytmVtFNffL0fXDLY1EZrOfu0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Z1V7/pZNCmTfDu4fgza/cEY3TaOgvjv0UsgJZ+vk/r6/KeySh/g9ZzaV9A4BMrz+f9gnus2z3WMHtZDjI5pDDSBPdtMhFWW0MlesMMSpawywdSULM1OV/cqIK7nNLJlVspB5+CJUm3pXbwQuOdL4g9A1nM7QjKmrTLEQXdBRZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A2ygz50a reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D0CC42B;
	Wed, 20 May 2026 09:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779262178;
	bh=0ePZAeB43i8A/OxyQKXytmVtFNffL0fXDLY1EZrOfu0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=A2ygz50an72oSta3bwh/YW+4Lv8AHEdjXHXnv5PyYdKKZFv1SqIK2aOcbQeXmt7f3
	 xNb4oSLbrto9g20Lbj+5ZRWldk2+QVu+GCJBu8jeQHiWyqmaAPdKlFLeX2SlyFOgV6
	 XJOxWjcWTxnplEZ7YD5LmP6c093l+QZy1bn5q0nQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-14-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-14-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 13/86] media: Documentation: v4l: Document internal sink pads
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 20 May 2026 09:29:47 +0200
Message-ID: <177926218793.2341049.4470290417149054877@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62212-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 63C71588F91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for the patch.

Quoting Sakari Ailus (2026-04-09 22:13:48)
> Document internal sink pads, pads that have both SINK and INTERNAL flags
> set. Use the IMX219 camera sensor as an example.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
>  .../media/v4l/ext-ctrls-image-source.rst      |  2 ++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Docum=
entation/userspace-api/media/v4l/dev-subdev.rst
> index 142e2cd95062..39c281991460 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -554,6 +554,25 @@ A stream at a specific point in the media pipeline i=
s identified by the
>  sub-device and a (pad, stream) pair. For sub-devices that do not support
>  multiplexed streams the 'stream' field is always 0.
> =20
> +Internal sink pads and routing
> +------------------------------
> +
> +Cases where a single sub-device source pad is carries multiple streams, =
one or

"is carries" -> "carries" or is "carrying"

> +more of which originate from within the sub-device itself, are special a=
s there
> +is no external sink pad for such routes. In those cases, the sources of =
the

I think this paragraph could read slightly easier:

There are special cases where a single sub-device source pad carries
multiple streams, one or more of which originate from within the sub-device
itself. In those cases, the sources of...

With that,

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> +internally generated streams are represented by internal sink pads, whic=
h are
> +sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERN=
AL>` pad
> +flag set.
> +
> +Internal pads have all the properties of an external pad, including form=
ats and
> +selections. The format in this case is the source format of the stream. =
An
> +internal pad always has a single stream only (0).
> +
> +Routes from an internal sink pad to an external source pad are created b=
y the
> +driver and can be activated and deactivated using the
> +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, dep=
ending
> +on the device capabilities.
> +
>  Interaction between routes, streams, formats and selections
>  -----------------------------------------------------------
> =20
> @@ -691,3 +710,8 @@ To configure this pipeline, the userspace must take t=
he following steps:
>     the configurations along the stream towards the receiver, using
>     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure =
each
>     stream endpoint in each sub-device.
> +
> +   In case generic raw and metadata formats are used, :ref:`V4L2_CID_CFA=
_PATTERN
> +   <image-source-control-cfa-pattern>` and :ref:`V4L2_CID_METADATA_LAYOUT
> +   <image_source_control_metadata_layout>` controls are present on the s=
ource
> +   sub-device to obtain the pixel array CFA pattern and metadata layout.
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source=
.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index e369978c2b50..490cd16186cd 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -153,6 +153,8 @@ Image Source Control IDs
> =20
>      This is a read-only control.
> =20
> +.. _image_source_control_metadata_layout:
> +
>  ``V4L2_CID_METADATA_LAYOUT (integer)``
>      The metadata layout control defines the metadata layout on the devic=
e's data
>      interface for metadata streams. The control is used in conjunction w=
ith
> --=20
> 2.47.3
>

