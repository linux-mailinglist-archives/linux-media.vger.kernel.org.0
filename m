Return-Path: <linux-media+bounces-63988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vKJTAZpMI2pzoQEAu9opvQ
	(envelope-from <linux-media+bounces-63988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:24:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD664B9F0
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:24:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CyXeSDCt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63988-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63988-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D67A73035858
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25733B9D8B;
	Fri,  5 Jun 2026 22:24:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE434071F3
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:24:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698260; cv=none; b=m2Zb8YGmKMm7FVswdlwDkFrC4QZzWnT17myTJ7ndaNHTDYLiJNPAdG2lJeLOc69vHL3DEzA2dt9k44k2+QDQ6sA4p2VPwGhw/9cnplfyCGQOKNV3YcO/VrFa6QUiaVlQvY94pgrSNwZ6Exepc1YPd1l3X+meEL9yyXIbNzDJS1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698260; c=relaxed/simple;
	bh=T4ZQrznC84VfOU/54+JykLyt976N+EsM8VOCsSZT8sg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fS6emdfMC8ZYRFjAXTGfxkfLFXU/y5Xc85U0xGmRfsYNgezbGxXQUbt3vIGpVxsjTHg5RonkC6KyG7JafyNH87YEQ9k2/kw9onDJuipOP28m4d98SYhOIJj83erE9KtyKy/fVeDz3FfTnomqf1FgrNjcl9Qua+MWnVs+wLyk8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyXeSDCt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97DF1F00893;
	Fri,  5 Jun 2026 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698258;
	bh=RUGooYrQLeBrMi+xNUJ2IFdfWCYxmbo+ZQKYoxUQuQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyXeSDCtf7eabfrU1hSvHv60vXUm0Eg+oLWhKTv3aX/bmvhSH5CifipiS+aP1JxDn
	 zr+zeSpuqeH0g0qTyeUtBoGMjKH2S/jafhCXlDImaSzYBSYwl4tuKmjgbXRKU5pv3q
	 1RYtXbFUQPu4Afv0KGY2L9KM9fF0/JgAzKGy4azgFNxUa2Sq+wPIces97zfp0azY/0
	 J76OW+IG7VefMCBG/HjtR7sKsBrknV6y7PTbHlBFUeCGX+mIp1NBVYtrbQ0vXLOtaF
	 1WuYgwEDj9QOnskCVuoQLZH4W5xySOagbeqrexKZo+MpHgas9C7F7wzu2g454oIhjW
	 5Z3xSjWW6xB+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/17] media: rockchip: rga: use components to manage
 multiple cores
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-9-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-9-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:24:18 +0000
Message-Id: <20260605222418.C97DF1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63988-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88CD664B9F0

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] v4l2 `m2m_dev` is freed while the shared interrupt handler rem=
ains active, causing a use-after-free.

Pre-existing issues:
- [High] Missing `synchronize_irq()` in runtime suspend and unsafe hardware=
 access in shared IRQ handler.
- [High] Out-of-order `pm_runtime_enable` and `platform_set_drvdata` causes=
 a NULL pointer dereference in `rga_runtime_resume`.
--

commit 56522d85947daeaf3327877b7e9e7555910847ab
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: use components to manage multiple cores

Use component helpers to manage multiple cores and aggregate them into a
central master device. This gives us a dedicated master device and
ensures that all cores (components) are properly set up before creating
the video device.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 15d095a1d1973..178f45b8da940 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
[ ... ]
> +static int rga_core_probe(struct platform_device *pdev)
> +{
> +	int ret =3D 0;
> +
> +	ret =3D component_add(&pdev->dev, &rga_core_ops);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register component: %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
This is a pre-existing issue, but can the initialization order leave the
driver vulnerable to sysfs-triggered PM transitions?

During probe, pm_runtime_enable() is called before the driver data is set:

drivers/media/platform/rockchip/rga/rga.c:
	pm_runtime_set_autosuspend_delay(core->dev, 50);
	pm_runtime_enable(core->dev);
	...
	platform_set_drvdata(pdev, core);

If a concurrent PM state transition to 'on' occurs (e.g., via a sysfs write)
before platform_set_drvdata() runs, the PM core will trigger
rga_runtime_resume().

Will this result in a NULL pointer dereference when dev_get_drvdata() is
called?

drivers/media/platform/rockchip/rga/rga.c:rga_runtime_resume() {
	struct rga_core *core =3D dev_get_drvdata(dev);

	return clk_bulk_prepare_enable(core->num_clks, core->clks);
}

[ ... ]
>  static int __maybe_unused rga_runtime_suspend(struct device *dev)
>  {
>  	struct rga_core *core =3D dev_get_drvdata(dev);
> @@ -933,7 +912,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
>  	return clk_bulk_prepare_enable(core->num_clks, core->clks);
>  }
> =20
> -static const struct dev_pm_ops rga_pm =3D {
> +static const struct dev_pm_ops rga_core_pm =3D {
>  	SET_RUNTIME_PM_OPS(rga_runtime_suspend,
>  			   rga_runtime_resume, NULL)
>  };

[Severity: High]
This is a pre-existing issue, but does this runtime suspend callback lack
a synchronize_irq() call?

When the hardware lacks an internal IOMMU, the driver requests a shared
interrupt line (IRQF_SHARED). If a shared interrupt fires while the device
is runtime-suspended, the interrupt handler rga_isr() unconditionally
reads hardware registers via rga_handle_irq() without verifying if the
device is powered on using pm_runtime_get_if_active().

Does disabling clocks here in rga_runtime_suspend():

drivers/media/platform/rockchip/rga/rga.c:rga_runtime_suspend() {
    ...
	clk_bulk_disable_unprepare(core->num_clks, core->clks);
    ...
}

allow the interrupt handler to execute mid-flight while the hardware is
powered down, potentially leading to a synchronous external abort?

[ ... ]
> +static void rga_unbind(struct device *dev)
> +{
> +	component_unbind_all(dev, NULL);
> +}

[Severity: Critical]
Does unbinding the master device cause a use-after-free in the active
interrupt handler?

Because the componentization moved the v4l2 m2m_dev allocation to the master
device, but the devres-managed IRQ request is on the core component device,
the shared interrupt handler rga_isr() remains active indefinitely.

When the master device is unbound, rga->m2m_dev is freed:

drivers/media/platform/rockchip/rga/rga.c:rga_unbind() {
    ...
	v4l2_m2m_release(rga->m2m_dev);
    ...
}

If a shared interrupt fires after the master is unbound, will rga_isr()
access the freed m2m_dev and rga structures when calling
v4l2_m2m_job_finish()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D9

