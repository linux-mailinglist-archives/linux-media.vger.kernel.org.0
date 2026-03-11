Return-Path: <linux-media+bounces-55351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OF9L+kwsWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:07:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F23260004
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A3B1300E5B1
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C473C5DAE;
	Wed, 11 Mar 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hVMxNeBT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F73B6C08;
	Wed, 11 Mar 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220014; cv=none; b=PWMpmc1gMfJ6FSpRBH2fUHrxTvth8vIpQ4l04z0ywEUifWEiqoFi/C6DfSuzINxatr1LmgIvklliQryu7sTqOZEbAX/VpTNZKK9LxyH+XPKyhH+6lZKyI8ZgAkxQ7EZyaZHAirpola+TbudwYg50quZ33YdKSxhGefHHN98q2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220014; c=relaxed/simple;
	bh=GvzHHFmfHHTV4U8O4ckrd0CIIos+xBiqDHrzOgrdc9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s96Nceobly7Zf6ejxYQy6EYBzwYM3lqayFB8nyTBLIYYiwFPBi9F6KircnslzdPza/1n4iGGORJRDj6PSTyyWv+q7vJ87aoLtOT9u7Qv60d30mJ8Tu8w4Lu/09dROVfV0NWQuqqAWzDyYaEev7FgASGB+HxF0xgdrOex9tJWoIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hVMxNeBT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BACBC4B3;
	Wed, 11 Mar 2026 10:05:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773219938;
	bh=GvzHHFmfHHTV4U8O4ckrd0CIIos+xBiqDHrzOgrdc9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVMxNeBTxMzfd4VTIRet4IlIVYaRqMsxIq/3l9/ZQjZWx243gR+teeC4o0zoO6nq4
	 oX7dbipKt5JdxLf5olrW6t0WhdPWXMAx2+QaRWjI0BXZIbpYyE4bjNLA/F8dNURxQb
	 ++13vlhhExVrdesJlbGm+uvn5xhFEqXdukeAoLDM=
Date: Wed, 11 Mar 2026 10:06:30 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
Message-ID: <abEwF39-dSVPWVAb@zed>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
 <0a8c0467-04f7-4b8f-8988-cb5665ca1d68@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a8c0467-04f7-4b8f-8988-cb5665ca1d68@ideasonboard.com>
X-Rspamd-Queue-Id: 61F23260004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55351-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Tomi

   I intend to send out soon a series for other Renesas components
which shouldn't be controversial. If I can get tags quickly I intend
to send a pull request for v7.0 next week.

I can include this patch and your other one which I don't see collected yet:
[PATCH] media: renesas: vin: Fix RAW8 (again)

unless someone else intends to handle it.

On Wed, Mar 11, 2026 at 08:15:43AM +0200, Tomi Valkeinen wrote:
> Hi,
>
> Ping. Would be good to have this fix merged.
>
>  Tomi
>
> On 15/01/2026 11:22, Tomi Valkeinen wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > When unloading the module on gen 4, we hit a NULL pointer dereference.
> > This is caused by the cleanup code calling vsp1_drm_cleanup() where it
> > should be calling vsp1_vspx_cleanup().
> >
> > Fix this by checking the IP version and calling the drm or vspx function
> > accordingly, the same way as the init code does.
> >
> > Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > index 6c64657fc4f3..30df9b36642d 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > @@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device *vsp1)
> >  		media_device_unregister(&vsp1->media_dev);
> >  	media_device_cleanup(&vsp1->media_dev);
> >
> > -	if (!vsp1->info->uapi)
> > -		vsp1_drm_cleanup(vsp1);
> > +	if (!vsp1->info->uapi) {
> > +		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> > +			vsp1_vspx_cleanup(vsp1);
> > +		else
> > +			vsp1_drm_cleanup(vsp1);
> > +	}
> >  }
> >
> >  static int vsp1_create_entities(struct vsp1_device *vsp1)
> >
> > ---
> > base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> > change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e
> >
> > Best regards,
>

