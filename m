Return-Path: <linux-media+bounces-62694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0VEjJVfBE2oYFgcAu9opvQ
	(envelope-from <linux-media+bounces-62694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 05:26:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB535C58CA
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 05:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3CB63002306
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 03:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1F62BE035;
	Mon, 25 May 2026 03:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbeA1sXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A528282F3A
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779679572; cv=pass; b=PqTbMniKfD84fpA85NmA7sjsk4zrHZFnN5by5cWyn9a8AuaBtleu6aGEPerqrBsv+FAh3zeLFH7f5g3Cd1WWlp4hmsJbYupA1GqD6I/3lNq3wZYsfbx0dr/iJk8q/x9OJxQjlDT8Yb87EbIiERMI4IhOtPUJiuG4q3mhgdomwSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779679572; c=relaxed/simple;
	bh=Tcjwar0ujMRUYwQNWOI9owhqHhcwp71+Xytox09KV28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpU5qAdggO45A1uD0G6LBxO44PA3yE6H9kFDHazzEiQRR85bo0BmuKdgR/PPLY9nedDBw/SG1GG9yvV6D1NUCz7R89BmAy6tiWF7Wm/xKE7VOB+FwSyYZxsUa52fothWyZ2q4ZuRMCId3SXti8FJHpv44kHW/Xx/gtqJEfmj6kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbeA1sXy; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43acb9730f4so5431996fac.1
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779679568; cv=none;
        d=google.com; s=arc-20240605;
        b=GZS3bfZo/AmHLJkZqVWZAkWhwkbt37r0WVFKBIDHz1aRg3qDLQh+tYHzmFgJCPluLc
         d748sMLpXAlhlP5bx9wpsiM8vOCKBztjhtzT16o9Rtb55no7ofjGQo81Wu0Vp00ip481
         cbB26kT/u6o1UDXkGb1mVf5z40r5KqaaJc82zfqNoR6WifsX/OX+AJvcvKPaZ226dbtx
         AyiOSWINCQWANkkpUytxahKZw1BXzEDFewyohxtccxuL45U3kmUtQHt3NDNbI4nijK0J
         UqWGpYHx5oUkMmHbY5WwE71fHcEg+2VD5TKOA2PZhMeqBrSM0IPvhpcf3a+7DPvP2GyN
         RblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=d++xR028ZOzxOtNEEAwWQ0igiDZ/BgvEaPTq92bRxPLKDX3m1Bez6wNsbu7Wdu4KK1
         PLKp/xYh/uGumDgICYtUiC1Iyf43WIjJ81KMsCgu7nbudMmZOJGhWKM8MTepUXBNm2sn
         VPJFt420TqlunGLNMUiJfO5z27JMZI0SFs8C6X0Lk7lCGgG6+haMppMQ92vwRl/mOiEB
         vYSUEW3GEt0/yzcGgZe7aMZH2vtwxWc/QVtT2tKPSABj3re1SLkCPnxprP+Jx5puo9uJ
         q2EdW0N8KExH9Hue7KdizE5QPKdpWOnnUwm/zNdZPofiiavKu/54S/xM7Bmcmm7RUVVb
         RO6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779679568; x=1780284368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=kbeA1sXyQ5dkCWIfThfUgDAV+VXEMzIwiJhITeu3Q5BKcl1WaLV3DiJle6Zy9Xths+
         9HV7WalsRq3dV+roFjjMnTfGR01XVIQKOcaCLTxLPVfalBj7KJleOnFQphUzP1+tUcvH
         Wpa8Om0fbN4/pGNrhqV+DrvBk7yed8I2yj6JxH93WDR85XhfJ8OpuL216En5Zeb7OZ1E
         PjCBEQqvifDsoYaeugkXGoFGZN/BGOF4wPK7uuZfpYtOIWmsYBtrzPOM0uEp+Gp16FgF
         zj8pVi5yjxr7YOLBNBQpFM/lb9/4q+S6V381KXbTYAras0cWpVAQ9NBhrDso5C/qijU2
         4QaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779679568; x=1780284368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=A5rUReIU/sleZCc045oRnxkWBxZsjIZbHeYvTl5n8Y7pLhSFE3fA9kvMv4EMCG+tF6
         9/M8KCWn+LutKViOnV4L45MU1dVSvfZ1CzgrKYJ7tazHdLKtzxkSfdyTUabhJLXOIeya
         NE8aDXDQqfHAK9IQkqx2PT4yJMpBRiWFLKmK8/2j1nUnwFkj4sqyri4q7eoSDHM9Dttp
         MGGGVJZSz37kVNpqda7+fhd7+Y1F5HOHBmwPCfGlWHMY17ijXvKge0z1+A5IN7oJogGB
         lrn7//Ry5BXtlE05cktRs5Bf2tsLkS8+qDhV4uqebpsTSE70HREzxctFZotEvDkLBsze
         pZrA==
X-Gm-Message-State: AOJu0YyAig+zTLv7vwiccrOektRJb9SPBs7Sh5qoxbxS4pG0bKUgJsWx
	Ac9rANwmbyIeHYzkw685l42/37+UaNhvywWpuflB2V8Dunv/n0cUenjE62DjJFdrhEWDP8DmLkC
	9WJhpZq/m08tVk7oRg9Ge738RaB3WUP0=
X-Gm-Gg: Acq92OHIWUdEAMSqK+ZPG31awyZ2JtRd7ajnuhoWjbe+b8P3TA1z6N7cRP2d42+PkBH
	wrfEANd4IfwsYV/QgR/WBCoamj5xCTGgyVTkx1JWYF9Fd0Oy50VAPWUBn8xWHzIfVqcU4XV83dL
	70ij5YbHKGqCXnJIUbvzQxiW/dJmNE7nFkDkIC9w9IGFSYp2kBWYprbWS1XBGusvkqCIbCgFYsU
	SgE+dYJNQmzn/t3XiqkK7LXLTOh/o34+rOz5jjhDLsq11MkD/uDxFSL599qxsqk+t06jOSVER4e
	ze4ih8ILfAZZwmxsK+ZTZ1bXLrD41NRd19Qr9dqCIGBYyNj9DhxEQmaNAPr1jbfZWg7F
X-Received: by 2002:a05:6820:4b09:b0:67e:2ff7:2a6e with SMTP id
 006d021491bc7-69d7eb501dbmr7243815eaf.18.1779679568125; Sun, 24 May 2026
 20:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-14-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-14-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 25 May 2026 06:55:48 +0330
X-Gm-Features: AVHnY4KUuBcGh4fPuvaF9wKJBQKBE4TDK2MAAseg_T5QDDf0jB-H1zPi4i_Lwlk
Message-ID: <CAMxPZkjfWckb89HeZ1aZU6szkvfPm6J20HH2+O2C-ZoftR1YsQ@mail.gmail.com>
Subject: Re: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62694-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2FB535C58CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Mon, May 18, 2026 at 2:01=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> There isn't anything configurable about the params video device link,
> but the v4l2 core complains that no op is provided so implement a dummy
> one to make it happy.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 77c2d06c0436..b7ef33fa2b13 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_p=
arams_fops =3D {
>         .poll           =3D vb2_fop_poll,
>  };
>
> +/* Media Entity */
> +
> +static int sun6i_isp_params_link_validate(struct media_link *link)
> +{
> +       /* Nothing to validate here. */
> +       return 0;
> +}
> +
> +static const struct media_entity_operations sun6i_isp_params_entity_ops =
=3D {
> +       .link_validate  =3D sun6i_isp_params_link_validate,
> +};
> +
>  /* Params */
>
>  int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
> @@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *=
isp_dev)
>         INIT_LIST_HEAD(&state->queue);
>         spin_lock_init(&state->lock);
>
> +       /* Media Entity */
> +
> +       video_dev->entity.ops =3D &sun6i_isp_params_entity_ops;
> +
>         /* Media Pads */
>
>         pad->flags =3D MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified that streaming through the ISP pipeline works correctly
after this change and that the previous .link_validate() warning for
'sun6i-isp-params' device is no longer triggered.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

