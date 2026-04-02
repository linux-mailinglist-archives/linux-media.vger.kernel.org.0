Return-Path: <linux-media+bounces-57945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JfrCiZbzmmgnAYAu9opvQ
	(envelope-from <linux-media+bounces-57945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:03:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58485388C27
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E51E8307CC57
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EDA3D4119;
	Thu,  2 Apr 2026 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eOt7mu+6"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546CE3A4517
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131228; cv=none; b=YtB0yQP6Mmf038ZIIaGn6fuSW0Au+y4YPy0Z0+0LRcei2LHtaZ6UYKkfoQPgfOacbPXW+f5tOhDrwfu3WFopT2M+xxHbbV0H3T6/yg2IwjInza/HWKiMYboafLJKhqbavM+g8WKwTyB8jg7d9Du/h6iiXPR8x8ZpqePQHNa9488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131228; c=relaxed/simple;
	bh=YQTNOWULEKJu7QXVb7cw5H0wOpBwIYQa4Pbqcfq12MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPHHH9Te570wbNhqmCdUqgcAVm+b3ftsF5ah2swsK7UrDEzn5QLRBNnC4RsNxDqI6xzArj1cgXudGBkss7j5u2cwEG5Z0QzuJWM5qNaMgptJDjfdWeqBxaLm72/zmhVAlXGSvU3B9Isz9blxiAfBwtFNuzXyysTprycVcIWtN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eOt7mu+6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775131218;
	bh=YQTNOWULEKJu7QXVb7cw5H0wOpBwIYQa4Pbqcfq12MA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eOt7mu+6YauexdjkZRLuk/FP/kcs9OSYwHGl5zvMUBfnmpXTZWYBzDOv6YBwp2ssq
	 PSpzGYjIy4MiWujlmmMeha1SuO3KkzcXshxiIK3Ev76tIgy4ypkBH1S1N4L/6LSkEa
	 Hr1XtVi2YY7NeHHKbbK2YUknUxyMtoQl0cw18Zci659c6HGxP5TJigGIoxWC2qugKA
	 J2SuITgqvMm0HaX3YqPD1bMFQQ04CVMZIObJWHwmmqgCas8egptveQhJcp5rlJ2hkk
	 KtjeXdEJcKRYS7eIVtVHAw9jrkJF1osmb+htmenUq2B90Z8yuUSZaipvXRYA3mtyIy
	 z81p2ZQ08DWXg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABA0617E66B7;
	Thu,  2 Apr 2026 14:00:17 +0200 (CEST)
Message-ID: <f16dc673-ef8a-4395-abcd-d44fc6b87fd3@collabora.com>
Date: Thu, 2 Apr 2026 14:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/22] media: v4l2-subdev: Allow accessing routes with
 STREAMS client capability
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
 <20260325105818.1176816-12-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260325105818.1176816-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57945-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 58485388C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 3/25/26 11:58, Sakari Ailus wrote:
> Disable access to routes when the STREAMS client capability bit isn't set.
> Routes aren't relevant otherwise anyway.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by <mirela.rabulea@nxp.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f8fde395a53a..647587c0499a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1020,6 +1020,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  
> +		if (!client_supports_streams)
> +			return -EINVAL;
> +
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>  
>  		copy_routes_state_to_routing(routing, state);
> @@ -1041,6 +1044,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  
> +		if (!client_supports_streams)
> +			return -EINVAL;
> +
>  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>  			return -EPERM;
>  


