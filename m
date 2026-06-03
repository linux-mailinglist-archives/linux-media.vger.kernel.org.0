Return-Path: <linux-media+bounces-63518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v91HMYvXH2qAqwAAu9opvQ
	(envelope-from <linux-media+bounces-63518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:28:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67756635351
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aVTDkKDI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63518-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63518-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73ADF3001454
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F933A1E92;
	Wed,  3 Jun 2026 07:21:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B139A4BA
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:21:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471304; cv=none; b=CO/QNliriPtKVrZtKuxZHPu2VjUXecnDuLUHt5vbaRo8KIZjrwcus+okBfmTQxS+kBFtMlKfo6XWBquw3k8sduxDWbDx44QfYUnGluszMlFoj2gD75MxKtrpH/G2p5vXMra/Q/l2IfGOMpN6zuSb9BzfVdpu/ObYB+yKukTo/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471304; c=relaxed/simple;
	bh=PrGx4t/E41kDfu3vPBNpehOhFGzvqIXc0TEH8Cv0Tpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iEE/8/gjkOB5pLnAulm+RFq/IW3ovXSyMZv3tA4A4GiFEfbUqfv0kyAkmmrGCgtagf+QjLWYTrvsLgvYje2wk2FDlt9ZXpanY81XOFQf+uzVEF7sjyx6Qzu/tDPcQrW0TsjL+li7udS3TcGTHYi3YoWTg2vuMlvH1dzhhQLH8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVTDkKDI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0A01F00893;
	Wed,  3 Jun 2026 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471303;
	bh=NGBlwv64KwuYjGCNA5BUAKrtlFqS4gGVicrJCr/nzUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aVTDkKDIn3E7VhFFOgeq3prOiEjxv2AM3XsnmCHaaQlNw4ink6vjIjdR9b3oMzJ3l
	 Pq5Cpq3nuDJSruvkZ8xzCOLfK+D/46EVSO2aUEDJ3L4HA7deoGyoTPWjSohCjVXMA1
	 bO7Ijst9tx86mXa519MvW04mrWQQNS+uMiIlynZTZnJeZKLThcdpQBSBcuxB10/jkE
	 igQ7sy5ZGgf9BkJXrCdLMX1zQJKi/bQX2Ij1zKStdZ5ZRiHWGP7WpdoW+EtwFfz6mS
	 RCGT87F8SXmupU+ljh66KI70knbNd4Cv/PIr18ogkrHK5fguFKiI6dqJBOFmKNFPSH
	 kH0mwAVAz+YjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/12] media: microchip-isc: add SAMA7G5 hue and
 saturation controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-9-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-9-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:21:42 +0000
Message-Id: <20260603072143.0A0A01F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63518-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,smtp.kernel.org:mid,sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67756635351

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] V4L2 controls are improperly gated due to deferred pipeline conf=
iguration, causing incorrect active states and state desynchronization when=
 inactive controls are modified.

Pre-existing issues:
- [High] `mutex_destroy(&isc->awb_mutex)` is called on an uninitialized or =
already destroyed mutex during async error and unbind paths.
--

commit a918c53cb3531019eb23300da7b6bcbdebef4df4
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

media: microchip-isc: add SAMA7G5 hue and saturation controls

This commit exposes hue and saturation as V4L2 controls for the SAMA7G5
CBHS block. The controls are gated based on the has_cbhs flag and are
initialized to neutral values at probe.

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -859,6 +859,46 @@ static int isc_try_configure_pipeline(struct isc_dev=
ice *isc)

[ ... ]

> +static void isc_update_cbhs_ctrls(struct isc_device *isc)
> +{
> +	bool cbhs_active =3D isc->config.bits_pipeline & CBHS_ENABLE;
> +	bool chroma_active =3D cbhs_active && isc_format_is_yuv(isc->config.fou=
rcc);
> +
> +	if (isc->brightness_ctrl)
> +		v4l2_ctrl_activate(isc->brightness_ctrl, cbhs_active);
> +	if (isc->contrast_ctrl)
> +		v4l2_ctrl_activate(isc->contrast_ctrl, cbhs_active);
> +	if (isc->hue_ctrl)
> +		v4l2_ctrl_activate(isc->hue_ctrl, chroma_active);
> +	if (isc->saturation_ctrl)
> +		v4l2_ctrl_activate(isc->saturation_ctrl, chroma_active);
> +}

[ ... ]

> @@ -902,6 +942,7 @@ static int isc_set_fmt(struct isc_device *isc, struct=
 v4l2_format *f)
>  	/* make the try configuration active */
>  	isc->config =3D isc->try_config;
>  	isc->fmt =3D isc->try_fmt;
> +	isc_update_cbhs_ctrls(isc);

[Severity: Medium]
Does this leave the CBHS controls incorrectly deactivated before streaming
starts?

Because isc->config.bits_pipeline is only updated during link validation
(VIDIOC_STREAMON), it appears bits_pipeline will be zero or stale here
in isc_set_fmt().

If the controls remain incorrectly inactive, and userspace tries to set
them, isc_s_ctrl() might quietly reject the change:

drivers/media/platform/microchip/microchip-isc-base.c:isc_s_ctrl() {
    ...
    if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
        return 0;
    ...
}

Will this silently ignore the update while the V4L2 core caches the new
value, causing the driver's internal hardware state to permanently diverge
from the V4L2 framework's cached state?


[Severity: High]
This is a pre-existing issue, but can the async error handling path cause
a double-destroy or uninitialized-destroy panic?

If an early operation such as v4l2_device_register_subdev_nodes() fails
in isc_async_complete(), it returns an error before initializing
isc->awb_mutex. The V4L2 async core handles this failure by unbinding the
subdevices, which triggers isc_async_unbind().

isc_async_unbind() unconditionally calls:

drivers/media/platform/microchip/microchip-isc-base.c:isc_async_unbind() {
    ...
    mutex_destroy(&isc->awb_mutex);
    ...
}

Could this lead to a kernel oops on an uninitialized mutex if
CONFIG_DEBUG_MUTEXES is enabled? Additionally, if isc_async_complete()
fails after initialization, it explicitly destroys the mutex in its error
block, causing isc_async_unbind() to destroy it a second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D9

