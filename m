Return-Path: <linux-media+bounces-64255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WuMOIG42J2qGtQIAu9opvQ
	(envelope-from <linux-media+bounces-64255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:38:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADA65AB43
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:38:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="I7Vx/bwX";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64255-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64255-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A038302BB99
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 21:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF043AF675;
	Mon,  8 Jun 2026 21:38:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36BB39D6FD
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 21:38:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780954722; cv=none; b=oASS+EnQEB5X9D7iB76sjZlV9Jt8UTVVUq3PUaheErg39xvjclwrcKkCdGZRY9wk2tnHa+rIYUSt1MeAugk178vzfGyk9+gchZNLHURbIQnuQVuYDuFYBr4ZepeBqceLKGoqUgjXWZVM9xdE4jaXvAo14NDbo5mU9MCUDtqK//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780954722; c=relaxed/simple;
	bh=5JXR8VgzOKi+zItDiQvW0UXop8eh5y7eYtpM7x833eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpmC8fRJUEpZUkpj+kIv0OcthyVrUv/c5qnMHyl8ti8bPwBT7F5c6noYT71TG3dCQwLcJFbDuLAHNb2UJ8BPO58+esX7/QhYjg9ApYVaZRA/0m7lO3FBJ61ZNgsvs1wcVnh4+OJUEkgqdM3ifmX0lRU3eiVx2JZ6OAuB4/bHU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I7Vx/bwX; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 709328F;
	Mon,  8 Jun 2026 23:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780954690;
	bh=5JXR8VgzOKi+zItDiQvW0UXop8eh5y7eYtpM7x833eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7Vx/bwXvHyhGKZXdyzTi+YGWXE7s4eF7C/+oLvHKUNwdNb+mokGPyK3pq9X9v+cz
	 u3ygpEmPddWHMo+U5UxL0rrrvzsWmxtstZLiB01wtpq8dLJBKGQRmlAzIk3TfRqcJ8
	 ZRSbdAEzaty0NV6fMUh+kJs5LdbM6ybvAA+6Ln8M=
Date: Tue, 9 Jun 2026 00:38:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
Message-ID: <20260608213837.GB944266@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-4-sakari.ailus@linux.intel.com>
 <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-64255-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5ADA65AB43

On Mon, Jun 08, 2026 at 04:42:44PM +0100, Dave Stevenson wrote:
> On Sun, 7 Jun 2026 at 22:54, Sakari Ailus wrote:
> >
> > The rate_factor multiplier is used to multiply a few values in the
> > sensor's timing configuration and the exposure time is one of them. This
> > also needs to be taken into account in exposure time margin: multiply it
> > by rate_factor so that sensor's exposure time margin is respected.
> 
> Testing the 1640x1232 mode with FRM_LENGTH_A set to 0x288 (79.07fps),
> I can write register 0x15a (COARSE_INTEGRATION_TIME_A) with values up
> to and including 0x284 without it affecting the output frame rate, and
> without image corruption.
> With IMX219_EXPOSURE_OFFSET being 4, the current code implements
> exactly those limits, so why do you believe the offset should be
> increased?
> 
> To my mind section 5-5 Frame Rate Calculation Formula of the datasheet
> is fairly clear with
> [ In the case of (frame_length_lines - 4 > coarse_integration_time) ]:
> Frame_Length = frame_length_lines
> [ In the case of (frame_length_lines - 4 < coarse_integration_time) ]:
> Frame_Length = coarse_integration_time + 4
> 
> The register FRM_LENGTH_A (0x160) being in units of 2 lines doesn't
> change that calculation.

Readnig Jai's and your analysis, I agree. This patch should be dropped.

> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index d8fe7db18b6c..e681f80f9e3e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 int exposure_max, exposure_def;
> >
> >                 /* Update max exposure while meeting expected vblanking */
> > -               exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> > +               exposure_max = format->height + ctrl->val -
> > +                       IMX219_EXPOSURE_OFFSET * rate_factor;
> >                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >                                 exposure_max : IMX219_EXPOSURE_DEFAULT;
> >                 ret = __v4l2_ctrl_modify_range(imx219->exposure,

-- 
Regards,

Laurent Pinchart

