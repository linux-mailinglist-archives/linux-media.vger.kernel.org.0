Return-Path: <linux-media+bounces-64209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XqgAMdbiJmqjmQIAu9opvQ
	(envelope-from <linux-media+bounces-64209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:42:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A796583B4
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:42:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AwUNjCWr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64209-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64209-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DC463110672
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FAE42189A;
	Mon,  8 Jun 2026 15:04:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE141C2E1
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931042; cv=none; b=ivKXCDkUS5MP5p354YsShd6cgOM57LdSyrWHCSN9rHf7z8A7PVbSj2RGXA3Xo3qIq878u0ngzeuwmQv2DBSfsdaVCUhUbVACs80do1y40zLIYaE3xEVKc0VzyWkBbBAc43RhV83imt9S8tpfUCQHJFpQb1eb6PnoKlFiz0wte00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931042; c=relaxed/simple;
	bh=wQwYXiPNycYPDd+XcLpAhsmvbPvHskTcbXRags0mZ1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IKqxchD/g35mK7CBmodBsPs8arPkKYNvKDFkfhDz4alPUEhVsTjs/VS7FY9giNER5TTB4yVWbCVH1EXBSCQG53+W1bMHiNVj6RHVks9TdPMOGonN5QB77Ac9K+N1mUFcvd3o3+eJxDEgLfF/BEUJf1EiiTu4ueC/J2zKE+r/h2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwUNjCWr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226891F00893;
	Mon,  8 Jun 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931041;
	bh=yAW2++smjZmUZvws9v+YofUkXIIzbUwOPv4VCJpC0t8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AwUNjCWrP+ZsJDlMd9W6I5gSgcxMnVh+lj/yQzKxynokWRyXregvbAtT1Umsx0Vkp
	 I1auYGUnyHZTxHwofHSL3cdE/ONvVNkqXowQyHcw+KQbQr49XdVpBBk5esJOaqPZO5
	 PRwVRivnNIOHBePwIu6feW7IwBwCUpe+Ipx6/G4eg0ccAyh74EkB/n9AiQAlKN8xbk
	 pWgJY8TjajstnFlsvITG+uQ+prlz2ExLF2sWuZ6oDzjH9bJKygBSFhxVT6lBJvIw4A
	 yKqfGdXVLvWplbrnVEuwcrT3P4zDnVE7TnLtMLtGYL8T4yrFGqxMUYSuB2pDlEQ4rV
	 ZvqRf/ffJ5Geg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] media: i2c: ds90ub960: Support multi-channel
 sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608142901.3971821-3-r-donadkar@ti.com>
References: <20260608142901.3971821-3-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:04:00 +0000
Message-Id: <20260608150401.226891F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64209-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13A796583B4

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [Critical] The `ret` variable in `ub960_configure_ports_for_streaming` is=
 used as an error accumulator without being initialized to 0.
- [High] If virtual channel exhaustion occurs, `ub960_get_vc_maps` logs an =
error but silently continues without propagating the error, causing silent =
stream collisions.
- [High] For `RXPORT_MODE_RAW10`, the hardware VC is incorrectly hardcoded =
to `nport`, diverging from the dynamically computed `vc_map` and breaking p=
ipeline negotiation.
- [High] The patch breaks support for the DS90UB954 chip by improperly rout=
ing it to UB9702-specific registers, and writes improperly formatted VC map=
s.
- [Medium] Shift out of bounds in `ub960_get_frame_desc` due to an unvalida=
ted virtual channel index.

Pre-existing issues:
- [High] Kernel crash in `ub960_get_frame_desc` when handling an active rou=
te with a disconnected hardware port.
- [High] Stack buffer overflow in `ub960_get_frame_desc` due to unbounded i=
ncrement of `fd->num_entries`.
- [High] Uninitialized stack structure `source_fd` is passed to the subdev =
`get_frame_desc` operation.
--

commit 5bded5d411560eeba33b8d2d67265fa39cdba2ca
Author: Jai Luthra <me@jailuthra.in>
Subject: media: i2c: ds90ub960: Support multi-channel sensors

This commit updates the DS90UB960 driver to dynamically map incoming streams
with different virtual channels to unique VCs on the CSI TX0 port. It repla=
ces
the previous behavior of ignoring the incoming virtual channel ID and setti=
ng
it to the RX port number.

> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -3471,40 +3472,76 @@ static int ub960_rxport_handle_events(struct ub96=
0_data *priv, u8 nport)
[ ... ]
> -static void ub960_get_vc_maps(struct ub960_data *priv,
> -			      struct v4l2_subdev_state *state, u8 *vc)
> +static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
>  {
[ ... ]
> +	for (nport =3D 0;
> +	     nport < priv->hw_data->num_rxports && priv->rxports[nport];
> +	     ++nport) {
> +		struct v4l2_mbus_frame_desc source_fd;
> +		bool used_vc[UB960_MAX_VC] =3D {false};

[Severity: High]
Does this code pass an uninitialized stack structure to the subdev
get_frame_desc operation?

Many subdev drivers append to the frame descriptor assuming fd->num_entries
is initially 0. Since it contains uninitialized stack garbage, could this
lead to an out-of-bounds array access inside the callee subdev, and cause
the later loop to read uninitialized array elements?

> +		/* Don't enable port if we ran out of available channels */
> +		if (cur_vc > UB960_MAX_VC) {
> +			dev_err(dev,
> +				"No VCs available for RX port %d\n",
> +				nport);
> +			continue;
> +		}

[Severity: High]
Does continuing here leave the VC mapping at 0 without aborting the
overarching configuration?

Since ub960_get_vc_maps() returns void, the caller is unaware of the failure
and proceeds to program the hardware with a VC mapping of 0. Will this force
the port to forward streams on VC 0 and silently corrupt any other active
stream legitimately mapped to VC 0?

> @@ -3606,11 +3604,7 @@ static int ub960_configure_ports_for_streaming(str=
uct ub960_data *priv,
>  	struct v4l2_subdev_route *route;
>  	int ret;
> =20
> -	ret =3D ub960_validate_stream_vcs(priv);
> -	if (ret)
> -		return ret;
> -
> -	ub960_get_vc_maps(priv, state, vc_map);
> +	ub960_get_vc_maps(priv, vc_map);

[Severity: Critical]
Is the ret variable used as an error accumulator without being initialized?

The removal of the ub960_validate_stream_vcs() call leaves ret uninitialize=
d.
Its first use is passing &ret to ub960_rxport_write(). Inside that function,
the pointer is immediately dereferenced to short-circuit on previous errors.
Since ret contains random stack garbage, will it evaluate to a non-zero val=
ue,
causing the register writes to be silently aborted?

> @@ -3676,16 +3670,14 @@ static int ub960_configure_ports_for_streaming(st=
ruct ub960_data *priv,
>  	for_each_active_rxport(priv, it) {
>  		unsigned long nport =3D it.nport;
> =20
> -		u8 vc =3D vc_map[nport];
> -
>  		if (rx_data[nport].num_streams =3D=3D 0)
>  			continue;
> =20
>  		switch (it.rxport->rx_mode) {
>  		case RXPORT_MODE_RAW10:
>  			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
> -				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
> -				&ret);
> +				rx_data[nport].pixel_dt | (nport << UB960_RR_RAW10_ID_VC_SHIFT),
> +					&ret);

[Severity: High]
Does this hardcode the hardware VC to nport, diverging from the dynamically
computed vc_map?

In ub960_get_frame_desc(), the software V4L2 frame descriptor's virtual
channel is computed dynamically via vc_map[nport]. Will this mismatch cause
downstream CSI-2 receivers to listen on the wrong virtual channel and fail
to capture the stream?

>  		case RXPORT_MODE_CSI2_SYNC:
>  		case RXPORT_MODE_CSI2_NONSYNC:
> -			if (priv->hw_data->chip_type =3D=3D UB960 ||
> -			    priv->hw_data->chip_type =3D=3D UB954) {
[ ... ]
> +			if (priv->hw_data->chip_type =3D=3D UB960) {
> +				ub960_rxport_write(priv, nport,
> +						   UB960_RR_CSI_VC_MAP,
> +						   vc_map[nport], &ret);

[Severity: High]
Does narrowing this check to strictly UB960 break support for the DS90UB954
chip?

This forces UB954 chips into the else branch, which writes to UB9702
registers using a 4-bit map format. Since the UB954 chip utilizes the
standard UB960_RR_CSI_VC_MAP with 2-bit map formats, could this improperly
format VC maps and break hardware stream forwarding for UB954?

> @@ -3982,7 +3974,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev =
*sd, unsigned int pad,
[ ... ]
>  	state =3D v4l2_subdev_lock_and_get_active_state(&priv->sd);
> =20
> -	ub960_get_vc_maps(priv, state, vc_map);
> +	ub960_get_vc_maps(priv, vc_map);
> =20
>  	for_each_active_route(&state->routing, route) {
>  		struct v4l2_mbus_frame_desc_entry *source_entry =3D NULL;

[Severity: High]
This is a pre-existing issue, but is the source_fd structure declared on the
stack earlier in this loop and used without initialization?

Many subdev drivers append to the frame descriptor assuming fd->num_entries
is initially 0. Since it contains uninitialized stack garbage, could passing
it to the source subdev's get_frame_desc operation lead to an immediate
out-of-bounds array access inside the callee subdev?

[Severity: High]
This is a pre-existing issue, but can this function crash when handling an
active route with a disconnected hardware port?

Userspace can configure the routing table with valid sink pads that have no
hardware source connected. When iterating over active routes here, could
v4l2_subdev_call(priv->rxports[nport]->source.sd, ...) unconditionally
dereference rxports[nport] while it is NULL?

> @@ -4025,7 +4017,12 @@ static int ub960_get_frame_desc(struct v4l2_subdev=
 *sd, unsigned int pad,
>  		fd->entry[fd->num_entries].length =3D source_entry->length;
>  		fd->entry[fd->num_entries].pixelcode =3D source_entry->pixelcode;
> =20
> -		fd->entry[fd->num_entries].bus.csi2.vc =3D vc_map[nport];
> +		fd->entry[fd->num_entries].bus.csi2.vc =3D
> +			ub960_get_output_vc(vc_map[nport],
> +					    source_entry->bus.csi2.vc);
> +		dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
> +			route->sink_pad, route->sink_stream,
> +			fd->entry[fd->num_entries].bus.csi2.vc);

[Severity: Medium]
Could this shift operation cause undefined behavior if the virtual channel
index is unvalidated?

The ub960_get_output_vc() helper shifts the 8-bit map by
2 * source_entry->bus.csi2.vc. If the source subdev driver reports a virtual
channel >=3D 16, could the computed shift amount trigger undefined behavior
for a promoted 32-bit integer?

[Severity: High]
This is a pre-existing issue, but does the code later in this function
write to fd->entry[fd->num_entries] and increment it without bounds checkin=
g?

When mapping routes to the fd->entry array, fd->num_entries is incremented
for each active route. Since there is no bounds check against
V4L2_FRAME_DESC_ENTRY_MAX, could a malicious userspace application
multiplexing more than 8 active streams trigger a stack buffer overflow?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142901.3971=
821-1-r-donadkar@ti.com?part=3D2

