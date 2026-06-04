Return-Path: <linux-media+bounces-63758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id quXZKpkvIWo/AQEAu9opvQ
	(envelope-from <linux-media+bounces-63758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 09:56:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD363DCA0
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 09:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dwVw3WSu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63758-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63758-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 321DA3014C55
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 07:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE138399364;
	Thu,  4 Jun 2026 07:54:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D7352C2B
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 07:54:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559670; cv=none; b=BI1R2MMLJxjbGakDbp1k4gXACixRS365WnkISThFO4fi0kpbaNbAa0oX0hj2BQxGnu1s7mkJxElAP4dQRq2Y9MMM93DulenDcoGqobMyYCZQoALE+3Y65RmMoLy/mLB6HfToeamkdXZf5ZJiFVi8cbxO3+txhVs8JbHiW8ORWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559670; c=relaxed/simple;
	bh=89Ldz/JozjxKKmLi+Gx9THwVXxERG1tV1v7QtCruK9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SQaRjMaLIqy5rauFvc9nyFEYHa7O/G1hWF3JHajTS2ylBmYnEHN8zzY40hxNnsYSCOBuR/RTjFl3+QLANp/2+hpYQquZQ5rcp7Su10/FpwhHIjg8OyfHfhJa3bCWCmJRLh+Gp2xgj63SSgkuP/KiIA0aYGVOqqew8mIvt2XyfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwVw3WSu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDA11F00893;
	Thu,  4 Jun 2026 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780559669;
	bh=rvWdmvgM4xs928q85ziJDypdV8aRKCYcHSIHxlPvqfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dwVw3WSua/Rvdtd5D/xoUPkkFSOnOHN8SR8zdzouBDnsygiTGYXHqltUccz2didE3
	 F1IbPFRS0a6aKrfDFrA2xRCdxpC9Um7YQ+5VMImKsvEc7n7APECsbT6mdv9OU07PF3
	 e1p2FV29ETQTHmpnts6ZP8rh3R4nUnL/t0X1iSM1UGXx8Gwg0WjPic01JkZ3YknU87
	 JLCC5VVIFWn2gm+sJbH57pYmgIBvkWtg3Kmgszb9XXTD+QbZ3wuvLLsKAglk9QFkxb
	 dBUfefXUfxwOIFCopO3oFYujLIXVcQnMKGXcqD/MyLdoKN326FwwjjR3xWR+0fNoz1
	 oYuGjsZmm4aBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: fix CLU/LUT entity leaks upon
 pool allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawei Feng" <dawei.feng@seu.edu.cn>
Cc: linux-media@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260604073654.1365717-1-dawei.feng@seu.edu.cn>
References: <20260604073654.1365717-1-dawei.feng@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:54:28 +0000
Message-Id: <20260604075428.BCDA11F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63758-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:linux-media@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,seu.edu.cn:email,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EFD363DCA0

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] vsp1_hgo_create() and vsp1_hgt_create() trigger a kernel oops if v=
sp1_entity_init() fails, due to an error pointer dereference in vsp1_entity=
_destroy().
--

commit e81aa1a80df0db63e68e1a79f5ff07f7bd58f096
Author: Dawei Feng <dawei.feng@seu.edu.cn>

media: renesas: vsp1: fix CLU/LUT entity leaks upon pool allocation failure

This commit fixes resource leaks in vsp1_clu_create() and vsp1_lut_create()
by consolidating error handling. If vsp1_dl_body_pool_create() or control
initialization fails, it now uses a common error label to properly invoke
vsp1_entity_destroy().

> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_clu.c
> index a6e4bcab5101a..b0b85a00957ac 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
[ ... ]
> @@ -248,11 +250,14 @@ struct vsp1_clu *vsp1_clu_create(struct vsp1_device=
 *vsp1)
>  	if (clu->ctrls.error) {
>  		dev_err(vsp1->dev, "clu: failed to initialize controls\n");
>  		ret =3D clu->ctrls.error;
> -		vsp1_entity_destroy(&clu->entity);
> -		return ERR_PTR(ret);
> +		goto error;
>  	}
> =20
>  	v4l2_ctrl_handler_setup(&clu->ctrls);
> =20
>  	return clu;
> +
> +error:
> +	vsp1_entity_destroy(&clu->entity);

[Severity: High]
This is a pre-existing issue, but does calling vsp1_entity_destroy() risk
a kernel panic if the entity state is an error pointer?

In drivers/media/platform/renesas/vsp1/vsp1_entity.c:vsp1_entity_init(),
if state allocation fails, it assigns an ERR_PTR to entity->state:

drivers/media/platform/renesas/vsp1/vsp1_entity.c:vsp1_entity_init() {
    ...
    entity->state =3D __v4l2_subdev_state_alloc(&entity->subdev,
                                              "vsp1:state->lock", &key);
    if (IS_ERR(entity->state)) {
        media_entity_cleanup(&entity->subdev.entity);
        return PTR_ERR(entity->state);
    }
    ...
}

If vsp1_entity_destroy() is later called, it unconditionally frees the stat=
e:

drivers/media/platform/renesas/vsp1/vsp1_entity.c:vsp1_entity_destroy() {
    ...
    __v4l2_subdev_state_free(entity->state);
    ...
}

However, __v4l2_subdev_state_free() only checks for NULL, not IS_ERR():

drivers/media/v4l2-core/v4l2-subdev.c:__v4l2_subdev_state_free() {
    if (!state)
        return;

    mutex_destroy(&state->_lock);
    ...
}

This causes a blind dereference of the error pointer.

While this patch calls vsp1_entity_destroy() after vsp1_entity_init() has
succeeded (making the state pointer valid here), callers like vsp1_hgo_crea=
te()
and vsp1_hgt_create() handle vsp1_entity_init() failures by immediately cal=
ling
vsp1_entity_destroy().

Could this cause a crash if state allocation fails during probe?

> +	return ERR_PTR(ret);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604073654.1365=
717-1-dawei.feng@seu.edu.cn?part=3D1

