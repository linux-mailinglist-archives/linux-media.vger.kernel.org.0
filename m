Return-Path: <linux-media+bounces-63983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EmJ4IctMI2qSoQEAu9opvQ
	(envelope-from <linux-media+bounces-63983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:25:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD564BA02
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:25:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=abuDWqRz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63983-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63983-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB0C1301CCF5
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C82390CA9;
	Fri,  5 Jun 2026 22:22:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B9256C84
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698156; cv=none; b=gzAkq05p5MdGU7ydkDxwPyXlfa1BNEPc4931jqwWwKiBmS3z49UUHQGPhbtLuxIo97iYpx6ZNbpB8ArLu9cc21cSw4OyV8ZlLsJFaLkobTRyphG9eulX/+uXMsVxlbn1ATiP+y0Sz30bPEz3yDRZPjxHi0szkOB+bQKqjc123iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698156; c=relaxed/simple;
	bh=LKIKh66NkBrz0AAwTqQZEI7Dkl9lactpb7vUO64cgxA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pm2hQDZvHRxKrcyRTy6Th9Tc36zvTEnsVksndOVqbDneDVqe0MUeH6ojZKxHvJhjTZUIz/ikIYn4C1YgXB3guY2fFuGft+ELyqBwmeSwZEx1JdIbQkkyu9bwNLUwAf35nIuIBLD7NezvNTef459tDGkYbulz6SmUKnfFwGDgiiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abuDWqRz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6930A1F00893;
	Fri,  5 Jun 2026 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698154;
	bh=zqOhd0Mx2WAc/92E8MIb+IKDjoOrqHD4LWN1Nk0ZllY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=abuDWqRzA5Ru/EGyP8Pb+ksIQkvWxRKAv8KfhY4EzG5ifVjhCedFrWxC7snt+HyAR
	 DB5EMz0PYFuC6dIhYdgeihTOVOSA6QkxCQvGNDPVw5M00NH0MYsK7DMcNi2jMRphZl
	 dAl4ZZ2WOhhhWAjbeUqOlUJOsmFLqXheXMgpAR6ThdmN0T4GIMQ2styT3qt9qGXV/z
	 4S66DXxhbHCrMQ7Wni8Z7IUo0CdYS7CaLX2xiVB0j1h9nX6gynddzBWEedeJBn7k4M
	 DFRaLkt9dW6L28RGf8kMgrr5aJdB2M797S7xy8n78yUIfcJ3PJPgxYNPEH86qy64Fq
	 bJ4VHvdPZQm6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/17] media: rockchip: rga: add rga_core structure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-8-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-8-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:22:34 +0000
Message-Id: <20260605222234.6930A1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63983-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,pengutronix.de:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6AD564BA02

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL pointer check for devm_kzalloc allocation

Pre-existing issues:
- [High] Shared IRQ handler accesses suspended hardware and dereferences NU=
LL context
- [High] Missing synchronize_irq() in runtime suspend with shared interrupts
- [High] Race condition between pm_runtime_enable and platform_set_drvdata
- [High] Use-After-Free during module removal due to incorrect teardown ord=
ering
--

commit 1e1c3cc644587ad2255c5349765b3893e811a0e9
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: add rga_core structure
   =20
Add a rga_core structure to separate the core specific data from the
m2m device. This is done in preparation for multi-core support.

> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c

[ ... ]

> @@ -447,36 +447,34 @@ static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
> -static bool rga_handle_irq(struct rockchip_rga *rga)
> +static bool rga_handle_irq(struct rga_core *core)
>  {
>  	int intr;
> =20
> -	intr =3D rga_read(rga, RGA_INT) & 0xf;
> +	intr =3D rga_read(core, RGA_INT) & 0xf;
> =20
> -	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> +	rga_mod(core, RGA_INT, intr << 4, 0xf << 4);
> =20
>  	return intr & RGA_INT_COMMAND_FINISHED;
>  }

[Severity: High]
This is a pre-existing issue, but does this handle spurious interrupts
correctly when the hardware is suspended?

