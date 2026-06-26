Return-Path: <linux-media+bounces-65691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ni3mJ5QwPmrRBAkAu9opvQ
	(envelope-from <linux-media+bounces-65691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:56:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 154D66CB2A4
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:56:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=MAJ9dRMZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65691-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65691-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99FA93009B35
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 07:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B943E3DB3;
	Fri, 26 Jun 2026 07:55:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CD3D4137;
	Fri, 26 Jun 2026 07:55:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460553; cv=none; b=EnXQprHCv/e/fWkfSGGhUsoeY+kXQaYTqArw0al8puzenWKxZw8OVmjfeQWmZn8IUMFZHTtVvIA5TenD0ZCguZW5LzeHEQSUqGCfeuXSgygUjhyu6CAh+a5MaTyyv/cB/gnBMgx3+iQqSiF/oV3FPG/hIpToRhrGnM1aRJPasE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460553; c=relaxed/simple;
	bh=k7nPlzqmD9L1ggtu4r73B/3FtxWoY3tnU1WA0RZF12I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fESDvrNhNwpj1/JJsSsUVMleOh5wz2P+ade7xzcQjHVfDOytw2ADPYkCA/yAFpuvydfuFzmEhwYD81I04mLt4OuKqmWsz2FyNRuCBvVhXP/VOzInZF9J9nLsWPYop2MzU7vLs2Wl0jfAttBW194qbMxukkhQ+c3SWvooBEypS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MAJ9dRMZ; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1999F9C;
	Fri, 26 Jun 2026 09:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782460508;
	bh=k7nPlzqmD9L1ggtu4r73B/3FtxWoY3tnU1WA0RZF12I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAJ9dRMZKT0XzHZxuytmEKX7EXzIIYko4bzosB3DnhxiAeprXaVcI/6yegdqU05sK
	 ro2LM+0xiqPHuRBlabrS6L55tfYXcoemQhqML80YjXwPpcSxaQgiUyhfNs1j9mZzpc
	 7lI56bcwYsf68to6wQPHhY49vUIkzU+2MlsLpHig=
Date: Fri, 26 Jun 2026 09:55:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] media: i2c: vd55g1: Fix media bus code initialization
Message-ID: <aj4u42ppuHSRqLIn@zed>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-1-4f745a83b87e@foss.st.com>
 <ajj90hhNwx7bLkOZ@zed>
 <f51d5d21-54fb-444a-9ae9-9b60e7a500f1@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f51d5d21-54fb-444a-9ae9-9b60e7a500f1@foss.st.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65691-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:benjamin.mugnier@foss.st.com,m:jacopo.mondi@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,st.com:email,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 154D66CB2A4

Hi Benjamin

On Thu, Jun 25, 2026 at 01:41:48PM +0200, Benjamin Mugnier wrote:
> Hi Jacopo,
>
> Thank you for your review.
>
> Le 22/06/2026 à 11:28, Jacopo Mondi a écrit :
> > Hi Benjamin
> >
> > On Tue, Apr 28, 2026 at 10:40:55AM +0200, Benjamin Mugnier wrote:
> >> In the driver initialization, the index of the default media bus code
> >> from the supported media bus code array is passed directly to the
> >> vd55g1_get_fmt_code() function instead of the proper media bus code.
> >>
> >> This works correctly as a proper media bus code is set after
> >> initialization but could not have been the case. This also resulted in
> >> mutliple "Unsupported mbus format" error messages.
> >>
> >> Retrieve the media bus code from the media bus code array, and pass this
> >> media bus code to vd55g1_get_fmt_code() instead of the code index.
> >>
> >> Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF and
> >> VD55G1_MODE_DEF to VD55G1_MODE_IDX_DEF while at it to avoid future
> >> confusions. Display the guilty error code in warning message.
> >>
> >> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
> >>
> > You should cc stable for fixes
> >
> > Cc: stable@vger.kernel.org
> >
>
> We talked about this very recently and somehow I still forgot.
>
> >
> > The CI should have flagged that, but for some reason it didn't run
> > properly on your series
> > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1655147
> >
> >> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> ---
> >>  drivers/media/i2c/vd55g1.c | 17 +++++++++++------
> >>  1 file changed, 11 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> >> index 78d18c028154..1e9db21322e3 100644
> >> --- a/drivers/media/i2c/vd55g1.c
> >> +++ b/drivers/media/i2c/vd55g1.c
> >> @@ -114,9 +114,9 @@
> >>
> >>  #define VD55G1_WIDTH					804
> >>  #define VD55G1_HEIGHT					704
> >> -#define VD55G1_MODE_DEF					0
> >> +#define VD55G1_MODE_IDX_DEF				0
> >>  #define VD55G1_NB_GPIOS					4
> >> -#define VD55G1_MBUS_CODE_DEF				0
> >> +#define VD55G1_MBUS_CODE_IDX_DEF			0
> >>  #define VD55G1_DGAIN_DEF				256
> >>  #define VD55G1_AGAIN_DEF				19
> >>  #define VD55G1_EXPO_MAX_TERM				64
> >> @@ -634,7 +634,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
> >
> > Unrelated, but it seems you now have 2 codes for MONO. Does
> >
> > 	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> > 		return code;
> >
> > need an update ?>
>
> Not in this patch because it does not add the new MONO sensor, but in

