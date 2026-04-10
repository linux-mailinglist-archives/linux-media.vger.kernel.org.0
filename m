Return-Path: <linux-media+bounces-58481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD1yNHGm2GkhgggAu9opvQ
	(envelope-from <linux-media+bounces-58481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:27:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD33D3510
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 052C9300FFB7
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 07:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BF03A16BE;
	Fri, 10 Apr 2026 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N43XqmHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533AB3191CA
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806062; cv=none; b=mw/I5D1qHl3fPs6oCGujB05S5K88B3bwSnOsn0BhlLjnXlsLJKXaLhhW7GrHhaDNP+rSQui+t4pshKCTI3Sb9p4J7CFdw6lCLOXWeeLAAMx4tHFObmPoRp5mPEvK0mxWtI5rFcy+VnhMslCsFE33AcILoKEGKRnwOLYKd4t+xE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806062; c=relaxed/simple;
	bh=rnb4gzBgIKnMeAPvla/z4PpYUBc4RoIaproSRAdK3+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBVBimvYyepWnA10bLmUas2udZCxW0daMZdm8EOxsed9c3DUDL3r2cMVMeu/FfUxztow6ZNX04wh4ZGRz0xzQTzZEhgmkwCn2w06ki3P1hUwOFeB9YqYx63Kc6VL9OSAUb7Z7uK1dTH8sOkCNAXY+PK3nQMqM8Lb2zdGI64qUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N43XqmHZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FC5C1E7;
	Fri, 10 Apr 2026 09:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775805968;
	bh=rnb4gzBgIKnMeAPvla/z4PpYUBc4RoIaproSRAdK3+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N43XqmHZGCqaZjkUu43rf80ich9x//QsRfqGnn2RlUzZZvHKT8tBxCU3i1auyjfF9
	 6pWiIPt29iAWDBz9toJ4CtkuSxclSzEeaHmps5u6vi947zC3mU1drjNrPhp6ZtIK2s
	 HyTGoqMN5Kqgq8B2LySrlW5hoedje+Gzt999/c8I=
Date: Fri, 10 Apr 2026 09:27:34 +0200
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
Subject: Re: [PATCH v4 03/29] media: imx219: Set horizontal blanking on mode
 change
Message-ID: <adilL-DvNsZfELLe@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-4-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58481-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 4DFD33D3510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:12PM +0300, Sakari Ailus wrote:
> The driver UAPI is mode-based, allowing the user to choose a mode from a
> small list based on the output size. The vertical blanking is set based on
> the mode, do the same for horizontal blanking so the frame rate obtained
> is constant.
>
> Additionally, it's best to use a known-good horizontal blanking value as
> choosing the value freely may affect image quality. While the minimum
> value may not be the best value for horizontal blanking, at least it is
> constant rather than a minimum value of a different configuration.

As Dave suggested, we should probably better define the desired behaviour.

As far as I can see the driver doesn't specify a line lenght in the
supported_modes array, and I guess we're always running with the min
valid blanking. From a libcamera perspective only RPi changes the
HBLANK control value, all other pipelines use the default, so if
Dave's fine with this, I'm fine as well.

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 89061dc1842d..62a23541b1dc 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -837,11 +837,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
>  	u8 bin_h, bin_v, binning;
> -	u32 prev_line_len;
>  	int ret;
>
>  	format = v4l2_subdev_state_get_format(state, 0);
> -	prev_line_len = format->width + imx219->hblank->val;
>
>  	/*
>  	 * Adjust the requested format to match the closest mode. The Bayer
> @@ -882,7 +880,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		int exposure_max;
>  		int exposure_def;
> -		int hblank, llp_min;
> +		int llp_min;
>  		int pixel_rate;
>
>  		/* Update limits and set FPS to default */
> @@ -924,15 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					       llp_min - mode->width);
>  		if (ret)
>  			return ret;
> -		/*
> -		 * Retain PPL setting from previous mode so that the
> -		 * line time does not change on a mode change.
> -		 * Limits have to be recomputed as the controls define
> -		 * the blanking only, so PPL values need to have the
> -		 * mode width subtracted.
> -		 */
> -		hblank = prev_line_len - mode->width;
> -		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> +
> +		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
>  		if (ret)
>  			return ret;
>
> --
> 2.47.3
>
>

