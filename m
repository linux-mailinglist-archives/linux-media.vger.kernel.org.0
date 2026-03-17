Return-Path: <linux-media+bounces-56163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAUcI7TiuWmnPAIAu9opvQ
	(envelope-from <linux-media+bounces-56163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 00:24:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0F2B4470
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 00:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AF36302B4C9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 23:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED5634FF4D;
	Tue, 17 Mar 2026 23:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lTgAx5wo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A53A63FB;
	Tue, 17 Mar 2026 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789835; cv=none; b=MdNgq5dYV40I3/HJhdmoxy5Zz3lA823lpy6VLltz+w+JtKR8sL176X0ZsSf0rCiLHowpOUJPrbdsSdrtU2rtf/U4lHr3xE9Bxg7WK7ZbpTgbZbwUAMF4SdbzHmHKCLyMH8cajDbRXC6duWD8HadL0GjOQ+z7n67OhiYthK0XMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789835; c=relaxed/simple;
	bh=Fw+uM4wTTXCSRR9MahDnwSuow3iiEXTBETD9qPOq2BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLfTyRLpN2FmV9UeiMcBM35n+9OUwr15yeirLmww18qC2ERdYG5I7oCq6ZUsiP+ZMOKKm2xishTwrcbN4p3ax8js2DA+LzDmUTgIXGlGceTB6ygO2M9ZSK8KBjOkH9PzqAgjOaFJP3O7tXskjKXucJJUr1rYL2l0RPVLngc/y9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lTgAx5wo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 48367B3;
	Wed, 18 Mar 2026 00:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773789758;
	bh=Fw+uM4wTTXCSRR9MahDnwSuow3iiEXTBETD9qPOq2BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTgAx5woBeOApOsVWgf5AwBCZeboTmY1rtwbqicrrOyNrOkDXN71bs7OC0HKJIAOP
	 e/xHZ2AHauxAnMgEBR420X+ITeCr44t1jHqGJQbGwLVyR4CH0pP6hRGuHFv9Sf/l2N
	 TrvjxDHHczV4cljEyABQSdWBc6hFS+zAJN95sITY=
Date: Wed, 18 Mar 2026 01:23:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Move suspend/resume handling to
 LATE phase
Message-ID: <20260317232349.GC408929@killaraus.ideasonboard.com>
References: <02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,ideasonboard.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56163-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,renesas.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 4CC0F2B4470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

Thank you for the patch.

On Fri, Dec 12, 2025 at 01:11:50PM +0100, Tommaso Merciai wrote:
> Switch the VSP1 driver's dev_pm_ops to LATE_SYSTEM_SLEEP_PM_OPS to ensure
> that suspend and resume callbacks are executed after DSI/DU suspend and
> before DSI/DU resume.

Have you considered handling this through device links ? Using late
system sleep is a hack that doesn't scale when more than two devices are
involved.

I've just written and posted [1] to address the issue in the rcar-du
driver (the suspend/resume ordering was right, but apparently only by
chance), it should be easy to replicate it in the rz-du driver..

[1] https://lore.kernel.org/dri-devel/20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com/T/#u

> This prevents timeouts and vblank wait errors during
> system resume, such as:
> 
> [drm] *ERROR* flip_done timed out [CRTC:43:crtc-0] vblank wait timed out
> 
> This addresses display commit and vblank timeouts seen with DRM atomic
> helpers during s2ram.
> 
> Co-developed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 2de515c497eb..0fbd27df1f46 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -693,7 +693,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops vsp1_pm_ops = {
> -	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
> +	LATE_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
>  	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
>  };
>  

-- 
Regards,

Laurent Pinchart

