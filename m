Return-Path: <linux-media+bounces-63386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kQFsCLHdHmq5WgAAu9opvQ
	(envelope-from <linux-media+bounces-63386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:42:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CE62E96D
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:42:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NrcUeR3p;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63386-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63386-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A675307BDC1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1E53E1D07;
	Tue,  2 Jun 2026 13:29:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CD3ED138
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:29:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406964; cv=none; b=miGshFwH0F6wE7jVsSS1jpNM7IM1NN1jYN5SwS29YHda/bxFpL7y2n5cSw/sZ29H0rJTYSRS2X6vXoldknMptgc9BEncy3C5Tm7O+FvBX3eKrB7Oqj1Ks0tqEeukeRRmDibclm1VqBhOp2fLcVVrqiCArAXrRlRRG0yqBlBbd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406964; c=relaxed/simple;
	bh=CL1N0wk9eHR5E5nrsBJh9yRUilFt2IpQ7CgFRdQ/WtI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cu454G4PhU14zhCY+HauNNfdTlZ7gpGOzINQk0/9EBF2oFwemFDT2xsdPivJUGlqyXTLXNxb1XGaHt7LM2W+/+JQM1O5hFJOmMX7aZ8JsLEu4zgdHljSp7ogVJ0cDnG9r47UJB4vgkLMJt/T2YRsDS5cnt0vilCZ/HhOQNIvKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrcUeR3p; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B761F00893;
	Tue,  2 Jun 2026 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406963;
	bh=zo4Ti2uazpF2GzMtzUKHUX2ZMdpsocW/HonjHHUo364=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NrcUeR3p0WVF2tmuE/wR0ady01noW5nodj2S3FetbB65ZHSXRDwWDindn2fhttYTy
	 popT1JoohqVxJbPqIW53Lb2ImTdFuqpWX3uwYLkC2yDt96GZQnLZ0s2lfvw2Tjp8KB
	 mPdxDyc9mSpGpfae357XdtQvZMR9x3pbY1w43orkJdMh3b6aBiBTqvoM3aPwmpNNo7
	 tvfN7OPsHgjxfmuptQz71Wfy7ZotYGZOgS9t4iZxtK8/nGl6bjFYiy7URZBBZD6R0j
	 vqaJINJw6weAVpZcpY+vEj7MwM4b3vntyP6T127WSKFt8qpq0cEgO64KYXqBwXaloW
	 Sr6p8NS+d6uHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] media: stm32: dcmipp: configure csi input of
 all pipes on stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-6-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-6-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:29:22 +0000
Message-Id: <20260602132923.09B761F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63386-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,st.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE2CE62E96D

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete multi-pad format propagation and hardware configuration=
 logic.
--

commit 11526b79984d515f0895343b0327ef2d55f0975d
Author: Alain Volmat <alain.volmat@foss.st.com>

    media: stm32: dcmipp: configure csi input of all pipes on stm32mp25

This patch adds two additional pixel pipes (source pads 2 and 3) to the
dcmipp-input subdevice for the STM32MP25. It modifies the hardware register
configuration to allow routing input streams to all available pipes.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c =
b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
> index 75421035cfad5..3fc859f1cb14a 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
[ ... ]
> @@ -383,7 +389,8 @@ static int dcmipp_inp_configure_parallel(struct dcmip=
p_inp_device *inp,
>  }
> =20
>  static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
> -				    struct v4l2_subdev_state *state)
> +				    struct v4l2_subdev_state *state,
> +				    u32 pad)
>  {
>  	const struct dcmipp_inp_pix_map *vpix;
>  	struct v4l2_mbus_framefmt *sink_fmt;

[Severity: High]
Since this function now accepts a pad argument, should it be updated to use=
 it
when retrieving the source format?

Currently, dcmipp_inp_configure_csi() hardcodes the format lookup to pad 1:

	/* Get format information */
	sink_fmt =3D v4l2_subdev_state_get_format(state, 0);
	src_fmt =3D v4l2_subdev_state_get_format(state, 1);

If a user configures a pipeline using pad 2 or 3, the driver will incorrect=
ly
configure the hardware using pad 1's format parameters. For instance, if pa=
d 1
is left at a default JPEG format, attempting to enable streams on pad 2 cou=
ld
fail with "JPEG only available on pipe 0" because the driver evaluates the
format of pad 1 instead of pad 2.

[ ... ]
> @@ -533,8 +554,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const =
char *entity_name,
>  	struct dcmipp_inp_device *inp;
>  	const unsigned long pads_flag[] =3D {
>  		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
> +		MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SOURCE,
>  	};

[Severity: High]
With the addition of these new source pads (pads 2 and 3), does
dcmipp_inp_set_fmt() also need to be updated to propagate the sink format
to all source pads?

Currently, dcmipp_inp_set_fmt() only propagates the format to pad 1:

	/* When setting the sink format, report that format on the src pad */
	if (IS_SINK(fmt->pad)) {
		mf =3D v4l2_subdev_state_get_format(sd_state, 1);
		*mf =3D fmt->format;
		dcmipp_inp_adjust_fmt(inp, mf, 1);
	}

This could leave pads 2 and 3 uninitialized or in a stale state, violating
V4L2 subdev API expectations and potentially causing
v4l2_subdev_link_validate() to fail when setting up a pipeline through the
new pipes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D6

