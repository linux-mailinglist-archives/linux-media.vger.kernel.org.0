Return-Path: <linux-media+bounces-64163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/f2OIeFJmoJYAIAu9opvQ
	(envelope-from <linux-media+bounces-64163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:04:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 415EC654593
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:04:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nH0F36IE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64163-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64163-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF9F33067F00
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0713B3887;
	Mon,  8 Jun 2026 08:57:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1030FF36
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:57:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909032; cv=none; b=Lv5NC9ik8ZZXJ2DQXZWDj9+a6y7s6z2V097SHERYPRM9SNxX/bOWEhn/axDzom43GwEh+pshcJvVVGf/HfSRliqdkXB85Kn+09TxX0Yd/0642gFuIFlh70gpg3YCOoZNjB9uojDulkOW27rcpPTZDqpzopYQJSGg7JrhA8qMhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909032; c=relaxed/simple;
	bh=uHwx7oWoa4XTCheIbH7hojpCwRp+2b5anJ2JJDHBHqw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jY7JLccy4DwEp3jzbE0NJdIhdJgEeaQ35ZlMRz+5loojGN440wrGKzT7nRBTc6NVWvINqOT/GNkoY0MYPbCgT6WYDQS4DI14PLKsx2UE2K332xgpvRJffBtr1Uav5n7ZQwXMWwVV5+rvylFnLhsyf0CVa4jRgvDLTxPSOTcqhn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nH0F36IE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EB81F00893;
	Mon,  8 Jun 2026 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909030;
	bh=1qlEzQ6jeemq4KP5+jOxeD4JPbn/N6MC38Ewn5nzhoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nH0F36IEJ/egvsfkg2cBACgl9xiWQN8YiQJdtmWTxgSE4Krvgirhuyhfk7qQf79W/
	 /9teVS9VDaMl5ZUm6ZLZpSbOO5ShW4ZXdOcOAbWWIpmjUuwmp2x/JwK5JzoIFH7Iqa
	 t/taH16/flLm09P7VTJK38jYDTZowIkr4Vn5GX4Hq9WKK9oJylv/zugn3S8L9X7WKO
	 vwhZ/UEtRywSgiW7f/42YpxifgMgkJTBylZ/QViHlitcFHDfNGvvDPkuSpJ2Kn4eHO
	 jEZc8FIdr27VHEEK8NWsTblSIACnieBOcc1NptfxLR8CRcYhiUwQ8/fZYkFvEvXEWn
	 BWuu/R1wNsfnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: atomisp: Fix resource leak in
 atomisp_pci_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawei Feng" <dawei.feng@seu.edu.cn>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
References: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 08:57:09 +0000
Message-Id: <20260608085710.04EB81F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64163-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 415EC654593

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The v4l2 async notifier is never unregistered or cleaned up, leadi=
ng to a memory leak of async subdevice connection objects and dangling noti=
fiers resulting in a Use-After-Free.
--

commit b7444e6b542badbafff9a7d15d5037c35782ba7c
Author: Dawei Feng <dawei.feng@seu.edu.cn>

media: atomisp: Fix resource leak in atomisp_pci_probe()

This commit fixes a resource leak by unregistering subdev entities if
atomisp_register_entities() fails during atomisp_pci_probe().

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/s=
taging/media/atomisp/pci/atomisp_v4l2.c
> index 900a67552d6a0..d4e4e845f66e6 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1401,6 +1401,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id *i
>  	err =3D atomisp_register_entities(isp);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
> +		atomisp_subdev_unregister_entities(&isp->asd);
>  		goto error_uninitialize_modules;
>  	}

[Severity: High]
This is a pre-existing issue, but while looking at the error paths being
fixed here, is there also a memory leak and use-after-free risk related to
the async notifier?

In atomisp_pci_probe(), the notifier is registered via
v4l2_async_nf_register(), adding it to the global notifier_list. However,
the error paths and the driver teardown function atomisp_pci_remove()
appear to entirely omit v4l2_async_nf_unregister() and
v4l2_async_nf_cleanup():

drivers/staging/media/atomisp/pci/atomisp_v4l2.c:atomisp_pci_probe() {
    ...
	err =3D v4l2_async_nf_register(&isp->notifier);
	if (err) {
		dev_err(isp->dev, "failed to register async notifier : %d\n", err);
		goto error_unload_firmware;
	}

	return 0;

error_unload_firmware:
	atomisp_pm_uninit(isp);
	ia_css_unload_firmware();
    ...
}

Does this code permanently leak the memory allocated for async subdevices v=
ia
v4l2_async_nf_add_fwnode_remote() because cleanup is never called?

Additionally, since the isp struct is allocated via devm_kzalloc(), could
omitting the unregister call leave a dangling pointer in the global
notifier_list when the driver is unloaded or when the probe fails, potentia=
lly
causing a use-after-free on subsequent list iterations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608082706.3287=
831-1-dawei.feng@seu.edu.cn?part=3D1

