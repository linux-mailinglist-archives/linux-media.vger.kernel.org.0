Return-Path: <linux-media+bounces-63986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id puiZFkhNI2rhoQEAu9opvQ
	(envelope-from <linux-media+bounces-63986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:27:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A264BA26
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CpQ9cogg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63986-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63986-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB969303E2FA
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018C13C2796;
	Fri,  5 Jun 2026 22:23:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BD4387362
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:23:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698188; cv=none; b=Qiszia7sjLuyN4R5sPcZPr0I3eNdjPn+syIBEug9pNWb/aH+TsS2yJte9a3xdFKRNNtQPaFy1AjmOr5xDmQtuO299nszUMfqdnlawJiltMKlCSwr32xR4SzPD0VK7NmJ+3D1BXa3LrSymt/tTVBlcQZ+VV/KxD6fb99GgZmdYDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698188; c=relaxed/simple;
	bh=sADIGGskiWNM2YJinxADh2XlqsfbJfZsGYMX2gemD6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aP7uTAzt+Wrr1pL33tS2Ik2bXbbvmCZjygfwZmIywrV4/4rV9064Rnq/V8pCGywoNH0oEvjQV5RYAGHH9NWbEVZJqRReKeLnnOpE8wfdhkFechlCPuk6wNVrAO9EPjAKbJnPYMaXNkEdkQla53LehsJnVsJTTtKO3rhKfOXEeFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpQ9cogg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3BC1F00893;
	Fri,  5 Jun 2026 22:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698187;
	bh=VbFP2d7IDTyYaEOO8llQmxpRxMIapEucA4H8bzrYDJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CpQ9coggBdghQxo+f8nlX1BNpQTGK/ILRkXQ9RFqNVgmHXyizZS1bUM7GY1cX0fDC
	 v/SwO9UPQ/xWTU7vWpnbf5R7UDCJnUDwQpeUfAdvwSxOy1N4vU4/TjdSEdNrrmTshv
	 JtKj1eYQTia/kHKCMN+8ERXIjDImMShk9LfEpL4dMtfJ/qmuEs/+OcfooBXbXVYBIm
	 hXyZuUPJgx2unAY5At0t8b5AnFNLvC1fxYj1GPVF7USXC1VIBJSsmlRMyB8sVTaiod
	 K+u0Kw6btYd6RDOj67S4sZyDko8wknBCHQVLGJ3RW6hgAZ3o4VEezVYqQARqN2BuUr
	 AvVjOMfORv2Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/17] media: rockchip: rga: put all cores into first
 core iommu domain
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-14-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-14-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:23:06 +0000
Message-Id: <20260605222307.3B3BC1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63986-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,pengutronix.de:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A36A264BA26

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Sharing the primary core's default IOMMU domain with secondary=
 cores creates a severe lifetime mismatch leading to a Use-After-Free if th=
e primary core is removed.
- [High] Incorrect error checking of `iommu_get_domain_for_dev()` using `IS=
_ERR()` causes a NULL pointer dereference and masks errors.
- [High] The new error paths for IOMMU attachment fail to release the PM ru=
ntime reference.
- [High] Missing `.unbind` callback leads to IOMMU domain reference leaks, =
teardown asymmetry, and array out-of-bounds writes upon driver rebind.
--

commit 3fbaee68845794dcb5e7c93168eef670817da976
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: put all cores into first core iommu domain

Put all cores into the iommu domain of the first core to allow them to
be used by any core.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -757,6 +758,19 @@ static int rga_core_bind(struct device *dev, struct =
device *master, void *data)
>  		  version.major, version.minor);
> =20
>  	if (rga->num_cores) {
> +		/* Attach to the first cores iommu */
> +		struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->cores[0]=
->dev);
> +
> +		if (IS_ERR(domain)) {

[Severity: High]
Since iommu_get_domain_for_dev() returns NULL on failure (not an ERR_PTR),
won't this IS_ERR() check fail to catch a NULL domain?

If domain is NULL, it will be passed to iommu_attach_device(), which could
lead to a NULL pointer dereference when accessing domain->owner in
domain_iommu_ops_compatible().

> +			dev_err(core->dev, "Couldn't get domain of the first core\n");
> +			return PTR_ERR(domain);

[Severity: High]
Does this early return leak the PM runtime reference?

pm_runtime_resume_and_get(core->dev) is called earlier in this function, but
this return path doesn't call pm_runtime_put(core->dev).

> +		}
> +		ret =3D iommu_attach_device(domain, core->dev);

[Severity: Critical]
Does sharing the primary core's default IOMMU domain with secondary cores
create a lifetime mismatch?

The IOMMU subsystem couples the lifetime of a default domain strictly to its
original device group. If the platform device for the first core is removed,
the IOMMU core frees the default domain in iommu_deinit_device().

Secondary cores would still retain pointers to this freed domain, leading t=
o a
use-after-free during DMA operations or unbinding.

[Severity: High]
Since we are attaching the device to the IOMMU domain here, how is it
detached when the driver is unbound?

There does not appear to be a corresponding .unbind callback in
rga_core_ops to call iommu_detach_device(). This would leave the IOMMU
group permanently attached, causing subsequent rebinds to fail with -EBUSY
or leak references.

Additionally, without an unbind callback to reset rga->num_cores, won't
re-binding the components cause rga->cores[rga->num_cores++] to continue
incrementing and overflow the array?

> +		if (ret) {
> +			dev_err(core->dev, "Couldn't attach to the domain of the first core\n=
");
> +			return ret;

[Severity: High]
Could this return path also leak the PM runtime reference acquired by
pm_runtime_resume_and_get(core->dev)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D14

