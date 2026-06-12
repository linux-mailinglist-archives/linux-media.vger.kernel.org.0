Return-Path: <linux-media+bounces-64721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ASMxD5NNLGpXPAQAu9opvQ
	(envelope-from <linux-media+bounces-64721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:18:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D143067B9C4
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:18:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=L8cKb9+c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64721-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64721-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DCFB301A990
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD2938D3EE;
	Fri, 12 Jun 2026 18:18:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996A37FF60
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 18:18:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288328; cv=none; b=igerKKEMjdLTbwkFCza8de/S8GmpmXQ7pTYNOhZXYV+HgHbX/tYKrJBc1Axtf4S9/aSPz3PK8RL6EPirfNQBwqAVabvDINuBELPgr5zSegJLRe1PsKnwWXXb91Em3bB9z5rtflBDFB3nu6DH8/gnfJmhaGKcO/UDTkUt7Jl/eZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288328; c=relaxed/simple;
	bh=1BNMz7J21AduUYsDORyT8IUXGCYinSAPVqMlUfufwDU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PQJX8NpPJBbsfccj4MB/e2/R4oq9UkKziu8ye8AGzPCpAXbFQgNLeeJNI7XoVDOZnfe+6J6trC9mqr0yEuhik8XuFlk/fXc1r6QMqeVQXUfgW3pT3fwlQcpkA5xYiZzcbOIcAqZ6W3bmH37thC08yMkqv9G+2lBX8WFZrB/r5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L8cKb9+c reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81BFF1337;
	Fri, 12 Jun 2026 20:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781288291;
	bh=1BNMz7J21AduUYsDORyT8IUXGCYinSAPVqMlUfufwDU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L8cKb9+cHs460bKLHFwgjkP09+DLKY8C9q4sZuY4VcYLNJHwRscjS48fioWeJ/IUA
	 8bwGuixOP3FExIzA7trsI9oTJl8yLlbBXVbTcNm6gmJcxghvo4aHfa+nN3IOph1FJQ
	 pG7RF0qpKLeTQAEvGhFjRQmNTQBI9u37laf2t0xs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-28-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-28-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 27/86] media: uapi: Add V4L2_CID_BINNING control for binning configuration
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 12 Jun 2026 23:48:36 +0530
Message-ID: <178128831650.1799417.3287316914483188867@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64721-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,freya:mid,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D143067B9C4

Hi Sakari,

Quoting Sakari Ailus (2026-04-10 01:44:02)
> Add V4L2_CID_BINNING control for configuring binning and enumerating a
> camera sensor's binning capabilities. The control combines horizontal and
> vertical binning into a single control as the two are generally related.
>=20
> New drivers should use this control to configure binning.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 12 ++++++++
>  .../media/v4l/ext-ctrls-image-source.rst      | 30 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  2 ++
>  4 files changed, 46 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index d8ba809486c5..12f075379bc8 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -120,6 +120,18 @@ values programmed by the register sequences. The def=
ault values of these
>  controls shall be 0 (disabled). Especially these controls shall not be i=
nverted,
>  independently of the sensor's mounting rotation.
> =20
> +Binning
> +-------
> +
> +Binning has traditionally been configured using :ref:`the compose select=
ion
> +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> +<image_source_control_binning_factors>` control is also available for bi=
nning
> +configuration and users should use it when it's available. Drivers suppo=
rting
> +the control shall also support the compose rectangle, albeit the rectang=
le may
> +be read-only when the control is present.
> +
> +Binning isn't affected by flipping.
> +
>  .. _media_using_camera_sensor_drivers_embedded_data:
> =20
>  Embedded data
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source=
.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 490cd16186cd..0ef76b02a6e1 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -160,3 +160,33 @@ Image Source Control IDs
>      interface for metadata streams. The control is used in conjunction w=
ith
>      :ref:`generic metadata formats <media-bus-format-generic-meta>` form=
ats to
>      specify the layout of the data.
> +
> +.. _image_source_control_binning_factors:
> +
> +``V4L2_CID_BINNING_FACTORS (integer menu)``
> +
> +    This control determines horizontal and vertical binning factors. Bin=
ning
> +    combines several horizontal, vertical or both pixel values into a si=
ngle
> +    pixel. It is a way to scale an image. Binning typically produces fai=
rly good
> +    quality output.
> +
> +    Determines both horizontal and vertical binning factors for a camera
> +    sensor. The values are encoded in the following way:
> +
> +.. flat-table::
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Bits
> +      - Synopsis
> +    * - 48--63
> +      - Horizontal binning numerator.
> +    * - 32--47
> +      - Horizontal binning denominator.
> +    * - 16--31
> +      - Vertical binning numerator.
> +    * - 0--15
> +      - Vertical binning denominator.
> +
> +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> +(horizontally) * 3/2 (vertically).

Shouldn't the value here be ``0x0003000100030002`?

With that fixed,
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 4618252d24f2..fee343667b69 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1160,6 +1160,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_CFA_PATTERN:              return "Color Filter Arra=
y Pattern";
>         case V4L2_CID_CFA_PATTERN_FLIP:         return "CFA Pattern Flip";
>         case V4L2_CID_METADATA_LAYOUT:          return "Metadata Layout";
> +       case V4L2_CID_BINNING_FACTORS:          return "Binning Factors";
> =20
>         /* Image processing controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> @@ -1438,6 +1439,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>         case V4L2_CID_HDR_SENSOR_MODE:
>                 *type =3D V4L2_CTRL_TYPE_MENU;
>                 break;
> +       case V4L2_CID_BINNING_FACTORS:
>         case V4L2_CID_LINK_FREQ:
>                 *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
>                 break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 1bf6d298e3c4..5496b1664432 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1249,6 +1249,8 @@ enum v4l2_jpeg_chroma_subsampling {
> =20
>  #define V4L2_CID_METADATA_LAYOUT               (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 12)
> =20
> +#define V4L2_CID_BINNING_FACTORS               (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 13)
> +
>  /* Image processing controls */
> =20
>  #define V4L2_CID_IMAGE_PROC_CLASS_BASE         (V4L2_CTRL_CLASS_IMAGE_PR=
OC | 0x900)
> --=20
> 2.47.3
>=20
>

