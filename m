Return-Path: <linux-media+bounces-63120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ44J8DLGmqA8wgAu9opvQ
	(envelope-from <linux-media+bounces-63120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:36:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B860C894
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF759300EC8B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9576E3AB260;
	Sat, 30 May 2026 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSWS4knb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0093976AD
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140937; cv=none; b=LU1Wfqc17F0AsgIyHnjUDL9du8wCxkVoNgkeFeqFz+maNUVc7urLduwqPfyzJcOWwW4qbV4oZMoOx1iRxX+2mbFjyXP1fLj+gqboplZtOd4cjpX0q7rs7+etUXNTd9G8couTyDDruUbtvOP9eUSLiB+FIBuE5rVrA++JO8XWWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140937; c=relaxed/simple;
	bh=ytS7JyxlwcLHZAEPMzHJnVt194rCC1t3+gtEKLOaRMQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mEVR/tioaFOJAELxsVVeRMsVVnIvI08XvvcV4U1P+DAxrlPWVEDS/d9z0SyEro9SIN9fIzzimImAcJgUZ+OiKewO84boOHZUIppoD112fIt1c/R7VxmAnu412vzl92DmWBJTLuOpUqusheAIG8bAa31+Z7Orj/L3M2kp1QkX6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSWS4knb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3611F00893;
	Sat, 30 May 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140935;
	bh=Yc77usDQiigwdpgTMTiMuOA07l23X/cNQcNayeUOeQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TSWS4knbk7cSeJgo8H+6wyxrc2ivB7BhmdvAMtz2WDM8wLsnbhmKQQcg4bu/E4UJA
	 rGbg80Nwk3QGAlCfUDgXUq9A2EJflkbesc0Lf1TMlWDVc3QpNQeuAxd3vtC27nWpnq
	 ADfgt9dbpulnjY58BfcHxk4w2W3V2HNQQG0sB+mkO6QBu8G9rbERADWrtyD1/LYssQ
	 Rt8gk+hkJGoLScYGC3vD3dP+FLlzBNmTzOVfOlAknA8aUej1b29Dj9evKYE+0mim4n
	 o6VSLHIvpAdG+0NHfbV6h8jZ7gTsmfFHuWDL93cNnk4gO6xrPjhQDoXrr80asD76sF
	 8P6sBT6VpqZmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/8] gpu: drm: meson: Fix DMA max segment size for
 DMABUF imports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-9-linux.amoon@gmail.com>
References: <20260530094326.11892-9-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 11:35:34 +0000
Message-Id: <20260530113535.1D3611F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63120-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 185B860C894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dereferencing a NULL `priv` pointer on the `devm_kzalloc` error pa=
th.
- [High] Missing `drm_bridge_remove()` on encoder probe error paths leaves =
a dangling bridge in the global DRM list, leading to a Use-After-Free.
- [High] Prematurely dropping the canvas device reference without a device =
link causes a Use-After-Free if the canvas driver is unbound.
--

commit a3547c6366bfd30d17cb91e687b8ed0c53c24146
Author: Anand Moon <linux.amoon@gmail.com>

gpu: drm: meson: Fix DMA max segment size for DMABUF imports

When using hardware-accelerated video decoding via v4l2m2m-copy with mpv or
similar players, the video decoder driver (meson_vdec) exports contiguous
memory allocations as DMABUFs. When these buffers are subsequently imported
by the display controller driver (meson-drm) for rendering via the GPU or
compositor, the DMA API throws constraint validation warnings.

> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 49ff9f1f16d32..8570add8b8315 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -247,6 +247,8 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>  		goto free_drm;
>  	}

[Severity: High]
This is a pre-existing issue, but does the error path in
meson_drv_bind_master() cause a NULL pointer dereference?

If devm_kzalloc() fails earlier in this function:

drivers/gpu/drm/meson/meson_drv.c:meson_drv_bind_master() {
    ...
	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
	if (!priv) {
		ret =3D -ENOMEM;
		goto free_drm;
	}
    ...
}

It jumps to the free_drm label with priv set to NULL. The cleanup path
sequentially calls meson_encoder_dsi_remove(priv),
meson_encoder_hdmi_remove(priv), and meson_encoder_cvbs_remove(priv).

Can this cause a kernel panic when these functions unconditionally derefere=
nce
priv, such as here in meson_encoder_dsi_remove()?

drivers/gpu/drm/meson/meson_encoder_dsi.c:meson_encoder_dsi_remove() {
    ...
	if (priv->encoders[MESON_ENC_DSI]) {
    ...
}

[Severity: High]
This is a pre-existing issue, but does meson_canvas_get() leave the system
vulnerable to a use-after-free?

Looking at meson_canvas_get() in drivers/soc/amlogic/meson-canvas.c, the
device reference is dropped after extracting the canvas pointer:

drivers/soc/amlogic/meson-canvas.c:meson_canvas_get() {
    ...
	canvas =3D dev_get_drvdata(&canvas_pdev->dev);
	put_device(&canvas_pdev->dev);
	if (!canvas)
    ...
}

Since no device_link_add() is used to track the dependency between the DRM
driver and the canvas driver, the driver core permits unbinding the
amlogic-canvas driver.

Would doing so free its devm-managed memory and leave meson-drm with a
dangling pointer that causes a use-after-free when dereferenced later, such
as when locking canvas->lock in meson_canvas_alloc()?

[Severity: High]
This is a pre-existing issue, but does meson_encoder_cvbs_probe() leak a
bridge reference on error paths?

In drivers/gpu/drm/meson/meson_encoder_cvbs.c, the bridge is added globally:

drivers/gpu/drm/meson/meson_encoder_cvbs.c:meson_encoder_cvbs_probe() {
    ...
	drm_bridge_add(&meson_encoder_cvbs->bridge);

	meson_encoder_cvbs->priv =3D priv;

	/* Encoder */
	ret =3D drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
				      DRM_MODE_ENCODER_TVDAC);
	if (ret)
		return dev_err_probe(priv->dev, ret,
				     "Failed to init CVBS encoder\n");
    ...
}

If a subsequent initialization step fails, the function returns an error
without calling drm_bridge_remove(). The master cleanup function fails to
remove it because priv->encoders[MESON_ENC_CVBS] is only populated upon
successful probe completion.

During devres teardown, the reference count drops to 1, but the bridge is
not freed. Can this leave the bridge accessible in the global bridge_list
with dangling pointers to the freed priv structure, leading to memory
corruption if accessed by other DRM subsystems?

> =20
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
>  	ret =3D meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
>  	if (ret)
>  		goto free_drm;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D8

