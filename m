Return-Path: <linux-media+bounces-58943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGzjLJcd4WmmpAAAu9opvQ
	(envelope-from <linux-media+bounces-58943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:34:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E913F412CEE
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 696CC30B6E19
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E19F2DCF6C;
	Thu, 16 Apr 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Abw/gS4z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A76264614
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776360731; cv=none; b=SYuFgFcet44KCIz+SPp8xAjliOJRBqWUjZ8RwipNelUW3xBGmy+FljLu4rJbXPNdL3TOhvHbFE/JADl9Rh4qilrud9InpSrv6IN3bK/CxcAWA4yhCsNbJ8vbwcy/xAvXc/cWLHZ8UXem6tJElJed7oQ+nhMzN1kTGLyUjUDe73U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776360731; c=relaxed/simple;
	bh=c7vQmtub6KiegOPFmKEjvOFZCVSdjd9ZHJ69ygfylNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsgbusXt64OECPQgJ2YAQZOlvi59AqwxCNA8DEfYrG+bzU/VILdteFQbfP759j4XIAdaiAYqe7ePHJy6dHPXnY40Oe0li+o4B5dStrYKNAi2fBmNr8mjh3aTgg0JcxwmL9JMfoeOseOdnBVieI3M5UVSLpscxvB0nE8aOBTKRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Abw/gS4z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2F43FB5;
	Thu, 16 Apr 2026 19:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776360631;
	bh=c7vQmtub6KiegOPFmKEjvOFZCVSdjd9ZHJ69ygfylNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Abw/gS4z902BvPOcdiMvjdiSmOHRZMAFUYQnk8Mj2bYR6gYaxWhaGJh1qCOk2vJMh
	 qtp5ndRVC+miM8Gqq6LoA07PglvExjnJSb3bpdzjOdo4WO9zomK+lgbBFKIayPh2Zk
	 RlgGXGJ5y4alFYOTHZlRPOph3Vw7yKpk4TddkNLI=
Date: Thu, 16 Apr 2026 20:32:03 +0300
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
Subject: Re: [PATCH v4 26/29] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
Message-ID: <20260416173203.GR1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-27-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-27-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58943-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sel.target:url,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: E913F412CEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:35PM +0300, Sakari Ailus wrote:
> Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> set_fmt, get_selection and set_selection sub-device pad ops. The client
> info struct will soon be used to differentiate UAPI based on client
> capabilities.

I don't think we need to add the client info to .get_fmt(). .get_fmt()
should just retrieve the format from the state, and that should not
depend on whether or not V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR is
set.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 72 +++++++++++++++++++--------
>  include/media/v4l2-subdev.h           |  9 +++-
>  2 files changed, 60 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index eaa408832c6b..7723e37a0ff5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -246,19 +246,21 @@ static inline int check_format(struct v4l2_subdev *sd,
>  }
>  
>  static int call_get_fmt(struct v4l2_subdev *sd,
> +			const struct v4l2_subdev_client_info *ci,
>  			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
>  	return check_format(sd, state, format) ? :
> -	       sd->ops->pad->get_fmt(sd, state, format);
> +		sd->ops->pad->get_fmt(sd, ci, state, format);
>  }
>  
>  static int call_set_fmt(struct v4l2_subdev *sd,
> +			const struct v4l2_subdev_client_info *ci,
>  			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
>  	return check_format(sd, state, format) ? :
> -	       sd->ops->pad->set_fmt(sd, state, format);
> +		sd->ops->pad->set_fmt(sd, ci, state, format);
>  }
>  
>  static int call_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -309,19 +311,21 @@ static inline int check_selection(struct v4l2_subdev *sd,
>  }
>  
>  static int call_get_selection(struct v4l2_subdev *sd,
> +			      const struct v4l2_subdev_client_info *ci,
>  			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_selection *sel)
>  {
>  	return check_selection(sd, state, sel) ? :
> -	       sd->ops->pad->get_selection(sd, state, sel);
> +		sd->ops->pad->get_selection(sd, ci, state, sel);
>  }
>  
>  static int call_set_selection(struct v4l2_subdev *sd,
> +			      const struct v4l2_subdev_client_info *ci,
>  			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_selection *sel)
>  {
>  	return check_selection(sd, state, sel) ? :
> -	       sd->ops->pad->set_selection(sd, state, sel);
> +		sd->ops->pad->set_selection(sd, ci, state, sel);
>  }
>  
>  static inline int check_frame_interval(struct v4l2_subdev *sd,
> @@ -524,6 +528,21 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  			v4l2_subdev_unlock_state(state);                   \
>  		return ret;                                                \
>  	}
> +#define DEFINE_CI_STATE_WRAPPER(f, arg_type)                               \
> +	static int call_##f##_state(struct v4l2_subdev *sd,		   \
> +				    const struct v4l2_subdev_client_info *ci, \
> +				    struct v4l2_subdev_state *_state,      \
> +				    arg_type *arg) \
> +	{                                                                  \
> +		struct v4l2_subdev_state *state = _state;                  \
> +		int ret;                                                   \
> +		if (!_state)                                               \
> +			state = v4l2_subdev_lock_and_get_active_state(sd); \
> +		ret = call_##f(sd, ci, state, arg);			   \
> +		if (!_state && state)                                      \
> +			v4l2_subdev_unlock_state(state);                   \
> +		return ret;                                                \
> +	}
>  
>  #else /* CONFIG_MEDIA_CONTROLLER */
>  
> @@ -535,15 +554,24 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  		return call_##f(sd, state, arg);                     \
>  	}
>  
> +#define DEFINE_CI_STATE_WRAPPER(f, arg_type)                            \
> +	static int call_##f##_state(struct v4l2_subdev *sd,          \
> +				    const struct v4l2_subdev_client_info *ci, \
> +				    struct v4l2_subdev_state *state, \
> +				    arg_type *arg)                   \
> +	{                                                            \
> +		return call_##f(sd, ci, state, arg);		     \
> +	}
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
> -DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
> -DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
> +DEFINE_CI_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
> +DEFINE_CI_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
>  DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
>  DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
>  DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
> -DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
> -DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
> +DEFINE_CI_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
> +DEFINE_CI_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
>  
>  static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>  	.get_fmt		= call_get_fmt_state,
> @@ -805,7 +833,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
> +		return v4l2_subdev_call(sd, pad, get_fmt, &subdev_fh->ci, state,
> +					format);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_FMT: {
> @@ -819,7 +848,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
> +		return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->ci, state,
> +					format);
>  	}
>  
>  	case VIDIOC_SUBDEV_G_CROP: {
> @@ -836,8 +866,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		sel.stream = crop->stream;
>  		sel.target = V4L2_SEL_TGT_CROP;
>  
> -		rval = v4l2_subdev_call(
> -			sd, pad, get_selection, state, &sel);
> +		rval = v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
> +					state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -862,8 +892,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		sel.target = V4L2_SEL_TGT_CROP;
>  		sel.r = crop->rect;
>  
> -		rval = v4l2_subdev_call(
> -			sd, pad, set_selection, state, &sel);
> +		rval = v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
> +					state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -933,8 +963,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  			sel->stream = 0;
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
> -		return v4l2_subdev_call(
> -			sd, pad, get_selection, state, sel);
> +		return v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
> +					state, sel);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_SELECTION: {
> @@ -947,8 +977,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  			sel->stream = 0;
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
> -		return v4l2_subdev_call(
> -			sd, pad, set_selection, state, sel);
> +		return v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
> +					state, sel);
>  	}
>  
>  	case VIDIOC_G_EDID: {
> @@ -1343,7 +1373,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
>  	else
>  		state = v4l2_subdev_lock_and_get_active_state(sd);
>  
> -	ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, state, fmt);
>  
>  	if (!states_locked && state)
>  		v4l2_subdev_unlock_state(state);
> @@ -1924,7 +1954,9 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
>  	return 0;
>  }
>  
> -int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
> +			const struct v4l2_subdev_client_info *ci,
> +			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
>  	struct v4l2_mbus_framefmt *fmt;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e0861acc638d..1ce1c18f84a9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -850,15 +850,19 @@ struct v4l2_subdev_pad_ops {
>  				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_frame_interval_enum *fie);
>  	int (*get_fmt)(struct v4l2_subdev *sd,
> +		       const struct v4l2_subdev_client_info *ci,
>  		       struct v4l2_subdev_state *state,
>  		       struct v4l2_subdev_format *format);
>  	int (*set_fmt)(struct v4l2_subdev *sd,
> +		       const struct v4l2_subdev_client_info *ci,
>  		       struct v4l2_subdev_state *state,
>  		       struct v4l2_subdev_format *format);
>  	int (*get_selection)(struct v4l2_subdev *sd,
> +			     const struct v4l2_subdev_client_info *ci,
>  			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
>  	int (*set_selection)(struct v4l2_subdev *sd,
> +			     const struct v4l2_subdev_client_info *ci,
>  			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
>  	int (*get_frame_interval)(struct v4l2_subdev *sd,
> @@ -1461,6 +1465,7 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>   * @sd: subdevice
>   * @state: subdevice state
>   * @format: pointer to &struct v4l2_subdev_format
> + * @ci: pointer to sub-device client information, including client capabilities
>   *
>   * Fill @format->format field based on the information in the @format struct.
>   *
> @@ -1470,7 +1475,9 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>   *
>   * Returns 0 on success, error value otherwise.
>   */
> -int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
> +			const struct v4l2_subdev_client_info *ci,
> +			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>  
>  /**

-- 
Regards,

Laurent Pinchart

