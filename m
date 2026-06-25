Return-Path: <linux-media+bounces-65661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sHDGH/hpPWps2wgAu9opvQ
	(envelope-from <linux-media+bounces-65661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 19:48:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8ED6C800A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 19:48:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=WCrREqV5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65661-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65661-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F9C4300E3C6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B8B3ECBE8;
	Thu, 25 Jun 2026 17:47:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9590025785C
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 17:47:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409654; cv=none; b=HOhaHIWpvNYJQ33OGazPfwNo1Cf94ZMcCGq3gdw4OSz6Uex0jzJ9M9DScb0zH7bVVovbtGseGFeVqf1rbtOnqNgM5A5QVne5PLo8lu0QvKlfS1TFyAmwQv3mz28SrpVhtUX4aNTLj9F7gEwvvOJF5QTXFqHDUz6StYy9mipoq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409654; c=relaxed/simple;
	bh=PH1NCu80mU4zUwumjYLyPOITAMV95YfvvOBv0OkBePk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FVr8wPKtOR8j/9k4PIWMoCrYWYQNX8f9isbB05Czv5rG3h6SpkrIvVyq0DMzOxh9x2J7lxJtNrlzX40wnRKsbr7f4RKr9vAXmwwdXPgvvevUPgmBXMbJu0W7VfiIKVZaAK6fuUJU+XSKqx0sd4eeqM7iRC5bDkgdd1LAoVV2Vek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WCrREqV5 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E1FD497;
	Thu, 25 Jun 2026 19:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782409603;
	bh=PH1NCu80mU4zUwumjYLyPOITAMV95YfvvOBv0OkBePk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WCrREqV5s9ggW0VidjIAQAgFYEzla7NULXKIOxRazILLpLsRSBEEFQ+iKaye0tRrT
	 wm5mntyVM4H/RiNlsaAFlihkxYXyguUe8BMdha+9iR0q3qS8b/ofr4rCV3qY75tbQs
	 gSEw6SDbIAT/TOZz7c2jFcMbxOKQonbDSZt5beq0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-6-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-6-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 05/86] media: uapi: Add V4L2_CID_CFA_PATTERN for describing color patterns
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Thu, 25 Jun 2026 23:17:19 +0530
Message-ID: <178240963924.1799417.13645477490024464265@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65661-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,ideasonboard.com:from_mime,ideasonboard.com:email,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA8ED6C800A

Hi Sakari,

Thank you for the patch.

Quoting Sakari Ailus (2026-04-10 01:43:40)
> Add V4L2_CID_CFA_PATTERN to tell the camera sensor's native Color Filter
> Array (CFA) pattern.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst      | 43 +++++++++++++++++++
>  .../media/v4l/subdev-formats.rst              |  2 +
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
>  include/uapi/linux/v4l2-controls.h            |  6 +++
>  4 files changed, 52 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source=
.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index f9c0b7ad3b4e..b09ad4b4576e 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -93,3 +93,46 @@ Image Source Control IDs
>      representing a gain of exactly 1.0. For example, if this default val=
ue
>      is reported as being (say) 128, then a value of 192 would represent
>      a gain of exactly 1.5.
> +
> +``V4L2_CID_CFA_PATTERN (integer)``
> +    This control determines the color components and native pixel order =
in the
> +    sensor's CFA (Color Filter Array) when used in conjunction with
> +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the b=
it
> +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pix=
el
> +    order is constant for a given device, it is not affected by cropping=
 or
> +    flipping.
> +
> +    This control may only be used on V4L2 sub-devices.
> +
> +    This is a read-only control.
> +
> +    Available patterns:
> +
> +.. flat-table:: V4L2 Color Filter Array Patterns
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 2 1
> +
> +    * - Macro name
> +      - Synopsis
> +      - Value
> +    * - V4L2_CFA_PATTERN_GRBG
> +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green fil=
ter in
> +        the top-left and bottom-right pixels, a red filter in the top-ri=
ght
> +        pixel, and a blue filter in the bottom-left pixel.
> +      - 0
> +    * - V4L2_CFA_PATTERN_RGGB
> +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green fil=
ter in
> +        the top-right and bottom-left pixels, a red filter in the top-le=
ft
> +        pixel, and a blue filter in the bottom-right pixel.
> +      - 1
> +    * - V4L2_CFA_PATTERN_BGGR
> +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green fil=
ter in
> +        the top-right and bottom-left pixels, a blue filter in the top-l=
eft
> +        pixel, and a red filter in the bottom-right pixel.
> +      - 2
> +    * - V4L2_CFA_PATTERN_GBRG
> +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green fil=
ter in
> +        the top-left and bottom-right pixels, a blue filter in the top-r=
ight
> +        pixel, and a red filter in the bottom-left pixel.
> +      - 3

WDYT about adding a V4L2_CFA_PATTERN_MONO or similar here?

This would help us re-use MEDIA_BUS_FMT_RAW_xx across mono/color variants
of the same sensor (like IMX678), and applications supporting the new raw
sensor model can also have a simple code-flow of always reading the
CFA_PATTERN control instead of handling MEDIA_BUS_FMT_Yxx separately.

Thanks,
    Jai

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/D=
ocumentation/userspace-api/media/v4l/subdev-formats.rst
> index fecb786cb8af..7d34c2991f81 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3855,6 +3855,8 @@ organization is given as an example for the first p=
ixel only.
> =20
>      \endgroup
> =20
> +.. _v4l2-mbus-pixelcode-generic-raw:
> +
>  Generic raw formats on serial interfaces
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index aab785e8948c..4fafc7a3c233 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_TEST_PATTERN_BLUE:        return "Blue Pixel Value";
>         case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixe=
l Value";
>         case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
> +       case V4L2_CID_CFA_PATTERN:              return "Color Filter Arra=
y Pattern";
> =20
>         /* Image processing controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 349d75d0da32..78c6fc69b1c1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1235,6 +1235,12 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_UNIT_CELL_SIZE                        (V4L2_CID_IMAGE_S=
OURCE_CLASS_BASE + 8)
>  #define V4L2_CID_NOTIFY_GAINS                  (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 9)
> =20
> +#define V4L2_CID_CFA_PATTERN                   (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 10)
> +#define V4L2_CFA_PATTERN_GRBG                  0U
> +#define V4L2_CFA_PATTERN_RGGB                  1U
> +#define V4L2_CFA_PATTERN_BGGR                  2U
> +#define V4L2_CFA_PATTERN_GBRG                  3U
> +
> =20
>  /* Image processing controls */
> =20
> --=20
> 2.47.3
>=20
>

