Return-Path: <linux-media+bounces-64167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IvYgGeuMJmpzYgIAu9opvQ
	(envelope-from <linux-media+bounces-64167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:35:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC1654A3E
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=QN6HUd0B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64167-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64167-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1456A304DBAC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986543B4EA9;
	Mon,  8 Jun 2026 09:29:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42843B4EAB
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:29:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910962; cv=none; b=mpM+iHyC1PumiqcbHpao2JkIntteU5pI0oy8G/9/vblEzH75pKQ9zJ+f5GrV1WEymgnPIzGhBlKCazr8T70yZkr/RKpk0hEVd9We8vOPUMwHhhS3dpbMAHgVKtmzM1P4aRDvgWJIsFkKa2CPxS0Z87pFEzpw6QXjLF/QPfGVIKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910962; c=relaxed/simple;
	bh=YMbphauo4ulRjqySEBCfY+b9QqGpDXjkD2V2cDTynUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYa3S/C8ftKWJEHG27WcEnnyFZHDfomY78BRJoQntysLCaA44VzqHKv4bF54kELMjFWjMAjb/0qsMlCkQPZzTY1Owwvxhdi3XzGGEZMWYi/jjo2UAWkXmNTy+xuDoAgMEoPIiig9YQ86Ptti/aAj0hjr65v2faOzY1DjCQTFq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QN6HUd0B; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A72B2D7;
	Mon,  8 Jun 2026 11:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780910930;
	bh=YMbphauo4ulRjqySEBCfY+b9QqGpDXjkD2V2cDTynUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN6HUd0Bs62wvlJEmXOa1nJvu0h1nWZPL6DvAkMypH3h72t8+xHlDuWjMRzQKekcj
	 AUNNmnZP1aFsDM/9hjIgEFLSKrqqwr8dB7EYvE4eagPlAMRe0n5HyLeH7XGMKfOUwJ
	 Pt/xJwPbmam1G5c/kVQjl1RWFJ84W+0TvHoiaJz4=
Date: Mon, 8 Jun 2026 12:29:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 07/10] media: Improve enable_streams and
 disable_streams documentation
Message-ID: <20260608092916.GC772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-8-sakari.ailus@linux.intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64167-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFDC1654A3E

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:53AM +0300, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  include/media/v4l2-subdev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 0361c8bbee38..a25234befbe9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -828,6 +828,10 @@ struct v4l2_subdev_state {
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
>   *
> + *	Starting the requested streams may require starting additional
> + *	streams. Streams that are started and stopped together due to hardware
> + *	are called a stream group.

This is too vague. "may require starting additional streams" can be
understood as the driver starting more streams than the requested ones,
or as the caller having to start more streams before the requests
streams are effectively started.

Here's a proposal to clarify the documentation:

 * Due to device constraints, starting the requested streams may result in
 * additional streams also being started by the driver. Streams that are started
 * and stopped together due to the nature of the hardware are called a stream
 * group.

"hardware" may be a bit restrictive, I wonder if those constraints could
also sometimes come from the software implementation instead of being
pure hardware constraints. I think it's fine for now though, we can
clarify this later if needed.

> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
> @@ -837,6 +841,10 @@ struct v4l2_subdev_state {
>   *	Drivers that support only a single stream without setting the
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
> + *
> + *	Stopping the requested streams may be delayed due to other enabled
> + *	streams in the stream group, where all streams are started and stopped
> + *	together.

This is better. I would have written

 * When the requested stream are part of a stream group, they will be stopped
 * once all streams in the group are stopped.

to make it clearer that the streams won't be stopped immediately ("may"
in the original text implies they may or may not be stopped
immediately), but I'm also OK with your text.

>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart

