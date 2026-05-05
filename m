Return-Path: <linux-media+bounces-60497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO2GApN6+mlePQMAu9opvQ
	(envelope-from <linux-media+bounces-60497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 01:17:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B14D4A03
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 01:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72EB30376A3
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 23:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DC63368B8;
	Tue,  5 May 2026 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fZB7KleA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09722139C9;
	Tue,  5 May 2026 23:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778023039; cv=none; b=Ico6T6Wu/i1/IGElBqLTYuIjPCnXkoiM7YiU5dhfOZQP2tfE5bUIujwUDydyf4k0262TT+tjbLjqovvT9wDl07Htfv24EkaeGp7Ni8+8nG/5k98vLv3FrpBenGNcmernHSxxugln+ivOfzPm2vhqFxWp/hWd4mvATvWS58+b7ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778023039; c=relaxed/simple;
	bh=c8M4maA60WNCneZAUPBVL/CCdJLUgPwcYyV/VxFNqZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfEiIHLRieJDKWauPZBrLEvPIngf6hiteAmpQpWZPURpWgQTi8zsE6F2q/+wLG7kpZGhywHU3BMxWpy2cmjAX2bC1AorEddd+/NvMiNVxZLY5vB4sYAILVq01JWvYV3U2E/bxKMQDM9OGIeMdtEKefG5FG+BEmhGCp8IzUpUn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fZB7KleA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 378855B2;
	Wed,  6 May 2026 01:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778023033;
	bh=c8M4maA60WNCneZAUPBVL/CCdJLUgPwcYyV/VxFNqZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZB7KleAbE0ZRbNifz1iPnPMN4zO3FVFoahmaezfmomNKG42PGkqibhPYIADotQ7E
	 l6i3HhOailRhn6ISJwXYLyxVT8Z4wSBd17wx5aXXBI8X59pv714ceZNtWrPJZNEAXX
	 M5EsVgrVDoY8EDvozIJikaGBl6rrmirZjihRgwuQ=
Date: Wed, 6 May 2026 02:17:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Message-ID: <20260505231714.GF1598374@killaraus.ideasonboard.com>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>
 <afhH8Fq_7bIy3Lv3@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afhH8Fq_7bIy3Lv3@zed>
X-Rspamd-Queue-Id: 996B14D4A03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-60497-lists,linux-media=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]

On Mon, May 04, 2026 at 09:19:30AM +0200, Jacopo Mondi wrote:
> On Mon, May 04, 2026 at 06:54:09AM +0000, Ricardo Ribalda wrote:
> > Avoid invalid memory access if the zones_num is bigger than
> > zone_weight.
> >
> > This patch fixes the following smatch errors:
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> >
> > Cc: stable@vger.kernel.org
> > Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > index 6f9ca7a7dd88..aec3eed0e443 100644
> > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> >  	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> >
> >  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > +	if (zones_num > C3_ISP_AWB_MAX_ZONES)
> > +		zones_num = C3_ISP_AWB_MAX_ZONES;
> 
> Or
>         zones_num = min(cfg->horiz_zones_num * cfg->vert_zones_num,
>                         C3_ISP_AWB_MAX_ZONES);

I have a slight preference for that, but both options work for me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Whatever you prefer:
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >
> >  	/* Need to write 8 weights at once */
> >  	for (i = 0; i < zones_num / 8; i++) {
> > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> >  	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> >
> >  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > +	if (zones_num > C3_ISP_AE_MAX_ZONES)
> > +		zones_num = C3_ISP_AE_MAX_ZONES;
> >
> >  	/* Need to write 8 weights at once */
> >  	for (i = 0; i < zones_num / 8; i++) {

-- 
Regards,

Laurent Pinchart

