Return-Path: <linux-media+bounces-53320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLDDK/K4nmnwWwQAu9opvQ
	(envelope-from <linux-media+bounces-53320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 09:55:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595319473E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 09:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CBC530C4561
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B7C322B72;
	Wed, 25 Feb 2026 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="COZJ3rV/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B271213254;
	Wed, 25 Feb 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009611; cv=none; b=SeKc/qInkUOxBxO4NgEJLiOLZO4ysmE+R7yftdw5CUHf/mEdzcpmlgkrvCPH+o4YFD2CFTLxz9RPjZWyZ2KM116p7R/QrengpVnKOgme/eDaUbr8zgxj859iJxMGGqUCRf5Rm31GurKEy7/LoXZYr+C6gllOuhobplZlRlwhwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009611; c=relaxed/simple;
	bh=T0agehA9b3cN5B91pcC9TcBN5bfPndQIA8Upt+oLK9U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=I0FXftmhJUS67cWljJyA64byOswefdOMBG8wjM0QjuvStBn4qbCfT/gTlm6G71SKI/yqnUf/8ZBS4h4LO8mjFuxFNNIxIlbfI4yTtEOCdh+nv7xkb8RmKE2wG+5ermJXc9jV9ptUBUuWOcSQ5ZXcPufB+sKo6aeTBn6iA2T/ghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=COZJ3rV/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F3A1E47;
	Wed, 25 Feb 2026 09:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772009550;
	bh=T0agehA9b3cN5B91pcC9TcBN5bfPndQIA8Upt+oLK9U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=COZJ3rV/K1qXO+rC4BrcWkuEuUC7DvMxeck1oCBeY9YWA6ijdgWe1smaGU0OYTgxn
	 9U2JJVg/xIHKrJt+fc/ot2tJebN813ILvcfqrLeuGa2hPqo56eciauDI65FQ2f7ar+
	 9erks1lJIa5bF/Mbr2jQfy6BnJHaR/0M4nlxLG54=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aZ1jy6QIdNqYgDXa@kekkonen.localdomain>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com> <aZwQJZX6sjzLgVL4@zed> <177191073323.14753.12002575507884033868@freya> <aZ1jy6QIdNqYgDXa@kekkonen.localdomain>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for raw camera sensors
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 25 Feb 2026 14:23:22 +0530
Message-ID: <177200960262.14753.8678718901155184945@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53320-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 3595319473E
X-Rspamd-Action: no action

Quoting Sakari Ailus (2026-02-24 14:09:39)
> Hi Jai,
>=20
> On Tue, Feb 24, 2026 at 10:55:33AM +0530, Jai Luthra wrote:
> > >         LLP =3D (analog_crop_width + HBLANK) / binning_timing_h
> > >         FLL =3D (analog_crop_height + VBLANK) / binning_timing_v
> > >         frame_interval =3D LLP * FLL / pixel_rate
> > >=20
> > > I'm not 100% sure this is correct however, as the blankings should be
> > > expressed on a different clock domain that the pixel sampling rate,
> > > but I guess this is a reasonable approximation ?
> >=20
> > What does these two extra controls really offer us?
>=20
> The conclusion earlier on (well, maybe 10 years ago?) was that we should
> have had these to begin with, and not to use the blanking values to contr=
ol
> the frame rate, largely because it requires a reference rectangle -- and
> the current drivers use a wrong one, mostly because the API doesn't offer
> the right one. The assumption back then was that everything would soon be
> SMIA (or now CCS) compliant so this wouldn't matter much. But here we
> are...
>=20
> The VBLANK and HBLANK controls effectively also use the wrong reference
> (output size) in most drivers and that can't really be changed meaningful=
ly
> without breaking things.
>=20

Argh, makes sense.

> >=20
> > All sensors we have seen thus far map their LLP/FLL (or equivalent HTOT=
/VTOT)
> > values with respect to the digital readout, and not the analogue pixel =
array.
> >=20
> > If we add these two controls, we will have to support two different mod=
els for
> > frame interval calculation in the application layer too. Which I'm fine=
 with if
> > it has a practical benefit, that is, it makes it easier to deal with so=
me
> > particular sensor.
>=20
> There are three models, effectively:
>=20
> 1. CCS, where vblank and hblank are related to analogue crop rectangle, a=
s in
>    hardware;
>=20
> 2. Common raw sensor model, with LLP and FLL; and
>=20
> 3. the rest of the existing drivers (vblank and hblank relative to format
>    on source pad).
>=20

Thanks that's helpful summary. I will update v2 to reflect 1 and 3, while
details for common raw sensor model can be finalized later.

> In the case of frame length vs. blanking, I'd presume the difference in t=
he
> user space will be relatively small.
>=20

Indeed, switching to a different LLP/FFL control is easy, what's annoying
is having two different reference rectangles for the H/VBLANK controls.

> >=20
> > And if exposing the LLP/FLL directly offer the same benefit, then that =
is
> > cleaner, as it leaves the HBLANK/VBLANK as-is in the new model.
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Thanks,
    Jai