If an interrupt arrives on the shared IRQ line while the device is suspende=
d,
the clock-gated hardware typically returns 0xffffffff for rga_read(). The
bitwise AND with RGA_INT_COMMAND_FINISHED will incorrectly evaluate to true.

The handler would then proceed in rga_isr():

    struct rga_ctx *ctx =3D core->curr;
    WARN_ON(!ctx);
    core->curr =3D NULL;
    src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);

If no job is active, core->curr is NULL, and dereferencing ctx->fh.m2m_ctx
will cause a kernel panic. Should we verify the PM state before hardware
access in the ISR using pm_runtime_get_if_active()?

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -799,20 +803,25 @@ static int rga_probe(struct platform_device *pdev)
>  	if (!rga->hw)
>  		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n"=
);
> =20
> -	rga->dev =3D &pdev->dev;
>  	spin_lock_init(&rga->ctrl_lock);
>  	mutex_init(&rga->mutex);
> =20
> -	ret =3D rga_parse_dt(rga);
> +	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +	core->rga =3D rga;
> +	core->dev =3D &pdev->dev;

[Severity: High]
Could this lead to a NULL pointer dereference? If devm_kzalloc() fails and
returns NULL, assigning core->rga =3D rga in the next line will immediately
crash. A check like "if (!core) return -ENOMEM;" appears to be missing here.

> +
> +	rga->cores[0] =3D core;
> +
> +	ret =3D rga_parse_dt(core);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
> =20
> -	pm_runtime_set_autosuspend_delay(rga->dev, 50);
> -	pm_runtime_enable(rga->dev);
> +	pm_runtime_set_autosuspend_delay(core->dev, 50);
> +	pm_runtime_enable(core->dev);
> =20
> -	rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(rga->regs)) {
> -		ret =3D PTR_ERR(rga->regs);
> +	core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->regs)) {
> +		ret =3D PTR_ERR(core->regs);
>  		goto err_put_clk;
>  	}

[ ... ]

> @@ -852,7 +861,7 @@ static int rga_probe(struct platform_device *pdev)
>  	video_set_drvdata(vfd, rga);
>  	rga->vfd =3D vfd;
> =20
> -	platform_set_drvdata(pdev, rga);
> +	platform_set_drvdata(pdev, core);

[Severity: High]
This is a pre-existing issue, but does this create a race condition window
between pm_runtime_enable() and platform_set_drvdata()?

If a PM transition occurs right after pm_runtime_enable(core->dev), the
runtime PM callbacks like rga_runtime_suspend() might execute before
platform_set_drvdata(pdev, core) is called.

In rga_runtime_suspend(), dev_get_drvdata() would return NULL, leading to a
crash when attempting to access core->num_clks.

[ ... ]

> @@ -904,23 +914,23 @@ static void rga_remove(struct platform_device *pdev)
>  	video_unregister_device(rga->vfd);
>  	v4l2_device_unregister(&rga->v4l2_dev);
> =20
> -	pm_runtime_disable(rga->dev);
> +	pm_runtime_disable(core->dev);
>  }

[Severity: High]
This is a pre-existing issue, but could this teardown sequence result in a
use-after-free vulnerability?

Calling v4l2_m2m_release(rga->m2m_dev) (which occurs just before the quoted
lines) before video_unregister_device() leaves the video node accessible to
userspace after the m2m_dev structure has been freed. Concurrent V4L2 ioctls
from userspace might then interact with freed memory.

>  static int __maybe_unused rga_runtime_suspend(struct device *dev)
>  {
> -	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +	struct rga_core *core =3D dev_get_drvdata(dev);
> =20
> -	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
> +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but are we missing a call to synchronize_irq()
before powering down the hardware?

Since the driver can request a shared interrupt line (IRQF_SHARED), disabli=
ng
the clocks without waiting for mid-flight IRQ handlers to finish might resu=
lt
in bus errors or crashes if another device triggers the shared IRQ while
suspending.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D8

