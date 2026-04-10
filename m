Return-Path: <linux-media+bounces-58537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGF2KanR2GngiQgAu9opvQ
	(envelope-from <linux-media+bounces-58537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:32:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 193073D5B2E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EEAC300559E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A24B37BE81;
	Fri, 10 Apr 2026 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kJqS18si"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7833DEE0
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817126; cv=none; b=DVjWp101iAy9XFGU1TAZlrf3JwUrB5JoJCBcH/bXr7hb4nfRWi7Tq276UNHz+Y6atHSSvorIKQEiMnDXN8yqi7JDzdizojHhFPXIL//5TaFEGCiLVOCIBvpZuUrpv7/tkRWHYAOygwxR6oJnjxOP51zaldpGHnIC1JaQ9OySEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817126; c=relaxed/simple;
	bh=9bJRjJRUvFZGVfQGr3D0y3mYbUqlHSsVyanL/RwGwzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UATul9NFRJymIV5MZnW9xO2KccXMZFL1le0SM8t8JGzynpes4DoBGOas9bL7PILi+vYmThW6fu5pYgiIO+D8eQU2qZZW22vPeJTSDO3fMUiEeZN8NpzlgxZfzPdba2e7fQY5aF1Sdc2zd9heWy8GXHN1bzvSrQFCMQVvemSG3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kJqS18si; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD82B1E7;
	Fri, 10 Apr 2026 12:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775817032;
	bh=9bJRjJRUvFZGVfQGr3D0y3mYbUqlHSsVyanL/RwGwzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJqS18sirDME1ny4u4Sndl7YFYM6ys6qp55dZHprlrOSGYYrdypnDNnwgBVspvP6d
	 FHnpZRSIQzTPvFcQe6Bcux9EAKtCBZrcgeB/gZAd01s5EOM1sZKS55agGPlqCd18M0
	 ZqopNLa3Mzi8qQQqnSM3PdfTVw/LrGEjYkskq+DU=
Date: Fri, 10 Apr 2026 12:31:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <adjPiWt-UFsf0h7h@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-22-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58537-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 193073D5B2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:30PM +0300, Sakari Ailus wrote:
> The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> flags that are set by the driver are correctly set as the driver expects.

I would

The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
flags that are not configurable are not modified by userspace.

> This poses a problem for adding new flags as programs could not work with
> links that have unknown flags even when the use of these flags wouldn't
> affect the program.
>
> Ignore the non-settable link flags.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 717569bd1a8c..287eded356bb 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
>
>  int __media_entity_setup_link(struct media_link *link, u32 flags)

Let me get this right: "link" comes from userspace. "flags" are the
flags set by driver when creating the link, right ?

>  {
> -	const u32 mask = MEDIA_LNK_FL_ENABLED;
> +	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
>  	struct media_device *mdev;
>  	struct media_pad *source, *sink;
>  	int ret = -EBUSY;
> @@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
>  	if (link == NULL)
>  		return -EINVAL;
>
> -	/* The non-modifiable link flags must not be modified. */
> -	if ((link->flags & ~mask) != (flags & ~mask))
> -		return -EINVAL;
> +	/* Only allow changing user-settable flags. */
> +	flags &= settable_flags;
> +	flags |= link->flags & ~settable_flags;
>
>  	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)

If my above understanding is correct and if you drop the above check,
doesn't this mean userspace can now clear MEDIA_LNK_FL_IMMUTABLE ?

Should link->flags be replaced by "flags" here ?

>  		return link->flags == flags ? 0 : -EINVAL;

And this should probably be changed as well. Unfortunately, if we
want to allow userspace to ignore the forthcoming MEDIA_LNK_FL_VALIDATE_LATE
flag I guess we need to make it an exception (which is not great, I know).

Hope I got it right...

> --
> 2.47.3
>
>

