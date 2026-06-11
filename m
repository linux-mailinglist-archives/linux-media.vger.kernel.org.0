Return-Path: <linux-media+bounces-64532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+HKG5xJKmq8lwMAu9opvQ
	(envelope-from <linux-media+bounces-64532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:37:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6B66EAC2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=BXF84Nbr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64532-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64532-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53C67301061F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 05:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3892DA76C;
	Thu, 11 Jun 2026 05:37:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE731A3172
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 05:37:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156247; cv=none; b=srV7P8GLQNFg0aBRvWs4rOn2IZPcVM1nueGgyeUH3DEjtTtR2WwlH9/lQcWin+x2X+kLnYU9j5O0dsljlmtyGgfQWM5CClRN6LIpQUoSi4vOL7uxWOZ0HoaftfWEWy+qMmZun/rrudBMTH91lDGQ1p+hOw+VBbICFQRbbS6mTxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156247; c=relaxed/simple;
	bh=Z0h3EmCf1+rEFr1KbjsG8LVQPkuTCzcHhND6OHFzKB4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j4cnILsOZGVnI30rax/ZCG2FnQDJAbjHDdxkVOkEPz+cN5SBMqM4GwU2rtoDeFk5tfq5xS1b797oZbwsbhnzR3mvylN6qA54Zb/+UqM0RdpTTmaX+W/GTt8LpxjEfg3RKqw16468vRwgmsxtMkVpCNggQNf5THi72qUvIofbRAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BXF84Nbr reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2864497;
	Thu, 11 Jun 2026 07:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781156212;
	bh=Z0h3EmCf1+rEFr1KbjsG8LVQPkuTCzcHhND6OHFzKB4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BXF84Nbr5nALG7H7wKC6iLfk2BRtXW+6bfLzpNOJswGwtkZC7ztTypwBRfZkSfLd9
	 8q6o/n/Jv21QHZVlKLO6q4CdENnX08Noy24S+8nHx90/0TzjpEZvC/E25bAHib80v5
	 89odM1UgZ0sEzFkiCbSi0/Fdlx12j7fpPxgMgHi0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-34-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-34-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 33/86] media: uapi: Add new controls for camera sensor FLL and LLP
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Thu, 11 Jun 2026 11:07:16 +0530
Message-ID: <178115623672.1799417.2005627235315487289@freya>
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
	TAGGED_FROM(0.00)[bounces-64532-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,ideasonboard.com:from_mime,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EC6B66EAC2

Hi Sakari,

Quoting Sakari Ailus (2026-04-10 01:44:08)
> Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
> V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analogue
> crop rectangle and horizontal and vertical blanking.
>=20
> The reason for adding the new controls is that they're much easier to use
> as the user doesn't have to be concerned of the analogue crop in the same
> context. Secondarily, the newly added common raw sensor model uses
> different values for the same.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>  3 files changed, 15 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source=
.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 63e53c883db6..fb4dee1b4f94 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -201,3 +201,13 @@ For instance, a value of ``0x0001000300020003`` indi=
cates binning by 3
>      Sub-sampling is used to downscale an image, horizontally and vertica=
lly, by
>      discarding a part of the image data. Typically sub-sampling produces=
 lower
>      quality images than binning.
> +
> +.. _image_source_control_frame_length:
> +
> +``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> +    Frame length in lines. The value of the control is the number of lin=
es
> +    captured in the sensor's pixel array added to the vertical blanking.
> +
> +``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> +    Line length in pixels. The value of the control is the number of pix=
els per
> +    line captured in the sensor's pixel array added to the horizontal bl=
anking.

In IMX219 driver in this series, we are exposing frame length in two-lines
and two-line's length in pixels, which doesn't make sense with respect to
these control definitions.

Similarly, for sensors like IMX283, IMX678 and others, the register is line
length in internal clock units, while the control is line length in pixels.

So I think we should add a small note to prevent these awkward units from
propping up in the userspace:

``V4L2_CID_FRAME_LENGTH_LINES (integer)``
    Frame length in lines. The value of the control is the number of lines
    captured in the sensor's pixel array added to the vertical blanking.
    Some sensors may have an internal register for the total vertical size
    that is in units of 2 lines or some other unit. But the control value
    should always reflect the number of lines in a frame.

``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
    Line length in pixels. The value of the control is the number of pixels
    per line captured in the sensor's pixel array added to the horizontal
    blanking. Some sensors may have an internal register for the total
    horizontal size in units of some internal clock instead of pixels, or
    the total pixel count for multiple lines. But the control value should
    always reflect the number of pixels in a line.

Thanks,
    Jai

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 227bcb5a549d..bd23c5640722 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1163,6 +1163,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_BINNING_FACTORS:          return "Binning Factors";
>         case V4L2_CID_SUBSAMPLING_HORIZONTAL:   return "Sub-Sampling Fact=
or, Horizontal";
>         case V4L2_CID_SUBSAMPLING_VERTICAL:     return "Sub-Sampling Fact=
or, Vertical";
> +       case V4L2_CID_FRAME_LENGTH_LINES:       return "Frame Length in L=
ines";
> +       case V4L2_CID_LINE_LENGTH_PIXELS:       return "Line Length in Pi=
xels";
> =20
>         /* Image processing controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index acb6f9ad4d1b..60f0fb599926 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1253,6 +1253,9 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_SUBSAMPLING_HORIZONTAL                (V4L2_CID_IMAGE_S=
OURCE_CLASS_BASE + 14)
>  #define V4L2_CID_SUBSAMPLING_VERTICAL          (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 15)
> =20
> +#define V4L2_CID_FRAME_LENGTH_LINES            (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 16)
> +#define V4L2_CID_LINE_LENGTH_PIXELS            (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 17)
> +
>  /* Image processing controls */
> =20
>  #define V4L2_CID_IMAGE_PROC_CLASS_BASE         (V4L2_CTRL_CLASS_IMAGE_PR=
OC | 0x900)
> --=20
> 2.47.3
>

