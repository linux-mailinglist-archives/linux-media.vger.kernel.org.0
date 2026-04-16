Return-Path: <linux-media+bounces-58944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BUvGGwf4Wl0pQAAu9opvQ
	(envelope-from <linux-media+bounces-58944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:42:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A141315A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D89F302FC17
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F70132D438;
	Thu, 16 Apr 2026 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iJCLJKuQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489031A061
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361108; cv=none; b=BqS2UkTug9C9TqCk3vL3i/DbzOvHjWJl4THkEzrdgAdzxTUDjnl7AFO4n33HslOBzcI934DzMJu/Cj2e+CREQOAZRaBMXcBybJ/sW4pypkeAIsatmLz5Lv5A/9tijgKb4l67pYaprOxaJWNQIVHSHOBfnDuvIV48O6yLnfYiYXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361108; c=relaxed/simple;
	bh=uXxnWeSFVQe2mNdpYm5nYORCPcppYElJYNnh9idbTNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgJJ2JQwQPj5fXnrI/KWGifJWCSj3lG3vb/O2mLTCT14JU1e3u9UQNzyKtCRBq2kY3TjCS7E04BjRVdTJt8LrOB7SQHxMJDrNwNpkWPANciOZJIjXh5+EifwKugbt7kBC3h30li5HgDEyR77V++AbOyJPrhCxhM2fr58wbwm64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iJCLJKuQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FFA8B5;
	Thu, 16 Apr 2026 19:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776361009;
	bh=uXxnWeSFVQe2mNdpYm5nYORCPcppYElJYNnh9idbTNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJCLJKuQ5F/JK6Il1KACsSKXl3iEdrt8dypzhWODWJdn/fOq6KAupdhjWfhjd76um
	 fDrZXi/BWGiMP1wxlS04Ems8hv9R7uVQbwo9Vpeeq7LFBOUyDGPxZjJC4QYyK5vgTR
	 ejG2ZIgcl3UHAIkS2fljLFZ/sr7CjkdX5lj97wQo=
Date: Thu, 16 Apr 2026 20:38:21 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: Re: [PATCH v4 27/29] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_active_state
Message-ID: <20260416173821.GA1824072@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-28-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-28-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58944-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: EC7A141315A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:36PM +0300, Sakari Ailus wrote:
> Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
> take struct v4l2_subdev_client_info pointer as an argument.

If we drop the client info parameter from .get_fmt(), the only driver
calling this new macro will be
drivers/media/platform/ti/cal/cal-video.c. I would just pass NULL
explicitly there and drop this patch.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 49 ++++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1ce1c18f84a9..9b0e091c30c1 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1968,6 +1968,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  		__result;						\
>  	})
>  
> +#define v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
> +	v4l2_subdev_call(first, second, third, ##rest)
> +
> +#define __v4l2_subdev_call_state_active(call, sd, o, f, args...) \
> +	({								\
> +		int __result;						\
> +		struct v4l2_subdev_state *state;			\
> +		state = v4l2_subdev_get_unlocked_active_state(sd);	\
> +		if (state)						\
> +			v4l2_subdev_lock_state(state);			\
> +		__result = call(sd, o, f, NULL, state, ##args);		\
> +		if (state)						\
> +			v4l2_subdev_unlock_state(state);		\
> +		__result;						\
> +	})
> +
>  /**
>   * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>   *				   takes state as a parameter, passing the
> @@ -1986,17 +2002,28 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>   * active state, lock it before calling the op and unlock it after the call.
>   */
>  #define v4l2_subdev_call_state_active(sd, o, f, args...)		\
> -	({								\
> -		int __result;						\
> -		struct v4l2_subdev_state *state;			\
> -		state = v4l2_subdev_get_unlocked_active_state(sd);	\
> -		if (state)						\
> -			v4l2_subdev_lock_state(state);			\
> -		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
> -		if (state)						\
> -			v4l2_subdev_unlock_state(state);		\
> -		__result;						\
> -	})
> +	__v4l2_subdev_call_state_active(v4l2_subdev_call_drop_fourth,	\
> +					sd, o, f, ##args)
> +
> +/**
> + * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
> + *				      takes state as a parameter, passing the
> + *				      subdev its active state.
> + *
> + * @sd: pointer to the &struct v4l2_subdev
> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> + *     Each element there groups a set of callbacks functions.
> + * @f: callback function to be called.
> + *     The callback functions are defined in groups, according to
> + *     each element at &struct v4l2_subdev_ops.
> + * @args: arguments for @f.
> + *
> + * This macro is just as v4l2_subdev_call_state_active(), with the exception
> + * that it passes NULL as the client info to sub-device ops that need it
> + * (currently pad ops get_fmt, set_fmt, get_selection and set_selection).
> + */
> +#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)		\
> +	__v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
>  
>  /**
>   * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> -- 
> 2.47.3
> 

-- 
Regards,

Laurent Pinchart

