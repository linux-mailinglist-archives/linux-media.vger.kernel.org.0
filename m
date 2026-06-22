Return-Path: <linux-media+bounces-65348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nxhgE+YAOWoFlQcAu9opvQ
	(envelope-from <linux-media+bounces-65348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:31:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F56AE3D3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:31:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=u5OxTiNu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65348-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65348-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A125300D782
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 09:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D56939C019;
	Mon, 22 Jun 2026 09:30:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6BF1D9A66;
	Mon, 22 Jun 2026 09:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120632; cv=none; b=IjqF+nT9hfvRrpNN6DihxRvT4hSeuC4Dxvvwr383GqUAJWPm9sGD5nZVyGfKIN7C+5cR1uv0YXi9UZ0SpzQ5xneFWGPnniVzNRV/pZ2AaVF6VQoN7O/lpI8GRm11H/PL7L21O967r6K64hTJmdt/cVS0DBITqV9HwZcRpFIImZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120632; c=relaxed/simple;
	bh=2a2VMTpf3vWG5L13CFyNUDllSlGWHDIouzTK1f32Ztw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+LAlhXf7TM5CXU4IsRqdVjXOPFo4aBehhIRXNuQxREhAHQgc/SoHiSUSW4EzXFUk+o5QFbBRJaNYt2Md5JGKRsfho3Q/Cq5GvIpt9i86wbGDxM2Qften2DUQKr5scpPFC1EBG6McAUAFfvBWo7A4KjnK2+w193iOLlLHN/PgX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u5OxTiNu; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 963DF7CA;
	Mon, 22 Jun 2026 11:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782120591;
	bh=2a2VMTpf3vWG5L13CFyNUDllSlGWHDIouzTK1f32Ztw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5OxTiNulD6+ybhteC83AXXKaMCS+vIOVSetGyI0+rKIVsgHdHMNKPfWam+mKq5of
	 Yyh6ACveVhpWstQU1axPGIpdspfGpH1HLEp9BU64Im+GtmfJXcUrqY8ph3U4pQoZ45
	 KHGVBd0TWNoZA+r3ueQUbfwn9KBKDYvBuMpTEWCo=
Date: Mon, 22 Jun 2026 11:30:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] media: i2c: vd55g1: Remove spurious pad format
 update on init_state()
Message-ID: <ajkAdol1szOK_XPB@zed>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-2-4f745a83b87e@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-vd55g4_and_fixes-v1-2-4f745a83b87e@foss.st.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65348-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D3F56AE3D3

Hi Benjamin

On Tue, Apr 28, 2026 at 10:40:56AM +0200, Benjamin Mugnier wrote:
> vd55g1_update_pad_fmt() is called in vd55g1_init_state(). But
> vd55g1_set_pad_fmt(), called at the end of vd55g1_init_state(), also
> calls vd55g1_update_pad_fmt() itself.
>
> Enhance readability and clear confusion by only preparing the format in
> vd55g1_init_state() and let vd55g1_set_pad_fmt() update it instead,
> effectively calling it only 1 time instead of 2.
>
> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")

Does this qualify as a fix ?

I think you could maybe squash it with the previous one if you want
also this change to be backported as part of a larger fix

>
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  drivers/media/i2c/vd55g1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 1e9db21322e3..e44174056ace 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1366,9 +1366,9 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>  	else
>  		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
> -	vd55g1_update_pad_fmt(sensor,
> -			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
> -			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
> +	fmt.format.code = vd55g1_get_fmt_code(sensor, code);
> +	fmt.format.width = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].width;
> +	fmt.format.height = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].height;
>
>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>  }
>
> --
> 2.43.0
>
>