Not in this patch ofc

> 4/5 I separated the model ID from the color code. Example for the vd55g4 :
>
>   .name  = "vd55g4",
>   .id    = VD55G1_MODEL_ID_3,
>   .color = VD55G1_COLOR_VERSION_MONO,
>
> So the patch 4/5 updates the previous 'if' you mentioned to check the
> color member instead of the model :
>
>   if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>
> Which IMO is a good way to handle this problematic. Tell me if you're
> thinking about something else.
>

Yes, I was thinking about the unconditional return of 'code'.

You know have two mono codes, shouldn't you do the same as you do with
the bayer ones ?

> >>  				goto adapt_bayer_pattern;
> >>  		}
> >>  	}
> >> -	dev_warn(sensor->dev, "Unsupported mbus format\n");
> >> +	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
> >>
> >>  	return code;
> >>
> >> @@ -1347,6 +1347,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
> >>  {
> >>  	struct vd55g1 *sensor = to_vd55g1(sd);
> >>  	struct v4l2_subdev_format fmt = { 0 };
> >> +	int code;
> >>  	struct v4l2_subdev_route routes[] = {
> >>  		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
> >>  	};
> >> @@ -1361,9 +1362,13 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
> >>  	if (ret)
> >>  		return ret;
> >>
> >> -	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
> >> -			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
> >> -			      &fmt.format);
> >> +	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> >> +		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
> >> +	else
> >> +		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
> >
> > Being this a multi-dimensional array, I don't seem much value in
> > defining VD55G1_MBUS_CODE_IDX_DEF if this is the only place where it
> > is used. What's the meaning of VD55G1_MBUS_CODE_IDX_DEF for
> > vd55g1_mbus_formats_bayer ? Does it represent the bitwidth or does it
> > represent the bayer pattern ?
>
> For vd55g1_mbus_formats_bayer, the first dimension of the array is the
> bitwidth, and the second one is the bayer pattern.
>
> >
> > I would rather define a
> > VD55G1_DEF_MBUS_CODE_MONO       MEDIA_BUS_FMT_Y8_1X8
> > VD55G1_DEF_MBUS_CODE_BAYER      MEDIA_BUS_FMT_SRGGB8_1X8
> >
> > Or maybe do
> >
> > 		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF]
> >                                                 [VD55G1_MBUS_CODE_IDX_DEF];
> >
> > if easier.
> >
> > I understand it's a minor, so up to you.
>
> As you mentioned it's only used here. I won't mind removing
> VD55G1_MBUS_CODE_IDX_DEF entirely and do :
>
>   code = vd55g1_mbus_formats_bayer[0][0];
>
> Does that sound okay ?
>

It does, thanks

> >
> >
> >
> >> +	vd55g1_update_pad_fmt(sensor,
> >> +			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
> >> +			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
> >>
> >>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
> >>  }
> >>
> >> --
> >> 2.43.0
> >>
> >>
>
> --
> Regards,
> Benjamin
>

