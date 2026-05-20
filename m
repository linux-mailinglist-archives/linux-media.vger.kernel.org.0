Return-Path: <linux-media+bounces-62343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGp6GR/nDWqm4gUAu9opvQ
	(envelope-from <linux-media+bounces-62343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:53:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8F592982
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8052A30BED75
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAF333F5BA;
	Wed, 20 May 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v2SnTkFR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97861CDFCA
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295170; cv=none; b=AJCJV7f5HONfvev8ybI4/4cOH37qFGfqSYUUgU7YGghGF0e98wcxGgPLC53KXfCcVy7Oy6/OQMuKHgn4SLmdjtiDLcf60bB6rxEqfdlY/cmjMWRI2hfGmoohoVlHy8eVY26C9zZlSDG1lM1ARC36h6vnGYH2ky3hEqnJOEZFu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295170; c=relaxed/simple;
	bh=D059oausWIlJMAngi5OgjPVBvgr0N47UomQg4W4CIl0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hpeAPhBKqk9Fc/ps7FHulpjQqWT7/QXwzWROAbIa0pi5RP0cEBOUHWX5cVXLAO8boZrh6lhamFmQnDuU1XMMglRBTjHpfhM9BNhEoIT5sZPL0mQ+f/hHF6B5mx/bVto8qFRZHxu2nN7EVv2hT/OQUyMrS8cwlnZUbx0fSa0ulB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v2SnTkFR reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06B2242B;
	Wed, 20 May 2026 18:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779295151;
	bh=D059oausWIlJMAngi5OgjPVBvgr0N47UomQg4W4CIl0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=v2SnTkFRXUBukpPKAP92ZG+jRqR90o/WRSPS0WUqpGZbeaLXhcLs8iZhWuPU6+ZI9
	 tI/210BM1I4S9ZPCHyOg6OP2+qTMh9SRcFSFRqr5z/yzR6AezUsgQJVmtY+viIgwqh
	 pOnteX+k03dJVF6J8NTglR5rdyCbZ8/Ee7lb6tXA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-65-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-65-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 64/86] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 20 May 2026 18:39:19 +0200
Message-ID: <177929515968.2341049.14051787779723537851@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62343-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1BA8F592982
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-09 22:14:39)
> Support V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
> controls. These two controls provide direct access to sensor's line and
> frame lengths, without requiring a reference crop rectangle.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 216 ++++++++++++++++++++++++++++---------
>  1 file changed, 168 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 591feb3d539f..9f9503602040 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c

[snip]

> @@ -519,6 +527,102 @@ static void imx219_apply_binning(struct v4l2_subdev=
_state *state,
> =20
>         embedded_format->width =3D
>                 embedded_source_format->width =3D source_format->width;
> +
> +       int fll_min =3D IMX219_VBLANK_MIN + source_format->height /
> +               V4L2_BINNING_FACTORS_VNUM(binning);
> +       ret =3D __v4l2_ctrl_modify_range(imx219->fll, fll_min, IMX219_FLL=
_MAX,
> +                                      1, fll_min);
> +       if (ret)
> +               return ret;
> +
> +       int vblank_min =3D IMX219_VBLANK_MIN -
> +               (int)(source_format->height *
> +                     (V4L2_BINNING_FACTORS_VNUM(binning) - 1 ) /
> +                     V4L2_BINNING_FACTORS_VNUM(binning));
> +       ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> +                                      vblank_min,
> +                                      IMX219_FLL_MAX - source_format->he=
ight,
> +                                      1, vblank_min);
> +       if (ret)
> +               return ret;
> +
> +       int llp_min =3D imx219_binnings[index].llp_min;
> +       ret =3D __v4l2_ctrl_modify_range(imx219->llp, llp_min, IMX219_LLP=
_MAX, 1,
> +                                      llp_min);
> +       if (ret)
> +               return ret;
> +
> +       return __v4l2_ctrl_modify_range(imx219->hblank,
> +                                       llp_min - (int)source_format->wid=
th,
> +                                       IMX219_LLP_MAX -
> +                                       (int)source_format->width, 1,
> +                                       llp_min - (int)source_format->wid=
th);
> +}
> +
> +/* Do not copy this function to other drivers, make it generic instead. =
*/
> +static int imx219_fll_llp_set(struct imx219 *imx219,
> +                             const struct v4l2_mbus_framefmt *format,
> +                             struct v4l2_ctrl *src)

Could this now use v4l2_subdev_sensor_fll_llp_set() that you have added in
a previous patch in this series?

> +{
> +       struct v4l2_ctrl *dest;
> +       s32 val;
> +       int ret;
> +
> +       /* Was setting the control user-initiated or were we called again=
? */
> +       if (imx219->setting_ctrl) {
> +               imx219->setting_ctrl =3D false;
> +               return 0;
> +       }
> +
> +       /* We're being called for applying a value to register, bail out =
now. */
> +       if (src->val =3D=3D src->cur.val)
> +               return 0;
> +
> +       switch (src->id) {
> +       case V4L2_CID_FRAME_LENGTH_LINES:
> +               dest =3D imx219->vblank;
> +               val =3D src->val - format->height;
> +               break;
> +       case V4L2_CID_VBLANK:
> +               dest =3D imx219->fll;
> +               val =3D src->val + format->height;
> +               break;
> +       case V4L2_CID_LINE_LENGTH_PIXELS:
> +               dest =3D imx219->hblank;
> +               val =3D src->val - format->width;
> +               break;
> +       case V4L2_CID_HBLANK:
> +               dest =3D imx219->llp;
> +               val =3D src->val + format->width;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (val =3D=3D dest->val)
> +               return 0;
> +
> +       imx219->setting_ctrl =3D true;
> +
> +       ret =3D __v4l2_ctrl_s_ctrl(dest, val);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Only modify exposure range when setting fll, directly or via v=
blank.
> +        */
> +       if (src->id !=3D V4L2_CID_FRAME_LENGTH_LINES &&
> +           dest->id !=3D V4L2_CID_FRAME_LENGTH_LINES)
> +               return 0;
> +
> +       int exposure_max =3D imx219->fll->val - IMX219_EXPOSURE_OFFSET;
> +
> +       return __v4l2_ctrl_modify_range(imx219->exposure,
> +                                       imx219->exposure->minimum,
> +                                       exposure_max,
> +                                       imx219->exposure->step,
> +                                       min(exposure_max,
> +                                           IMX219_EXPOSURE_DEFAULT));
>  }
> =20

[snip]

Thanks,
    Jai

